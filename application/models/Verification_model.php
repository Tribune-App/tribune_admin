<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Verification_model extends CI_Model {

	public function __construct()
	{
		parent::__construct();
	}

    public function list_today(){

        $this->db->select('token_date, id_usuario,flestado');
        $this->db->from('verification_login');

        $date = new DateTime('NOW', new DateTimeZone( $this->config->item('time_reference') ));

        $this->db->where('DATE(fregistro)', $date->format("Y-m-d"));
        $this->db->where('flestado', 1);
        $query = $this->db->get();
		if($query->num_rows() > 0)
		{
		    return $query->result_array();
		}
		return false;
    }

    public function verification($id_usuario){
        $token = $this->security->xss_clean($this->input->post('token'));
        $code = $this->security->xss_clean($this->input->post('code'));

        $this->db->select('*');
        $this->db->from('verification_login');
        $this->db->where('token_date' , $token);
        $this->db->where('flestado' , 1);
        $query = $this->db->get();

        $continue = false;
        $id_usuario = 0;

		if($query->num_rows() > 0)
		{
            
		    $results = $query->result_array();
            foreach ($results as $r) {
                if($r["verification_code"] == $code){
                    $continue = true;
                    $id_usuario = $r["id_usuario"];
                    break;
                }
            }

            if($continue){
                $this->db->set('flestado', 0);
                $this->db->where('id_usuario', $id_usuario);
                $this->db->update('verification_login');

                $this->db->select('usuario.id_usuario, 
							usuario.login, 
							usuario.contrasena, 
							usuario.flestado, 
							personal.nro_doc,
							personal.nombres,
							personal.apellido_paterno,
							personal.apellido_materno,
							perfil.nombre as perfil,
                            usuario.id_perfil,
                            personal.ruta_foto,
                            personal.email,
                            '
						);

                $this->db->from('usuario');
                $this->db->join('personal', 'usuario.id_personal = personal.id_personal');
                $this->db->join('perfil', 'perfil.id_perfil = usuario.id_perfil');
                $this->db->where('usuario.id_usuario', $id_usuario);
                $query = $this->db->get();
                if($query->num_rows() > 0)
                {
                    return $query->result_array();
                }
            }

		}
		return false;
    }
    
}