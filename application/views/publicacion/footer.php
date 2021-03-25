  <!-- jQuery -->
    <script src="<?php echo base_url(); ?>template/gentelella-master/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="<?php echo base_url(); ?>template/gentelella-master/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="<?php echo base_url(); ?>template/gentelella-master/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="<?php echo base_url(); ?>template/gentelella-master/vendors/nprogress/nprogress.js"></script>
    <!-- iCheck -->
    <script src="<?php echo base_url(); ?>template/gentelella-master/vendors/iCheck/icheck.min.js"></script>
    <!-- Datatables -->
    <script src="<?php echo base_url(); ?>template/gentelella-master/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="<?php echo base_url(); ?>template/gentelella-master/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="<?php echo base_url(); ?>template/gentelella-master/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="<?php echo base_url(); ?>template/gentelella-master/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="<?php echo base_url(); ?>template/gentelella-master/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="<?php echo base_url(); ?>template/gentelella-master/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="<?php echo base_url(); ?>template/gentelella-master/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="<?php echo base_url(); ?>template/gentelella-master/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="<?php echo base_url(); ?>template/gentelella-master/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="<?php echo base_url(); ?>template/gentelella-master/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="<?php echo base_url(); ?>template/gentelella-master/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="<?php echo base_url(); ?>template/gentelella-master/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="<?php echo base_url(); ?>template/gentelella-master/vendors/jszip/dist/jszip.min.js"></script>
    <script src="<?php echo base_url(); ?>template/gentelella-master/vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="<?php echo base_url(); ?>template/gentelella-master/vendors/pdfmake/build/vfs_fonts.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="<?php echo base_url(); ?>template/gentelella-master/build/js/custom.min.js"></script>
    <!-- Alert!-->
    <script src="<?php echo base_url(); ?>template/gentelella-master/vendors/sweetalert/js/sweetalert.min.js"></script>
    <!--Chosen  -->
    <script src="<?php echo base_url(); ?>template/gentelella-master/vendors/chosen/chosen.jquery.js"></script>

    <script>
        var base_url = '<?php echo base_url(); ?>';
        var <?php echo $this->security->get_csrf_token_name(); ?> = '<?php echo $this->security->get_csrf_hash(); ?>';
          //document.addEventListener('contextmenu', event => event.preventDefault());
        var timeout;
        document.onmousemove = function(){
            clearTimeout(timeout);
            timeout = setTimeout(function(){window.location.href=base_url+'logout';}, 1200000);
        }
    </script>

    <script>
         $('#datatable-responsive').DataTable({
            order: [[ 0, "desc" ]],
            language: {
                "url": "//cdn.datatables.net/plug-ins/1.10.16/i18n/Spanish.json"
            },
        });

         function verPostFile(time){
             params = {csrfsn: csrfsn, time: time }
             $.post(base_url+'ajax/getpostfile/', params, function(data){
                 if(data.status > 0){
                     //var html="";
                     console.log(data.postfiles);

                     for(var i=0;i<data.postfiles.length;i++){
                         var ruta='http://localhost/tribune_redsocial_light/'+data.postfiles[i].postFile;
                         window.open(ruta, '_blank');
                     }
                 }else{
                     alert('No se encontraron PostFile en la publicación');
                 }
             });
         }

         function eliminarPublicacion(time){
            swal(
              {
                  title: "¿Está seguro que desea ELIMINAR la publicación?",
                  text: "Eliminando Publicación Seleccionada",
                  type: "warning",
                  showCancelButton: true,
                  showLoaderOnConfirm: true,
                  confirmButtonColor: "#AEDEF4",
                  confirmButtonText: "SI",
                  cancelButtonText: "NO",
                  closeOnConfirm: true,
                  closeOnCancel: false
              },
              function (isConfirm) {
                  if (isConfirm) {
                    params = {csrfsn: csrfsn, time: time }
                    $.post(base_url+'ajax/deletepost/', params, function(data){
                        // console.log(data);
                        if(data.status==1){
                              //swal("Correcto", data.msg, "success");
                              location.reload();
                          }else{
                              swal("Error", data.msg, "error");
                          }
                    });
                  } else {
                      swal("Cancelado", "Se canceló la operación", "error");
                  }
              }
          );
         }

         function censurarPublicacion(time, valor){
            var msg= (valor== 1 ? "¿Está seguro que desea CENSURAR la publicación?" : "¿Está seguro que desea HABILITAR la publicación?");
            var subtitle= (valor== 1 ? "Censurando Publicación Seleccionada" : "Habilitando Publicación Seleccionada");

            swal(
              {
                  title: msg,
                  text: subtitle,
                  type: "warning",
                  showCancelButton: true,
                  showLoaderOnConfirm: true,
                  confirmButtonColor: "#AEDEF4",
                  confirmButtonText: "SI",
                  cancelButtonText: "NO",
                  closeOnConfirm: true,
                  closeOnCancel: false
              },
              function (isConfirm) {
                  if (isConfirm) {
                    params = {csrfsn: csrfsn, time: time, valor: valor }
                    $.post(base_url+'ajax/update_cendured_post/', params, function(data){
                        // console.log(data);
                        if(data.status==1){
                              //swal("Correcto", data.msg, "success");
                              location.reload();
                          }else{
                              swal("Error", data.msg, "error");
                          }
                    });
                  } else {
                      swal("Cancelado", "Se canceló la operación", "error");
                  }
              }
          );
         }
    </script>
  </body>
</html>