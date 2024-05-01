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
