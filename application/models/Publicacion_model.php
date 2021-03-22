<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Publicacion_model extends CI_Model {

	public function __construct()
	{
		parent::__construct();
	}

    #Obtenemos las publicaciones
    public function getPublicaciones($where = null)
    {
        //Consulta
        $this->db->select('*');
        $this->db->from('wo_posts');
        $this->db->group_by('time');
        if(!empty($where)){$this->db->where_in($where);}
        $query = $this->db->get();
        if($query->num_rows() > 0)
        {
            return $query->result();
        }

        return false;
    }
}
