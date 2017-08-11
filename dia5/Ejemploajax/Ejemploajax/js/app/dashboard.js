var tpl = Handlebars.compile($('#tplDemo').html());
var paginaActual = 0;


$('#txtFecha').datepicker({
    format: "dd/mm/yyyy",
    language: "es",
    calendarWeeks: true,
    autoclose: true,
    todayHighlight: true
});

$('#btnConsultar').on('click', consultar);


$('#btnSiguiente').on('click', function () {
    paginaActual += 10;
    consultar();
});

$('#btnAnterior').on('click', function () {
    if (paginaActual>=10) {
        paginaActual -= 10;
    }
    consultar();
});

$('#btnAbrirGrafica').on('click', function () {
    $('#modalGrafico').modal({ backdrop: 'static', show: true, keyboard:false});
});

$('#modalGrafico').on('hidden.bs.modal', function (e) {
    $('#txtPrueba').val('');
});


$('#btnAceptar').on('click', function () {
    var txt = $('#txtPrueba');
    if (txt.val().trim()==='') {
        txt.select();
        return;
    }

    console.log('Valor: ', txt.val());
    $('#modalGrafico').modal('hide');
});

/*
$('#btnSiguiente, #btnAnterior').on('click', function (event) {

});
*/

function consultar() {
    var parametros = {
        actual: paginaActual,
        fecha: $('#txtFecha').val().replace(/\//g, '-')
    };

    if ($('#txtEdadMin').val().trim() != '') {
        parametros.min = parseInt($('#txtEdadMin').val());
        parametros.max = parseInt($('#txtEdadMax').val());
    }

    $.ajax({
        url: 'Datos.ashx',
        type: 'GET',
        data: parametros,
        dataType: 'json',
        success: cargarDatos,
        error: controlarError,
        beforeSend:mostrarCargador
    });
}

function mostrarCargador() {
    $('#cargador').fadeIn('fast');
}

function ocultarCargador() {
    $('#cargador').fadeOut('fast');
}

function cargarDatos(respuesta) {
    ocultarCargador();
    drawchart(respuesta.datos);
    if (respuesta.codigo == 1) {
        $('#contenedor').empty().append( tpl({ poblacion: respuesta.datos }));
    }
}

function controlarError(err) {
    ocultarCargador();
    console.error(err);
    alert('Ocurrió un error al consultar');
}


consultar();


function drawchart(dataValues) {
    // Callback that creates and populates a data table,
    // instantiates the pie chart, passes in the data and
    // draws it.
    var data = new google.visualization.DataTable();

    data.addColumn('string', 'age');
    data.addColumn('number', 'males');
 
    for (var i = 0; i < dataValues.length; i++)
    {
        data.addRow(['Edad: '+dataValues[i].age, dataValues[i].males] );
    }
    // Instantiate and draw our chart, passing in some options
    var chart = new google.visualization.PieChart(document.getElementById('divChart'));

    chart.draw(data,
      {
          title: "Pie Chart of Google Chart in Asp.net",
          position: "top",
          fontsize: "14px",
          chartArea: { width: '90%' },
          //is3D: true,
          //pieHole: 0.4,
          //sliceVisibilityThreshold: .008,
      });
}
