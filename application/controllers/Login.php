<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

set_time_limit(0);
ini_set("memory_limit","1024M");

class Login extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		#Cargamos los modelos
        $this->load->model('usuario_model');
		$this->load->model('acceso_model');
		$this->load->model('verification_model');
        
	}

	public function index()
	{
		#Título de la página
		$data['titulo'] = "LOGIN";
		$data['msg'] = '';
    	#Validación del formulario
		if($_POST){
			#Reglas de validación
			$this->form_validation->set_rules('login', 'Usuario', 'trim|required');
			$this->form_validation->set_rules('contrasena', 'Contraseña', 'trim|required');
			#Mensajes para la validación
			$this->form_validation->set_message('login', 'Debe ingresar el nombre de usuario.');
			$this->form_validation->set_message('contrasena', 'Debe ingresar la contraseña del usuario.');

			if ($this->form_validation->run() == TRUE)
			{
				#Verificamos que el usuario existe y está activo

				$date = new DateTime('NOW', new DateTimeZone( $this->config->item('time_reference') ));
				$token_date = md5( $date->format("Y-m-d H:i:s") );
				$usuario = $this->usuario_model->existeUsuarioActivo($token_date);
				if($usuario){

					$current_user = $usuario[0];


					if($usuario[0]['id_perfil']>0 ){ #Perfil: Administrador

						$config = array(
							'smtp_crypto'  => getenv('MAIL_CRYPTO'),
							'protocol'  => getenv('MAIL_PROTOCOL'),
							'smtp_host' => getenv('MAIL_HOST'),
							'smtp_port' => getenv('MAIL_PORT'),
							'smtp_user' => getenv('MAIL_USER'),
							'smtp_pass' => getenv('MAIL_PASS'),
							'mailtype'  => getenv('MAIL_MAILTYPE'),
							'charset'   => 'utf-8',
							'smtp_timeout'   => "2"
						);
				
						$this->load->library('email');
						$this->email->initialize($config);
				
						//$this->email->set_newline("\r\n");
						$this->email->from("dashboard@tribune.pe");
						$this->email->to("bossun258@gmail.com");
						$this->email->subject("codigo");
						$this->email->message( base_url('authflow/twofactor?mt=' . $token_date) );
						if ($this->email->send()) {
							
							redirect(base_url('authflow/twofactor?mt=' . $token_date));
						} else {
							$data['msg'] = $this->email->print_debugger();
						}

						// $this->session->set_userdata($usuario[0]);
						// #Almacenar el Log de Acceso
						// $acceso = array(
						// 	'id_usuario'      => $usuario[0]['id_usuario'],
						// 	'ip'      => $this->getRealIP()
						// );
						// #Enviamos los datos
						// $this->acceso_model->save($acceso);
						// redirect(base_url('panel'));

						//redirect(base_url('authflow/twofactor?mt=' . $token_date));
					}else{
						$this->session->set_flashdata('msg', '<div class="alert alert-danger">El Usuario y/o Contraseña son incorrectos.</div>');
	                    redirect(base_url('login'));
					}
				}
			}
		}
	    
		$this->load->view('login/header', $data);
		$this->load->view('login/index', $data);
	}

	public function verification_two_factor(){
		#Título de la página
		$data['titulo'] = "VERIFICATION TWO FACTOR";
		$data['msg'] = "";
		$data['nottoken'] = false;
		
		$token = $this->security->xss_clean($this->input->get('mt'));
		$data['token'] = $token;
		
		$token_list = $this->verification_model->list_today();
		// $token_list = array_values($token_list);

		$id_usuario = "";
		$_token_list = array();
		foreach ($token_list as $t) {
			if( $token == $t["token_date"]){
				$id_usuario = $t["id_usuario"];
			}
			array_push($_token_list , $t["token_date"]);
		}

		if( in_array( $token , $_token_list) ){
			if($_POST){
				$this->form_validation->set_rules('token', 'Token', 'trim|required');
				$this->form_validation->set_rules('code', 'Verification', 'trim|required');
	
				$this->form_validation->set_message('token', 'El Token no existe.');
				$this->form_validation->set_message('code', 'El codigo es requerido.');
	
				if ($this->form_validation->run() == TRUE)
				{
					$usuario = $this->verification_model->verification($id_usuario);
					if($usuario){
						$this->session->set_userdata($usuario[0]);
						#Almacenar el Log de Acceso
						$acceso = array(
							'id_usuario'      => $usuario[0]['id_usuario'],
							'ip'      => $this->getRealIP()
						);
						#Enviamos los datos
						$this->acceso_model->save($acceso);
						redirect(base_url('panel'));
					}else{
						$data['msg'] = "Codigo de Seguridad Invalido";
					}
					
				}
			}
		}else{
			$data['nottoken'] = true;
			$data['msg'] = "TOKEN NO EXISTE";
		}
		
		
		$this->load->view('verification/header', $data);
		$this->load->view('verification/index', $data);
	}

	public function logout()
	{
	    $user_data = $this->session->all_userdata();
	    foreach ($user_data as $key => $value) {
	        if ($key != 'session_id' && $key != 'ip_address' && $key != 'user_agent' && $key != 'last_activity') {
	            $this->session->unset_userdata($key);
	        }
	    }

	    redirect(base_url());
	}

	function getRealIP()
	{

		if (isset($_SERVER["HTTP_CLIENT_IP"]))
		{
			return $_SERVER["HTTP_CLIENT_IP"];
		}
		elseif (isset($_SERVER["HTTP_X_FORWARDED_FOR"]))
		{
			return $_SERVER["HTTP_X_FORWARDED_FOR"];
		}
		elseif (isset($_SERVER["HTTP_X_FORWARDED"]))
		{
			return $_SERVER["HTTP_X_FORWARDED"];
		}
		elseif (isset($_SERVER["HTTP_FORWARDED_FOR"]))
		{
			return $_SERVER["HTTP_FORWARDED_FOR"];
		}
		elseif (isset($_SERVER["HTTP_FORWARDED"]))
		{
			return $_SERVER["HTTP_FORWARDED"];
		}
		else
		{
			return $_SERVER["REMOTE_ADDR"];
		}

	}

	private function accessLogin($user){
		$this->session->set_userdata($user);
		#Almacenar el Log de Acceso
		$acceso = array(
			'id_usuario'      => $user['id_usuario'],
			'ip'      => $this->getRealIP()
		);
		#Enviamos los datos
		$this->acceso_model->save($acceso);
		redirect(base_url('panel'));
	}
}

