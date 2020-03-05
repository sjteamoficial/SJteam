<?php 

$red = ControladorMultinivel::ctrMostrarRed("usuarios", "red_uninivel", "patrocinador_red",	$usuario["enlace_afiliado"]);

/*=============================================
Limpiando el array de tipo Objeto de valores repetidos
=============================================*/

$resultado = array();

foreach ($red as $value) {
	
	$resultado[$value["id_usuario"]]= $value;
	
}

$red = array_values($resultado);

$listaCodPaises = array();
$listaPaises = array();


foreach ($red as $key => $value) {

	array_push($listaCodPaises, $value["codigo_pais"]);
	array_push($listaPaises, $value["pais"]);
	

}

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

<div class="col-12 col-lg-5">

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


