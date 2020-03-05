<?php 
	
	if(isset($_GET["id_ticket"])){

		$ticket = ControladorSoporte::ctrMostrarTickets("id_soporte", $_GET["id_ticket"]);

	}else{

		echo '<script>
        
	      window.location = "'.$ruta.'backoffice/soporte";       

	    </script>';

	    return;

	}

 ?>

<div class="card card-primary card-outline">
 	
 	<!--=====================================
	Header tickets
	======================================-->	

 	<div class="card-header">

      <h3 class="card-title">Leer Ticket</h3>

    </div>

    <!--=====================================
	Body tickets
	======================================-->

	<div class="card-body p-0">
		
		<div class="mailbox-read-info">
			
			<h5><?php echo $ticket[0]["asunto"]; ?></h5>

			<h6>
				<span class="mailbox-read-time"><?php echo $ticket[0]["fecha_soporte"]; ?></span>
			</h6>

		</div><!-- Fin mailbox-read-info -->

		<div class="mailbox-controls with-border text-center">
			
			 <div class="btn-group">
			 	
				<button type="button" class="btn btn-default btn-sm btnPapelera" data-toggle="tooltip" data-container="body" title="Enviar a papelera" idTickets="<?php echo $ticket[0]["id_soporte"]; ?>" idUsuario="<?php echo $usuario["id_usuario"]; ?>">
	                <i class="fas fa-trash"></i>
              	</button>

              	<?php 

              		if($_GET["tipo"] == "recibidos"){

              			$para = ControladorUsuarios::ctrMostrarUsuarios("id_usuario", $ticket[0]["remitente"]);

              			$id_para = $ticket[0]["remitente"];

              			$direccion = array("Responder",'<i class="fas fa-reply"></i>');

              		}

              		if($_GET["tipo"] == "enviados"){

              			$para = ControladorUsuarios::ctrMostrarUsuarios("id_usuario", $ticket[0]["receptor"]);

                		$id_para = $ticket[0]["receptor"];

                		$direccion = array("Reenviar",'<i class="fas fa-share"></i>');
              		}
              	?>

              	<a href="index.php?pagina=soporte&soporte=nuevo-ticket&para=<?php echo $para["nombre"]?>&asunto=RE:<?php echo $ticket[0]["asunto"]?>&id_para=<?php echo $id_para?>">
              		
					<button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-container="body" title="<?php echo $direccion[0]; ?>">
                  		<?php echo $direccion[1]; ?>
                	</button>

              	</a>

			 </div>	 

		</div><!-- Fin mailbox-controls -->

		<div class="mailbox-read-message p-4">
		 	
			<?php echo $ticket[0]["mensaje"]; ?>

		</div><!-- Fin mailbox-read-message -->

	</div>

	<!--=====================================
	Footer tickets
	======================================-->

	<div class="card-footer bg-white">
		
		<ul class="mailbox-attachments clearfix">

		<?php 

			if($ticket[0]["adjuntos"] != ""){

				$adjuntos = json_decode($ticket[0]["adjuntos"], true);

				foreach ($adjuntos as $key => $value) {

					if(substr($value, -3) == "png" || substr($value, -3) == "jpg" || substr($value, -4) == "jpeg"){

						echo '<li>
	                            
	                            <span class="mailbox-attachment-icon has-img"><img src="'.$value.'" alt="Attachment"></span><br>

	                            <div class="mailbox-attachment-info">

	                              <a href="'.$value.'" target="_blank" class="mailbox-attachment-name">
	                                <i class="fas fa-camera"></i> Imagen
	                              </a>
	                                  
	                              <a href="'.$value.'" target="_blank" class="btn btn-default btn-sm float-right"><i class="fas fa-cloud-download-alt"></i>
	                              </a>
	                                 
	                            </div>

	                    </li>';

	                }

                    if(substr($value, -3) == "pdf"){

                    	echo '<li>

                            <span class="mailbox-attachment-icon"><i class="far fa-file-pdf"></i></span>

                            <div class="mailbox-attachment-info">

                              <a href="'.$value.'" target="_blank" class="mailbox-attachment-name">
                                <i class="fas fa-papperclip"></i> PDF
                              </a>
                                  
                              <a href="'.$value.'" target="_blank" class="btn btn-default btn-sm float-right"><i class="fas fa-cloud-download-alt"></i>
                              </a>

                            </div>

                          </li>';

                  	}

                  	if(substr($value, -3) == "doc" || substr($value, -4) == "docx"){

                    	echo '<li>

                            <span class="mailbox-attachment-icon"><i class="far fa-file-word"></i></span>

                            <div class="mailbox-attachment-info">

                              <a href="'.$value.'" target="_blank" class="mailbox-attachment-name">
                                <i class="fas fa-papperclip"></i> Word
                              </a>
                                  
                              <a href="'.$value.'" target="_blank" class="btn btn-default btn-sm float-right"><i class="fas fa-cloud-download-alt"></i>
                              </a>

                            </div>

                          </li>';

                  	}

                  	if(substr($value, -3) == "xls" || substr($value, -4) == "xlsx"){

                    	echo '<li>

                            <span class="mailbox-attachment-icon"><i class="far fa-file-excel"></i></span>

                            <div class="mailbox-attachment-info">

                              <a href="'.$value.'" target="_blank" class="mailbox-attachment-name">
                                <i class="fas fa-papperclip"></i> Excel
                              </a>
                                  
                              <a href="'.$value.'" target="_blank" class="btn btn-default btn-sm float-right"><i class="fas fa-cloud-download-alt"></i>
                              </a>

                            </div>

                          </li>';

                  	}

				}

			}

		?>	

		</ul>

		<div class="float-right">

		<?php if ($_GET["tipo"] == "recibidos"): ?>

			<a href="index.php?pagina=soporte&soporte=nuevo-ticket&para=<?php echo $para["nombre"]?>&asunto=RE:<?php echo $ticket[0]["asunto"]?>&id_para=<?php echo $id_para?>"> 
			  <button type="button" class="btn btn-default"><i class="fa fa-reply"></i> Responder</button>
			 </a>
			
		<?php endif ?>

		<?php if ($_GET["tipo"] == "enviados"): ?>

			<a href="index.php?pagina=soporte&soporte=nuevo-ticket&para=<?php echo $para["nombre"]?>&asunto=RE:<?php echo $ticket[0]["asunto"]?>&id_para=<?php echo $id_para?>">
			  <button type="button" class="btn btn-default"><i class="fa fa-share"></i> Reenviar</button>
			</a>
			
		<?php endif ?>   
   
        </div>

        <button type="button" class="btn btn-default btnPapelera" idTickets="<?php echo $ticket[0]["id_soporte"]; ?>" idUsuario="<?php echo $usuario["id_usuario"]; ?>"><i class="fa fa-trash-o"></i> Enviar a Papelera</button>

	</div>

 </div>