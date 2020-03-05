<?php 

/*=============================================
TRAER VIDEOS DE ACUERDO A LA CATEGORÍA
=============================================*/

if(isset($_GET["pagina"])){

 	$item = "ruta_categoria";  
  	$valor = $_GET["pagina"];

  	$academia = ControladorAcademia::ctrMostrarAcademia($item, $valor);

}

/*=============================================
TRAER VIDEO
=============================================*/

if(isset($_GET["video"])){

	$item = "id_video";
	$valor = $_GET["video"];

	$video = ControladorAcademia::ctrMostrarVideos($item, $valor);

	if($video["vista_gratuita"] == 0 && $usuario["suscripcion"] == 0){

		echo '<script>

			 window.location = "'.$ruta.'backoffice/perfil";

		</script>'; 

		return;
	}

	$idVideo = $video["id_video"];
	$posterVideo = $video["imagen_video"];
	$rutaVideo = $video["medios_video"];
	$rutaVideoMp4 = $video["medios_video_mp4"];
	$tituloVideo = $video["titulo_video"];

}else{

	$idVideo = $academia[0]["id_video"];
	$posterVideo = $academia[0]["imagen_video"];
	$rutaVideo = $academia[0]["medios_video"];
	$rutaVideoMp4 = $academia[0]["medios_video_mp4"];
	$tituloVideo = $academia[0]["titulo_video"];

}

/*=============================================
ENUMERAR LOS TÍTULOS DE LAS CLASES
=============================================*/

$numeroClase = 0;

foreach ($academia as $key => $value) {

	++$numeroClase;

	if($value["id_video"] == $idVideo){

		break;
	
	}

}

/*=============================================
REPRODUCIR SIGUIENTE VIDEO AUTOMÁTICAMENTE
=============================================*/

if(empty($academia[$numeroClase]["id_video"])){

	$nextVideo = $academia[0]["id_video"];

}else{

	$nextVideo = $academia[$numeroClase]["id_video"];

}


?>


<div class="card card-default color-palette-box videos">

	<div class="visorVideos" rutaVideo="<?php echo $rutaVideo ?>" rutaVideoMP4="<?php echo $rutaVideoMp4 ?>" numeroClase="<?php echo $numeroClase ?>">

		<h5 class="text-white p-2 p-md-3 text-light w-100 d-flex"><?php echo $numeroClase.". ". $tituloVideo ?>
			
		<div class="velocidadVideo dropdown ml-2">
 			<div data-toggle="dropdown">
 				<i class="fas fa-tachometer-alt"></i>
 			</div>
 			<div class="dropdown-menu">
			    <a class="dropdown-item" href="#" velocidad=".25">0.25x</a>
			    <a class="dropdown-item" href="#" velocidad=".50">0.5x</a>
			    <a class="dropdown-item active" href="#" velocidad="1">1x</a>
			    <a class="dropdown-item" href="#" velocidad="1.50">1.5x</a>
			    <a class="dropdown-item" href="#" velocidad="2">2x</a>
		  	</div>			
 		</div>


		</h5>
		
		<video id="myVideo" controls poster="<?php echo $posterVideo; ?>" rutaCategoria="<?php echo $_GET["pagina"]; ?>" nextVideo="<?php echo $nextVideo; ?>">
			
			<!-- <source src="<?php echo $rutaVideo; ?>" type="video/mp4"> -->

		</video>

		<i class="fas fa-bars"></i>

	</div>

	<div class="botonesVideos">
		
		<ul class="list-group list-group-flush">

		<?php foreach ($academia as $key => $value): ?>

			<?php if ($usuario["suscripcion"] == 1): ?>

				<li class="list-group-item list-group-item-action py-3 px-2 d-flex" numeroClase="<?php echo ($key+1); ?>">
					
					<img src="<?php echo $value["imagen_video"]; ?>" class="img-thumbnail p-0 mr-2">

					<a href="index.php?pagina=<?php echo $value["ruta_categoria"]; ?>&video=<?php echo $value["id_video"];?>" class="text-muted">

						<?php echo ($key+1).". ". $value["titulo_video"]; ?>

					</a>

				</li>

			<?php else: ?>

				<?php if ($value["vista_gratuita"] == 1 ): ?>

					<li class="list-group-item list-group-item-action py-3 px-2 d-flex" numeroClase="<?php echo ($key+1); ?>">
					
						<img src="<?php echo $value["imagen_video"]; ?>" class="img-thumbnail p-0 mr-2">

						<a href="index.php?pagina=<?php echo $value["ruta_categoria"]; ?>&video=<?php echo $value["id_video"];?>" class="text-muted">

							<?php echo ($key+1).". ". $value["titulo_video"]; ?>

						</a>

					</li>

				<?php endif ?>			

			<?php endif ?>
	
		<?php endforeach ?>

		</ul>

	</div>


</div>