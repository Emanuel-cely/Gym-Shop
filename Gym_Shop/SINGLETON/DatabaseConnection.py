import mysql.connector
from mysql.connector import Error

class DatabaseConnection:
    _instance = None

    @staticmethod
    def get_instance():
        if DatabaseConnection._instance is None:
            DatabaseConnection()
        return DatabaseConnection._instance

    def __init__(self):
        if DatabaseConnection._instance is not None:
            raise Exception("This class is a singleton!")
        else:
            DatabaseConnection._instance = self
            try:
                self.connection = mysql.connector.connect(
                    host="localhost",
                    user="root",
                    password="Caina117",
                    database="gym_shop"
                )
                if not self.connection.is_connected():
                    raise Error("No se pudo conectar a la base de datos.")
            except Error as e:
                print(f"Error de conexión: {e}")
                raise

    def get_connection(self):
        return self.connection