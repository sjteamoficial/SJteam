<?php 

$listaUsuarios = ControladorUsuarios::ctrMostrarUsuarios(null,null);

?>

<div class="card card-primary card-outline">
	
	<div class="card-header">
		
		<h3 class="card-title">Crear un nuevo Ticket</h3>

	</div>

	<form method="post" enctype="multipart/form-data">

		<div class="card-body">

			<!--=====================================
			PARA QUIÉN VA DIRIGIDO EL TICKET
			======================================-->	

			<div class="input-group mb-3">
				
				<?php if ($usuario["perfil"] != "admin"): ?>

					<div class="input-group-prepend">
				      <span class="input-group-text">Para:</span>
				    </div>

			     	<?php if (isset($_GET["para"])): ?>
					
						<input type="text" class="form-control" value="<?php echo $_GET["para"]?>" readonly required>

						<input type="hidden" class="form-control" value="<?php echo $_GET["id_para"]?>" name="receptor">
				    
				    <?php else: ?>  

						<input type="text" class="form-control" value="Academy of life" readonly required>

						<input type="hidden" class="form-control" value="1" name="receptor">

					<?php endif ?>		

				<?php else: ?>

					<div class="input-group-prepend">
				      <span class="input-group-text">Para:</span>
				    </div>

				    <?php if (isset($_GET["para"])): ?>
					
						<input type="text" class="form-control" value="<?php echo $_GET["para"]?>" readonly required>

						<input type="hidden" class="form-control" value="<?php echo $_GET["id_para"]?>" name="receptor">
				    
				    <?php else: ?>  

				    <div style="width:93%">
				    	
				    	<select name="receptor[]" class="form-control select2" multiple="multiple" data-placeholder="Selecciona un usuario">
				    		
				    		<option value="0">Todos los usuarios</option>
							
							<?php foreach ($listaUsuarios as $key => $value): ?>

								<?php if ($key != 0): ?>

									<option value="<?php echo $value["id_usuario"]?>">
										<?php echo $value["nombre"]; ?>
									</option>
									
								<?php endif ?>
								
							<?php endforeach ?>

				    	</select>	

				    </div>

				    <?php endif ?>
					
				<?php endif ?>

				<input type="hidden" class="form-control" value="<?php echo $usuario["id_usuario"]; ?>" name="remitente">

			</div>

			<!--=====================================
			EL ASUNTO DEL TICKET
			======================================-->	

			<div class="input-group mb-3">
				
				<div class="input-group-prepend">
			      <span class="input-group-text">Asunto:</span>
			    </div>

			    <?php if (isset($_GET["asunto"])): ?>

					<input type="text" class="form-control" value="<?php echo $_GET["asunto"]?>" name="asunto" required>	

			    <?php else: ?>

			    	<input type="text" class="form-control" name="asunto" required>		
			    <?php endif ?>

			  
			</div>

			<!--=====================================
			EL MENSAJE DEL TICKET
			======================================-->

			<div class="form-group">
				
				<textarea id="editor" name="mensaje" style="width: 100%"></textarea>

				<!--=====================================
				LOS ADJUNTOS DEL TICKET
				======================================-->

				<div class="form-group my-2">
					
					<div class="btn btn-default btn-file">
						
						<i class="fas fa-paperclip"></i> Adjuntar 

						<input type="file" class="subirAdjuntos" multiple>

						<input type="hidden" name="adjuntos" class="archivosTemporales">

					</div>

					<p class="help-block small">Archivos con peso máximo de 32MB</p>

				</div>

			</div>	

		</div>

		<div class="card-footer">
			
			<ul class="mailbox-attachments d-flex align-items-stretch clearfix">

               <!--  <li>
                  <span class="mailbox-attachment-icon"><i class="far fa-file-pdf"></i></span>

                  <div class="mailbox-attachment-info">
                    <a href="#" class="mailbox-attachment-name"><i class="fas fa-paperclip"></i> Sep2014-report.pdf</a>
                        <span class="mailbox-attachment-size clearfix mt-1">
                          <span>1,245 KB</span>
                          <a href="#" class="btn btn-default btn-sm float-right"><i class="fas fa-cloud-download-alt"></i></a>
                        </span>
                  </div>
                </li>

                <li>
                  <span class="mailbox-attachment-icon"><i class="far fa-file-word"></i></span>

                  <div class="mailbox-attachment-info">
                    <a href="#" class="mailbox-attachment-name"><i class="fas fa-paperclip"></i> App Description.docx</a>
                        <span class="mailbox-attachment-size clearfix mt-1">
                          <span>1,245 KB</span>
                          <a href="#" class="btn btn-default btn-sm float-right"><i class="fas fa-cloud-download-alt"></i></a>
                        </span>
                  </div>
                </li>

                 <li>
                  <span class="mailbox-attachment-icon"><i class="far fa-file-excel"></i></span>

                  <div class="mailbox-attachment-info">
                    <a href="#" class="mailbox-attachment-name"><i class="fas fa-paperclip"></i> App Description.xslx</a>
                        <span class="mailbox-attachment-size clearfix mt-1">
                          <span>1,245 KB</span>
                          <a href="#" class="btn btn-default btn-sm float-right"><i class="fas fa-cloud-download-alt"></i></a>
                        </span>
                  </div>
                </li>


                <li>
                  <span class="mailbox-attachment-icon has-img"><img src="http://academyoflife.com/backoffice/vistas/img/tickets/JPG.jpg" alt="Attachment"></span><br>

                  <div class="mailbox-attachment-info">
                    <a href="#" class="mailbox-attachment-name"><i class="fas fa-camera"></i> JPG.jpg</a>
                        <span class="mailbox-attachment-size clearfix mt-1">
                          <span>2.67 MB</span>
                          <a href="#" class="btn btn-default btn-sm float-right"><i class="fas fa-cloud-download-alt"></i></a>
                        </span>
                  </div>
                </li>

                <li>
                  <span class="mailbox-attachment-icon has-img"><img src="http://academyoflife.com/backoffice/vistas/img/tickets/PNG.png" alt="Attachment"></span><br>

                  <div class="mailbox-attachment-info">
                    <a href="#" class="mailbox-attachment-name"><i class="fas fa-camera"></i> PNG.png</a>
                        <span class="mailbox-attachment-size clearfix mt-1">
                          <span>1.9 MB</span>
                          <a href="#" class="btn btn-default btn-sm float-right"><i class="fas fa-cloud-download-alt"></i></a>
                        </span>
                  </div>
                </li> -->
		    						
	    	</ul>

	    	<div class="float-right">
			
				<button type="submit" class="btn btn-primary">
					<i class="fas fa-envelope"></i> Enviar
				</button>

			</div>

			<button type="reset" class="btn btn-default">
				<i class="fas fa-times"></i>  Descartar
			</button>

		</div>

		<?php 

		$crearTicket = new ControladorSoporte();
		$crearTicket -> ctrCrearTicket();

		?>

	</form>

</div>