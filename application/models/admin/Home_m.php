<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Home_m extends CI_Model
{
    function __construct()
    {
        parent::__construct();
    }



    public function getUsersInfo($condition = '')
    {
        $query = $this->db
            ->select("*")
            ->join("role_type as rt", "us.role_id = rt.role_id ");

        $this->db->where("us.isactive = ", 1);
        if ($condition)
            $this->db->where($condition);
        $result = $query->get("users as us")->row();

        return $result;
    }


    public function userLast5LoginDetails($condition = '', $perpage = "", $start = 0)
    {
        $this->db
            ->select('us.*,u.created_at as lead_date, u.first_name')
            ->join('users as u', 'u.user_id = us.user_id')
            ->where(
                [
                    'us.type' => "Login",
                    "u.user_id" => $this->user_id
                ]
            );
        if ($condition)
            $this->db->where($condition);

        $this->db->order_by("us.created_at", "desc");
        if ($perpage) {
            $res = $this->db->get('user_sessions as us', $perpage, $start)->result();
            return $res;
        } else {

            return $this->db->get('user_sessions as us')->num_rows();
        }
    }

    public function customerList($condition = "")
    {
        $query = $this->db
            ->select("*")
            ->where([
                "i.isactive" => 1,
            ]);

        if ($condition)
            $this->db->where($condition);
        $result = $query->get("items as i")
            ->result();
        return $result;
    }

    public function getReportExcel($condition = "", $where_in_assign_to_in = "")
    {
        $this->db
            ->select("i.number,i.seal_name,i.doi,i.`type`,i.`use`,i.`client`")
            ->where([
                'i.isactive' => 1,
            ]);

        if ($where_in_assign_to_in) {
            // $this->db->where_in("u.assigned_to", $where_in_assign_to_in);
        } else {
            // $this->db->where_in("u.assigned_to", ('xxx'));
        }



        if ($condition)
            $this->db->where($condition);

        $data = $this->db->get("items as i")->result();

        Excel::export($data, [
            'filename' => "report_"
        ]);
    }

    public function itemDetails($custID = "")
    {

        $query = $this->db
            ->select("a.*,us.profile_pic,us.first_name")
            ->join("users as us", "a.created_by = us.user_id", "left")
            ->where([
                // "us.isactive" => 1
            ]);

        if ($custID)
            $this->db->where([
                "us.user_id" => $custID
            ]);
        $result = $query->get("items as a")
            ->result();

        return $result;
    }
}
