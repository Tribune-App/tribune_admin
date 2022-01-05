<body class="login">
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <?php echo form_open(base_url(), array('class' => 'm-t'));?>
              <h1>TRIBUNE - ADMIN</h1>
              <div>
                <input type="text" class="form-control" name="login" placeholder="Usuario" required="" value=""/>
              </div>
              <div>
                <input type="password" class="form-control" name="contrasena" placeholder="Contraseña" required="" value=""/>
              </div>
              <div>
                <button type="submit" class="btn btn-danger btn-block">Ingresar</button>
              </div>
              
              <p class="error"><?php echo $msg; ?></p>
              <?php if ($this->session->flashdata('msg')){ echo $this->session->flashdata('msg'); } ?>

              <div class="clearfix"></div>

              <div class="separator">
                <div class="clearfix"></div>
                <br />
                <div>
                  <p>©2021 All Rights Reserved. Privacy and Terms. <br>Tribune SRL</p>
                </div>
              </div>
            </form>
          </section>
        </div>
      </div>
    </div>
  </body>