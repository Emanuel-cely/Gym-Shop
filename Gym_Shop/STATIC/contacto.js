document.addEventListener("DOMContentLoaded", function () {
    const gymLat = 4.6681;  
    const gymLng = -74.0527;
 
   
    const offsetLat = 0.02;
    const map = L.map('map').setView([gymLat + offsetLat, gymLng], 12);
 
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 18,
        attribution: '© OpenStreetMap contributors'
    }).addTo(map);
 
    const gymMarker = L.marker([gymLat, gymLng]).addTo(map)
        .bindPopup(`<b>Centro Comercial Andino</b><br>Bogotá, Colombia.`)
        .openPopup();
 
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition((position) => {
            const userLat = position.coords.latitude;
            const userLng = position.coords.longitude;
 
            map.setView([userLat, userLng], 12);
 
            const userMarker = L.marker([userLat, userLng]).addTo(map)
                .bindPopup('Estás aquí')
                .openPopup();
 
            const distancia = calcularDistancia(userLat, userLng, gymLat, gymLng);
 
            const distanciaTexto = `El Centro Comercial Andino está a ${distancia.toFixed(2)} km de tu ubicación.`;
            document.getElementById('distancia').textContent = distanciaTexto;
            document.getElementById('user-coords').textContent = `Tu latitud es: ${userLat.toFixed(4)}, y tu longitud es: ${userLng.toFixed(4)}`;
 
            gymMarker.bindPopup(`<b>Centro Comercial Andino</b><br>Bogotá, Colombia.<br>${distanciaTexto}`).openPopup();
 
            const formulario = document.querySelector("form");
            formulario.addEventListener("submit", function (event) {
                event.preventDefault();
 
                const nombre = document.getElementById('name').value;
                const correo = document.getElementById('email').value;
                const mensaje = document.getElementById('message').value;
 
                const datosContacto = {
                    nombre: nombre,
                    correo_electronico: correo,
                    mensaje: mensaje,
                    latitud: userLat,  
                    longitud: userLng  
                };
 
                fetch('http://localhost:5001/guardar_contacto', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(datosContacto)
                })
                .then(response => response.json())
                .then(data => {
                    alert(data.message);
                })
                .catch(error => {
                    console.error('Error:', error);
                });
            });
 
        }, showError);
    } else {
        alert("La geolocalización no es compatible con este navegador.");
    }
 
    function calcularDistancia(lat1, lon1, lat2, lon2) {
        const R = 6371;
        const dLat = (lat2 - lat1) * Math.PI / 180;
        const dLon = (lon2 - lon1) * Math.PI / 180;
        const a =
            Math.sin(dLat / 2) * Math.sin(dLat / 2) +
            Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) *
            Math.sin(dLon / 2) * Math.sin(dLon / 2);
        const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        const distancia = R * c;
        return distancia;
    }
 
    function showError(error) {
        switch (error.code) {
            case error.PERMISSION_DENIED:
                alert("El usuario ha negado la solicitud de geolocalización.");
                break;
            case error.POSITION_UNAVAILABLE:
                alert("La información de ubicación no está disponible.");
                break;
            case error.TIMEOUT:
                alert("La solicitud para obtener la ubicación ha expirado.");
                break;
            case error.UNKNOWN_ERROR:
                alert("Se ha producido un error desconocido.");
                break;
        }
    }
});