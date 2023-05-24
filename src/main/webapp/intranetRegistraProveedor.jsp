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
<jsp:include page="intranetCabecera.jsp" />

<div class="container" style="margin-top: 4%">
<h1>Registra Proveedor</h1>
<h1>Autor: Miguel Cobeñas - 202216313</h1>

	<form action="registraProveedor" id="id_form"> 
			<input type="hidden" name="metodo" value="registra">	

			<div class="form-group">
				<label class="control-label" for="id_razonsocial">Razón Social de la Empresa</label>
				<input class="form-control" type="text" id="id_razonsocial" name="razonsocial" placeholder="Ingrese la razon social" maxlength="30">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_ruc">RUC de la empresa</label>
				<input class="form-control" type="text" id="id_ruc" name="ruc" placeholder="Ingrese el RUC" maxlength="11">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_direccion">Dirección de la Empresa</label>
				<input class="form-control" type="text" id="id_direccion" name="direccion" placeholder="Ingrese el Domicilio Fiscal de la empresa" maxlength="30">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_celular">Teléfono de Contacto de la Empresa</label>
				<input class="form-control" type="text" id="id_celular" name="celular" placeholder="Ingrese el numero de telefono de contacto" maxlength="9">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_contacto">Nombre de la Persona de Contacto Telefónico</label>
				<input class="form-control" type="text" id="id_contacto" name="contacto" placeholder="Ingrese el Nombre de la Persona de Contacto Telefonico" maxlength="30">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_pais"> Pais </label> <select
					class="form-control" id="id_pais" name="pais">
					<option value=" ">[Seleccione]</option>
				</select>
			</div>
			
			
			
			<div class="form-group">
				<button type="button" class="btn btn-primary" id="id_btn_registra">Registrar Proveedor</button>
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

          	razonsocial : {
        		selector: "#id_razonsocial",
        		validators : {
        			notEmpty: {
                        message: 'La razón social de la empresa es requerida'
                    },
                    stringLength: {
                        min: 3,
                        max: 30,
                        message: 'La razón social tiene de 3 a 30 caracteres'
                    },
        		}
        	}, 
        	ruc : {
        		selector: "#id_ruc",
        		validators : {
        			notEmpty: {
                        message: 'El RUC de la empresa es requerido'
                    },
                    regexp: {
                        regexp: /^[0-9]{11}$/,
                        message: 'El RUC de la empresa tiene 11 dígitos'
                    },
        		}
        	}, 
        	direccion : {
        		selector: "#id_direccion",
        		validators : {
        			notEmpty: {
                        message: 'La dirección de la empresa es requerida'
                    },
        		}
        	}, 
        	celular : {
        		selector: "#id_celular",
        		validators : {
        			notEmpty: {
                        message: 'El teléfono de contacto es obligatorio'
                    },
                    regexp: {
                        regexp: /^[0-9]{9}$/,
                        message: 'El dni tiene 9 dígitos'
                    },
        		}
        	},
        	contacto : {
        		selector: "#id_contacto",
        		validators : {
        			notEmpty: {
                        message: 'El nombre de contacto es obligatorio'
                    },
                    stringLength: {
                        min: 3,
                        max: 30,
                        message: 'El nombre del contacto tiene de 3 a 30 caracteres'
                    },
        		}
        	}, 
        	pais : {
        		selector: "#id_pais",
        		validators : {
        			notEmpty: {
                        message: 'El nombre del país es obligatorio'
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

	
	$.getJSON("cargaPais", {}, function (data){
		$.each(data, function(index, item){
			$("#id_pais").append("<option value=" +  item.idPais +" >" +  item.nombre + "</option>");
		});	
	});	

	
	function limpiarFormulario(){	
		
		$('#id_razonsocial').val(' ');
		$('#id_ruc').val(' ');
		$('#id_direccion').val(' ');
		$('#id_celular').val(' ');
		$('#id_contacto').val(' ');
		$('#id_pais').val(' ');
	}
</script>
	
</body>
</html>



