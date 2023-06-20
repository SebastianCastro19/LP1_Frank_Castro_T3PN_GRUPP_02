

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

<title>Consulta Alumnos</title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />

<div class="container" style="margin-top: 4%">
		<h1>Lista Alumnos</h1>
		
		<div class="row" style="margin-top: 5%">
			<div class="col-md-4">
				<label class="control-label">Nombres</label> 
			</div>	
			<div class="col-md-5">
				<input class="form-control" type="text" name="nombre" id="id_nombre" >
			</div>			
		</div>
		<div class="row" style="margin-top: 2%">
			<div class="col-md-4">
				<label class="control-label">Apellidos</label> 
			</div>	
			<div class="col-md-5">
				<input class="form-control" type="text" name="apellido" id="id_apellido" >
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
				<label class="control-label">DNI</label> 
			</div>	
			<div class="col-md-5">
				<input class="form-control" type="text" name="dni" id="id_dni" maxlength="8" >
			</div>			
		</div>
		<div class="row" style="margin-top: 2%">
			<div class="col-md-4">
				<label class="control-label">Correo</label> 
			</div>	
			<div class="col-md-5">
				<input class="form-control" type="text" name="correo" id="id_correo" >
			</div>			
		</div>
		<div class="row" style="margin-top: 2%">
			<div class="col-md-4">
				<label class="control-label">Pais</label> 
			</div>	
			<div class="col-md-5">
				<select class="form-control" id="id_pais" name="pais">
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
						<th>Teléfono</th>
						<th>DNI</th>
						<th>Correo</th>
						<th>País</th>
						<th>Estado</th>
						<th>Fecha Nacimiento</th>
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
						<h4><span class="glyphicon glyphicon-ok-sign"></span>Datos del Alumno</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_actualiza">
			                   			<input type="hidden" name="metodo" value="actualiza">
			                   			<input type="hidden" name="idAlumno" id="idAlumno" >
			                   			<div class="panel-body">
			                                <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_nombre">Nombres</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_nombre" type="text" readonly="readonly" />
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_apellido">Apellidos</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_apellido" type="text" readonly="readonly" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_telefono">Teléfono</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_telefono" name="telefono" type="text" readonly="readonly" maxlength="9"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_dni">DNI</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_dni" name="dni" type="text" readonly="readonly" maxlength="8"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_correo">Correo</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_correo" type="text" readonly="readonly" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_pais">País</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_act_pais" name="pais" disabled="disabled">
														<option value=" ">[Seleccione]</option>
													</select>
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
		                                        <label class="col-lg-3 control-label" for="id_act_fechaNacimiento">Fecha Nacimiento</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_fechaNacimiento" name="fechaNacimiento" type="date" readonly="readonly" />
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
	$.getJSON("cargaPais", {}, function (data){
		$.each(data, function(index, item){
			$("#id_pais").append("<option value=" +  item.idPais +" >" +  item.nombre+ "</option>");
			$("#id_act_pais").append("<option value=" +  item.idPais +" >" +  item.nombre+ "</option>");
		});	
	});
	
	//Funcion para filtrar (Funciona)
		$("#id_btn_filtro").click(function() {
			var vnombre = $("#id_nombre").val();
			var vapellido = $("#id_apellido").val();
			var vtelefono = $("#id_telefono").val();
			var vdni = $("#id_dni").val();
			var vcorreo = $("#id_correo").val();
			var vpais = $("#id_pais").val();
			var vestado = $("#id_estado").is(":checked") ? "1": "0";
			var vfechaInicio = $("#id_fecha_inicio").val();
			var vfechaFin = $("#id_fecha_fin").val();
			
			console.log("Nombre : "  + vnombre);
			console.log("Apellido : "  + vapellido);
			console.log("Telefono : "  + vtelefono);
			console.log("DNI : "  + vdni);
			console.log("Correo : "  + vcorreo);
			console.log("Pais :"   + vpais);
			console.log("Estado :"  + vestado);
			console.log("Fecha Inicio :"  + vfechaInicio);
			console.log("Fecha Fin :"  + vfechaFin);
			
			if (valFechaInicioMayFechaFin("#id_fecha_inicio", "#id_fecha_fin")){
				mostrarMensaje("La fecha fin es super a la fecha inicio");
				return;
			}
			
			$.getJSON("listaAlumnoComplejo", {"estado": vestado,"pais":vpais,"nombres":vnombre,"apellidos":vapellido,"telefono":vtelefono,"dni":vdni,"correo":vcorreo,"fechaInicio":vfechaInicio,"fechaFin":vfechaFin}, function(data) {
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
						{data: "idAlumno",className:'text-center'},
						{data: "nombres",className:'text-center'},
						{data: "apellidos",className:'text-center'},
						{data: "telefono",className:'text-center'},
						{data: "dni",className:'text-center'},
						{data: "correo",className:'text-center'},
						{data: "pais.nombre",className:'text-center'},
						{data: function(row, type, val, meta){
							return row.estado == 1 ? "Activo" : "Inactivo";  
						},className:'text-center'},
						{data: "formateadoFechaNacimiento",className:'text-center'},
						{data: function (row,type,val,meta){
							return '<button type="button" class="btn btn-info btn-sm" onClick="verFormulario(\'' + row.nombres +'\',\''+ row.apellidos +'\',\''+ row.telefono +'\',\''+ row.dni +'\',\''+ row.correo +'\',\''+ row.formateadoFechaNacimiento +'\',\''+ row.estado +'\',\''+ row.pais.nombre + '\');">Ver</button>';
						},className:'text-center'},
					]                                     
			    });
		}
		
		
		function verFormulario(nombres,apellidos,telefono,dni,correo,pais,estado,fechaNacimiento){
			$("#id_act_nombre").val(nombres);
			$("#id_act_apellido").val(apellidos);
			$("#id_act_telefono").val(telefono);
			$("#id_act_dni").val(dni);
			$("#id_act_correo").val(correo);
			$("#id_act_pais").val(pais);
			$("#id_act_estado").val(estado);  
			$("#id_act_fechaNacimiento").val(fechaNacimiento); 
			$("#id_div_modal_ver").modal("show");
		}
		
		function valFechaInicioMayFechaFin(idIni, idFin){
		    var fIni = $.trim($(idIni).val());
		    var fFin = $.trim($(idFin).val());
		    
		    var dIni = new Date(fIni);
		    var dFin = new Date(fFin);
		    
		    if (dIni > dFin){
		        return true;
		    }else{
		        return false;
		    }
		}
	</script>

</body>
</html>



