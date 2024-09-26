document.addEventListener('DOMContentLoaded', () => {
    loadTestimonios();
});

async function loadTestimonios() {
    try {
        const response = await fetch('http://localhost:5001/main_1');
        if (!response.ok) {
            const errorText = await response.text(); 
            throw new Error(`Error en la solicitud de testimonios: ${response.status} ${errorText}`);
        }
        const testimonios = await response.json();
        const testimoniosList = document.getElementById('testimonios-list');
        
        if (testimonios.length === 0) {
            testimoniosList.innerHTML = '<p>No hay testimonios disponibles.</p>';
        } else {
            
            testimonios.forEach(testimonio => {
                const blockquote = document.createElement('blockquote');
                const p = document.createElement('p');
                p.textContent = `"${testimonio.contenido}"`;
                const cite = document.createElement('cite');
                cite.textContent = `- ${testimonio.autor}`;
                blockquote.appendChild(p);
                blockquote.appendChild(cite);
                testimoniosList.appendChild(blockquote);
            });
        }
    } catch (error) {
        console.error('Error al cargar los testimonios:', error);
        const testimoniosList = document.getElementById('testimonios-list');
        testimoniosList.innerHTML = '<p>Ocurrió un error al cargar los testimonios.</p>';
    }
}

