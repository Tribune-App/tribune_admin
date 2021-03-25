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
        $this->db->select('wo_posts.*,wo_users.first_name,wo_users.last_name,wo_users.username');
        $this->db->from('wo_posts');
        $this->db->group_by('time');
        $this->db->join('wo_users', 'wo_users.user_id = wo_posts.user_id');
        if(!empty($where)){$this->db->where_in($where);}
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
        $this->db->from('wo_posts');
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
        return $this->db->delete('wo_posts', array('time' => $time));
    }

    #Actualizar/Censurar publicaciones
    public function updateCenduredPost($time, $valor)
    {
        $this->db->where('time', $time);
        return $this->db->update('wo_posts',array('is_censured' => $valor));
    }
}
