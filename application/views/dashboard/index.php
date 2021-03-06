<?php 
  if($this->session->ruta_foto){
    $ruta_foto=base_url('imagenes/personal/'.$this->session->ruta_foto);
  }else{
    $ruta_foto=base_url('imagenes/personal/personal_default.png');
  }
?>
<div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="#" class="site_title"><i class="fa fa-dashboard"></i> <span>Tribune SRL</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="<?php echo $ruta_foto; ?>" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Bienvenido,</span>
                <h2><?php echo $this->session->nombres; ?></h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>Menú de Opciones</h3>
                <ul class="nav side-menu">
                  <li><a href="<?php echo base_url('panel'); ?>"><i class="fa fa-bar-chart-o"></i> Mi Dashboard </a></li>
                  <li><a><i class="fa fa-desktop"></i> Mantenimientos <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <?php if($this->session->id_perfil==1){  ?>
                          <li><a href="<?php echo base_url('panel/mant_usuario'); ?>">Usuarios</a></li>
                          <li><a href="<?php echo base_url('panel/mant_publicacion'); ?>">Publicaciones</a></li>
                      <?php }  ?>
                    </ul>
                  </li>
                </ul>
              </div>
            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Salir del Sistema" href="<?php echo base_url('login/logout'); ?>">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="<?php echo $ruta_foto; ?>" alt=""><?php echo $this->session->nombres; ?>
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="<?php echo base_url('login/logout'); ?>"><i class="fa fa-sign-out pull-right"></i> Salir del Sistema</a></li>
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          <!-- top tiles -->

          <div class="row tile_count">
            <?php if($this->session->id_perfil==1){  ?>
                <a href="<?php echo base_url('panel/mant_usuario'); ?>">
                    <div class="animated flipInY col-lg-2 col-md-2 col-sm-6 col-xs-6">
                        <div class="tile-stats">
                            <div class="icon"><i class="fa fa-user red"></i></div>
                            <div class="count"><?php $total_usuarios=0; if(is_array($usuarios)){ echo $total_usuarios=count($usuarios); } else{ echo $total_usuarios;} ?></div>
                            <h4 style="padding-left:10px">Usuarios</h4>
                        </div>
                    </div>
                </a>
              <a href="<?php echo base_url('panel/mant_publicacion'); ?>">
                <div class="animated flipInY col-lg-2 col-md-2 col-sm-6 col-xs-6">
                  <div class="tile-stats">
                    <div class="icon"><i class="fa fa-list red"></i></div>
                    <div class="count"><?php $total_publicaciones=0; if(is_array($publicaciones)){ echo $total_publicaciones=count($publicaciones); } else{ echo $total_publicaciones;} ?></div>
                    <h4 style="padding-left:10px">Publicaciones</h4>
                  </div>
                </div>
              </a>
            <?php }  ?>
          </div>
          <!-- /top tiles -->
          <br />
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            ©2021 All Rights Reserved. Privacy and Terms. Tribune SRL
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>