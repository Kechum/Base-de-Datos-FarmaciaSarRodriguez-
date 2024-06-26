Create DataBase FarmaciaSarRodriguez

use FarmaciaSarRodriguez
Go

create TABLE clientes (
ID_Cliente int not null,
Nombre Varchar (50),
Apellido Varchar (50),
Direccion Varchar (100),
Telefono Varchar (50),
CONSTRAINT PK_Clientes PRIMARY KEY  (ID_Cliente)
);

Create Table Empleados
(
  ID_Empleado int not null,
  Nombre varchar(50),
  Apellido varchar(50),
  Cargo varchar(30),
  Salario decimal(15,2)

  Constraint PK_Empleado PRIMARY KEY (ID_Empleado)
);

create TABLE Productos(
ID_Productos int not null,
Nombre Varchar (50),
Descripcion Varchar (300),
Precio decimal (10, 2),
Stock int,
CONSTRAINT PK_Productos PRIMARY KEY (ID_Productos)
);

Create Table Proveedores
(
  ID_Proveedor int not null,
  Nombre varchar(50),
  Dirección varchar(100),
  Teléfono varchar(50),

  Constraint PK_Proveedor PRIMARY KEY (ID_Proveedor)
);

create TABLE Ventas(
ID_Venta INT not null,
ID_Cliente INT,
ID_Empleado INT,
Fecha DATE,
Total DECIMAL (10,2),
CONSTRAINT PK_Venta PRIMARY KEY (ID_Venta),
CONSTRAINT FK_Cliente FOREIGN KEY (ID_Cliente) REFERENCES Clientes (ID_Cliente),
CONSTRAINT FK_Empleado FOREIGN KEY (ID_Empleado) REFERENCES Empleados (ID_Empleado)
);

Create Table Detalles_Venta
(
  ID_Detalle int not null,
  ID_Venta int,
  Id_Producto int,
  Cantidad int,
  Precio_Unitario decimal (7,2),
  Subtotal decimal (15,2)

    CONSTRAINT PK_Detalle_Venta PRIMARY KEY (ID_Detalle),
	CONSTRAINT FK_Ventas FOREIGN KEY (ID_Venta) REFERENCES Ventas (ID_Venta),
	CONSTRAINT FK_Productos FOREIGN KEY (ID_Producto) REFERENCES Productos (ID_Productos)
);

create TABLE Categoria_Productos(
ID_Categoria INT not null,
Nombre VARCHAR (50),
   CONSTRAINT PK_Categoria PRIMARY KEY (ID_Categoria)
);

Create Table Productos_Categoria
(
  ID_Producto int,
  ID_Categorias int,

  Constraint FK_Productos_Categorias foreign key (ID_Producto) References Productos (ID_Productos),
  Constraint FK_Categorias_Productos foreign key (ID_Categorias) References Categoria_Productos (ID_Categoria)

);

create TABLE Compras (
ID_Compra INT not null,
ID_Proveedor INT,
ID_empleado INT,
Fecha DATE,
Total DECIMAL (15,2),
  CONSTRAINT PK_Compra PRIMARY KEY (ID_Compra),
  CONSTRAINT FK_Proveedor FOREIGN KEY (ID_Proveedor)REFERENCES Proveedores (ID_Proveedor),
  CONSTRAINT FK_Empleado_ FOREIGN KEY (ID_Empleado) REFERENCES Empleados (ID_Empleado)
);

Create Table Detalles_Compra
(
	ID_DetalleCompra int not null,
	ID_Compra int,
	ID_Producto int,
	Cantidad int,
	Precio_Unitario decimal (7,2),

	CONSTRAINT PK_Detalle_Compra PRIMARY KEY (ID_DetalleCompra),
    CONSTRAINT FK_Compra FOREIGN KEY (ID_Compra)REFERENCES Compras (ID_Compra),
    CONSTRAINT FK_Productos_ FOREIGN KEY (ID_Producto) REFERENCES Productos (ID_Productos)
)

Alter Table Detalles_Compra
ADD Subtotal decimal (15,2)

Alter Table Productos_Categoria
alter column ID_Producto int not null
Alter Table Productos_Categoria
alter column ID_Categorias int not null;



Alter Table Productos_Categoria
ADD Primary Key ( ID_Producto, ID_Categorias)

--Drop Table Productos_Categoria

Create Table Productos_Categoria
(
  ID_Producto int,
  ID_Categorias int,
  Constraint PK_IdProductosyCategorias Primary Key (ID_Producto,ID_Categorias),
  Constraint FK_Productos_Categorias foreign key (ID_Producto) References Productos (ID_Productos),
  Constraint FK_Categorias_Productos foreign key (ID_Categorias) References Categoria_Productos (ID_Categoria)

);