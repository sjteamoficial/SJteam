<?php 

$regresar = false;

if(isset($_GET["id"])){

	$valor = $_GET["id"];
	$usuario = ControladorUsuarios::ctrMostrarUsuarios("id_usuario", $valor);
	$regresar = true;

}else{

	$valor = $usuario["id_usuario"];
}

$red = ControladorMultinivel::ctrMostrarUsuarioRed("red_binaria", "usuario_red", $valor);

$ordenBinaria = $red[0]["orden_binaria"];

?>

<input type="hidden" value="<?php echo $usuario["id_usuario"]?>" id="id_usuario">

<div class="card card-primary card-outline preloadRed">
	
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

		<div class="habilitarGananciasBinarias" verGanancias="ok"></div>

		<button type="button" class="btn btn-info btn-sm text-white float-right verGanancias">
			<i class="fas fa-sitemap"></i>
		</button>

		<div class="tablaGanancias">

			<table class="table table-striped table-bordered table-light text-center">

				<thead class="bg-info">
					<tr>
						<th><i class="fas fa-table"></i></th>
						<th>Izquierdo</th>
						<th>Derecho</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>Directos</td>
						<td><span class="directoIzq">0</span></td>
						<td><span class="directoDer">0</span></td>
					</tr>

					<tr>
						<td>Derrame</td>
						<td><span class="derrameIzq">0</span></td>
						<td><span class="derrameDer">0</span></td>
					</tr>

					<tr>
						<td><b>Puntos</b></td>
						<td><b><span class="totalLadoIzq">0</span> Puntos</b></td>
						<td><b><span class="totalLadoDer">0</span> Puntos</b></td>
					</tr>
				</tbody>
			</table>

		</div>

		<?php endif ?>

	</div>

	<div class="card-body">

		<div id="summary" class="tree_main" patrocinador="<?php echo $usuario["enlace_afiliado"]; ?>">

		<?php 

		generarArbol($ordenBinaria, $usuario["id_usuario"], $usuario["nombre"], $usuario["foto"], $usuario["enlace_afiliado"]);

		function generarArbol($ordenBinaria, $usuarioRed, $nombre, $foto, $patrocinador){

			$ladoA = "";
			$ladoB = "";

			if($foto == ""){

				$foto = 'vistas/img/usuarios/default/default.png';
			}

			/*=============================================
			TRAEMOS LADO A Y LADO B DE LA PRIMERA LÍNEA DESCENDIENTE
			=============================================*/

			$respuesta = ControladorMultinivel::ctrMostrarUsuarioRed("red_binaria", "derrame_binaria", $ordenBinaria);
			
			echo '<ul id="tree_view" style="display:none">

					<li>
						<img class="tree_icon rounded-circle" src="'.$foto.'">
						<p class="demo_name_style">'.$nombre.'</p>';

						foreach ($respuesta as $key => $value) {

							if($value["posicion_binaria"] == "A"){

								$ladoA = generarLineasDescendientes($value["orden_binaria"], $ladoA, null, $patrocinador, null);

							}

							if($value["posicion_binaria"] == "B"){

								$ladoB = generarLineasDescendientes($value["orden_binaria"], null, $ladoB, $patrocinador, null);

							}

						}

						
						echo generarLineasDescendientes($ordenBinaria, $ladoA, $ladoB, $patrocinador, "lineaDescendiente");


					echo '</li>

			</ul>';

		
		}//FIN de la función generarArbol

		function generarLineasDescendientes($ordenBinaria, $ladoA, $ladoB, $patrocinador, $clase){

			$respuesta = ControladorMultinivel::ctrMostrarUsuarioRed("red_binaria", "derrame_binaria", $ordenBinaria);

			$derrame = 0;
			$sinLineaDescendiente = null;
			$arbol = '<ul>';
			
			/*=============================================
			CUANDO NO HAY LÍNEA DESCENDIENTE
			=============================================*/

			if(!$respuesta){
			
				$arbol .=  '<li>
								<img class="tree_icon rounded-circle" src="vistas/img/usuarios/default/default.png">
							</li>
							<li>
								<img class="tree_icon rounded-circle" src="vistas/img/usuarios/default/default.png">
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

				if($value["posicion_binaria"] == "A" && $derrame == 1){

					$arbol .= '<li>
								<a href="index.php?pagina=binaria&id='.$afiliado["id_usuario"].'">
								<img class="tree_icon rounded-circle '.$clase.'Izq" src="'.$foto.'" patrocinador="'.$afiliado["patrocinador"].'">';
								
								if($afiliado["patrocinador"] == $patrocinador){

									$arbol .= '<p class="demo_name_style">'.$afiliado["nombre"].'</p></a>';

								}else{

									$arbol .= '<p class="demo_name_style bg-info">'.$afiliado["nombre"].'</p></a>';
								}
							

					$arbol .= $ladoA.generarLineasDescendientes($value["orden_binaria"], $ladoA, null, $patrocinador, $clase).'</li>';

				}

				/*=============================================
				DEFINIMOS SEGUNDA LÍNEA DESCENDIENTE LADO B
				=============================================*/

				if($value["posicion_binaria"] == "B" && $derrame == 2){

					$arbol .= '<li>
								<a href="index.php?pagina=binaria&id='.$afiliado["id_usuario"].'">
								<img class="tree_icon rounded-circle '.$clase.'Der" src="'.$foto.'" patrocinador="'.$afiliado["patrocinador"].'">';
								
								if($afiliado["patrocinador"] == $patrocinador){

									$arbol .= '<p class="demo_name_style">'.$afiliado["nombre"].'</p></a>';

								}else{

									$arbol .= '<p class="demo_name_style bg-info">'.$afiliado["nombre"].'</p></a>';
								}

					$arbol .= $ladoB.generarLineasDescendientes($value["orden_binaria"], null, $ladoB, $patrocinador, $clase).'</li>';

				}

				$sinLineaDescendiente = $value["posicion_binaria"];


			}

			/*=============================================
			CUANDO FALTA GENTE EN LADO B
			=============================================*/ 

			if($derrame == 1 && $sinLineaDescendiente == "A"){

				$arbol .= '<li>
						<img class="tree_icon rounded-circle" src="vistas/img/usuarios/default/default.png">
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