

//(function () {
    
    var categorias = [];
    var categoria = null;
    var productos = [];

    $('#btnGuardar').on('click', guardarCategoria);

    function guardarCategoria() {
        categoria = {
            CategoryID: $('#cmbCategorias').val(),
            CategoryName: $('#txtNombre').val(),
            Description: $('#txtDescripcion').val()
        };
        $.ajax({
            url: 'categorias/actualizar',
            type: 'PUT',
            data: categoria,
            dataType: 'json',
            //contentType:'application/json',
            success: function (respuesta) {
                console.log(respuesta);
                if (respuesta === 'OK') {
                    //Usando variables por referencia
                    //var categoriaActualizada = obtenerCategoriaPorId(categoria.CategoryID);
                    //categoriaActualizada.CategoryName = categoria.CategoryName;
                    //categoriaActualizada.Description = categoria.Description;

                    //Usando el índice para acceder directamente al arreglo
                    var indice = obtenerIndiceCategoriaPorId(categoria.CategoryID);
                    categorias[indice].CategoryName = categoria.CategoryName;
                    categorias[indice].Description = categoria.Description;
                }
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
        categorias = respuesta;
        $('#cmbCategorias')
            .llenarCombo(categorias, 'CategoryID', 'CategoryName')
            .on('change', onCategoriaChange);
    }

    function cargarComboProductos(respuesta) {
        productos = respuesta;
        $('#cmbProductos')
            .llenarCombo(respuesta, 'ProductID', 'ProductName')
    }

    function onCategoriaChange() {
        var idCategoria = $('#cmbCategorias').val();
        if (idCategoria == '-1') {
            return;
        }

        var categoriaSeleccionada = categoria = categorias.obtenerObjetoPorAtributo("CategoryID", idCategoria);
        if (categoriaSeleccionada) {
            $('#txtNombre').val(categoriaSeleccionada.CategoryName);
            $('#txtDescripcion').val(categoriaSeleccionada.Description);
        }
        

        $.ajax({
            url: 'productos/consultar_por_categoria',
            type: 'POST',
            data: { idCategoria: idCategoria },
            dataType: 'json',
            success: cargarComboProductos,
            error: controlarError
        })
    }

    function obtenerCategoriaPorId(id) {
        id = parseInt(id);
        for (var i = 0; i < categorias.length; i++) {
            if (categorias[i].CategoryID === id) {
                return categorias[i];
            }
        }
        return null;
    }

    function obtenerIndiceCategoriaPorId(id) {
        id = parseInt(id);
        for (var i = 0; i < categorias.length; i++) {
            if (categorias[i].CategoryID === id) {
                return i;
            }
        }
        return null;
    }

    consultarCategorias();

//})();

    //Se pueden extender métodos a cualquier prototipo
    Array.prototype.obtenerObjetoPorAtributo = function (atributo, valor) {
        //this hace referencia al arreglo sobre el cual se invoca el método.
        for (var i = 0; i < this.length; i++) {
            if (this[i][atributo] == valor) {
                return this[i];
            }
        }
        return null;
    };



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
