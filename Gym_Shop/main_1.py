from flask import Flask, jsonify, request
from flask_cors import CORS
from DAO.TestimonioDAO import TestimonioDAO
from DAO.ProductoDAO import ProductoDAO
from DAO.CompraDAO import CompraDAO
from DAO.RecomendacionDAO import RecomendacionDAO
from DAO.ContactoDAO import ContactoDAO
from DTO.CompraDTO import CompraDTO
from DTO.ContactoDTO import ContactoDTO


app = Flask(__name__)
CORS(app)

@app.route('/main_1', methods=['GET'])
def get_testimonios():
    try:
        testimonios = TestimonioDAO.obtener_todos()
        return jsonify(testimonios)
    except Exception as e:
        app.logger.error(f"Error inesperado: {e}")
        return jsonify({'error': 'Error inesperado'}), 500

@app.route('/main_2', methods=['GET'])
def get_productos():
    try:
        productos = ProductoDAO.obtener_todos()
        return jsonify(productos)
    except Exception as e:
        app.logger.error(f"Error inesperado: {e}")
        return jsonify({'error': 'Error inesperado'}), 500
    
@app.route('/main_3', methods=['GET'])
def get_recomendaciones():
    try:
        recomendaciones = RecomendacionDAO.obtener_todas()
        return jsonify(recomendaciones)
    except Exception as e:
        app.logger.error(f"Error inesperado: {e}")
        return jsonify({'error': 'Error inesperado'}), 500
    

@app.route('/main_4', methods=['POST'])
def guardar_compras():
    data = request.json 
    try:
        compra = CompraDTO(
            nombre=data['nombre'],
            email=data['email'],
            direccion=data['direccion'],
            forma_pago=data['formaPago'],  
            total=data['total']
        )
    except KeyError as e:
        return jsonify({"message": f"Error en los datos: falta la clave '{str(e)}'."}), 400  

    compra_dao = CompraDAO()
    if compra_dao.insert_compra(compra):
        return jsonify({"message": "Compra guardada exitosamente"}), 200
    else:
        return jsonify({"message": "Error al guardar la compra"}), 500




@app.route('/guardar_contacto', methods=['POST'])
def guardar_contacto():
    try:
        if request.is_json:
            datos = request.get_json()  
            nombre = datos.get('nombre')
            correo_electronico = datos.get('correo_electronico')
            mensaje = datos.get('mensaje')
            latitud = datos.get('latitud')
            longitud = datos.get('longitud')

            if not (nombre and correo_electronico and mensaje and latitud and longitud):
                return jsonify({"message": "Faltan datos requeridos."}), 400

            contacto_dto = ContactoDTO(nombre=nombre, correo_electronico=correo_electronico, mensaje=mensaje, latitud=latitud, longitud=longitud)
            contacto_dao = ContactoDAO()
            contacto_dao.guardar_contacto(contacto_dto)

            return jsonify({"message": "Contacto guardado exitosamente."}), 200
        else:
            return jsonify({"message": "El contenido no es JSON válido."}), 400
    except Exception as e:
        return jsonify({"message": f"Error al guardar el contacto: {str(e)}"}), 500
    

    
if __name__ == '__main__':
    app.run(debug=True, port=5001)
