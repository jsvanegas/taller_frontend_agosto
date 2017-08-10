<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Ejemploajax.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="js/lib/jquery-3.2.1.min.js"></script>
    <script src="js/lib/bootstrap.min.js"></script>
    <script src="js/lib/handlebars-v4.0.10.js"></script>
    <script src="js/lib/bootstrap-datepicker.min.js"></script>
    <script src="locales/bootstrap-datepicker.es.min.js"></script>

    <style>
        #cargador {
            background-color:rgba(255, 255, 255, 0.7);
            width:100%;
            position:fixed;
            top:0px;
            left:0px;
            height:100vh;
            z-index:999999;
            display:none;
            text-align:center;
            padding-top:70px;
        }

            #cargador .fa {
                font-size:60px;
            }
    </style>


    <link href="css/terceros/bootstrap.min.css" rel="stylesheet" />
    <link href="css/terceros/font-awesome.min.css" rel="stylesheet" />
    <link href="css/terceros/bootstrap-datepicker.min.css" rel="stylesheet" />
</head>
<body>

    <div id="cargador">
        <i class="fa fa-cog fa-spin fa-3x fa-fw"></i>
    </div>


    <div class="container">
        <div class="row">
            <div class="form-group col-md-4">
                <label for="txtEdadMin">Edad Mínima:</label>
                <input type="text" id="txtEdadMin" class="form-control" />
            </div> 
            <div class="form-group col-md-4">
                <label for="txtEdadMax">Edad Máxima:</label>
                <input type="text" id="txtEdadMax" class="form-control"/>
            </div> 
            <div class="form-group col-md-4">
                <label for="txtFecha">Fecha:</label>
                <input type="text" id="txtFecha" class="form-control"/>
            </div> 
            <div class="form-group col-md-4">
                <button class="btn btn-primary" id="btnConsultar"><i class="fa fa-search"></i> Consultar</button>
            <//div>
        </div>
        <div class="row">
            <div id="contenedor" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

            </div>
            <div>
                <button class="btn btn-success" id="btnAnterior">Anterior</button>
                <button class="btn btn-success" id="btnSiguiente">Siguiente</button>
            </div>
        </div>
    </div>
    
    

    <script id="tplDemo" type="text/x-handlebars-template">
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>Mujeres</th>
                    <th>País</th>
                    <th>Edad</th>
                    <th>Hombres</th>
                    <th>Año</th>
                    <th>Total</th>
                </tr>  
            </thead>
            <tbody>
                {{#each poblacion}}
                <tr>
                    <td>{{females}}</td>
                    <td>{{country}}</td>
                    <td>{{age}}</td>
                    <td>{{males}}</td>
                    <td>{{year}}</td>
                    <td>{{total}}</td>
                </tr>
                {{/each}}
            </tbody>
        </table>
    </script>

    <script src="js/app/dashboard.js"></script>
</body>
</html>
