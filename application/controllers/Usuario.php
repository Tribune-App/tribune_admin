<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

set_time_limit(0);
ini_set("memory_limit","1024M");

class Usuario extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		#Cargamos los modelos
        $this->load->model('usuario_model');
        
        if(!$this->session->id_usuario){ redirect(base_url()); }
	}

    #Responde en JSON
    public function responseJSON($datos)
    {
        $this->output->set_content_type('application/json')->set_output(json_encode($datos));
    }


    #Cambiar contraseña del usuario
    public function cambiarcontrasena(){
        #Validamos los campos del formulario
        $this->form_validation->set_rules('edit_contrasena', 'Contraseña', 'trim|required');
        #Validamos el Formulario
        if ($this->form_validation->run() == FALSE){
            #Ocurrio un error en la validación, hay campos que faltan completar
            $this->session->set_flashdata('msg', '<div class="alert alert-warning"><strong>MENSAJE:</strong><br>- Debe completar todos los campos obligatorios del formulario.</div>');
            #Redirigimos al formulario y mostramos el mensaje
            redirect(base_url('panel/mant_usuario'));
        }else {
            #Obtenemos el valor
            $id_usuario = $this->security->xss_clean($this->input->post('contrasena_id_usuario'));
            #Datos del usuario
            $usuario = array(
                'contrasena'      => md5(md5($this->security->xss_clean($this->input->post('edit_contrasena'))))
            );
            #Enviamos los datos del usuario para registrar
            $this->usuario_model->update($usuario,$id_usuario);

            #Redirecionamos a la lista de usuarios
            $this->session->set_flashdata('msg', '<div class="alert alert-success"><strong>MENSAJE:</strong><br>- ¡Contraseña del Usuario ACTUALIZADO con éxito!.</div>');
            redirect(base_url('panel/mant_usuario'));
        }
    }

}