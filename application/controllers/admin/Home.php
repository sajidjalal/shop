<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Home extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();

        $validateToken = validateToken();
        Monolog::saveLog("validateToken", "I", json_encode($validateToken));

        if ($validateToken["status_code"] == 200) {

            $this->role_id = @$validateToken["user_data"]->role_id;
            $this->user_id = @$validateToken["user_data"]->user_id;
            $this->mobile_number = @$validateToken["user_data"]->mobile_number;
            $this->first_name = @$validateToken["user_data"]->first_name;
            $this->email = @$validateToken["user_data"]->email;
            $query = $this->db
                ->select("us.session_id")
                ->where("us.isactive = ", 1)
                ->where("us.user_id = ", $this->user_id);
            $resultCheckToken = $query->get("users as us")->row();


            if (is_null($resultCheckToken->session_id) || empty($resultCheckToken->session_id)) {
                $data = $validateToken;
                echo $this->load->view('comman/unauthorize_view', $data, TRUE);
                die();
            }
        } else {
            $data = $validateToken;
            echo $this->load->view('comman/unauthorize_view', $data, TRUE);
            die();
        }
        $this->load->model('admin/Home_m', 'obj_home', true);
    }


    public function profile()
    {
        extract($this->input->post(null, true));
        $data = [];
        $condition = "";
        if (@$user_id) {
            $condition = ['us.user_id' => $user_id];
        } else {
            $condition = ['us.user_id' => $this->user_id];
        }

        $data['userInfo'] = $this->obj_home->getUsersInfo($condition);



        $data['userLast5LoginDetails'] = $this->obj_home->userLast5LoginDetails(false, 5, 0);

        if ($data['userInfo']) {

            if (strcmp($data['userInfo']->session_id, $_COOKIE['token']) == 0) {

                if ($this->role_id == 1) {
                    $this->load->view('layout/superAdmin/header', $data);
                    $this->load->view('admin/profile', $data);
                    $this->load->view('layout/admin/footer');
                    return;
                } else if ($this->role_id == 2) {

                    $this->load->view('layout/admin/header', $data);
                    $this->load->view('admin/profile', $data);
                    $this->load->view('layout/admin/footer');
                    return;
                } else if ($this->role_id  == 4) {
                    $this->load->view('layout/customer/header', $data);
                    $this->load->view('admin/profile', $data);
                    $this->load->view('layout/customer/footer');
                    return;
                }
                $this->load->view('comman/unauthorize_view', $data);
            }
        }
        $this->load->view('comman/unauthorize_view', $data);
        return;
    }

    public function itemList()
    {
        extract($this->input->get(null, true));

        $condition = "";
        if (@$user_id) {
            $condition = ['us.user_id' => $user_id];
        } else {
            $condition = ['us.user_id' => $this->user_id];
        }


        $data['userInfo'] = $this->obj_home->getUsersInfo($condition);
        $data['itemList'] = $this->obj_home->customerList();

        if ($data['itemList']) {
            if ($this->role_id == 1) {
                $this->load->view('layout/superAdmin/header', $data);
                $this->load->view('admin/itemList', $data);
                $this->load->view('layout/admin/footer');
                return;
            } else if ($this->role_id == 2) {
                $this->load->view('layout/admin/header', $data);
                $this->load->view('admin/itemList', $data);
                $this->load->view('layout/admin/footer');
                return;
            } else if ($this->role_id  == 4) {
            }
            $this->load->view('comman/unauthorize_view', $data);
        } else {
            $this->load->view('comman/unauthorize_view', $data);
        }
    }


    public function excel_export()
    {

        $condition = '';
        extract($this->input->get(null, true));

        $condition = '';
        // $condition = ['u.organization_id' => $this->organization_id];

        $all_assign_to = false;
        $this->obj_home->getReportExcel($condition, $all_assign_to);
    }

    public function excel_import()
    {
        $data = [];


        if (!empty($_FILES['exam_file']['name'])) {

            $allowed = array('xls', 'xlsx', 'xltx', "csv");
            $filename = $_FILES['exam_file']['name'];

            $ext = pathinfo($filename, PATHINFO_EXTENSION);

            if (!in_array($ext, $allowed)) {
                $arr["title"] = "Please select a excel file";
                return $this->output
                    ->set_status_header(401)
                    ->set_content_type('application/json')
                    ->set_output(json_encode([
                        "message" => $arr['title'],
                        "data" =>
                        []
                    ]));
            }


            $path = $_FILES['exam_file']['tmp_name'];


            $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load($path);
            $worksheet = $spreadsheet->getActiveSheet();
            // Store data from the activeSheet to the varibale in the form of Array
            $allDataInSheet =  $worksheet->toArray(null, true, true, true);

            $comment_excel = "";
            $comment_excel .= "Number Title";
            $comment_excel .= "\tStatus";
            $comment_excel .= "\tReason \n";
            for ($i = 2; $i <= count($allDataInSheet); $i++) {
                $do_insert = true;

                foreach (array('A', 'B', 'C', 'F') as $let) {
                    if (empty($allDataInSheet[$i][$let])) {
                        $do_insert = false;
                    };
                }

                if ($do_insert) {

                    //check duplicate Numbers
                    $this->db->where("number like '" . str_replace("'", "''", $worksheet->getCellByColumnAndRow(1, $i)->getValue()) . "'", NULL, FALSE);


                    $this->db->where(
                        [
                            // 'name' => $this->name,
                        ]
                    );

                    $countDuplicateItem = $this->db->get("items")->num_rows();

                    if ($countDuplicateItem == 0) {


                        $number = $worksheet->getCellByColumnAndRow(1, $i)->getValue();

                        $hasError  = false;
                        if (!is_numeric($number)) {
                            $hasError = true;
                        }

                        if (strlen($number) != 12) {
                            $hasError = true;
                        }


                        $seal_name = $worksheet->getCellByColumnAndRow(2, $i)->getValue();
                        $doi = $worksheet->getCellByColumnAndRow(3, $i)->getValue();
                        $type = $worksheet->getCellByColumnAndRow(4, $i)->getValue();
                        $use = $worksheet->getCellByColumnAndRow(5, $i)->getValue();
                        $client = $worksheet->getCellByColumnAndRow(6, $i)->getValue();
                        if (!$hasError) {
                            $data[] = array(
                                'number' => $number,
                                'seal_name' => $seal_name,
                                'doi' => $doi,
                                'type' => $type,
                                'use' => $use,
                                'client' => $client,
                                'created_by' => $this->user_id,
                                'created_by_ip_address' => @$this->input->ip_address(),
                            );

                            $comment_excel .= $worksheet->getCellByColumnAndRow(1, $i)->getValue();
                            $comment_excel .= "\tAdded";
                            $comment_excel .= "\t----\n";
                        } else {
                            $comment_excel .= $worksheet->getCellByColumnAndRow(1, $i)->getValue();
                            $comment_excel .= "\tNot Added";
                            $comment_excel .= "\tInvalid number Given\n";
                        }
                    } else {
                        $comment_excel .= $worksheet->getCellByColumnAndRow(1, $i)->getValue();
                        $comment_excel .= "\tNot Added";
                        $comment_excel .= "\tAll Ready present\n";
                    }
                }
            }

            if ($data)
                $this->insert($data);


            $arr["title"] = "check status of all records";
            return $this->output
                ->set_status_header(200)
                ->set_content_type('application/json')
                ->set_output(json_encode([
                    "message" => $arr['title'],
                    "data" => $comment_excel
                ]));
        }


        $arr["title"] = "File not uploaded.";
        return $this->output
            ->set_status_header(422)
            ->set_content_type('application/json')
            ->set_output(json_encode([
                "message" => $arr['title'],
                "data" => $data
            ]));
    }

    public function insert($data)
    {
        $this->db->trans_begin();
        $this->db->trans_strict(true);
        $this->db->insert_batch('items', $data);
        $this->db->trans_complete();

        if ($this->db->trans_status() === false) {
            //if something went wrong, rollback everything
            $this->db->trans_rollback();

            return false;
        } else {
            //if everything went right, commit the data to the database
            $this->db->trans_commit();

            return true;
        }
    }
}
