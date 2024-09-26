import mysql.connector
from SINGLETON.DatabaseConnection import DatabaseConnection

class ProductoDAO:
    @staticmethod
    def obtener_todos():
        try:
            conn = DatabaseConnection.get_instance().get_connection()
            cursor = conn.cursor(dictionary=True)
            
            query = "SELECT producto_id, nombre, descripcion, precio, stock, imagen_url FROM productos"
            cursor.execute(query)
            productos = cursor.fetchall()
            
            cursor.close()  
            return productos
        except mysql.connector.Error as err:
            
            print(f"Error de MySQL: {err}")
            raise
        except Exception as e:
           
            print(f"Error inesperado: {e}")
            raise