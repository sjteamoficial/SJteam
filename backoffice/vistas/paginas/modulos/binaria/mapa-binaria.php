<?php 

$red = ControladorMultinivel::ctrMostrarUsuarioRed("red_binaria", "usuario_red", $usuario["id_usuario"]);

completarReferidos($red[0]["orden_binaria"]);

$_SESSION["var_pais"] = null;
$_SESSION["var_cod"] = null;

function completarReferidos($ordenBinaria){

	$red = ControladorMultinivel::ctrMostrarUsuarioRed("red_binaria", "derrame_binaria", $ordenBinaria);
	
	foreach($red as $key => $value) {

		listadoUsuarios($value["usuario_red"]);
		
		completarReferidos($value["orden_binaria"]);
	}

}


function listadoUsuarios($idUsuario){

	$pais = ControladorUsuarios::ctrMostrarUsuarios("id_usuario", $idUsuario);
	
	$_SESSION["var_pais"] .= $pais["pais"].",";	
	$_SESSION["var_cod"] .= $pais["codigo_pais"].",";

	$_SESSION["totalPais"] = explode(",", $_SESSION["var_pais"]);
	$_SESSION["codPais"] = explode(",", $_SESSION["var_cod"]);
	
}

array_pop($_SESSION["totalPais"]);
$listaPaises = $_SESSION["totalPais"];

array_pop($_SESSION["codPais"]);
$listaCodPaises = $_SESSION["codPais"];

$cantidadPaises = count($listaPaises);

/*=============================================
FUNCIÓN PARA CONTAR LOS PAÍSES
=============================================*/
function contarValoresArray($array){

	$contar=array();

	foreach($array as $value){

		if(isset($contar[$value])){

			$contar[$value]+=1;

		}else{
      
	      $contar[$value]=1;

	    }

	}

	return $contar;
}

$cantidadUsuariosCodigo = contarValoresArray($listaCodPaises);
$cantidadUsuarios = contarValoresArray($listaPaises);


/*=============================================
LIMITAR FOREACH
=============================================*/

function limit($array, $limite) {
    
    foreach ($array as $key => $value) {

        if (!$limite--) break;

        yield $key => $value;

    }

}

/*=============================================
ORDENAR ARRAY DE MAYOR A MENOR
=============================================*/
arsort($cantidadUsuarios);

?>


	<div class="card card-info card-outline">

		<div class="card-header">

			<h5 class="m-0 float-left">Territorios</h5>

		</div>

		<div class="card-body">

			<div id="world-map" style="height: 250px; width: 100%;"></div>

		</div>

		<div class="card-footer bg-white">
			
			<div class="d-flex">

			<?php foreach (limit($cantidadUsuarios, 4) as $key => $value): ?>

				<div class="text-center flex-fill">
				 	
					 <input type="text" class="knob" data-readonly="true" value="<?php echo  number_format($value*100/$cantidadPaises); ?>" data-width="60" data-height="60" data-fgColor="#007BFF">

					 <div class="text-secondary"><?php echo $key; ?></div>

				</div>

				
			<?php endforeach ?>
				
				
			</div>

		</div>

	</div>



<script>

 $('.knob').knob();

 // jvectormap data
  var visitorsData = {
  <?php 

 	foreach ($cantidadUsuariosCodigo as $key => $value) {
    
   		echo "'".$key."':".$value.",";
  
  	}

  ?>
  }

 // World map by jvectormap
 $('#world-map').vectorMap({
 	map              : 'world_mill_en',
 	backgroundColor  : '#007BFF',
 	regionStyle      : {
 		initial: {
 			fill            : 'rgba(255, 255, 255, 0.7)',
 			'fill-opacity'  : 1,
 			stroke          : 'rgba(0,0,0,.2)',
 			'stroke-width'  : 1,
 			'stroke-opacity': 1
 		}
 	},
 	series           : {
 		regions: [{
 			values           : visitorsData,
 			scale            : ['#ffffff', '#0154ad'],
 			normalizeFunction: 'polynomial'
 		}]
 	},
 	onRegionLabelShow: function (e, el, code) {
      if (typeof visitorsData[code] != 'undefined')
        el.html(el.html() + ': ' + visitorsData[code] + ' afiliados')
    }
 })	

</script>


