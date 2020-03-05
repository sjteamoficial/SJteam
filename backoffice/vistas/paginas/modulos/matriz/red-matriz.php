<?php 

include "vistas/paginas/modulos/preload.php";

$regresar = false;

if(isset($_GET["id"])){

	$valor = $_GET["id"];
	$usuario = ControladorUsuarios::ctrMostrarUsuarios("id_usuario", $valor);
	$regresar = true;

}else{

	$valor = $usuario["id_usuario"];
}

$red = ControladorMultinivel::ctrMostrarUsuarioRed("red_matriz", "usuario_red", $valor);

$ordenMatriz = $red[0]["orden_matriz"];

?>

<input type="hidden" value="<?php echo $usuario["id_usuario"]?>" id="id_usuario">

<div class="card card-primary card-outline preloadRed" style="display:none">
	
	<div class="card-header">

		<?php if ($red[0]["patrocinador_red"] != ""): ?>
	
			<h5 class="float-left">Patrocinador: 
				<span class="badge badge-secondary"><?php echo $red[0]["patrocinador_red"]; ?></span>
			</h5>
			
		<?php endif ?>	

	

		<!--=====================================
		TABLA GANANCIAS
		======================================-->

		<?php if ($regresar): ?>

			<a href="javascript:history.back()" class="btn btn-default btn-sm text-secondary float-right"><i class="fas fa-chevron-left"></i> Regresar</a>

		<?php else: ?>

		<div class="habilitarGananciasMatriz" verGanancias="ok"></div>

		<button type="button" class="btn btn-info btn-sm text-white float-right verGanancias">
			<i class="fas fa-sitemap"></i>
		</button>

		<div class="tablaGanancias">

			<table class="table table-striped table-bordered table-light text-center">

				<thead class="bg-info">
					<tr>
						<th><i class="fas fa-table"></i></th>
						<th>Comisiones</th>
						<th>Ventas</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>Nivel 1</td>
						<td>$<span class="comisionNivel1">
							<img src="vistas/img/plantilla/status.gif" style="width:30px; height:30px">
						</span></td>
						<td>$<span class="ventaNivel1">
							<img src="vistas/img/plantilla/status.gif" style="width:30px; height:30px">
						</span></td>
					</tr>

					<tr>
						<td>Nivel 2</td>
						<td>$<span class="comisionNivel2">
							<img src="vistas/img/plantilla/status.gif" style="width:30px; height:30px">
						</span></td>
						<td>$<span class="ventaNivel2">
							<img src="vistas/img/plantilla/status.gif" style="width:30px; height:30px">
						</span></td>
					</tr>

					<tr>
						<td>Nivel 3</td>
						<td>$<span class="comisionNivel3">
							<img src="vistas/img/plantilla/status.gif" style="width:30px; height:30px">
						</span></td>
						<td>$<span class="ventaNivel3">
							<img src="vistas/img/plantilla/status.gif" style="width:30px; height:30px">
						</span></td>
					</tr>

					<tr>
						<td>Nivel 4</td>
						<td>$<span class="comisionNivel4">
							<img src="vistas/img/plantilla/status.gif" style="width:30px; height:30px">
						</span></td>
						<td>$<span class="ventaNivel4">
							<img src="vistas/img/plantilla/status.gif" style="width:30px; height:30px">
						</span></td>
					</tr>

					<tr>
						<td><b>Total</b></td>
						<td>$<span class="totalComisionMatriz">
							<img src="vistas/img/plantilla/status.gif" style="width:30px; height:30px">
						</span></td>
						<td>$<span class="totalVentaMatriz">
							<img src="vistas/img/plantilla/status.gif" style="width:30px; height:30px">
						</span></td>
					</tr>
				</tbody>
			</table>

		</div>

		<?php endif ?>

	</div>

	<div class="card-body">

		<div id="summary" class="tree_main" patrocinador="<?php echo $usuario["enlace_afiliado"]; ?>">

		<?php 

		generarArbol($ordenMatriz, $usuario["id_usuario"], $usuario["nombre"], $usuario["foto"], $usuario["enlace_afiliado"]);

		function generarArbol($ordenMatriz, $usuarioRed, $nombre, $foto, $patrocinador){

			$ladoA = "";
			$ladoB = "";
			$ladoC = "";
			$ladoD = "";

			if($foto == ""){

				$foto = 'vistas/img/usuarios/default/default.png';
			}

			/*=============================================
			TRAEMOS LADO A, LADO B, LADO C Y LADO D DE LA PRIMERA LÍNEA DESCENDIENTE
			=============================================*/

			$respuesta = ControladorMultinivel::ctrMostrarUsuarioRed("red_matriz", "derrame_matriz", $ordenMatriz);
			
			echo '<ul id="tree_view" style="display:none">

					<li>
						<img class="tree_icon rounded-circle" data-nite-src="'.$foto.'">
						<p class="demo_name_style">'.$nombre.'</p>';

						foreach ($respuesta as $key => $value) {

							if($value["posicion_matriz"] == "A"){

								$ladoA = generarLineasDescendientes($value["orden_matriz"], $ladoA, null, null, null, $patrocinador, null);

							}

							if($value["posicion_matriz"] == "B"){

								$ladoB = generarLineasDescendientes($value["orden_matriz"], null, $ladoB, null, null, $patrocinador, null);

							}

							if($value["posicion_matriz"] == "C"){

								$ladoC = generarLineasDescendientes($value["orden_matriz"], null, null, $ladoC, null, $patrocinador, null);

							}

							if($value["posicion_matriz"] == "D"){

								$ladoD = generarLineasDescendientes($value["orden_matriz"], null, null, null, $ladoD, $patrocinador, null);

							}


						}

						
						echo generarLineasDescendientes($ordenMatriz, $ladoA, $ladoB, $ladoC, $ladoD, $patrocinador, "lineaDescendiente");


					echo '</li>

			</ul>';

		
		}//FIN de la función generarArbol

		function generarLineasDescendientes($ordenMatriz, $ladoA, $ladoB, $ladoC, $ladoD,  $patrocinador, $clase){

			$respuesta = ControladorMultinivel::ctrMostrarUsuarioRed("red_matriz", "derrame_matriz", $ordenMatriz);

			$derrame = 0;
			$sinLineaDescendiente = null;
			$arbol = '<ul>';
			
			/*=============================================
			CUANDO NO HAY LÍNEA DESCENDIENTE
			=============================================*/

			if(!$respuesta){
			
				$arbol .=  '<li>
								<img class="tree_icon rounded-circle" data-nite-src="vistas/img/usuarios/default/default.png">
							</li>
							<li>
								<img class="tree_icon rounded-circle" data-nite-src="vistas/img/usuarios/default/default.png">
							</li>
							<li>
								<img class="tree_icon rounded-circle" data-nite-src="vistas/img/usuarios/default/default.png">
							</li>
							<li>
								<img class="tree_icon rounded-circle" data-nite-src="vistas/img/usuarios/default/default.png">
							</li>
						</ul>';

				return $arbol;

			}

			/*=============================================
			CUANDO SI HAY LÍNEA DESCENDIENTE
			=============================================*/

			foreach ($respuesta as $key => $value) {

				// TRAEMOS LOS DATOS DEL USUARIO

				$afiliado = ControladorUsuarios::ctrMostrarUsuarios("id_usuario", $value["usuario_red"]);

				// VALIDAMOS LA FOTO

				if($afiliado["foto"] == ""){

					$foto = 'vistas/img/usuarios/default/default.png'; 
				
				}else{

					$foto = $afiliado["foto"];

				}

				// AUMENTAMOS EL DERRAME

				$derrame++;

				/*=============================================
				DEFINIMOS SEGUNDA LÍNEA DESCENDIENTE LADO A
				=============================================*/

				if($value["posicion_matriz"] == "A" && $derrame == 1){

					$arbol .= '<li>
								<a href="index.php?pagina=matriz&id='.$afiliado["id_usuario"].'">
								<img class="tree_icon rounded-circle '.$clase.'Izq" data-nite-src="'.$foto.'" patrocinador="'.$afiliado["patrocinador"].'">';
								
								if($afiliado["patrocinador"] == $patrocinador){

									$arbol .= '<p class="demo_name_style">'.$afiliado["nombre"].'</p>
									<img data-nite-src="vistas/img/plantilla/down.png" class="tree_down_icon">
									</a>';

								}else{

									$arbol .= '<p class="demo_name_style bg-info">'.$afiliado["nombre"].'</p>
									<img data-nite-src="vistas/img/plantilla/down.png" class="tree_down_icon">
									</a>';
								}
							

					$arbol .= $ladoA.'</li>';

				}

				/*=============================================
				DEFINIMOS SEGUNDA LÍNEA DESCENDIENTE LADO B
				=============================================*/

				if($value["posicion_matriz"] == "B" && $derrame == 2){

					$arbol .= '<li>
								<a href="index.php?pagina=matriz&id='.$afiliado["id_usuario"].'">
								<img class="tree_icon rounded-circle '.$clase.'Der" data-nite-src="'.$foto.'" patrocinador="'.$afiliado["patrocinador"].'">';
								
								if($afiliado["patrocinador"] == $patrocinador){

									$arbol .= '<p class="demo_name_style">'.$afiliado["nombre"].'</p>
									<img data-nite-src="vistas/img/plantilla/down.png" class="tree_down_icon">
									</a>';

								}else{

									$arbol .= '<p class="demo_name_style bg-info">'.$afiliado["nombre"].'</p>
									<img data-nite-src="vistas/img/plantilla/down.png" class="tree_down_icon">
									</a>';
								}

					$arbol .= $ladoB.'</li>';

				}

				/*=============================================
				DEFINIMOS SEGUNDA LÍNEA DESCENDIENTE LADO C
				=============================================*/

				if($value["posicion_matriz"] == "C" && $derrame == 3){

					$arbol .= '<li>
								<a href="index.php?pagina=matriz&id='.$afiliado["id_usuario"].'">
								<img class="tree_icon rounded-circle '.$clase.'Der" data-nite-src="'.$foto.'" patrocinador="'.$afiliado["patrocinador"].'">';
								
								if($afiliado["patrocinador"] == $patrocinador){

									$arbol .= '<p class="demo_name_style">'.$afiliado["nombre"].'</p>
									<img data-nite-src="vistas/img/plantilla/down.png" class="tree_down_icon">
									</a>';

								}else{

									$arbol .= '<p class="demo_name_style bg-info">'.$afiliado["nombre"].'</p>
									<img data-nite-src="vistas/img/plantilla/down.png" class="tree_down_icon">
									</a>';
								}

					$arbol .= $ladoC.'</li>';

				}

				/*=============================================
				DEFINIMOS SEGUNDA LÍNEA DESCENDIENTE LADO D
				=============================================*/

				if($value["posicion_matriz"] == "D" && $derrame == 4){

					$arbol .= '<li>
								<a href="index.php?pagina=matriz&id='.$afiliado["id_usuario"].'">
								<img class="tree_icon rounded-circle '.$clase.'Der" data-nite-src="'.$foto.'" patrocinador="'.$afiliado["patrocinador"].'">';
								
								if($afiliado["patrocinador"] == $patrocinador){

									$arbol .= '<p class="demo_name_style">'.$afiliado["nombre"].'</p>
									<img data-nite-src="vistas/img/plantilla/down.png" class="tree_down_icon">
									</a>';

								}else{

									$arbol .= '<p class="demo_name_style bg-info">'.$afiliado["nombre"].'</p>
									<img data-nite-src="vistas/img/plantilla/down.png" class="tree_down_icon">
									</a>';
								}

					$arbol .= $ladoD.'</li>';

				}


				$sinLineaDescendiente = $value["posicion_matriz"];


			}

			/*=============================================
			CUANDO FALTAN 3 PUESTOS
			=============================================*/ 

			if($derrame == 1 && $sinLineaDescendiente == "A"){

				$arbol .= '  <li>
								<img class="tree_icon rounded-circle" data-nite-src="vistas/img/usuarios/default/default.png">
							</li>
							 <li>
								<img class="tree_icon rounded-circle" data-nite-src="vistas/img/usuarios/default/default.png">
							</li>
							 <li>
								<img class="tree_icon rounded-circle" data-nite-src="vistas/img/usuarios/default/default.png">
							</li>';

			}

			/*=============================================
			CUANDO FALTAN 2 PUESTOS
			=============================================*/ 

			if($derrame == 2 && $sinLineaDescendiente == "B"){

				$arbol .= '  <li>
								<img class="tree_icon rounded-circle" data-nite-src="vistas/img/usuarios/default/default.png">
							</li>
							 <li>
								<img class="tree_icon rounded-circle" data-nite-src="vistas/img/usuarios/default/default.png">
							</li>';

			}

			/*=============================================
			CUANDO FALTAN 1 PUESTO
			=============================================*/ 

			if($derrame == 3 && $sinLineaDescendiente == "C"){

				$arbol .= '  <li>
								<img class="tree_icon rounded-circle" data-nite-src="vistas/img/usuarios/default/default.png">
							</li>';

			}

			$arbol .= '</ul>';

   			return $arbol;			

		}

		?>

			<!-- <ul id="tree_view" style="display:none">
				
				<li>	
					
					<img class="tree_icon rounded-circle" src="vistas/img/usuarios/4/701.jpg">

					<p class="demo_name_style">Academy of Life</p>

					<ul>
						
						<li>
							
							<img class="tree_icon rounded-circle lineaDescendienteIzq" src="vistas/img/usuarios/9/828.png">
							<p class="demo_name_style">Monica Murillo</p>

							<ul>
								
								<li>
									
									<img class="tree_icon rounded-circle lineaDescendienteIzq" src="vistas/img/usuarios/9/828.png">
									<p class="demo_name_style">Monica Murillo</p>

									<ul>
								
										<li>
											
											<img class="tree_icon rounded-circle lineaDescendienteIzq" src="vistas/img/usuarios/9/828.png">
											<p class="demo_name_style">Monica Murillo</p>

											

										</li>

										<li>
											
											<img class="tree_icon rounded-circle lineaDescendienteDer" src="vistas/img/usuarios/4/701.jpg">
											<p class="demo_name_style">Alexander Pierce</p>

										</li>

									</ul>

								</li>

								<li>
									
									<img class="tree_icon rounded-circle lineaDescendienteDer" src="vistas/img/usuarios/4/701.jpg">
									<p class="demo_name_style">Alexander Pierce</p>

								</li>

							</ul>

						</li>

						<li>
							
							<img class="tree_icon rounded-circle lineaDescendienteDer" src="vistas/img/usuarios/4/701.jpg">
							<p class="demo_name_style">Alexander Pierce</p>

							<ul>
						
								<li>
									
									<img class="tree_icon rounded-circle lineaDescendienteIzq" src="vistas/img/usuarios/9/828.png">
									<p class="demo_name_style">Monica Murillo</p>

								</li>

								<li>
									
									<img class="tree_icon rounded-circle lineaDescendienteDer" src="vistas/img/usuarios/4/701.jpg">
									<p class="demo_name_style">Alexander Pierce</p>

								</li>

							</ul>

						</li>

					</ul>

				</li>

			</ul> -->

			<div id="tree" class="orgChart"></div>

		</div>

	</div>

</div>