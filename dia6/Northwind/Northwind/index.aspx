<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Northwind.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <link href="css/terceros/font-awesome.min.css" rel="stylesheet" />

    <script src="js/lib/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</head>
<body>


    <div class="container">
        <div class="form-group col-md-4">
            <label for="cmbCategorias">Categorías</label>
            <select id="cmbCategorias" class="form-control" runat="server"></select>
        </div>
        <div class="form-group col-md-4">
            <label for="cmbProductos">Productos</label>
            <select id="cmbProductos" class="form-control" runat="server"></select>
        </div>
    </div>

    <div class="container">
        <h3>Categoría Seleccionada</h3>  
        <div class="form-group col-md-4">
            <label for="txtNombre">Nombre:</label>
            <input type="text" id="txtNombre" class="form-control" />
        </div>
        <div class="form-group col-md-4">
            <label for="txtDescripcion">Descripción:</label>
            <input type="text" id="txtDescripcion" class="form-control" />
        </div>
        <button id="btnGuardar" class="btn btn-success">Guardar</button>
    </div>

    <script src="js/app/index.js"></script>

</body>
</html>
