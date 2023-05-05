<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/global.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Sistemas - Jorge Jacinto Gutarra</title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">

<div class="container">
<h1>Registra Sala</h1>

	<form action="registraSala" id="id_form"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_numero">Número De Sala</label>
				<input class="form-control" type="number" id="id_numero" name="numero" placeholder="Ingrese el numero de sala" maxlength="2">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_piso">Piso</label>
				<input class="form-control" type="number" id="id_piso" name="piso" placeholder="Ingrese el piso" maxlength="2">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_numAlumnos">Número de Alumnos</label>
				<input class="form-control" type="number" id="id_numAlumnos" name="numAlumnos" placeholder="Ingrese la cantidad de alumnos" maxlength="2">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_recursos">Recursos</label>
				<input class="form-control" type="text" id="id_recursos" name="recursos" placeholder="Ingrese los recursos" maxlength="30">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_sede"> Sede </label>
				 <select
					class="form-control" id="id_sede" name="sede">
					<option value=" ">[Seleccione]</option>
				</select>
			</div>
			<div class="form-group">
				<button type="button" class="btn btn-primary" id="id_btn_registra">Registra Sede</button>
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
        	numero : {  
        		selector: "#id_numero",
        		validators : {
        			notEmpty: {
                        message: 'El numero es requerido'
                    },
                    stringLength: {
                        min: 1,
                        max: 3,
                        message: 'El numero tiene de 1 a 2 digitos'
                    },
        		}
        	},
        	piso : {  
        		selector: "#id_piso",
        		validators : {
        			notEmpty: {
                        message: 'El piso es requerido'
                    },
                    stringLength: {
                        min: 1,
                        max: 2,
                        message: 'El piso tiene de 1 a 2 digitos'
                    },
        		}
        	},
        	numAlumnos : {
        		selector: "#id_numAlumnos",
        		validators : {
        			notEmpty: {
                        message: 'El número de alumnos es requerido'
                    },
                    stringLength: {
                        min: 1,
                        max: 2,
                        message: 'El número de alumnos tiene de 1 a 2 digitos'
                    },
        		}
        	},
        	sede : {
        		selector: "#id_sede",
        		validators : {
        			notEmpty: {
                        message: 'La sede es requerida'
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
	          url: "registraSala", 
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

	$.getJSON("cargaSede", {}, function (data){
		$.each(data, function(index, item){
			$("#id_sede").append("<option value=" +  item.idSede +" >" +  item.nombre+ "</option>");
		});	
	});		

	
	function limpiarFormulario(){	
		$('#id_numero').val('');
		$('#id_piso').val('');
		$('#id_numAlumnos').val(' ');
		$('#id_recursos').val('');
		$('#id_sede').val(' ');
		
	}
 </script>
</div>
</body>
</html>

