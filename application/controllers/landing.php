<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Landing extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('buku_model');
        $this->load->model('peminjaman_model');
    }

    public function index()
    {
        $data['title'] = 'Landing Page';
        
        // Mengambil data buku dari database menggunakan model buku_model
		$data['buku'] = $this->buku_model->dataJoin()->result();
        
        // Mengambil data buku paling sering dipinjam dari database menggunakan model peminjaman_model
        $data['buku_paling_serang_dipinjam'] = $this->peminjaman_model->top3buku()->result();

        // Load view untuk landing page dengan data buku dan buku paling sering dipinjam
        $this->load->view('landing', $data);
      
    }

}
