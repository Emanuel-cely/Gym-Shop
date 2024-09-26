document.getElementById("registroForm").addEventListener("submit", function(event) {
    event.preventDefault();
    const direccion = document.getElementById("direccion").value;

    fetch(`https://nominatim.openstreetmap.org/search?q=${direccion}&format=json`)
    .then(response => response.json())
    .then(data => {
        if (data.length > 0) {
            document.getElementById("latitud").value = data[0].lat;
            document.getElementById("longitud").value = data[0].lon;

            document.getElementById("registroForm").submit();
        } else {
            alert("No se pudo obtener la ubicación basada en la dirección.");
        }
    })
    .catch(error => {
        console.error("Error al obtener la latitud y longitud:", error);
    });
});
