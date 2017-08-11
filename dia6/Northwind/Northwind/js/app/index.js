$('#btnGuardar').on('click', guardarCategoria);

function guardarCategoria() {
    var categoria = {
        CategoryID: $('#cmbCategorias').val(),
        CategoryName: $('#txtNombre').val(),
        Description:$('#txtDescripcion').val()
    };
    $.ajax({
        url: 'categorias/actualizar',
        type: 'PUT',
        data: categoria,
        dataType: 'json',
        //contentType:'application/json',
        success: function (respuesta) {
            console.log(respuesta);
        },
        error: controlarError
    });
}


function consultarCategorias() {
    $.ajax({
        url: 'categorias/consultar',
        type: 'GET',
        dataType: 'json',
        success: cargarComboCategorias,
        error: controlarError
    })
};

function controlarError(err) {
    console.error(err);
}

function cargarComboCategorias(respuesta) {
    $('#cmbCategorias')
        .llenarCombo(respuesta, 'CategoryID', 'CategoryName')
        .on('change', onCategoriaChange);
}

function cargarComboProductos(respuesta) {
    $('#cmbProductos')
        .llenarCombo(respuesta, 'ProductID', 'ProductName')
}

function onCategoriaChange() {
    var idCategoria = $('#cmbCategorias').val();
    if (idCategoria=='-1') {
        return;
    }

    $('#txtNombre').val( $('#cmbCategorias option:selected').text() );

    $.ajax({
        url: 'productos/consultar_por_categoria',
        type: 'POST',
        data: {idCategoria:idCategoria},
        dataType: 'json',
        success: cargarComboProductos,
        error: controlarError
    })
}


$.fn.llenarCombo = function (data, value, text) {
    var cmb = $(this).empty();
    var option = $('<option>').val(-1).text('Seleccione una opción');
    cmb.append(option);
    for (var i = 0; i < data.length; i++) {
        var option = $('<option>').val(data[i][value]).text(data[i][text]);
        cmb.append(option);
    }
    return cmb;
}

consultarCategorias();