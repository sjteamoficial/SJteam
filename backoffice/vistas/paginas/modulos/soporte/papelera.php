<div class="card card-primary card-outline">

	<!--=====================================
	Header tickets
	======================================-->	

	<div class="card-header pb-3">	
		
		<h3 class="card-title">Papelera de tickets</h3>

		<div class="card-tools">
			
			<div class="mailbox-controls pb-4">
				
				<button type="button" class="btn btn-default btn-sm checkbox-toggle">
                	<i class="far fa-square"></i>
              	</button>

              	<div class="btn-group">
              		
					<a href="#">
						
						 <button type="button" class="btn btn-default btn-sm btnPapelera" data-toggle="tooltip" title="Recuperar tickets" idTickets idUsuario="<?php echo $usuario["id_usuario"]; ?>" tipoTickets="enviado">
							 <i class="fas fa-recycle"></i>
						 </button>

					</a>

              	</div>

              	<a href="<?php echo $ruta ?>backoffice/index.php?pagina=soporte&soporte=papelera" class="btn btn-default btn-sm">
              		
					 <i class="fas fa-sync-alt"></i>

              	</a>

			</div>

		</div>

	</div>

	<!--=====================================
	Body tickets
	======================================-->

	<div class="card-body p-3 mailbox-messages">

		<input type="hidden" class="tipoTicket" value="papelera">
		<input type="hidden" class="idUsuario" value="<?php echo $usuario["id_usuario"] ?>">
		
		<table class="table table-striped dt-responsive tablaTickets" width="100%">

			<thead>
				
				<tr>

                	<th>Seleccionar</th> 
                	<th>Remitente</th>
                	<th>Receptor</th>
                	<th>Asunto</th>
                	<th>Adjunto</th>
                	<th>Fecha y hora</th>       
              
              	</tr>   

			</thead>

			<tbody>

			<!-- 	<tr>
				
					<td><input type="checkbox"><i class="far fa-square"></i></td>  
					<td>Lorenzo Gomez</td>
					<td>Lorem Ipsum</td>
					<td><i class="fas fa-paperclip"></i></td>
					<td>2020-01-22 23:59:00</td>

				</tr>

				<tr>
				
					<td><input type="checkbox"><i class="far fa-square"></i></td>  
					<td>Ricardo Tapia</td>
					<td>Lorem Ipsum</td>
					<td><i class="fas fa-paperclip"></i></td>
					<td>2020-01-22 23:59:00</td>

				</tr> -->

			</tbody>			

		</table>

	</div>	


</div>