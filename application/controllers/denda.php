<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Denda extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper('download');
        $this->load->library('pagination');
        $this->load->helper('cookie');
        $this->load->model('denda_model');
    }

    public function index()
    {
        $data['title'] = 'Denda';
        $data['denda'] = $this->denda_model->data()->result();
        $data['kode'] = $this->denda_model->buat_kode();

        $this->load->view('templates/header', $data);
        $this->load->view('denda/index');
        $this->load->view('templates/footer');
    }

    public function proses_tambah()
    {
        $kode = $this->input->post('id_denda');
        $denda = $this->input->post('denda');

        $data = array(
            'id_denda' => $kode,
            'denda' => $denda
        );

        $this->denda_model->tambah_data($data, 'denda');
        $this->session->set_flashdata('Pesan', '
        <script>
        $(document).ready(function() {
            swal.fire({
                title: "Berhasil ditambahkan!",
                icon: "success",
                confirmButtonColor: "#4e73df",
            });
        });
        </script>
        ');
        redirect('denda');
    }

    public function proses_ubah()
    {
        $kode = $this->input->post('id_denda');
        $denda = $this->input->post('denda');

        $data = array(
            'denda' => $denda
        );

        $where = array(
            'id_denda' => $kode
        );

        $this->denda_model->ubah_data($where, $data, 'denda');
        $this->session->set_flashdata('Pesan', '
        <script>
        $(document).ready(function() {
            swal.fire({
                title: "Berhasil diubah!",
                icon: "success",
                confirmButtonColor: "#4e73df",
            });
        });
        </script>
        ');
        redirect('denda');
    }

    public function proses_hapus($id)
    {
        $where = array('id_denda' => $id);
        $this->denda_model->hapus_data($where, 'denda');
        $this->session->set_flashdata('Pesan', '
        <script>
        $(document).ready(function() {
            swal.fire({
                title: "Berhasil dihapus!",
                icon: "success",
                confirmButtonColor: "#4e73df",
            });
        });
        </script>
        ');
        redirect('denda');
    }

    public function getData()
    {
        $id = $this->input->post('id');
        $where = array('id_denda' => $id);
        $data = $this->denda_model->detail_data($where, 'denda')->result();
        echo json_encode($data);
    }

    // Controller untuk mengambil nilai dendaperhari dari database
    public function getDendaperhari()
    {
        $dendaperhari = $this->denda_model->getDendaperhari();
        echo json_encode(array('denda' => $dendaperhari));
    }

}
