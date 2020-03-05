<?php 

$red = ControladorMultinivel::ctrMostrarRed("usuarios", "red_uninivel", "patrocinador_red",	$usuario["enlace_afiliado"]);

/*=============================================
Limpinado el array de tipo Objeto de valores repetidos
=============================================*/

$resultado = array();

foreach ($red as $value) {
	
	$resultado[$value["id_usuario"]]= $value;
	
}

$red = array_values($resultado);

$comisiones = 0;
$ventas = 0;

if(count($red) != 0){

	foreach ($red as $key => $value) {

		if($value["id_suscripcion"] != ""){
		
			$comisiones += $value["periodo_comision"];
			$ventas += $value["periodo_venta"];

		}
	}


}else{

	$comisiones = 0;
	$ventas = 0;

}

?>

<div class="row">

	<div class="col-12 col-sm-6 col-lg-3">

		<div class="small-box bg-info">

			<div class="inner">

				<h3>$ <?php echo number_format($comisiones, 2, ",", "."); ?></h3>

				<p class="text-uppercase">Comisiones de este período</p>

			</div>

			<div class="icon">

				<i class="fas fa-dollar-sign"></i>

			</div>

			<a href="" class="small-box-footer">Más información <i class="fa fa-arrow-circle-right"></i></a>

		</div>

	</div>

	<div class="col-12 col-sm-6 col-lg-3">

		<div class="small-box bg-purple">

			<div class="inner">

				<h3>$ <?php echo number_format($ventas, 2, ",", "."); ?></h3>

				<p class="text-uppercase">Ventas de este período</p>

			</div>

			<div class="icon">

				<i class="fas fa-wallet"></i>

			</div>

			<a href="" class="small-box-footer">Más información <i class="fa fa-arrow-circle-right"></i></a>
			
		</div>

	</div>

	<div class="col-12 col-sm-6 col-lg-3">

		<div class="small-box bg-primary">

			<div class="inner">

				<h3>0</h3>

				<p class="text-uppercase">Mis tickets</p>

			</div>

			<div class="icon">

				<i class="fas fa-comments"></i>

			</div>

			<a href="" class="small-box-footer">Más información <i class="fa fa-arrow-circle-right"></i></a>

		</div>

	</div>

	<div class="col-12 col-sm-6 col-lg-3">

		<div class="small-box bg-dark">

		<?php if ($usuario["enlace_afiliado"] != $patrocinador): ?>

			<div class="inner">

				<h3 class="text-secondary"><?php echo $usuario["vencimiento"]; ?></h3>

				<p class="text-uppercase">Próximo pago de comisión</p>

			</div>

			<div class="icon">

				<i class="fas fa-user-plus"></i>

			</div>

			<a href="" class="small-box-footer">Cancelar Suscripción <i class="fa fa-arrow-circle-right"></i></a>

		<?php else: ?>

			<div class="inner">

				<h3 class="text-secondary">0</h3>

				<p class="text-uppercase">Perfil Administrador</p>

			</div>

			<div class="icon">

				<i class="fas fa-user-plus"></i>

			</div>
		
			<a href="" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a>

		<?php endif ?>

		</div>
		
	</div>



</div>

