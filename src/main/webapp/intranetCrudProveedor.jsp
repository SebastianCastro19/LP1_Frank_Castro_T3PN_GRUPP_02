<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrapValidator.css" />

<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>

<title>Sistemas - Jorge Jacinto Gutarra</title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 5%">
		<h1>CRUD Proveedor</h1>

		<div class="row" style="margin-top: 5%">
			<div class="col-md-3">
				<label class="control-label" for="id_filtro">Razón Social</label> 
			</div>	
			<div class="col-md-6">
				<input	class="form-control" type="text" id="id_filtro" placeholder="Ingrese el razonsocial de la razón social de la empresa">
			</div>	
			<div class="col-md-1">
				<button type="button" class="btn btn-primary" id="id_btn_filtro">Filtrar</button>
			</div>	
			<div class="col-md-1">
				<button type="button" class="btn btn-primary"  data-toggle='modal' data-target="#id_div_modal_registra" >Registrar</button>
			</div>	
		</div>


		<div class="row" style="margin-top: 4%">
			<table id="id_table" class="table table-bordered table-hover table-condensed" >
				<thead style='background-color:#337ab7; color:white'>
					<tr>
					    <th>Id Proveedor</th>
						<th>RUC</th>
						<th>Razón Social</th>
						<th>Dirección</th>
						<th>Teléfono</th>
						<th>Nombre del Contacto</th>
						<th>Estado</th>
						<th>País</th>
					</tr>
				</thead>
				<tbody>


				</tbody>
			</table>
		</div>
		
		<!-- INICIO MODAL DE REGISTRO -->
		<div class="modal fade" id="id_div_modal_registra" >
			<div class="modal-dialog" style="width: 60%">
					<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Proveedor</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_registra">
			                   			<input type="hidden" name="metodo" value="inserta">
			                   			<div class="panel-body">
			                   			
			                   			    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_reg_razonsocial">Razón Social</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_razonsocial" name="razonsocial" placeholder="Ingrese el razonsocial de la razón social de la empresa" type="text" maxlength="100"/>
		                                        </div>
		                                    </div> 	
		                                    
			                   				<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_ruc">RUC</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_ruc" name="ruc" placeholder="Ingrese el RUC de la empresa" type="text" maxlength="11"/>
		                                        </div>
		                                    </div> 	                               

		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_direccion">Dirección</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_direccion" name="direccion" placeholder="Ingrese la dirección" type="text" maxlength="100"/>
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_telefono">Teléfono</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_telefono" name="telefono" placeholder="Ingrese el teléfono" type="text" maxlength="9"/>
		                                        </div>
		                                    </div> 
		                                    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_contacto">Nombre del contacto</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_contacto" name="contacto" placeholder="Ingrese el Nombre del Contacto" type="text" maxlength="100"/>
		                                        </div>
		                                    </div> 
	
			                                <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_pais">País</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_reg_pais" name="pais">
														<option value=" ">[Seleccione]</option>
													</select>
		                                        </div>
		                                    </div> 	
 

		                                    <div class="form-group">
		                                        <div class="col-lg-12" align="center">
		                                        	<button type="button" style="width: 80px" id="id_btn_registra" class="btn btn-primary btn-sm">Registra</button>
		                                        	<button type="button" style="width: 80px" id="id_btn_reg_cancelar" class="btn btn-primary btn-sm" data-dismiss="modal">Cancela</button>
		                                        </div>
		                                    </div>   
		                                    
		                                    
			                             </div>
			                             </form>
			                        </div>
			                   </div>
			              </div>
					</div>
				</div>
			</div>
		</div>	 
		<!-- FIN MODAL DE REGISTRO -->
		
		<!-- INICIO MODAL DE ACTUALIZA -->
		<div class="modal fade" id="id_div_modal_actualiza" >
			<div class="modal-dialog" style="width: 60%">
					<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualizar datos del Proveedor</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_actualiza">
			                   			<input type="hidden" name="metodo" value="actualiza">
			                   			<input type="hidden" name="idProveedor" id="idProveedor">
			                   			<div class="panel-body">
			                   			
			                   			
			                   				<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_ruc">RUC</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_ruc" name="ruc" placeholder="Ingrese el RUC de la empresa" type="text" maxlength="11"/>
		                                        </div>
		                                    </div> 
		                                    
			                                <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_reg_razonsocial">Razón Social</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_razonsocial" name="razonsocial" placeholder="Ingrese el razonsocial de la razón social de la empresa" type="text" maxlength="100"/>
		                                        </div>
		                                    </div> 	
		                                    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_direccion">Dirección</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_direccion" name="direccion" placeholder="Ingrese la dirección" type="text" maxlength="100"/>
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_telefono">Teléfono</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_telefono" name="telefono" placeholder="Ingrese el teléfono" type="text" maxlength="9"/>
		                                        </div>
		                                    </div> 
		                                    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_contacto">Nombre del contacto</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_contacto" name="contacto" placeholder="Ingrese el Nombre del Contacto" type="text" maxlength="100"/>
		                                        </div>
		                                    </div> 
	
			                                <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_pais">País</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_reg_pais" name="pais">
														<option value=" ">[Seleccione]</option>
													</select>
		                                        </div>
		                                    </div> 	 
		                                    
		                                    
		                                    
		                                    <div class="form-group">
		                                        <div class="col-lg-12" align="center">
		                                        	<button type="button" style="width: 80px" id="id_btn_actualiza" class="btn btn-primary btn-sm">Actualiza</button>
		                                        	<button type="button" style="width: 80px" id="id_btn_act_cancelar" class="btn btn-primary btn-sm" data-dismiss="modal">Cancela</button>
		                                        </div>
		                                    </div>   
		                                    
		                                    
			                             </div>
			                             </form>
			                        </div>
			                   </div>
			              </div>
					</div>
				</div>
			</div>
		</div>	
		<!-- FIN MODAL DE ACTUALIZA -->
		
	</div>


	<script type="text/javascript">
		$("#id_btn_filtro").click(function() {
			var vfiltro = $("#id_filtro").val();
			$.getJSON("crudProveedor", {"metodo":"lista","filtro":vfiltro}, function(data) {
				agregarGrilla(data);
			});
		});
		
		function agregarGrilla(lista){
			 $('#id_table').DataTable().clear();
			 $('#id_table').DataTable().destroy();
			 $('#id_table').DataTable({
					data: lista,
					language: IDIOMA,
					searching: true,
					ordering: true,
					processing: true,
					pageLength: 10,
					lengthChange: false,
					info:true,
					scrollY: 305,
			        scroller: {
			            loadingIndicator: true
			        },
					columns:[
						{data: "idProveedor",className:'text-center'},
						{data: "razonsocial",className:'text-center'},
						{data: "ruc",className:'text-center'},						
						{data: "direccion",className:'text-center'},
						{data: "telefono",className:'text-center'},						
						{data: "contacto",className:'text-center'},
						{data: function(row, type, val, meta){
							return row.estado == 1 ? "Activo" : "Inactivo";  
						},className:'text-center'},
						{data: "pais.nombre",className:'text-center'},
						{data: function(row, type, val, meta){
							return '<button type="button" class="btn btn-info btn-sm" onClick="verFormularioActualiza(\'' + row.idProveedor   + '\',\'' + row.razonsocial   + '\',\'' +  row.ruc + '\',\'' + row.direccion + '\',\'' + row.telefono + '\',\'' + row.contacto + '\',\'' + row.estado + '\',\'' + row.pais.nombre +'\');">Editar</button>';  
						},className:'text-center'},
						{data: function(row, type, val, meta){
							return '<button type="button" class="btn btn-warning btn-sm" onClick="eliminacionLogica(\'' + row.idProveedor +'\');" >E.Lógica</button>';
						},className:'text-center'},
						{data: function(row, type, val, meta){
							return '<button type="button" class="btn btn-danger btn-sm"  onClick="eliminacionFisica(\'' + row.idProveedor +'\');" >E.Física</button>';
						},className:'text-center'},
					]                                     
			    });
		}
		
		function verFormularioActualiza(idProveedor, razonsocial, ruc, estado, pais){
			console.log(">> verFormularioActualiza >> " + idProveedor);
			           
			$("#idProveedor").val(idProveedor);
			$("#id_act_razonsocial").val(razonsocial);
			$("#id_act_ruc").val(ruc);
			$("#id_act_direccion").val(direccion);
			$("#id_act_telefono").val(telefono);
			$("#id_act_contacto").val(contacto);
			$("#id_act_pais").val(pais);
		}
		
		$.getJSON("cargaPais",{}, function (data){
			$.each(data, function(index, item){
				$("#id_reg_pais").append("<option value='"+ item.idPais +"'>"+ item.nombre+"</option>");
				$("#id_act_pais").append("<option value='"+ item.idPais +"'>"+ item.nombre+"</option>");
			})
		});
		
		function eliminacionFisica(idProveedor){	
			var array = [idProveedor];
			mostrarMensajeConfirmacion(MSG_ELIMINAR, accionEliminacionFisica,null,array);
		}

		function accionEliminacionFisica(array){
			 $.ajax({
		          type: "POST",
		          url: "crudProveedor", 
		          data: {"metodo":"eFisica", "idProveedor":array[0]},
		          success: function(data){
		        	  mostrarMensaje(data.mensaje);
		        	  agregarGrilla(data.datos);
		          },
		          error: function(){
		        	  mostrarMensaje(MSG_ERROR);
		          }
		    });
		}
		
		$("#id_btn_registra").click(function() {
			var validator = $('#id_form_registra').data('bootstrapValidator');
		    validator.validate();
			
		    if (validator.isValid()) {
		        $.ajax({
			          type: "POST",
			          url: "crudProveedor", 
			          data: $('#id_form_registra').serialize(),
			          success: function(data){
			        	  mostrarMensaje(data.mensaje);
			        	  agregarGrilla(data.datos);
			        	  validator.resetForm();
			        	  $('#id_div_modal_registra').modal("hide");
			          },
			          error: function(){
			        	  mostrarMensaje(MSG_ERROR);
			          }
			    });
		    }
		});
		
		$("#id_btn_actualiza").click(function() {
			var validator = $('#id_form_actualiza').data('bootstrapValidator');
		    validator.validate();
			
		    if (validator.isValid()) {
		        $.ajax({
			          type: "POST",
			          url: "crudProveedor", 
			          data: $('#id_form_actualiza').serialize(),
			          success: function(data){
			        	  mostrarMensaje(data.mensaje);
			        	  agregarGrilla(data.datos);
			        	  validator.resetForm();
			        	  $('#id_div_modal_actualiza').modal("hide");
			          },
			          error: function(){
			        	  mostrarMensaje(MSG_ERROR);
			          }
			    });
		    }
		});
		
		
		function eliminacionLogica(idProveedor){
			 $.ajax({
		          type: "POST",
		          url: "crudProveedor", 
		          data: {"metodo":"eLogica", "idProveedor":idProveedor},
		          success: function(data){
		        	  agregarGrilla(data.datos);
		          },
		          error: function(){
		        	  mostrarMensaje(MSG_ERROR);
		          }
		    });
		}
		
		$(document).ready(function() {
		    $('#id_form_registra').bootstrapValidator({
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        
		        fields:{
		        	razonsocial : {  
		        		selector: "#id_reg_razonsocial",
		        		validators : {
		        			notEmpty: {
		                        message: 'El nombre de la razón social es requerido'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 30,
		                        message: 'El nombre de la razón social tiene de 3 a 30 caracteres'
		                    },
		        		}
		        	},
		        	ruc : {
		        		selector: "#id_reg_ruc",
		        		validators : {
		        			notEmpty: {
		                        message: 'El ruc es requerido'
		                    },
		                    regexp: {
		                        regexp: /^[0-9]{11}$/,
		                        message: 'El ruc tiene 11 dígitos'
		                    },
		        		}
		        	},
		        	pais : {
		        		selector: "#id_reg_pais",
		        		validators : {
		        			notEmpty: {
		                        message: 'El país es requerido'
		                    },
		        		}
		        	},        	
		        }
		    });
		});
		
		$(document).ready(function() {
		    $('#id_form_actualiza').bootstrapValidator({
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        
		        fields:{
		        	razonsocial : {  
		        		selector: "#id_act_razonsocial",
		        		validators : {
		        			notEmpty: {
		                        message: 'El razonsocial es requerido'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 30,
		                        message: 'El razonsocial tiene de 3 a 30 caracteres'
		                    },
		        		}
		        	},
		        	ruc : {
		        		selector: "#id_act_ruc",
		        		validators : {
		        			notEmpty: {
		                        message: 'El ruc es requerido'
		                    },
		                    regexp: {
		                        regexp: /^[0-9]{8}$/,
		                        message: 'El ruc tiene 8 dígitos'
		                    },
		        		}
		        	},
		        	estado : {
		        		selector: "#id_act_estado",
		        		validators : {
		        			notEmpty: {
		                        message: 'El estado es requerido'
		                    },
		        		}
		        	},     
		        	pais : {
		        		selector: "#id_act_pais",
		        		validators : {
		        			notEmpty: {
		                        message: 'La categoría es requerida'
		                    },
		        		}
		        	},        	
		        }
		    });
		});		
		
		function limpiarFormulario(){	
			$('#id_reg_ruc').val("");
			$('#id_reg_razonsocial').val("");
			$('#id_reg_direccion').val(" ");
			$('#id_act_telefono').val("");
			$('#id_act_contacto').val("");
			$('#id_act_pais').val(" ");
			//$('#id_act_estado').val(" ");
		}
	</script>
</body>
</html>



