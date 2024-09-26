import mysql.connector
from SINGLETON.DatabaseConnection import DatabaseConnection

class RecomendacionDAO:
    @staticmethod
    def obtener_todas():
        try:
            conn = DatabaseConnection.get_instance().get_connection()
            cursor = conn.cursor(dictionary=True)
            
            query = "SELECT razon FROM recomendaciones"
            cursor.execute(query)
            recomendaciones = cursor.fetchall()

            return recomendaciones
        except mysql.connector.Error as err:
            print(f"Error de MySQL: {err}")
            raise
        except Exception as e:
            print(f"Error inesperado: {e}")
            raise
        finally:
            cursor.close()  

