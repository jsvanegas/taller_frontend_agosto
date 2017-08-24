<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ordenes.aspx.cs" Inherits="Northwind.ordenes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Órdenes de Compra</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link href="css/terceros/bootstrap-datepicker.min.css" rel="stylesheet" />
    <link href="css/terceros/sweetalert.css" rel="stylesheet" />

    <script src="js/lib/jquery-3.2.1.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="js/lib/bootstrap-datepicker.min.js"></script>
    <script src="js/lib/sweetalert.min.js"></script>
</head>
<body>
    
    <div class="col-md-12">
        <h1>Registro de órdenes de Compra</h1>
        <div class="row">
            <div class="form-group col-md-4">
                <label for="txtFechaEnvio">Fecha de Envío:</label>
                <input type="text" required="required" id="txtFechaEnvio" class="form-control" />
            </div>
            <div class="form-group col-md-4">
                <label for="txtFechaRequerida">Fecha Requerida:</label>
                <input type="text" required="required" id="txtFechaRequerida" class="form-control"  />
            </div>
            <div class="col-md-4">
                <button class="btn btn-primary" id="btnEnviar">Enviar</button>
            </div>
        </div>
    </div>

    
    <script src="js/app/ordenes/ordenes.modelo.js"></script>
    <script src="js/app/ordenes/ordenes.control.js"></script>
    <script src="js/app/ordenes/ordenes.vista.js"></script>

</body>
</html>
