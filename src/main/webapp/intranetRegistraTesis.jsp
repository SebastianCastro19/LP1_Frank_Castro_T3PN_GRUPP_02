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

<title>Registra Tesis</title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />

<div class="container" style="margin-top: 4%">
<h1>Registra Tesis</h1>

	<form action="registraRevista" id="id_form"> 
			<input type="hidden" name="metodo" value="registra">	

			<div class="form-group">
				<label class="control-label" for="id_titulo">Titulo</label>
				<input class="form-control" type="text" id="id_titulo" name="titulo" placeholder="Ingrese el titulo" maxlength="50">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_tema">Tema</label>
				<input class="form-control" type="text" id="id_tema" name="tema" placeholder="Ingrese la frecuencia" maxlength="30">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_alumno"> Alumno </label> <select
					class="form-control" id="id_alumno" name="alumno">
					<option value=" ">[Seleccione]</option>
				</select>
			</div>
			<div class="form-group">
				<button type="button" class="btn btn-primary" id="id_btn_registra">Registrar Tesis</button>
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

          	titulo : {
        		selector: "#id_titulo",
        		validators : {
        			notEmpty: {
                        message: 'El titulo es requerido'
                    },
        		}
        	}, 
        	tema : {
        		selector: "#id_tema",
        		validators : {
        			notEmpty: {
                        message: 'El tema es requerido'
                    },
        		}
        	}, 
        	alumno : {
        		selector: "#id_alumno",
        		validators : {
        			notEmpty: {
                        message: 'El Alumno es obligatorio'
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
	          url: "registraTesis", 
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

	
	$.getJSON("listaAlumnoPorNombre", {}, function (data){
		$.each(data, function(index, item){
			$("#id_alumno").append("<option value=" +  item.idAlumno +" >" +  item.nombres + "</option>");
		});	
	});	

	
	function limpiarFormulario(){	
		
		$('#id_titulo').val(' ');
		$('#id_tema').val(' ');
		$('#id_alumno').val(' ');
	}
</script>
	
</body>
</html>


