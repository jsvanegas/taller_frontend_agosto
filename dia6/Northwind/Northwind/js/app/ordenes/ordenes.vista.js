var ordenesVista = vista = {
    
    init: function () {
        vista.configurarControles();
    },

    configurarControles: function () {
        $('#txtFechaEnvio, #txtFechaRequerida').datepicker({
            format: "dd/mm/yyyy",
            calendarWeeks: true,
            autoclose: true,
            todayHighlight: true
        });

        $('#btnEnviar').on('click', vista.validarFormulario);

    },

    validarFormulario: function () {

        var requeridos = $('input[required]');
        var errores = 0;
        for (var i = 0; i < requeridos.length; i++) {
            var txt = $(requeridos[i]);
            if (txt.val().trim() === '') {
                txt.parent().addClass('has-error');
                errores++;
            } else {
                txt.parent().removeClass('has-error').addClass('has-success');
            }
        }

        if (errores>0) {
            vista.mostrarAlerta('Formulario Incompleto', 'Debe diligenciar todos los campos obligatorios');
            $('div.has-error:first input').select();
        }
    },

    mostrarAlerta: function (titulo, mensaje) {
        swal({
            title: titulo,
            text: mensaje,
            type: "error",
            confirmButtonText: "Cool"
        });
    }

};

ordenesVista.init();