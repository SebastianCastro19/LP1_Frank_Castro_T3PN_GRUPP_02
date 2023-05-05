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
<h1>Registra Editorial</h1>

	<form action="registraEditorial" id="id_form"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_razonSocial">Razón Social</label>
				<input class="form-control" type="text" id="id_razonSocial" name="razonSocial" placeholder="Ingrese la razón social">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_direccion">Dirección</label>
				<input class="form-control" type="text" id="id_direccion" name="direccion" placeholder="Ingrese la dirección">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_ruc">RUC</label>
				<input class="form-control" type="text" id="id_ruc" name="ruc" placeholder="Ingrese el RUC" maxlength="11">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_pais"> Pais </label>
				 <select
					class="form-control" id="id_pais" name="pais">
					<option value=" ">[Seleccione]</option>
				</select>
			</div>
			<div class="form-group">
				<button type="button" class="btn btn-primary" id="id_btn_registra">Registra Editorial</button>
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
        	razonSocial : {  
        		selector: "#id_razonSocial",
        		validators : {
        			notEmpty: {
                        message: 'La razón social es requerida'
                    },
                    stringLength: {
                        min: 3,
                        max: 30,
                        message: 'La razón social tiene de 3 a 30 caracteres'
                    },
        		}
        	},
        	direccion : {  
        		selector: "#id_direccion",
        		validators : {
        			notEmpty: {
                        message: 'La dirección es requerida'
                    },
                    stringLength: {
                        min: 3,
                        max: 30,
                        message: 'La direccion tiene de 3 a 60 caracteres'
                    },
        		}
        	},
        	ruc : {
        		selector: "#id_ruc",
        		validators : {
        			notEmpty: {
                        message: 'El ruc es requerido'
                    },
                    regexp: {
                        regexp: /^[0-9]{11}$/,
                        message: 'El RUC tiene 11 dígitos'
                    },
        		}
        	},
        	pais : {
        		selector: "#id_pais",
        		validators : {
        			notEmpty: {
                        message: 'El Pais es requerido'
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
	          url: "registraEditorial", 
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
			$("#id_pais").append("<option value=" +  item.idPais +" >" +  item.nombre+ "</option>");
		});	
	});		

	
	function limpiarFormulario(){	
		$('#id_razonSocial').val('');
		$('#id_direccion').val('');
		$('#id_ruc').val(' ');
		$('#id_pais').val(' ');
		
	}
 </script>
</div>
</body>
</html>

