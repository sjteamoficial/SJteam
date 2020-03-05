/*=============================================
LISTADO DE PAISES
=============================================*/

$.ajax({

	url:"vistas/js/plugins/paises.json",
	type: "GET",
	success: function(respuesta){
		
		respuesta.forEach(seleccionarPais);

		function seleccionarPais(item, index){
			
			var pais =  item.name;
			var codPais =  item.code;
			var dial = item.dial_code;

			$("#inputPais").append(

				`<option value="`+pais+`,`+codPais+`,`+dial+`">`+pais+`</option>`

			)


		}

	}

})

/*=============================================
PLUGIN SELECT 2
=============================================*/

$('.select2').select2()

/*=============================================
AGREGAR DIAL CODE DEL PAIS
=============================================*/

$("#inputPais").change(function(){

	$(".dialCode").html($(this).val().split(",")[2])

})

/*=============================================
INPUT MASK
=============================================*/

$('[data-mask]').inputmask();

/*=============================================
FIRMA VIRTUAL
=============================================*/
$("#signatureparent").jSignature({

  color:"#333", // line color
  lineWidth:1, // Grosor de línea
  // Ancho y alto área de la firma
  idth:320,
  height:100

});

$(".repetirFirma").click(function(){

	$("#signatureparent").jSignature("reset");

})

/*=============================================
FUNCIÓN PARA GENERAR COOKIES
=============================================*/

function crearCookie(nombre, valor, diasExpiracion){

	var hoy = new Date();

	hoy.setTime(hoy.getTime() + (diasExpiracion*24*60*60*1000));

	var fechaExpiracion = "expires=" +hoy.toUTCString();

	document.cookie = nombre + "=" +valor+"; "+fechaExpiracion;
}



/*=============================================
VALIDAR FORMULARIO SUSCRIPCIÓN
=============================================*/

$(".suscribirse").click(function(){

	$(".alert").remove();

	var nombre = $("#inputName").val();
	var email = $("#inputEmail").val();
	var patrocinador = $("#inputPatrocinador").val();
	var enlace_afiliado = $("#inputAfiliado").val();
	var pais = $("#inputPais").val().split(",")[0];
	var codigo_pais = $("#inputPais").val().split(",")[1];
	var telefono_movil = $("#inputPais").val().split(",")[2]+" "+$("#inputMovil").val();
	var red = $("#tipoRed").val();
	var aceptarTerminos = $("#aceptarTerminos:checked").val();

	if($("#signatureparent").jSignature("isModified")){

		var firma = $("#signatureparent").jSignature("getData", "image/svg+xml");

	}

	/*=============================================
	VALIDAR
	=============================================*/
	if( nombre == "" ||
		email == "" ||
		patrocinador == "" ||
		enlace_afiliado == "" ||
		pais == "" ||
		codigo_pais == "" ||
		telefono_movil == "" ||
		red == "" ||
		aceptarTerminos != "on" ||
		!$("#signatureparent").jSignature('isModified')){

			$(".suscribirse").before(`

				<div class="alert alert-danger">Faltan datos, no ha aceptado o no ha firmado los términos y condiciones</div>


			`);

		return;


	}else{

		crearCookie("enlace_afiliado", enlace_afiliado, 1);
		crearCookie("patrocinador", patrocinador, 1);
		crearCookie("pais", pais, 1);
		crearCookie("codigo_pais", codigo_pais, 1);
		crearCookie("telefono_movil", telefono_movil, 1);
		crearCookie("red", red, 1);
		crearCookie("firma", firma[1], 1);


		var datos = new FormData();
		datos.append("suscripcion", "ok");
		datos.append("nombre", nombre);
		datos.append("email", email);

		$.ajax({

			url:"ajax/usuarios.ajax.php",
			method: "POST",
			data: datos,
			cache: false,
			contentType: false,
			processData: false,
			// dataType:"json",
			beforeSend: function(){

				$(".suscribirse").after(`

					<img src="vistas/img/plantilla/status.gif" class="ml-3" style="width:30px; height:30px" />
					<span class="alert alert-warning ml-3">Procesando la suscripción, no cerrar esta página</span>

				`)


			},
			success:function(respuesta){
				
				// console.log("respuesta", respuesta);

				window.location = respuesta;

			}

		})
	}
	

})


/*=============================================
TABLA USUARIOS
=============================================*/

// $.ajax({

// 	url:"ajax/tabla-usuarios.ajax.php",
// 	success: function(respuesta){
		
// 		console.log("respuesta", respuesta);
// 	}

// });

$(".tablaUsuarios").DataTable({
	"ajax":"ajax/tabla-usuarios.ajax.php",
 	"deferRender": true,
  	"retrieve": true,
  	"processing": true,
	"language": {

	    "sProcessing":     "Procesando...",
	    "sLengthMenu":     "Mostrar _MENU_ registros",
	    "sZeroRecords":    "No se encontraron resultados",
	    "sEmptyTable":     "Ningún dato disponible en esta tabla",
	    "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_",
	    "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0",
	    "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
	    "sInfoPostFix":    "",
	    "sSearch":         "Buscar:",
	    "sUrl":            "",
	    "sInfoThousands":  ",",
	    "sLoadingRecords": "Cargando...",
	    "oPaginate": {
	      "sFirst":    "Primero",
	      "sLast":     "Último",
	      "sNext":     "Siguiente",
	      "sPrevious": "Anterior"
	    },
	    "oAria": {
	        "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
	        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
	    }

   }

});

/*=============================================
COPIAR EN EL CLIPBOARD
=============================================*/

$(".copiarLink").click(function(){

	var temporal = $("<input>");

	$("body").append(temporal);

	temporal.val($("#linkAfiliado").val()).select();

	document.execCommand("copy");

	temporal.remove();

	$(this).parent().parent().after(`
		
		<div class="text-muted copiado">Enlace copiado en el portapapeles</div>

	`)

	setTimeout(function(){

		$(".copiado").remove();

	},2000)

})

/*=============================================
Cancelar Suscripción
=============================================*/

$(".cancelarSuscripcion").click(function(){

	var idSuscripcion = $(this).attr("idSuscripcion");
	var idUsuario = $(this).attr("idUsuario");

	swal({
    	title: '¿Está seguro de cancelar la suscripción?',
    	text: "¡Si no lo está puede cancelar la acción, recuerde que perderá todo el trabajo que ha hecho con la red pero recibirá el pago de su último mes!",
    	type: 'warning',
    	showCancelButton: true,
    	confirmButtonColor: '#3085d6',
      	cancelButtonColor: '#d33',
      	cancelButtonText: 'Cancelar',
      	confirmButtonText: 'Si, cancelar suscripción!'
	  }).then(function(result){

	    if(result.value){

	    	var token = null;

	    	var settings1 = {
			  "async": true,
			  "crossDomain": true,
			  "url": "https://api.sandbox.paypal.com/v1/oauth2/token",
			  "method": "POST",
			  "headers": {
			    "content-type": "application/x-www-form-urlencoded",
			    "authorization": "Basic QVRHd21HZGVxZ2xmS0R4VFpaNkNwUjZFV1VjNWRZcElaUndiX25jcjNvZXRHLVFSWnRQRU1YemY4MlZZZVdpSzg2a1luMjdiVmFOSGtBbFI6RU1sdXZsbVZfQ056QzhXT1p1LTRFSlNfQjBTVkFhWktiNnhjLVgwR2Fob3gtNlFEVE1IS2hJMVEyNnlXaUFuY3pEOG92Q012bFpmMks1TG8=",
			    "cache-control": "no-cache"
			  },
			  "data": {
			    "grant_type": "client_credentials"
			  }
			}

			$.ajax(settings1).done(function (response) {
			  
				token = "Bearer "+response["access_token"];
				
				var settings2 = {
				  "async": true,
				  "crossDomain": true,
				  "url": "https://api.sandbox.paypal.com/v1/billing/subscriptions/"+idSuscripcion+"/cancel",
				  "method": "POST",
				  "headers": {
				    "content-type": "application/json",
				    "authorization": token,
				    "cache-control": "no-cache"
				  },
				  "processData": false,
				  "data": "{\r\n  \"reason\": \"Not satisfied with the service\"\r\n}"
				}

				$.ajax(settings2).done(function (response) {
		
			 		var datos = new FormData();
					datos.append("idUsuario", idUsuario);

					$.ajax({

						url:"ajax/usuarios.ajax.php",
						method: "POST",
						data: datos,
						cache: false,
						contentType: false,
						processData: false,
						success:function(respuesta){
							
							if(respuesta == "ok"){

								swal({
									type:"success",
								  	title: "¡Su suscripción ha sido cancelada con éxito!",
								  	text: "¡Continua disfrutando de nuestro contenido gratuito!",
								  	showConfirmButton: true,
									confirmButtonText: "Cerrar"
								  
								}).then(function(result){

										if(result.value){   
										    window.location = "perfil";
										  } 
								});
												
							}

						}

					})
									 

				});


			});

	    }

	})


})


/*=============================================
PINTEREST GRID
=============================================*/

$('.grid').pinterest_grid({

	no_columns: 3,
	padding_x: 10,
	padding_y: 10,
	margin_bottom: 50,
	single_column_breakpoint: 700
})
