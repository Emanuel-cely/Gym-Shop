from mysql.connector import Error
from SINGLETON.DatabaseConnection import DatabaseConnection

class CompraDAO:
    def __init__(self):
        self.connection = DatabaseConnection.get_instance().get_connection()

    def insert_compra(self, compra):
        try:
            cursor = self.connection.cursor()
           
            sql = "CALL Insertar_Compras(%s, %s, %s, %s, %s)"
            values = (compra.nombre, compra.email, compra.direccion, compra.forma_pago, compra.total)
            cursor.execute(sql, values)
            self.connection.commit()  
            return True  
        except Error as e:
            print(f"Error al insertar la compra: {e}")
            return False  
        finally:
            cursor.close()  

