<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
date_default_timezone_set('America/Lima');
set_time_limit(0);
ini_set("memory_limit","1024M");

class Panel extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		#Cargamos los modelos
	  
        $this->load->model('perfil_model');
        $this->load->model('personal_model');
        $this->load->model('usuario_model');
        $this->load->model('publicacion_model');

        if(!$this->session->id_usuario){ redirect(base_url()); }
	}

	public function index()
	{
		#Título de la página
		$data['titulo'] = "DASHBOARD";
        #Traemos las publicaciones
        $data['publicaciones'] = $this->publicacion_model->getPublicaciones(array('postType' => array('post','profile_picture')));
        #Traemos los usuarios
        $data['usuarios'] = $this->usuario_model->getUsuarios();
		$this->load->view('dashboard/header', $data);
		$this->load->view('dashboard/index');
		$this->load->view('dashboard/footer');
	}

	public function mant_publicacion()
	{
		//Administrador:1
		if($this->session->id_perfil==1){
			#Título de la página
			$data['titulo'] = "PUBLICACIÓN";
		    #Traemos las publicaciones
	        $data['publicaciones'] = $this->publicacion_model->getPublicaciones(array('postType' => array('post','profile_picture')));

			$this->load->view('publicacion/header', $data);
			$this->load->view('publicacion/index');
			$this->load->view('publicacion/footer');
		}else{
			redirect(base_url('login/logout'));
		}
	}

    public function mant_usuario()
    {
        //Administrador:1
        if($this->session->id_perfil==1){
            #Título de la página
            $data['titulo'] = "USUARIO";
            #Traemos los usuarios
            $data['usuarios'] = $this->usuario_model->getUsuarios();

            $this->load->view('usuario/header', $data);
            $this->load->view('usuario/index');
            $this->load->view('usuario/footer');
        }else{
            redirect(base_url('login/logout'));
        }
    }

}