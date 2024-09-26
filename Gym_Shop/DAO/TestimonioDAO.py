import mysql.connector
from SINGLETON.DatabaseConnection import DatabaseConnection

class TestimonioDAO:
    @staticmethod
    def obtener_todos():
        try:
            conn = DatabaseConnection.get_instance().get_connection()
            cursor = conn.cursor(dictionary=True)
            
            query = "SELECT contenido, autor FROM testimonio"
            cursor.execute(query)
            testimonios = cursor.fetchall()
            
            cursor.close()  
            return testimonios
        except mysql.connector.Error as err:
            
            print(f"Error de MySQL: {err}")
            raise
        except Exception as e:
           
            print(f"Error inesperado: {e}")
            raise

