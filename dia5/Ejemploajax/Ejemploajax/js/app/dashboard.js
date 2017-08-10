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
    if (respuesta.codigo == 1) {
        $('#contenedor').empty().append( tpl({ poblacion: respuesta.datos }));
    }
}

function controlarError(err) {
    ocultarCargador();
    console.error(err);
}


consultar();