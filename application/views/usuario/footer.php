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
        $(document).ready(function() {
          $('.chosen-select').chosen({width: "100%"});
        });

        $('#datatable-responsive').DataTable({
            language: {
                "url": "//cdn.datatables.net/plug-ins/1.10.16/i18n/Spanish.json"
            },
        });

        $('#mdlEditarUsuario').on('show.bs.modal', function (event) {
          var button = $(event.relatedTarget);
          var id_usuario = button.data('idusuario');
          var modal = $(this);
          $('.loading').show();
          $('#id_usuario').val(id_usuario);
          console.log(id_usuario);
          params = {csrfsn: csrfsn, id_usuario: id_usuario }
          $.post(base_url+'ajax/getusuario/', params, function(data){
              if(data.status > 0){
                  console.log(data);
                  $('#edit_id_personal').val(data.usuarios.id_personal).trigger('chosen:updated');
                  $('#edit_id_perfil').val(data.usuarios.id_perfil).trigger('chosen:updated');
                  $('#edit_login').val(data.usuarios.login);
                  
                  $('.loading').hide();
              }else{
                  alert('No hay datos disponibles para el mensaje.');
                  $('.loading').hide();
              }
          });
        });


        $('#mdlEditarUsuario').on('hidden.bs.modal', function (e) {
          var modal = $(this);
          $('#id_personal').val('').trigger('chosen:updated');
          $('#id_perfil').val('').trigger('chosen:updated');
          $('#login').val('');
        });

        $('#mdlContrasenaUsuario').on('show.bs.modal', function (event) {
          var button = $(event.relatedTarget);
          var id_usuario = button.data('idusuario');
          var modal = $(this);
          $('.loading').show();
          $('#contrasena_id_usuario').val(id_usuario);
          console.log(id_usuario);
        });

        $('#mdlContrasenaUsuario').on('hidden.bs.modal', function (e) {
          var modal = $(this);
          $('#edit_contrasena').val('');
        });

        function eliminarUsuario(id_usuario){
          swal(
              {
                  title: "¿Está seguro que desea ELIMINAR el USUARIO?",
                  text: "Eliminando Usuario Seleccionado",
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
                      $.get(base_url + "usuario/eliminar/"+id_usuario, function(data){
                          if(data.status==1){
                              //swal("Correcto", data.msg, "success");
                              location.reload();
                          }else{
                              swal("Error", data.msg, "error");
                          }
                      })
                  } else {
                      swal("Cancelado", "Se canceló la operación", "error");
                  }
              }
          );
      }
    </script>
  </body>
</html>