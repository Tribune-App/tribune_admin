<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

set_time_limit(0);
ini_set("memory_limit","1024M");

class Ajax extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        #Cargamos los modelos
        $this->load->model('publicacion_model');

        #Detectamos el envío por Ajax
        if (!$this->input->is_ajax_request()) { exit('No direct script access allowed'); }
    }

    #Responde en JSON
    public function responseJSON($datos)
    {
        $this->output->set_content_type('application/json')->set_output(json_encode($datos));
    }

    #Obtenemos los datos del PostFile
    public function getpostfile()
    {
        $time = $this->security->xss_clean($this->input->post('time'));
        $response = array('status' => 0);
        $where = array('time' => $time,'multi_image_post' => 1);
        $postfiles = $this->publicacion_model->getPostFile($where);
        if($postfiles){
            $response = array('status' => 1, 'postfiles' => $postfiles );
        }

        $this->responseJSON($response);
    }

    #Obtenemos los datos del PostFile
    public function deletepost()
    {
        $time = $this->security->xss_clean($this->input->post('time'));
        $response = array('status' => 0);
        $post = $this->publicacion_model->deletePost($time);
        if($post){
            $response = array('status' => 1, 'post' => $post );
        }

        $this->responseJSON($response);
    }

    #Actualizar/Censurar posts
    public function update_cendured_post()
    {
        $time = $this->security->xss_clean($this->input->post('time'));
        $valor = $this->security->xss_clean($this->input->post('valor'));
        $response = array('status' => 0);
        $post = $this->publicacion_model->updateCenduredPost($time, $valor);
        if($post){
            $response = array('status' => 1, 'post' => $post );
        }

        $this->responseJSON($response);
    }

}