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
<script type="text/javascript" src="js/bootstrapValidator.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Sistemas - Jorge Jacinto Gutarra</title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">
<h4>Registra Libro</h4>
<h6>Autor: Diego Villafuerte Villalobos</h6>

	<form action="registraLibro" id="id_form"> 
			<input type="hidden" name="metodo" value="registra">	
			
STRING-TITULO
			<div class="form-group">
				<label class="control-label" for="id_titulo">T�tulo del libro</label>
				<input class="form-control" type="text" id="id_titulo" name="titulo" placeholder="Ingrese el t�tulo">
			</div>
INT-ANIO			
			<div class="form-group">
				<label class="control-label" for="anio">A�o del libro</label>
				<input class="form-control" type="number" id="id_anio" name="anio" placeholder="Ingrese el a�o">
			</div>
STRING-SERIE			
			<div class="form-group">
				<label class="control-label" for="id_serie">Serie del libro</label>
				<input class="form-control" type="text" id="id_serie" name="titulo" placeholder="Ingrese el t�tulo">
			</div>
FECHA REGISTRO


INT-ESTADO			
			<div class="form-group">
				<label class="control-label" for="anio">A�o del libro</label>
				<input class="form-control" type="number" id="id_anio" name="anio" placeholder="Ingrese el a�o">
			</div>
			
CATEGORIA		
			
			<div class="form-group">
				<label class="control-label" for="id_categoria"> Categor�a </label> <select
					class="form-control" id="id_categoria" name="categoria">
					<option value=" ">[Seleccione]</option>
				</select>
			</div>
			
			<div class="form-group">
				<button type="button" class="btn btn-primary" id="id_btn_registra">Crea Alumno</button>
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
                        message: 'El dni tiene 8 d�gitos'
                    },
        		}
        	},
        	categoria : {
        		selector: "#id_categoria",
        		validators : {
        			notEmpty: {
                        message: 'El correo es requerido'
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
	          url: "registraCliente", 
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

	$.getJSON("cargaCategoria", {}, function (data){
		$.each(data, function(index, item){
			$("#id_categoria").append("<option value=" +  item.idCategoria +" >" +  item.nombre+ "</option>");
		});	
	});		

	
	function limpiarFormulario(){	
		$('#id_nombre').val('');
		$('#id_dni').val('');
		$('#id_categoria').val(' ');
	}
</script>

	

</body>
</html>



