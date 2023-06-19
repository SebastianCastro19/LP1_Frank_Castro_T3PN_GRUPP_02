

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	
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

<title>Consulta Autor</title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />

<div class="container" style="margin-top: 4%">
		<h1>Lista Autor</h1>
		
		<div class="row" style="margin-top: 5%">
			<div class="col-md-4">
				<label class="control-label">Nombres</label> 
			</div>	
			<div class="col-md-5">
				<input class="form-control" type="text" name="nombre" id="id_nombres" >
			</div>			
		</div>
		<div class="row" style="margin-top: 2%">
			<div class="col-md-4">
				<label class="control-label">Apellidos</label> 
			</div>	
			<div class="col-md-5">
				<input class="form-control" type="text" name="apellido" id="id_apellidos" >
			</div>			
		</div>
		<div class="row" style="margin-top: 2%">
			<div class="col-md-4">
				<label class="control-label">Telefono</label> 
			</div>	
			<div class="col-md-5">
				<input class="form-control" type="text" name="telefono" id="id_telefono" maxlength="9" >
			</div>			
		</div>
		<div class="row" style="margin-top: 2%">
			<div class="col-md-4">
				<label class="control-label">Grado</label> 
			</div>	
			<div class="col-md-5">
				<select class="form-control" id="id_grado" name="grado">
					<option value="-1">[Seleccione]</option>
				</select>
			</div>			
		</div>
		<div class="row" style="margin-top: 2%">
			<div class="col-md-4">
				<label class="control-label" for="id_estado">Estado</label> 
			</div>	
			<div class="col-md-5">
				<input type="checkbox" class="custom-control-input" id="id_estado" checked="checked"  name="estado" value="1"/>
			</div>			
		</div>
		<div class="row" style="margin-top: 2%">
			<div class="col-md-3">
				<label class="control-label" for="id_filtro">Fecha Nacimiento</label> 
			</div>	
			<div class="col-md-1"></div>
			<div class="col-md-2">
				<input	class="form-control" type="date" id="id_fecha_inicio" name="fechaInicio">
			</div>
			<div class="col-md-1"></div>	
			<div class="col-md-2">
				<input	class="form-control" type="date" id="id_fecha_fin" name="fechaFin">
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-2">
				<button type="button" class="btn btn-primary" id="id_btn_filtro">Filtro</button>
			</div>	
		</div>

		<div class="row" style="margin-top: 4%">
			<table id="id_table" class="table table-bordered table-hover table-condensed" >
				<thead style='background-color:#337ab7; color:white'>
					<tr>
						<th>Codigo</th>
						<th>Nombres</th>
						<th>Apellidos</th>
						<th>Fec Nacimiento</th>
						<th>Telefono</th>
						<th>Grado</th>
						<th>Estado</th>
						<th></th>
					</tr>
				</thead>
				<tbody>


				</tbody>
			</table>

		</div>
		
		<!-- INICIO MODAL DE ACTUALIZA -->
		<div class="modal fade" id="id_div_modal_ver" >
			<div class="modal-dialog" style="width: 60%">
					<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span>Datos del Autor</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_actualiza">
			                   			<input type="hidden" name="metodo" value="actualiza">
			                   			<input type="hidden" name="idAutor" id="idAutor" >
			                   			<div class="panel-body">
			                                <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_nombres">Nombres</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_nombres" type="text" readonly="readonly" />
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_apellidos">Apellidos</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_apellidos" type="text" readonly="readonly" />
		                                        </div>
		                                    </div> 	
											<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_fecnac">Fecha Nacimiento</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_fecnac" name="fechaNacimiento" type="date" readonly="readonly" />
		                                        </div>
		                                    </div> 
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_telefono">Telefono</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_telefono" name="telefono" type="text" readonly="readonly" maxlength="9"/>
		                                        </div>
		                                    </div> 	 	
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_estado">Estado</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_act_estado" name="estado" disabled="disabled">
														<option value=" ">[Seleccione]</option>
														<option value="1">Activo</option>
														<option value="0">Inactivo</option>
													</select>
		                                        </div>
		                                    </div> 	 
			                                <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_grado">Grado</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_act_grado" name="grado" disabled="disabled">
														<option value=" ">[Seleccione]</option>
													</select>
		                                        </div>
		                                    </div> 	  
		                                      <div class="form-group">
		                                        <div class="col-lg-12" align="center">
		                                        	<button type="button" style="width: 80px" id="id_btn_salir" class="btn btn-primary btn-sm" data-dismiss="modal">Salir</button>
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
	//Funcion para cargar el ComboBox Grado (Funciona)
	$.getJSON("cargaGrado", {}, function (data){
		$.each(data, function(index, item){
			$("#id_grado").append("<option value=" +  item.idGrado +" >" +  item.descripcion+ "</option>");
			$("#id_act_grado").append("<option value=" +  item.idGrado +" >" +  item.descripcion+ "</option>");
		});	
	});
	
	//Funcion para filtrar (Funciona)
		$("#id_btn_filtro").click(function() {
			var vnom = $("#id_nombres").val();
			var vape = $("#id_apellidos").val();
			var vfecIni = $("#id_fecha_inicio").val();
			var vfecFin = $("#id_fecha_fin").val();
			var vtel = $("#id_telefono").val();
			var vgrado = $("#id_grado").val();
			var vestado = $("#id_estado").is(":checked") ? "1": "0";
			
			console.log("Nombre : "  + vnom);
			console.log("Apellido : "  + vape);
			console.log("F.Inicio :"  + vfecIni);
			console.log("F.Fin :"  + vfecFin);
			console.log("Telefono :"  + vtel);
			console.log("Grado :"   + vgrado);
			console.log("Estado :"  + vestado);
			
			$.getJSON("listaAutorComplejo", {"estado": vestado,"grado":vgrado,"nombre":vnom,"apellido":vape,"telefono":vtel,"fechaInicio":vfecIni,"fechaFin":vfecFin}, function(data) {
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
						{data: "idAutor",className:'text-center'},
						{data: "nombres",className:'text-center'},
						{data: "apellidos",className:'text-center'},
						{data: "formateadoFecNac",className:'text-center'},
						{data: "telefono",className:'text-center'},
						{data: "grado.descripcion",className:'text-center'},
						{data: function(row, type, val, meta){
							return row.estado == 1 ? "Activo" : "Inactivo";  
						},className:'text-center'},
						{data: function (row,type,val,meta){
							return '<button type="button" class="btn btn-info btn-sm" onClick="verFormulario(\'' + row.nombres +'\',\''+ row.apellidos +'\',\''+ row.formateadoFecNac +'\',\''+row.telefono+'\',\''+ row.estado +'\',\''+ row.grado.idGrado + '\');">Ver</button>';
						},className:'text-center'},
					]                                     
			    });
		}
		
		
		//Para visualizar formulario (No funciona)
		function verFormulario(nombres,apellidos,telefono,fecha,estado,grado){
			$("#id_act_nombres").val(nombres);
			$("#id_act_apellidos").val(apellidos);
			$("#id_act_telefono").val(fecha);
			$("#id_act_fecnac").val(telefono);
			$("#id_act_estado").val(estado);
			$("#id_act_grado").val(grado);
			$("#id_div_modal_ver").modal("show");
		}
		
		
		
	</script>

</body>
</html>



