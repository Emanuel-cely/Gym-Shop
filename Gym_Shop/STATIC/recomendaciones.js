document.addEventListener('DOMContentLoaded', () => {
    loadRecomendaciones();
});

async function loadRecomendaciones() {
    try {
        const response = await fetch('http://localhost:5001/main_3');
        if (!response.ok) {
            const errorText = await response.text(); 
            throw new Error(`Error en la solicitud de recomendaciones: ${response.status} ${errorText}`);
        }
        const recomendaciones = await response.json();
        const recomendacionesList = document.getElementById('recomendaciones-list');
        
        if (recomendaciones.length === 0) {
            recomendacionesList.innerHTML = '<p>No hay recomendaciones disponibles.</p>';
        } else {
            recomendaciones.forEach(recomendacion => {
                const card = document.createElement('div');
                card.className = 'recomendacion-card';
                
                const p = document.createElement('p');
                p.textContent = recomendacion.razon;
                card.appendChild(p);
                
                recomendacionesList.appendChild(card);
            });
        }
    } catch (error) {
        console.error('Error al cargar las recomendaciones:', error);
        const recomendacionesList = document.getElementById('recomendaciones-list');
        recomendacionesList.innerHTML = '<p>Ocurrió un error al cargar las recomendaciones.</p>';
    }
}

function scrollToSection(sectionId) {
    const section = document.getElementById(sectionId);
    if (section) {
        section.scrollIntoView({ behavior: 'smooth' });
    }
}


const apiKey = 'ejkyyWgKMtSKIQV8riV5nQxtvrnRf6Nrh';
        const latitude = '4.60971'; 
        const longitude = '-74.08175'; 
        const timezone = 'America/Bogota';
        
        const url = `https://api.tomorrow.io/v4/timelines?location=${latitude},${longitude}&fields=temperature,temperatureApparent,windSpeed,humidity,precipitationProbability,weatherCode&timesteps=current&timezone=${timezone}&apikey=${apiKey}`;
    
        fetch(url)
            .then(response => response.json())
            .then(data => {
                const interval = data.data.timelines[0].intervals[0];
                const temperature = interval.values.temperature;
                const apparentTemperature = interval.values.temperatureApparent;
                const windSpeed = interval.values.windSpeed;
                const humidity = interval.values.humidity;
                const precipitationProbability = interval.values.precipitationProbability;
                const time = new Date(interval.startTime).toLocaleTimeString();
    
                document.getElementById('temperature').innerText = `Temperatura: ${temperature}°C`;
                document.getElementById('apparentTemperature').innerText = `Sensación térmica: ${apparentTemperature}°C`;
                document.getElementById('windSpeed').innerText = `Velocidad del viento: ${windSpeed} km/h`;
                document.getElementById('humidity').innerText = `Humedad: ${humidity}%`;
                document.getElementById('precipitation').innerText = `Probabilidad de precipitación: ${precipitationProbability}%`;
                document.getElementById('time').innerText = `Hora: ${time}`;
    
                let message;
                if (temperature > 25) {
                    message = "¡El clima es cálido! Perfecto para una sesión en el Gym y mantenerse activo.";
                } else if (temperature <= 25 && temperature >= 15) {
                    message = "El clima es ideal, ¡un gran momento para entrenar en el Gym!";
                } else {
                    message = "Hace un poco de frío, ¡pero no dejes que eso te detenga! Ven al Gym para entrar en calor.";
                }
    
                document.getElementById('message').innerText = message;
            })
            .catch(error => {
                console.error('Error al obtener los datos del clima:', error);
                document.getElementById('temperature').innerText = 'Error al cargar el clima';
                document.getElementById('apparentTemperature').innerText = '';
                document.getElementById('windSpeed').innerText = '';
                document.getElementById('humidity').innerText = '';
                document.getElementById('precipitation').innerText = '';
                document.getElementById('time').innerText = '';
            });