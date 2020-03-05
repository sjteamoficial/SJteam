<?php

/*=============================================
VISTAS
=============================================*/

date_default_timezone_set('America/Bogota');

$token = null;
$idPayout = null;

$usuarios = ControladorPagos::ctrMostrarUsuarios(null, null);

$fechaActual = date('Y-m-d');

foreach ($usuarios as $key => $value) {

	$fechaDiaDespues = strtotime ( '+1 day' , strtotime ($value["vencimiento"]));
	$fechaDiaDespues = date ( 'Y-m-d' , $fechaDiaDespues);
	
	if($fechaDiaDespues == $fechaActual){
		
		pagarUsuario($value["id_usuario"], $value["enlace_afiliado"], $value["paypal"], $value["vencimiento"], $fechaActual, $value["id_suscripcion"], $value["patrocinador"]);	
	}

}

/*=============================================
FUNCIÓN PARA PAGAR A CADA USUARIO POR SEPARADO
=============================================*/

function pagarUsuario($id_usuario, $enlace_afiliado, $paypal, $vencimiento, $fechaActual, $id_suscripcion, $patrocinador){

	$valorSuscripcion = 10;

	$comisionNivel1 = 0;
	$ventaNivel1 = 0;

	$comisionNivel2 = 0;
	$ventaNivel2 = 0;

	$comisionNivel3 = 0;
	$ventaNivel3 = 0;

	$comisionNivel4 = 0;
	$ventaNivel4 = 0;

	/*=============================================
	Traer el usuario en la red
	=============================================*/

	$respuesta = ControladorPagos::ctrMostrarUsuarioRed("red_matriz", "usuario_red", $id_usuario);

	/*=============================================
	Hacer recorrido por la primera línea para comisiones nivel 1
	=============================================*/	

	$linea1 = ControladorPagos::ctrMostrarUsuarioRed("red_matriz", "derrame_matriz", $respuesta[0]["orden_matriz"]);
	
	if(count($linea1) == 4){

		$comisionNivel1 = $valorSuscripcion;
		$ventaNivel1 = $valorSuscripcion*4;

	}else{

		$comisionNivel1 = 0;
		$ventaNivel1 = count($linea1)*$valorSuscripcion;
	}											

	/*=============================================
	Hacer recorrido por la segunda y tercera línea para comisiones nivel 2
	=============================================*/	

	$arrayNivel2 = array();
	$arrayNivel3 = array();
	$arrayNivel4 = array();

	foreach ($linea1 as $key1 => $value1) {
		
		$linea2 = ControladorPagos::ctrMostrarUsuarioRed("red_matriz", "derrame_matriz", $value1["orden_matriz"]);
										
		foreach ($linea2 as $key2 => $value2) {
	
			$linea3 = ControladorPagos::ctrMostrarUsuarioRed("red_matriz", "derrame_matriz", $value2["orden_matriz"]);

			/*=============================================
			LLENAMOS ARRAY PARA COMISIONES NIVEL 2
			=============================================*/	

			array_push($arrayNivel2, count($linea3));

			foreach ($linea3 as $key3 => $value3) {

				$linea4 = ControladorPagos::ctrMostrarUsuarioRed("red_matriz", "derrame_matriz", $value3["orden_matriz"]);

				foreach ($linea4 as $key4 => $value4) {

					$linea5 = ControladorPagos::ctrMostrarUsuarioRed("red_matriz", "derrame_matriz", $value4["orden_matriz"]);

					foreach ($linea5 as $key5 => $value5) {

						$linea6 = ControladorPagos::ctrMostrarUsuarioRed("red_matriz", "derrame_matriz", $value5["orden_matriz"]);

						/*=============================================
						LLENAMOS ARRAY PARA COMISIONES NIVEL 3
						=============================================*/	

						array_push($arrayNivel3, count($linea6));

						foreach ($linea6 as $key6 => $value6) {

							$linea7 = ControladorPagos::ctrMostrarUsuarioRed("red_matriz", "derrame_matriz", $value6["orden_matriz"]);

							foreach ($linea7 as $key7 => $value7) {

								$linea8 = ControladorPagos::ctrMostrarUsuarioRed("red_matriz", "derrame_matriz", $value7["orden_matriz"]);

								foreach ($linea8 as $key8 => $value8) {

									$linea9 = ControladorPagos::ctrMostrarUsuarioRed("red_matriz", "derrame_matriz", $value8["orden_matriz"]);

									foreach ($linea9 as $key9 => $value9) {

										$linea10 = ControladorPagos::ctrMostrarUsuarioRed("red_matriz", "derrame_matriz", $value9["orden_matriz"]);

										/*=============================================
										LLENAMOS ARRAY PARA COMISIONES NIVEL 4
										=============================================*/	

										array_push($arrayNivel4, count($linea10));

									}

								}

							}
							
						}

					}

				}			
				
			}
		
		}

	}

	/*=============================================
	COMISIONES NIVEL 2
	=============================================*/	

	$cantidadNivel2 = 0;
	$comiNivel2 = 0;

	for($i = 0; $i < count($arrayNivel2); $i++){
		
		$cantidadNivel2 += $arrayNivel2[$i];				
		
	}

	$bloque = floor($cantidadNivel2/4);

	if($cantidadNivel2 <= 32){														

		$comisionNivel2 = 0;
		$ventaNivel2 = $bloque*$valorSuscripcion*3;

	}else{

		$ventaNivel2 = $bloque*$valorSuscripcion*3;
		$comisionNivel2 = $ventaNivel2 - $valorSuscripcion*24;

	}

	/*=============================================
	COMISIONES NIVEL 3
	=============================================*/	

	$cantidadNivel3 = 0;
	$comiNivel3 = 0;

	for($i = 0; $i < count($arrayNivel3); $i++){
		
		$cantidadNivel3 += $arrayNivel3[$i];				
		
	}

	$bloque = floor($cantidadNivel3/64);

	if($cantidadNivel3 <= 1024){														

		$comisionNivel3 = 0;
		$ventaNivel3 = $bloque*$valorSuscripcion*24;

	}else{

		$ventaNivel3 = $bloque*$valorSuscripcion*24;
		$comisionNivel3 = $ventaNivel3 - $valorSuscripcion*384;

	}

	/*=============================================
	COMISIONES NIVEL 4
	=============================================*/	

	$cantidadNivel4 = 0;
	$comiNivel4 = 0;

	for($i = 0; $i < count($arrayNivel4); $i++){
		
		$cantidadNivel4 += $arrayNivel4[$i];				
		
	}

	$bloque = floor($cantidadNivel4/4096);						

	$ventaNivel4 = $bloque*$valorSuscripcion*384;
	$comisionNivel4 = $bloque*$valorSuscripcion*384;

	$periodo_comision = $comisionNivel1+$comisionNivel2+$comisionNivel3+$comisionNivel4;
	$periodo_venta = $ventaNivel1+$ventaNivel2+$ventaNivel3+$ventaNivel4;

	pagar($periodo_comision, $periodo_venta, $id_usuario, $enlace_afiliado, $paypal, $vencimiento, $fechaActual, $id_suscripcion, $patrocinador);

}

function pagar($periodo_comision, $periodo_venta, $id_usuario, $enlace_afiliado, $paypal, $vencimiento, $fechaActual, $id_suscripcion, $patrocinador){

	if($enlace_afiliado != "academy-of-life" && $periodo_comision != 0){
	
		/*=============================================
		CREAR EL ACCESS TOKEN DE PAYPAL MODO SANDBOX
		=============================================*/

		$curl1 = curl_init();

		curl_setopt_array($curl1, array(
		  CURLOPT_URL => "https://api.sandbox.paypal.com/v1/oauth2/token",
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_ENCODING => "",
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 300,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_CUSTOMREQUEST => "POST",
		  CURLOPT_POSTFIELDS => "grant_type=client_credentials",
		  CURLOPT_HTTPHEADER => array(
		    "authorization: Basic QVg2bFlDaEdLdkYwZnFmTGU1T1pXZ3ZONVlPYXo5bEllRVp5bjRXR09nTzE1enlCTVp2NHFQakxtRTVrcFJiRV93dFR0bzlleWNrS0hjSTE6RU9OTkFWcG9kV3JjdXpHRlBLeUtlTjhNM3JyQTJSMnFlZlg1bEI2TVZiZVU4dHRPVzVpQWZwMWpZckVwRkpZUEhhOTdjaEUtanBTY0JFYVM=",
		    "cache-control: no-cache",
		    "content-type: application/x-www-form-urlencoded"
		  ),
		));

		$response = curl_exec($curl1);
		$err = curl_error($curl1);

		curl_close($curl1);

		if ($err) {

		  echo "error";

		} else {

		  	$respuesta1 = json_decode($response, true);

		  	$token = $respuesta1["access_token"];
		  	
		  	$curl2 = curl_init();

		  	$aleatorio = rand(0, 10000);

			curl_setopt_array($curl2, array(
			  CURLOPT_URL => "https://api.sandbox.paypal.com/v1/payments/payouts",
			  CURLOPT_RETURNTRANSFER => true,
			  CURLOPT_ENCODING => "",
			  CURLOPT_MAXREDIRS => 10,
			  CURLOPT_TIMEOUT => 300,
			  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			  CURLOPT_CUSTOMREQUEST => "POST",
			  CURLOPT_POSTFIELDS => "{\r\n  \"sender_batch_header\": {\r\n    \"sender_batch_id\": \"Payouts_".$aleatorio."_".$enlace_afiliado."_".$fechaActual."\",\r\n    \"email_subject\": \"You have a payout!\",\r\n    \"email_message\": \"You have received a payout! Thanks for using our service!\"\r\n  },\r\n  \"items\": [\r\n    {\r\n      \"recipient_type\": \"EMAIL\",\r\n      \"amount\": {\r\n        \"value\": \"".$periodo_comision."\",\r\n       \"currency\": \"USD\"\r\n      },\r\n      \"note\": \"Thanks for your patronage!\",\r\n      \"sender_item_id\": \"Payouts_".$aleatorio."_".$enlace_afiliado."_".$fechaActual."\",\r\n      \"receiver\": \"".$paypal."\"\r\n    }\r\n  ]\r\n}",
			  CURLOPT_HTTPHEADER => array(
			    "authorization: Bearer ".$token,
			    "cache-control: no-cache",
			    "content-type: application/json"
			  ),
			));

			$response = curl_exec($curl2);
			$err = curl_error($curl2);

			curl_close($curl2);

			if ($err) {

			  echo "error";
			
			} else {

			  	$respuesta2 = json_decode($response, true);

			  	$idPayout = $respuesta2["batch_header"]["payout_batch_id"];

			  	// $idPayout = "SDGSDFTSER352";		

			  	$tabla = "pagos_matriz";

				$fechaInicial = strtotime ( '-1 month' , strtotime ($fechaInicio));
				$fechaInicial = date ( 'Y-m-d' , $fechaInicial );

			  	$datos = array( "id_pago_paypal" => $idPayout,
						  		"usuario_pago" => $id_usuario,
						  		"periodo" => $fechaInicial." a ".$vencimiento,
						  		"periodo_comision" => $periodo_comision,
						  		"periodo_venta" => $periodo_venta);

			  	$respuesta3 = ControladorPagos::ctrIngresarPagos($tabla, $datos);		  		
			  	
			  	/*=============================================
				VALIDAR LA SUSCRIPCIÓN
				=============================================*/

				if($respuesta3 == "ok"){

					$curl3 = curl_init();

					curl_setopt_array($curl3, array(
					  CURLOPT_URL => "https://api.sandbox.paypal.com/v1/billing/subscriptions/".$id_suscripcion,
					  CURLOPT_RETURNTRANSFER => true,
					  CURLOPT_ENCODING => "",
					  CURLOPT_MAXREDIRS => 10,
					  CURLOPT_TIMEOUT => 300,
					  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
					  CURLOPT_CUSTOMREQUEST => "GET",
					  CURLOPT_HTTPHEADER => array(
					    "authorization: Bearer ".$token,
					    "cache-control: no-cache",
					    "content-type: application/json"
					  ),
					));

					$response = curl_exec($curl3);
					$err = curl_error($curl3);

					curl_close($curl3);

					if ($err) {

					  echo "cURL Error #:" . $err;

					} else {

					  	$respuesta4 = json_decode($response, true);
					
				  	  	$estado = $respuesta4["status"];

			  			/*=============================================
						APPROVAL_PENDING. La suscripción se crea, pero aún no ha sido aprobada por el comprador.
						APPROVED. El comprador ha aprobado la suscripción.
						ACTIVE. La suscripción está activa.
						SUSPENDED. La suscripción está suspendida.
						CANCELLED. Se cancela la suscripción.
						EXPIRED. La suscripción ha caducado.
						=============================================*/

						if($estado == "ACTIVE"){
					
		    		    	$fechaVencimiento = substr($respuesta4["billing_info"]["next_billing_time"],0, -10);
				  	  		$ciclosPagados = $respuesta4["billing_info"]["cycle_executions"][0]["cycles_completed"];

							/*=============================================
							ACTUALIZAR SUSCRIPCIÓN TABLA DE USUARIOS
							=============================================*/

							$traerPatrocinador = ControladorPagos::ctrMostrarUsuarios("enlace_afiliado", $patrocinador);

							if ($traerPatrocinador["suscripcion"] == 0) {
									
								$patrocinadorRed = "academy-of-life";
							
							}else{

								$patrocinadorRed = $traerPatrocinador["enlace_afiliado"];

							}

							$datosSuscripcion = array("id_usuario" => $id_usuario,
													  "patrocinador" => $patrocinadorRed,
													  "ciclo_pago" => $ciclosPagados,
													  "vencimiento" => $fechaVencimiento);

							$actualizarSuscripcion = ControladorPagos::ctrActualizarSuscripcion($datosSuscripcion);
							echo '<pre>Actualizar suscripción: '; print_r($actualizarSuscripcion); echo '</pre>';

							/*=============================================
							ELIMINAR USUARIO DE LA RED
							=============================================*/

							$eliminarUsuarioRed = ControladorPagos::ctrEliminarUsuarioRed($id_usuario);
							echo '<pre>Eliminar Usuario Red: '; print_r($eliminarUsuarioRed); echo '</pre>';

							/*=============================================
							ACTUALIZAR SUSCRIPCIÓN TABLA RED
							=============================================*/

							$datosBinaria = array( "usuario_red" => $id_usuario,
			  							   		   "patrocinador_red" => $patrocinadorRed);

		  					$registroBinaria = ControladorPagos::ctrRegistroMatriz($datosBinaria);
							echo '<pre>Actualizar Usuario Red: '; print_r($registroBinaria); echo '</pre>';

						}else{

							/*=============================================
							ACTUALIZAR SUSCRIPCIÓN TABLA DE USUARIOS
							=============================================*/

							$datosSuscripcion = array("id_usuario" => $id_usuario,
													  "suscripcion" => 0,
													  "id_suscripcion" => null,
													  "vencimiento" => null,
													  "ciclo_pago" => null,
													  "firma" => null,
													  "fecha_contrato" => null);

							$cancelarSuscripcion = ControladorPagos::ctrCancelarSuscripcion($datosSuscripcion);
							echo '<pre>Cancelar suscripcion: '; print_r($cancelarSuscripcion); echo '</pre>';

							/*=============================================
							ELIMINAR USUARIO DE LA RED
							=============================================*/

							$eliminarUsuarioRed = ControladorPagos::ctrEliminarUsuarioRed($id_usuario);
							echo '<pre>Eliminar Usuario Red: '; print_r($eliminarUsuarioRed); echo '</pre>';

						}

					}

				}

			}

		}

	}

	if($enlace_afiliado == "academy-of-life"){

	  	/*=============================================
			INGRESAR PAGO DE ADMINISTRADOR
			=============================================*/

			$usuarios = ControladorPagos::ctrMostrarUsuarioRed("red_matriz", null, null);

			$periodo_comision = 0;
			$periodo_venta = (count($usuarios)-1)*10;

			$pagos = ControladorPagos::ctrMostrarPagosRed("pagos_matriz", null, null);

			if(count($pagos) != 0){

				foreach ($pagos as $key => $value) {

					if($value["usuario_pago"] == $id_usuario && $periodo_venta > $value["periodo_venta"]){

						$periodo_venta += $periodo_venta - $value["periodo_venta"];

					}else{

						$periodo_venta = 0;
					}

				}

			}

			$tabla = "pagos_matriz";

			$fechaInicial = strtotime ( '-1 day' , strtotime ($vencimiento));
			$fechaInicial = date ( 'Y-m-d' , $fechaInicial );

		  	$datos = array( "id_pago_paypal" => null,
					  		"usuario_pago" => $id_usuario,
					  		"periodo" => $fechaInicial." a ".$vencimiento,
					  		"periodo_comision" => $periodo_comision,
					  		"periodo_venta" => $periodo_venta);

		  	$respuesta = ControladorPagos::ctrIngresarPagos($tabla, $datos);
		  	echo '<pre>Pago Administrador: '; print_r($respuesta); echo '</pre>';

			/*=============================================
			ACTUALIZAR FECHA DE VENCIMIENTO
			=============================================*/

		  	$fechaNuevaVencimiento = strtotime ( '+1 day' , strtotime ($vencimiento));
			$fechaNuevaVencimiento = date ( 'Y-m-d' , $fechaNuevaVencimiento );	

		  	$datosSuscripcion = array("id_usuario" => $id_usuario,
									  "patrocinador" => null,
									  "ciclo_pago" => null,
									  "vencimiento" => $fechaNuevaVencimiento);

			$actualizarSuscripcion = ControladorPagos::ctrActualizarSuscripcion($datosSuscripcion);
			echo '<pre>Actualizar fecha vencimiento Administrador: '; print_r($actualizarSuscripcion); echo '</pre>';
	}

}



/*=============================================
CONTROLADORES
=============================================*/

class ControladorPagos{

	/*=============================================
	Mostrar Usuarios
	=============================================*/

	static public function ctrMostrarUsuarios($item, $valor){

		$tabla = "usuarios";

		$respuesta = ModeloPagos::mdlMostrarUsuarios($tabla, $item, $valor);

		return $respuesta;

	}

	/*=============================================
	Actualizar Suscripción
	=============================================*/

	static public function ctrActualizarSuscripcion($datos){

		$tabla = "usuarios";

		$respuesta = ModeloPagos::mdlActualizarSuscripcion($tabla, $datos);

		return $respuesta;

	}

	/*=============================================
	Cancelar Suscripción
	=============================================*/

	static public function ctrCancelarSuscripcion($datos){

		$tabla = "usuarios";

		$respuesta = ModeloPagos::mdlCancelarSuscripcion($tabla, $datos);

		return $respuesta;

	}

	/*=============================================
	MOSTRAR USUARIO RED
	=============================================*/

	static public function ctrMostrarUsuarioRed($tabla, $item, $valor){

		$respuesta = ModeloPagos::mdlMostrarUsuarioRed($tabla, $item, $valor);

		return $respuesta;

	}

	/*=============================================
	REGISTRO PAGOS RED
	=============================================*/

	static public function ctrIngresarPagos($tabla, $datos){

		$respuesta = ModeloPagos::mdlIngresarPagos($tabla, $datos);

		return $respuesta;

	}

	/*=============================================
	REGISTRO MATRIZ
	=============================================*/
	
	static public function ctrRegistroMatriz($datos){

		/*=============================================
		VARIABLES
		=============================================*/		

		$ordenMatriz = null;
		$derrameMatriz = null;	
		
		/*=============================================
		ASIGNAR EL ORDEN EN LA RED
		=============================================*/	

		$red = ModeloPagos::mdlMostrarUsuarioRed("red_matriz", null, null);	
		
		foreach ($red as $key => $value) {

			$ordenMatriz = $value["orden_matriz"] + 1;

							
		}

		/*=============================================
		TRAEMOS EL ID DEL PATROCINADOR Y ASIGNAMOS POSICIÓN Y PATROCINADOR
		=============================================*/				

		$patrocinador = ControladorPagos::ctrMostrarUsuarios("enlace_afiliado", $datos["patrocinador_red"]);

		$idPatrocinador	= $patrocinador["id_usuario"];

		$derrame = ModeloPagos::mdlMostrarUsuarioRed("red_matriz", "usuario_red", $idPatrocinador);

		foreach ($derrame as $key => $value) {
				
			$derrameMatriz = $value["orden_matriz"];
				
		}
				
		/*=============================================
		EJECUTAMOS FUNCIÓN PARA DAR POSICIÓN EN LA RED
		=============================================*/		

		$respuesta = ControladorPagos::derrameMatriz($derrameMatriz, $datos["patrocinador_red"]);			

		/*=============================================
		GENERAR LA POSICIÓN CORRESPONDIENTE
		=============================================*/	

		if ($respuesta["posicionLetra"] == "" || $respuesta["posicionLetra"] == "D"){

			$posicionLetra = "A";

		}

		if ($respuesta["posicionLetra"] == "A"){				

			$posicionLetra = "B";
			
		}

		if ($respuesta["posicionLetra"] == "B"){				

			$posicionLetra = "C";
			
		}

		if ($respuesta["posicionLetra"] == "C"){				

			$posicionLetra = "D";
			
		}

		/*=============================================
		GUARDAMOS NUEVO USUARIO EN LA RED
		=============================================*/

		$datosMatriz = array( "orden_matriz" => $ordenMatriz,
							   "usuario_red" => $datos["usuario_red"],
							   "derrame_matriz" => $respuesta["derrameMatriz"],
							   "patrocinador_red" => $datos["patrocinador_red"],
							   "posicion_matriz" => $posicionLetra);

		$tabla = "red_matriz";

		$respuesta = ModeloPagos::mdlRegistroMatriz($tabla, $datosMatriz);
		
		return $respuesta;

	}

	/*=============================================
	DERRAME Matriz
	=============================================*/	

	static public function derrameMatriz($derrameMatriz, $patrocinadorRed){

		$lineaDescendiente = ModeloPagos::mdlMostrarUsuarioRed("red_matriz","derrame_matriz", $derrameMatriz);

		/*=============================================
		CUANDO NO HAY LÍNEA DESCENDIENTE
		=============================================*/

		if(!$lineaDescendiente){

			$datos = array("posicionLetra"=>"",
				       	   "derrameMatriz"=>$derrameMatriz);

			return $datos;			

		}

		/*=============================================
		CUANDO SOLO HAY UNA LÍNEA DESCENDIENTE
		=============================================*/

		else if(count($lineaDescendiente) == 1){

			$datos = array("posicionLetra"=>"A",
				       	   "derrameMatriz"=>$derrameMatriz);

			return $datos;		

		}

		/*=============================================
		CUANDO SOLO HAY DOS LÍNEAS DESCENDIENTES
		=============================================*/

		else if(count($lineaDescendiente) == 2){

			$datos = array("posicionLetra"=>"B",
				       	   "derrameMatriz"=>$derrameMatriz);

			return $datos;		

		}

		/*=============================================
		CUANDO SOLO HAY DOS LÍNEAS DESCENDIENTES
		=============================================*/

		else if(count($lineaDescendiente) == 3){

			$datos = array("posicionLetra"=>"C",
				       	   "derrameMatriz"=>$derrameMatriz);

			return $datos;		

		}else{

			/*=============================================
			CUANDO EL DERRAME VIENE DIRECTAMENTE DE LA EMPRESA
			=============================================*/

			$patrocinador = ControladorGeneral::ctrPatrocinador();

			if($patrocinadorRed == $patrocinador){	

				$datos = ControladorPagos::derrameMatriz($derrameMatriz+1, $patrocinadorRed);

				return $datos;

			}else{

				$datos = ControladorPagos::derrameMatrizPatrocinador($lineaDescendiente[0]["orden_matriz"]);

				return $datos;

			}
		
		}

	}

	/*=============================================
	DERRAME MATRIZ PATROCINADOR
	=============================================*/	

	static public function derrameMatrizPatrocinador($derrameMatriz){

		$lineaDescendiente = ModeloPagos::mdlMostrarUsuarioRed("red_matriz","derrame_matriz", $derrameMatriz);

		/*=============================================
		CUANDO NO HAY LÍNEA DESCENDIENTE
		=============================================*/

		if(!$lineaDescendiente){

			$datos = array("posicionLetra"=>"",
				       	   "derrameMatriz"=>$derrameMatriz);

			return $datos;			

		}

		/*=============================================
		CUANDO SOLO HAY UNA LÍNEA DESCENDIENTE
		=============================================*/

		else if(count($lineaDescendiente) == 1){

			$datos = array("posicionLetra"=>"A",
				       	   "derrameMatriz"=>$derrameMatriz);

			return $datos;		

		}

		/*=============================================
		CUANDO SOLO HAY DOS LÍNEAS DESCENDIENTES
		=============================================*/

		else if(count($lineaDescendiente) == 2){

			$datos = array("posicionLetra"=>"B",
				       	   "derrameMatriz"=>$derrameMatriz);

			return $datos;		

		}

		/*=============================================
		CUANDO SOLO HAY DOS LÍNEAS DESCENDIENTES
		=============================================*/

		else if(count($lineaDescendiente) == 3){

			$datos = array("posicionLetra"=>"C",
				       	   "derrameMatriz"=>$derrameMatriz);

			return $datos;		

		}else{


			$datos = ControladorPagos::derrameMatrizPatrocinador($derrameMatriz+1);

			return $datos;

			
		}

	}

	/*=============================================
	Eliminar Usuario de la red
	=============================================*/

	static public function ctrEliminarUsuarioRed($datos){

		$tabla = "red_matriz";

		$respuesta = ModeloPagos::mdlEliminarUsuarioRed($tabla, $datos);

		return $respuesta;

	}

	/*=============================================
	MOSTRAR PAGOS RED
	=============================================*/

	static public function ctrMostrarPagosRed($tabla, $item, $valor){

		$respuesta = ModeloPagos::mdlMostrarPagosRed($tabla, $item, $valor);

		return $respuesta;

	}

}

/*=============================================
CONEXION
=============================================*/

class Conexion{

	static public function conectar(){

		$link = new PDO("mysql:host=localhost;dbname=ventas-suscripcion",
			            "root",
			            "");

		$link->exec("set names utf8");

		return $link;

	}

}

/*=============================================
MODELOS
=============================================*/

class ModeloPagos{

	/*=============================================
	MOSTRAR USUARIO
	=============================================*/

	static public function mdlMostrarUsuarios($tabla, $item, $valor){

		if($item != null && $valor != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}

		$stmt-> close();

		$stmt = null;

	}

	/*=============================================
	Actualizar Suscripción
	=============================================*/

	static public function mdlActualizarSuscripcion($tabla, $datos){

		$stmt = Conexion::conectar()->prepare("UPDATE $tabla SET  ciclo_pago = :ciclo_pago, vencimiento = :vencimiento,  patrocinador = :patrocinador WHERE id_usuario = :id_usuario");

		$stmt -> bindParam(":ciclo_pago", $datos["ciclo_pago"], PDO::PARAM_STR);
		$stmt -> bindParam(":vencimiento", $datos["vencimiento"], PDO::PARAM_STR);
		$stmt -> bindParam(":patrocinador", $datos["patrocinador"], PDO::PARAM_STR);
		$stmt -> bindParam(":id_usuario", $datos["id_usuario"], PDO::PARAM_INT);

		if($stmt -> execute()){

			return "ok";

		}else{

			echo "\nPDO::errorInfo():\n";
    		print_r(Conexion::conectar()->errorInfo());

		}

		$stmt-> close();

		$stmt = null;

	}

	/*=============================================
	Cancelar Suscripción
	=============================================*/

	static public function mdlCancelarSuscripcion($tabla, $datos){

		$stmt = Conexion::conectar()->prepare("UPDATE $tabla SET  suscripcion = :suscripcion, id_suscripcion = :id_suscripcion, vencimiento = :vencimiento, ciclo_pago = :ciclo_pago, firma = :firma, fecha_contrato = :fecha_contrato WHERE id_usuario = :id_usuario");

		$stmt -> bindParam(":suscripcion", $datos["suscripcion"], PDO::PARAM_STR);
		$stmt -> bindParam(":id_suscripcion", $datos["id_suscripcion"], PDO::PARAM_STR);
		$stmt -> bindParam(":vencimiento", $datos["vencimiento"], PDO::PARAM_STR);
		$stmt -> bindParam(":ciclo_pago", $datos["ciclo_pago"], PDO::PARAM_STR);
		$stmt -> bindParam(":firma", $datos["firma"], PDO::PARAM_STR);
		$stmt -> bindParam(":fecha_contrato", $datos["fecha_contrato"], PDO::PARAM_STR);
		$stmt -> bindParam(":id_usuario", $datos["id_usuario"], PDO::PARAM_INT);

		if($stmt -> execute()){

			return "ok";

		}else{

			echo "\nPDO::errorInfo():\n";
    		print_r(Conexion::conectar()->errorInfo());

		}

		$stmt-> close();

		$stmt = null;

	}

	/*=============================================
	MOSTRAR USUARIO RED
	=============================================*/

	static public function mdlMostrarUsuarioRed($tabla, $item, $valor){

		if($item != null && $valor != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetchAll();

		}else{

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}

		$stmt-> close();

		$stmt = null;

	}

	/*=============================================
	INGRESAR PAGO
	=============================================*/

	static public function mdlIngresarPagos($tabla, $datos){

		$stmt = Conexion::conectar()->prepare("INSERT INTO $tabla (id_pago_paypal, usuario_pago, periodo, periodo_comision,  periodo_venta) VALUES (:id_pago_paypal, :usuario_pago, :periodo,  :periodo_comision, :periodo_venta)");

		$stmt -> bindParam(":id_pago_paypal", $datos["id_pago_paypal"], PDO::PARAM_STR);
		$stmt -> bindParam(":usuario_pago", $datos["usuario_pago"], PDO::PARAM_STR);
		$stmt -> bindParam(":periodo", $datos["periodo"], PDO::PARAM_STR);
		$stmt -> bindParam(":periodo_comision", $datos["periodo_comision"], PDO::PARAM_STR);
		$stmt -> bindParam(":periodo_venta", $datos["periodo_venta"], PDO::PARAM_STR);

		if($stmt -> execute()){

			return "ok";

		}else{

			echo "\nPDO::errorInfo():\n";
    		print_r(Conexion::conectar()->errorInfo());

		}

		$stmt-> close();

		$stmt = null;

	}

	/*=============================================
	REGISTRO MATRIZ
	=============================================*/

	static public function mdlRegistroMatriz($tabla, $datos){

		$stmt = Conexion::conectar()->prepare("INSERT INTO $tabla (orden_matriz, usuario_red, derrame_matriz, patrocinador_red, posicion_matriz) VALUES (:orden_matriz, :usuario_red, :derrame_matriz, :patrocinador_red, :posicion_matriz)");

		$stmt -> bindParam(":orden_matriz", $datos["orden_matriz"], PDO::PARAM_STR);
		$stmt -> bindParam(":usuario_red", $datos["usuario_red"], PDO::PARAM_STR);
		$stmt -> bindParam(":derrame_matriz", $datos["derrame_matriz"], PDO::PARAM_STR);
		$stmt -> bindParam(":patrocinador_red", $datos["patrocinador_red"], PDO::PARAM_STR);
		$stmt -> bindParam(":posicion_matriz", $datos["posicion_matriz"], PDO::PARAM_STR);


		if($stmt -> execute()){

			return "ok";

		}else{

			echo "\nPDO::errorInfo():\n";
    		print_r(Conexion::conectar()->errorInfo());

		}

		$stmt-> close();

		$stmt = null;

	}

	/*=============================================
	Eliminar Usuario de la Red
	=============================================*/

	static public function mdlEliminarUsuarioRed($tabla, $datos){

		$stmt = Conexion::conectar()->prepare("DELETE FROM $tabla WHERE usuario_red = :usuario_red");

		$stmt -> bindParam(":usuario_red", $datos, PDO::PARAM_INT);

		if($stmt -> execute()){

			return "ok";
		
		}else{

			echo "\nPDO::errorInfo():\n";
    		print_r(Conexion::conectar()->errorInfo());

		}

		$stmt -> close();

		$stmt = null;


	}

	/*=============================================
	MOSTRAR PAGOS RED
	=============================================*/

	static public function mdlMostrarPagosRed($tabla, $item, $valor){

		if($item != null && $valor != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetchAll();

		}else{

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}

		$stmt-> close();

		$stmt = null;

	}



}










