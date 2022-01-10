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
        $this->db->select('Wo_Posts.*,Wo_Users.first_name,Wo_Users.last_name,Wo_Users.username');
        $this->db->from('Wo_Posts');
        $this->db->group_by('time');
        $this->db->join('Wo_Users', 'Wo_Users.user_id = Wo_Posts.user_id');
        if(!empty($where)){
            foreach ($where as $k => $w) {
                $this->db->where_in($k, $w);
            }
        }
        $query = $this->db->get();
        if($query->num_rows() > 0)
        {
            return $query->result();
        }

        return false;
    }

    #Obtenemos el postFile de Publicaciones
    public function getPostFile($where = null)
    {
        //Consulta
        $this->db->select('*');
        $this->db->from('Wo_Posts');
        if(!empty($where)){$this->db->where($where);}
        $query = $this->db->get();
        if($query->num_rows() > 0)
        {
            return $query->result();
        }

        return false;
    }

    #Eliminar publicaciones
    public function deletePost($time)
    {
        return $this->db->delete('Wo_Posts', array('time' => $time));
    }

    #Actualizar/Censurar publicaciones
    public function updateCenduredPost($time, $valor)
    {
        $this->db->where('time', $time);
        return $this->db->update('Wo_Posts',array('is_censured' => $valor));
    }
}
