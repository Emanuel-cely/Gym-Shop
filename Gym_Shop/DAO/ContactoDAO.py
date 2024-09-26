from SINGLETON.DatabaseConnection import DatabaseConnection
from DTO.ContactoDTO import ContactoDTO

class ContactoDAO:
    def __init__(self):
        db_instance = DatabaseConnection.get_instance() 
        self.conn = db_instance.get_connection()  
        self.cursor = self.conn.cursor()

    def guardar_contacto(self, contacto_dto: ContactoDTO):
        try:
            query = """
            INSERT INTO contacto (nombre, correo_electronico, mensaje, latitud, longitud)
            VALUES (%s, %s, %s, %s, %s)
            """
            valores = (contacto_dto.nombre, contacto_dto.correo_electronico, contacto_dto.mensaje, contacto_dto.latitud, contacto_dto.longitud)
            self.cursor.execute(query, valores)
            self.conn.commit()
        except Exception as e:
            print(f"Error al insertar el contacto: {e}")
        finally:
            self.cursor.close()
