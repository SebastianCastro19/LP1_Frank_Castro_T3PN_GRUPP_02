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
<h1>Autor: Miguel Cobeñas - 202216313</h1>

	<form action="registraAlumno" id="id_form"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombres y apellidos completos del representante legal</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre" maxlength="45">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_dni">DNI del representante legal</label>
				<input class="form-control" type="text" id="id_dni" name="dni" placeholder="Ingrese el dni" maxlength="8">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_tipo"> Tipo de empresa (Nacional/Extranjero) </label> <select
					class="form-control" id="id_tipo" name="tipo">
					<option value=" ">[Seleccione]</option>

				</select>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_razonsocial">Razon Social de la Empresa</label>
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
				<label class="control-label" for="id_pais"> Pais </label> <select
					class="form-control" id="id_pais" name="pais">
					<option value=" ">[Seleccione]</option>
<option value="1">Afganistán</option>
<option value="2">Islas Gland</option>
<option value="3">Albania</option>
<option value="4">Alemania</option>
<option value="5">Andorra</option>
<option value="6">Angola</option>
<option value="7">Anguilla</option>
<option value="8">Antártida</option>
<option value="9">Antigua y Barbuda</option>
<option value="10">Antillas Holandesas</option>
<option value="11">Arabia Saudí</option>
<option value="12">Argelia</option>
<option value="13">Argentina</option>
<option value="14">Armenia</option>
<option value="15">Aruba</option>
<option value="16">Australia</option>
<option value="17">Austria</option>
<option value="18">Azerbaiyán</option>
<option value="19">Bahamas</option>
<option value="20">Bahréin</option>
<option value="21">Bangladesh</option>
<option value="22">Barbados</option>
<option value="23">Bielorrusia</option>
<option value="24">Bélgica</option>
<option value="25">Belice</option>
<option value="26">Benin</option>
<option value="27">Bermudas</option>
<option value="28">Bhután</option>
<option value="29">Bolivia</option>
<option value="30">Bosnia y Herzegovina</option>
<option value="31">Botsuana</option>
<option value="32">Isla Bouvet</option>
<option value="33">Brasil</option>
<option value="34">Brunéi</option>
<option value="35">Bulgaria</option>
<option value="36">Burkina Faso</option>
<option value="37">Burundi</option>
<option value="38">Cabo Verde</option>
<option value="39">Islas Caimán</option>
<option value="40">Camboya</option>
<option value="41">Camerún</option>
<option value="42">Canadá</option>
<option value="43">República Centroafricana</option>
<option value="44">Chad</option>
<option value="45">República Checa</option>
<option value="46">Chile</option>
<option value="47">China</option>
<option value="48">Chipre</option>
<option value="49">Isla de Navidad</option>
<option value="50">Ciudad del Vaticano</option>
<option value="51">Islas Cocos</option>
<option value="52">Colombia</option>
<option value="53">Comoras</option>
<option value="54">República Democrática del Congo</option>
<option value="55">Congo</option>
<option value="56">Islas Cook</option>
<option value="57">Corea del Norte</option>
<option value="58">Corea del Sur</option>
<option value="59">Costa de Marfil</option>
<option value="60">Costa Rica</option>
<option value="61">Croacia</option>
<option value="62">Cuba</option>
<option value="63">Dinamarca</option>
<option value="64">Dominica</option>
<option value="65">República Dominicana</option>
<option value="66">Ecuador</option>
<option value="67">Egipto</option>
<option value="68">El Salvador</option>
<option value="69">Emiratos Árabes Unidos</option>
<option value="70">Eritrea</option>
<option value="71">Eslovaquia</option>
<option value="72">Eslovenia</option>
<option value="73">España</option>
<option value="74">Islas ultramarinas de Estados Unidos</option>
<option value="75">Estados Unidos</option>
<option value="76">Estonia</option>
<option value="77">Etiopía</option>
<option value="78">Islas Feroe</option>
<option value="79">Filipinas</option>
<option value="80">Finlandia</option>
<option value="81">Fiyi</option>
<option value="82">Francia</option>
<option value="83">Gabón</option>
<option value="84">Gambia</option>
<option value="85">Georgia</option>
<option value="86">Islas Georgias del Sur y Sandwich del Sur</option>
<option value="87">Ghana</option>
<option value="88">Gibraltar</option>
<option value="89">Granada</option>
<option value="90">Grecia</option>
<option value="91">Groenlandia</option>
<option value="92">Guadalupe</option>
<option value="93">Guam</option>
<option value="94">Guatemala</option>
<option value="95">Guayana Francesa</option>
<option value="96">Guinea</option>
<option value="97">Guinea Ecuatorial</option>
<option value="98">Guinea-Bissau</option>
<option value="99">Guyana</option>
<option value="100">Haití</option>
<option value="101">Islas Heard y McDonald</option>
<option value="102">Honduras</option>
<option value="103">Hong Kong</option>
<option value="104">Hungría</option>
<option value="105">India</option>
<option value="106">Indonesia</option>
<option value="107">Irán</option>
<option value="108">Iraq</option>
<option value="109">Irlanda</option>
<option value="110">Islandia</option>
<option value="111">Israel</option>
<option value="112">Italia</option>
<option value="113">Jamaica</option>
<option value="114">Japón</option>
<option value="115">Jordania</option>
<option value="116">Kazajstán</option>
<option value="117">Kenia</option>
<option value="118">Kirguistán</option>
<option value="119">Kiribati</option>
<option value="120">Kuwait</option>
<option value="121">Laos</option>
<option value="122">Lesotho</option>
<option value="123">Letonia</option>
<option value="124">Líbano</option>
<option value="125">Liberia</option>
<option value="126">Libia</option>
<option value="127">Liechtenstein</option>
<option value="128">Lituania</option>
<option value="129">Luxemburgo</option>
<option value="130">Macao</option>
<option value="131">ARY Macedonia</option>
<option value="132">Madagascar</option>
<option value="133">Malasia</option>
<option value="134">Malawi</option>
<option value="135">Maldivas</option>
<option value="136">Malí</option>
<option value="137">Malta</option>
<option value="138">Islas Malvinas</option>
<option value="139">Islas Marianas del Norte</option>
<option value="140">Marruecos</option>
<option value="141">Islas Marshall</option>
<option value="142">Martinica</option>
<option value="143">Mauricio</option>
<option value="144">Mauritania</option>
<option value="145">Mayotte</option>
<option value="146">México</option>
<option value="147">Micronesia</option>
<option value="148">Moldavia</option>
<option value="149">Mónaco</option>
<option value="150">Mongolia</option>
<option value="151">Montserrat</option>
<option value="152">Mozambique</option>
<option value="153">Myanmar</option>
<option value="154">Namibia</option>
<option value="155">Nauru</option>
<option value="156">Nepal</option>
<option value="157">Nicaragua</option>
<option value="158">Níger</option>
<option value="159">Nigeria</option>
<option value="160">Niue</option>
<option value="161">Isla Norfolk</option>
<option value="162">Noruega</option>
<option value="163">Nueva Caledonia</option>
<option value="164">Nueva Zelanda</option>
<option value="165">Omán</option>
<option value="166">Países Bajos</option>
<option value="167">Pakistán</option>
<option value="168">Palau</option>
<option value="169">Palestina</option>
<option value="170">Panamá</option>
<option value="171">Papúa Nueva Guinea</option>
<option value="172">Paraguay</option>
<option value="173">Perú</option>
<option value="174">Islas Pitcairn</option>
<option value="175">Polinesia Francesa</option>
<option value="176">Polonia</option>
<option value="177">Portugal</option>
<option value="178">Puerto Rico</option>
<option value="179">Qatar</option>
<option value="180">Reino Unido</option>
<option value="181">Reunión</option>
<option value="182">Ruanda</option>
<option value="183">Rumania</option>
<option value="184">Rusia</option>
<option value="185">Sahara Occidental</option>
<option value="186">Islas Salomón</option>
<option value="187">Samoa</option>
<option value="188">Samoa Americana</option>
<option value="189">San Cristóbal y Nevis</option>
<option value="190">San Marino</option>
<option value="191">San Pedro y Miquelón</option>
<option value="192">San Vicente y las Granadinas</option>
<option value="193">Santa Helena</option>
<option value="194">Santa Lucía</option>
<option value="195">Santo Tomé y Príncipe</option>
<option value="196">Senegal</option>
<option value="197">Serbia y Montenegro</option>
<option value="198">Seychelles</option>
<option value="199">Sierra Leona</option>
<option value="200">Singapur</option>
<option value="201">Siria</option>
<option value="202">Somalia</option>
<option value="203">Sri Lanka</option>
<option value="204">Suazilandia</option>
<option value="205">Sudáfrica</option>
<option value="206">Sudán</option>
<option value="207">Suecia</option>
<option value="208">Suiza</option>
<option value="209">Surinam</option>
<option value="210">Svalbard y Jan Mayen</option>
<option value="211">Tailandia</option>
<option value="212">Taiwán</option>
<option value="213">Tanzania</option>
<option value="214">Tayikistán</option>
<option value="215">Territorio Británico del Océano Índico</option>
<option value="216">Territorios Australes Franceses</option>
<option value="217">Timor Oriental</option>
<option value="218">Togo</option>
<option value="219">Tokelau</option>
<option value="220">Tonga</option>
<option value="221">Trinidad y Tobago</option>
<option value="222">Túnez</option>
<option value="223">Islas Turcas y Caicos</option>
<option value="224">Turkmenistán</option>
<option value="225">Turquía</option>
<option value="226">Tuvalu</option>
<option value="227">Ucrania</option>
<option value="228">Uganda</option>
<option value="229">Uruguay</option>
<option value="230">Uzbekistán</option>
<option value="231">Vanuatu</option>
<option value="232">Venezuela</option>
<option value="233">Vietnam</option>
<option value="234">Islas Vírgenes Británicas</option>
<option value="235">Islas Vírgenes de los Estados Unidos</option>
<option value="236">Wallis y Futuna</option>
<option value="237">Yemen</option>
<option value="238">Yibuti</option>
<option value="239">Zambia</option>
<option value="240">Zimbabue</option>
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
        	celular : {
        		selector: "#id_celular",
        		validators : {
        			notEmpty: {
                        message: 'El telefono de contacto es obligatorio'
                    },
        		}
        	},
        	contacto : {
        		selector: "#id_contacto",
        		validators : {
        			notEmpty: {
                        message: 'El nombre de contacto es obligatorio'
                    },
        		}
        	}, 
        	pais : {
        		selector: "#id_pais",
        		validators : {
        			notEmpty: {
                        message: 'El nombre del pais es obligatorio'
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
	$.getJSON("cargaPais", {}, function (data){
		$.each(data, function(index, item){
			$("#id_pais").append("<option value=" +  item.idTipo +" >" +  item.descripcion + "</option>");
		});	
	});	

	
	function limpiarFormulario(){	
		$('#id_nombre').val('');
		$('#id_dni').val('');
		$('#id_tipo').val(' ');
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



