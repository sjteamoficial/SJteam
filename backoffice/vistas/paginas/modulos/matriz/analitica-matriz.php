<div class="row">

	<div class="col-12 col-sm-6 col-lg-3">

		<div class="small-box bg-info">

			<div class="inner">

				<h3>$ <span class="periodoComisionMatriz">
					
					<img src="vistas/img/plantilla/status.gif" style="width:30px; height:30px">
					<small class="pl-1" style="font-size:15px">Procesando...</small>

				</span></h3>

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

				<h3>$ <span class="periodoVentaMatriz">
					
					<img src="vistas/img/plantilla/status.gif" style="width:30px; height:30px">
					<small class="pl-1" style="font-size:15px">Procesando...</small>

				</span></h3>

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

