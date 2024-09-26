document.addEventListener('DOMContentLoaded', () => {
    loadproductos();
});

async function loadproductos() {
    try {
        console.log('Iniciando carga de productos...');
        const response = await fetch('http://localhost:5001/main_2');
        if (!response.ok) {
            const errorText = await response.text(); 
            throw new Error(`Error en la solicitud de productos: ${response.status} ${errorText}`);
        }
        const productos = await response.json();
        const productosList = document.getElementById('productos-list');
        
        console.log('Elemento productos-list:', productosList);
        
        if (!productosList) {
            throw new Error('No se encontró el elemento con ID "productos-list"');
        }

        if (productos.length === 0) {
            productosList.innerHTML = '<p>No hay productos disponibles.</p>';
        } else {
            productosList.innerHTML = ''; 
            
            productos.forEach(producto => {
                const card = document.createElement('div');
                card.className = 'producto-card';
                
                
                const img = document.createElement('img');
                img.src = producto.imagen_url; 
                img.alt = `Imagen de ${producto.nombre}`; 
                img.className = 'producto-imagen'; 
                
                const h2 = document.createElement('h2');
                h2.textContent = producto.nombre;
                
                const descripcion = document.createElement('p');
                descripcion.textContent = producto.descripcion;
                
                const precio = document.createElement('p');
                precio.textContent = `Precio: $${producto.precio}`;
                
                const stock = document.createElement('p');
                stock.textContent = `Stock: ${producto.stock}`;
                
                const button = document.createElement('button');
                button.textContent = 'Agregar al Carrito';
                button.addEventListener('click', () => {
                    agregarAlCarrito(producto); 
                    
                    Swal.fire({
                        icon: 'success',
                        title: 'Agregado al Carrito',
                        text: `Producto ${producto.nombre} agregado al carrito.`,
                        timer: 2500,
                        showConfirmButton: false
                    });
                });

                
                card.appendChild(img); 
                card.appendChild(h2);
                card.appendChild(descripcion);
                card.appendChild(precio);
                card.appendChild(stock);
                card.appendChild(button);

                productosList.appendChild(card);
            });
        }
    } catch (error) {
        console.error('Error al cargar los productos:', error);
        const productosList = document.getElementById('productos-list');
        if (productosList) {
            productosList.innerHTML = '<p>Ocurrió un error al cargar los productos.</p>';
        }
    }
}

//-----------------------------------------------------------------------------------------------------//

let carrito = []; 


function actualizarCarrito() {
    const carritoBtn = document.getElementById('carrito-btn');
    carritoBtn.textContent = `Carrito de Compras (${carrito.length})`;
}


function agregarAlCarrito(producto) {
    carrito.push(producto);
    actualizarCarrito();
}


function eliminarDelCarrito(index) {
    carrito.splice(index, 1); 
    actualizarCarrito();
    mostrarCarrito(); 
}

function calcularTotal() {
    return carrito.reduce((total, producto) => total + parseFloat(producto.precio), 0).toFixed(2);
}

function mostrarCarrito() {
    if (carrito.length === 0) {
        Swal.fire('Tu carrito está vacío');
        return;
    }

    
    let listadoProductos = carrito.map((producto, index) => `
        <div class="produc-card">
            <img src="${producto.imagen_url}" alt="Imagen de ${producto.nombre}" class="produc-imag">
            <div class="produc-info">
                <div class="produc-details">
                    <strong>${producto.nombre}</strong><br>
                    <span style="font-size: 0.9em; color: #white;">$${producto.precio}</span>
                </div>
                <button class="eliminar-btn" onclick="eliminarDelCarrito(${index})">Eliminar</button>
            </div>
        </div>
    `).join('');

    
    const total = calcularTotal();

   
    Swal.fire({
        title: 'Carrito de Compras',
        html: `
            <div class="carrito-container">
                <div class="datos-compra">
                    <h4>Información de Compra:</h4>
                    <input type="text" id="nombre" class="swal2-input" placeholder="Nombre Completo">
                    <input type="email" id="email" class="swal2-input" placeholder="Correo Electrónico">
                    <input type="text" id="direccion" class="swal2-input" placeholder="Dirección de Envío">
                </div>
                <div class="produc-seleccionados">
                    <h4>Productos Seleccionados:</h4>
                    <div>${listadoProductos}</div>
                </div>
            </div>
            <div class="total formapago-container">
                <label for="formapago">Forma de Pago:</label>
                <select id="formapago" class="swal2-input">
                    <option value="tarjeta">Tarjeta de Crédito/Débito</option>
                    <option value="efectivo">Efectivo</option>
                    <option value="paypal">PayPal</option>
                </select>
                <h4>Total: $${total}</h4>
            </div>
        `,
        showCancelButton: true,
        confirmButtonText: 'Comprar',
        preConfirm: () => {
            const nombre = document.getElementById('nombre').value;
            const email = document.getElementById('email').value;
            const direccion = document.getElementById('direccion').value;
            const formaPago = document.getElementById('formapago').value;
    
           
            if (typeof total === 'undefined') {
                Swal.showValidationMessage('No se ha podido calcular el total.');
                return;
            }
    
           
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!nombre || !email || !direccion) {
                Swal.showValidationMessage('Por favor completa todos los campos');
                return; 
            } else if (!emailRegex.test(email)) {
                Swal.showValidationMessage('Por favor ingresa un correo electrónico válido');
                return; 
            }
    
            return { nombre, email, direccion, formaPago, total };
        }
    }).then((result) => {
        if (result.isConfirmed) {
            const compra = result.value;
    
            
            fetch('http://localhost:5001/main_4', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(compra)
            })
            .then(response => {
                
                if (!response.ok) {
                    throw new Error('Error en la respuesta del servidor');
                }
                return response.json();
            })
            .then(data => {
                if (data.message === "Compra guardada exitosamente") {
                    Swal.fire({
                        title: `Compra realizada por <strong>${compra.nombre}</strong>`,
                        html: `
                            <div style="text-align: center; line-height: 1.6;">
                                <strong>Nombre:</strong> ${compra.nombre} <br>
                                <strong>Email:</strong> ${compra.email} <br>
                                <strong>Dirección:</strong> ${compra.direccion} <br>
                                <strong>Forma de Pago:</strong> ${compra.formaPago} <br>
                                <strong>Total:</strong> $${compra.total}
                            </div>
                        `,
                        icon: 'success',
                        confirmButtonText: 'OK',
                        denyButtonText: 'Descargar Factura',
                        showDenyButton: true,
                        customClass: {
                            popup: 'swal2-centered'
                        }
                    }).then((result) => {
                        if (result.isDenied) {
                            
                            generarFacturaPDF(compra);
                        }
    
                        carrito = []; 
                        actualizarCarrito(); 
                    });
                } else {
                    throw new Error('No se pudo completar la compra.'); 
                }
            })
            .catch(error => {
                console.error('Error:', error);
                Swal.fire({
                    title: 'Error',
                    text: error.message || 'Ocurrió un error al procesar la compra.',
                    icon: 'error'
                });
            });
        }
    });
    
    
    
    
    
    function generarFacturaPDF(datosCliente) {
        const { jsPDF } = window.jspdf;
        const doc = new jsPDF();
    
        const total = calcularTotal(); 
    
        
        doc.setFillColor(255, 255, 255); 
        doc.rect(0, 0, doc.internal.pageSize.width, doc.internal.pageSize.height, 'F');
    
        
        doc.setFontSize(20);
        doc.setFont("helvetica", "bold");
        doc.text('Factura de Compra', 105, 30, null, null, 'center');
        
        
        doc.setDrawColor(0);
        doc.setLineWidth(1);
        doc.line(10, 35, 200, 35); 
    
       
        doc.setFontSize(14);
        doc.setFont("helvetica", "normal");
        doc.text(`Nombre: ${datosCliente.nombre}`, 10, 50);
        doc.text(`Email: ${datosCliente.email}`, 10, 60);
        doc.text(`Dirección: ${datosCliente.direccion}`, 10, 70);
        doc.text(`Forma de Pago: ${datosCliente.formaPago}`, 10, 80);
    
       
        doc.text('', 10, 90);
    
       
        doc.setFontSize(16);
        doc.setFont("helvetica", "bold");
        doc.text('Productos:', 10, 100);
        
       
        let posicionY = 110; 
        const incrementoY = 10; 
    
        
        doc.setFontSize(12);
        carrito.forEach(producto => {
            doc.text(`${producto.nombre} - $${producto.precio}`, 10, posicionY);
            posicionY += incrementoY; 
        });
    
        
        doc.setFontSize(14);
        doc.setFont("helvetica", "bold");
        doc.text(`Total: $${total}`, 10, posicionY);
        
        
        doc.setFontSize(12);
        doc.setFont("helvetica", "normal");
        const frase = "¡El cambio comienza hoy! Da el primer paso hacia una vida más saludable y llena de energía.";
        doc.text(frase, 10, posicionY + 20);
    
        
        const imgUrl = 'https://marketplace.canva.com/EAFxdcos7WU/1/0/1600w/canva-dark-blue-and-brown-illustrative-fitness-gym-logo-oqe3ybeEcQQ.jpg'; // Cambia esta URL a la de tu sello
        const img = new Image();
        img.src = imgUrl;
    
        img.onload = function() {
           
            const selloWidth = 40; 
            const selloHeight = 40;
            const posicionX = (doc.internal.pageSize.width - selloWidth) / 2; 
            const posicionYSello = posicionY + 50; 
    
            doc.addImage(img, 'JPEG', posicionX, posicionYSello, selloWidth, selloHeight);
    
            
            doc.save('factura.pdf');
        };
    
        
        img.onerror = function() {
            console.error("No se pudo cargar la imagen del sello.");
            
            doc.save('factura.pdf');
        };
    }
}

//-----------------------------------------------------------------------------------------------------//

const socket = new WebSocket('ws://127.0.0.1:5500/fsws');

socket.onopen = function(event) {
    console.log('Conexión abierta:', event);
};

socket.onmessage = function(event) {
    console.log('Mensaje recibido:', event.data);
};

socket.onclose = function(event) {
    console.log('Conexión cerrada:', event);
};

socket.onerror = function(error) {
    console.error('Error en la conexión WebSocket:', error);
};




document.getElementById('carrito-btn').addEventListener('click', mostrarCarrito);
