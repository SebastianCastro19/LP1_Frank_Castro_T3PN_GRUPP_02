<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Registra Proveedor</title>
</head>
<body>


<div class="container">
<h1>Registra Proveedor</h1>

	<form action="registraAlumno" id="id_form"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombres</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_dni">DNI</label>
				<input class="form-control" type="text" id="id_dni" name="dni" placeholder="Ingrese el dni" maxlength="8">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_tipo"> Tipo </label> <select
					class="form-control" id="id_tipo" name="tipo">
					<option value=" ">[Seleccione]</option>
					<option value="1">Nacional</option>
					<option value="2">Extranjero</option>
				</select>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_razonsocial">Razon Social</label>
				<input class="form-control" type="text" id="id_razonsocial" name="razonsocial" placeholder="Ingrese la razon social" maxlength="100">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_ruc">RUC de la empresa</label>
				<input class="form-control" type="text" id="id_ruc" name="ruc" placeholder="Ingrese el RUC" maxlength="11">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_direccion">Domicilio Fiscal de la Empresa</label>
				<input class="form-control" type="text" id="id_direccion" name="direccion" placeholder="Ingrese el Domicilio Fiscal de la empresa" maxlength="200">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_celular">Telefono de Contacto de la Empresa</label>
				<input class="form-control" type="text" id="id_celular" name="celular" placeholder="Ingrese el numero de telefono de contacto" maxlength="9">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_contacto">Nombre de la Persona de Contacto Telefonico</label>
				<input class="form-control" type="text" id="id_contacto" name="contacto" placeholder="Ingrese el Nombre de la Persona de Contacto Telefonico" maxlength="200">
			</div>
			
			
			
			<div class="form-group">
				<button type="button" class="btn btn-primary" id="id_btn_registra">Crea Tipo</button>
			</div>
	</form>
</div>

<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>


<script type="text/javascript">
$(document).ready(function() {
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        fields:{
        	nombre : {  
        		selector: "#id_nombre",
        		validators : {
        			notEmpty: {
                        message: 'El nombre es requerido'
                    },
                    stringLength: {
                        min: 3,
                        max: 30,
                        message: 'El nombre tiene de 3 a 30 caracteres'
                    },
        		}
        	},
        	dni : {
        		selector: "#id_dni",
        		validators : {
        			notEmpty: {
                        message: 'El dni es requerido'
                    },
                    regexp: {
                        regexp: /^[0-9]{8}$/,
                        message: 'El dni tiene 8 dígitos'
                    },
        		}
        	},
        	tipo : {
        		selector: "#id_tipo",
        		validators : {
        			notEmpty: {
                        message: 'El tipo es requerido'
                    },
        		}
        	},
        	razonsocial : {
        		selector: "#id_razonsocial",
        		validators : {
        			notEmpty: {
                        message: 'La razon social de la empresa es requerida'
                    },
        		}
        	}, 
        	ruc : {
        		selector: "#id_ruc",
        		validators : {
        			notEmpty: {
                        message: 'El RUC de la empresa es requerido'
                    },
        		}
        	}, 
        	direccion : {
        		selector: "#id_direccion",
        		validators : {
        			notEmpty: {
                        message: 'El domicilio fiscal de la empresa es requerido'
                    },
        		}
        	}, 
        }
  
    });

});
</script>


<script type="text/javascript">
	$("#id_btn_registra").click(function(){
		var validator = $('#id_form').data('bootstrapValidator');
	    validator.validate();
		
	    if (validator.isValid()) {
	        $.ajax({
	          type: "POST",
	          url: "registraProveedor", 
	          data: $('#id_form').serialize(),
	          success: function(data){
	        	  mostrarMensaje(data.mensaje);
	        	  limpiarFormulario();
	        	  validator.resetForm();
	          },
	          error: function(){
	        	  mostrarMensaje(MSG_ERROR);
	          }
	        });
	        
	    }
	});

	$.getJSON("cargaTipo", {}, function (data){
		$.each(data, function(index, item){
			$("#id_tipo").append("<option value=" +  item.idTipo +" >" +  item.descripcion + "</option>");
		});	
	});		

	
	function limpiarFormulario(){	
		$('#id_nombre').val('');
		$('#id_dni').val('');
		$('#id_tipo').val(' ');
		$('#id_razonsocial').val(' ');
		$('#id_ruc').val(' ');
		$('#id_direccion').val(' ');
	}
</script>
	
</body>
</html>



