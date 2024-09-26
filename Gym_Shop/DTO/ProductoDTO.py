class ProductoDTO:
    def __init__(self, producto_id, nombre, descripcion, precio, stock, imagen_url):
        self.producto_id = producto_id
        self.nombre = nombre
        self.descripcion = descripcion
        self.precio = precio
        self.stock = stock
        self.imagen_url = imagen_url

    def to_dict(self):
        return {
            'producto_id': self.producto_id,
            'nombre': self.nombre,
            'descripcion': self.descripcion,
            'precio': self.precio,
            'stock': self.stock,
            'imagen_url': self.imagen_url
        }
