<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Ejemploajax.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ejemplo AJAX</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="js/lib/jquery-3.2.1.min.js"></script>
    <!--<script src="js/lib/bootstrap.min.js"></script>-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

    <script src="js/lib/handlebars-v4.0.10.js"></script>
    <script src="js/lib/bootstrap-datepicker.min.js"></script>
    <script src="locales/bootstrap-datepicker.es.min.js"></script>
     <script src="http://www.google.com/jsapi" type="text/javascript"></script>
    <script type="text/javascript">
        // Global variable to hold data
        // Load the Visualization API and the piechart package.
        google.load('visualization', '1', { packages: ['corechart'] });
    </script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <!--<link href="css/terceros/bootstrap.min.css" rel="stylesheet" />-->
    <link href="css/terceros/font-awesome.min.css" rel="stylesheet" />
    <link href="css/terceros/bootstrap-datepicker.min.css" rel="stylesheet" />
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

        .btn-en-linea {
            margin-top:24px;
        }
    </style>


    
</head>
<body>

    <div id="cargador">
        <i class="fa fa-cog fa-spin fa-3x fa-fw"></i>
    </div>


    <div class="container">
        <div class="row" id="formulario">
            <div class="form-group col-md-3">
                <label for="txtEdadMin">Edad Mínima:</label>
                <input type="text" id="txtEdadMin" class="form-control" />
            </div> 
            <div class="form-group col-md-3">
                <label for="txtEdadMax">Edad Máxima:</label>
                <input type="text" id="txtEdadMax" class="form-control"/>
            </div> 
            <div class="form-group col-md-3">
                <label for="txtFecha">Fecha:</label>
                <input type="text" id="txtFecha" class="form-control"/>
            </div> 
            <div class="form-group col-md-3">
                <button class="btn btn-primary btn-en-linea" id="btnConsultar"><i class="fa fa-search"></i> Consultar</button>
            <//div>
        </div>
        <div class="row">
            <div id="contenedor" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

            </div>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                <button class="btn btn-primary" id="btnAbrirGrafica"><i class="fa fa-pie-chart"></i> Mostrar Gráfica</button>
                <button class="btn btn-success" id="btnAnterior">Anterior</button>
                <button class="btn btn-success" id="btnSiguiente">Siguiente</button>
            </div>
        </div>
    </div>
    
    

    <!-- Modal -->
    <div class="modal fade" id="modalGrafico" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">

            <h5 class="modal-title" id="exampleModalLabel">Gráfica de la información demográfica</h5>

              <!--
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
              -->
          </div>

          <div class="modal-body">
                
                <div id="divChart"></div>
              <input type="text" id="txtPrueba" />
          </div>

          <div class="modal-footer">
            <!--<button type="button" class="btn btn-secondary" data-dismiss="modal">Aceptar</button>-->
              <button type="button" class="btn btn-primary" id="btnAceptar">Aceptar</button>
          </div>
        </div>
      </div>
    </div>
    <!-- Modal -->




    <script id="tplDemo" type="text/x-handlebars-template">
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>País</th>
                    <th><i class="fa fa-female" aria-hidden="true"></i> Mujeres</th>
                    <th><i class="fa fa-male" aria-hidden="true"></i> Hombres</th>
                    <th>Edad</th>
                    <th>Año</th>
                    <th>Total</th>
                </tr>  
            </thead>
            <tbody>
                {{#each poblacion}}
                <tr>
                    <td>{{country}}</td>
                    <td class="text-right">{{females}}</td>
                    <td class="text-right">{{males}}</td>
                    <td class="text-right">{{age}}</td>
                    <td class="text-right">{{year}}</td>
                    <td class="text-right">{{total}}</td>
                </tr>
                {{/each}}
            </tbody>
        </table>
    </script>

    <script src="js/app/dashboard.js"></script>
</body>
</html>
