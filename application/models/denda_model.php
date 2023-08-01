<?php
class Denda_model extends CI_Model
{
    function data()
    {
        $this->db->order_by('id_denda', 'DESC');
        return $this->db->get('denda');
    }

    public function ambilId($table, $where)
    {
        return $this->db->get_where($table, $where);
    }

    public function hapus_data($where, $table)
    {
        $this->db->where($where);
        $this->db->delete($table);
        if ($this->db->affected_rows() == 1) {
            return TRUE;
        }
        return false;
    }

    public function detail_data($where, $table)
    {
        return $this->db->get_where($table, $where);
    }

    public function tambah_data($data, $table)
    {
        $this->db->insert($table, $data);
    }

    public function ubah_data($where, $data, $table)
    {
        $this->db->where($where);
        $this->db->update($table, $data);
    }

    public function buat_kode()
    {
        $this->db->select('RIGHT(denda.id_denda, 2) as kode', FALSE);
        $this->db->order_by('id_denda', 'DESC');
        $this->db->limit(1);
        $query = $this->db->get('denda'); // cek dulu apakah sudah ada kode di tabel.
        if ($query->num_rows() <> 0) {
            // jika kode ternyata sudah ada.
            $data = $query->row();
            $kode = intval($data->kode) + 1;
        } else {
            // jika kode belum ada
            $kode = 1;
        }
        $kodemax = str_pad($kode, 2, "0", STR_PAD_LEFT); // angka 3 menunjukkan jumlah digit angka 0
        $kodejadi = "DND-" . $kodemax;
        return $kodejadi;
    }

    public function getDendaperhari()
    {
        $this->db->select('denda');
        $this->db->limit(1); // Ambil hanya satu baris data
        $this->db->order_by('id_denda', 'DESC'); // Ambil data dengan id_denda terbesar
        $query = $this->db->get('denda');

        if ($query->num_rows() > 0) {
            $row = $query->row();
            return $row->denda;
        } else {
            return 0; // Jika nilai denda tidak ditemukan, kembalikan nilai 0 atau nilai default yang Anda tentukan.
        }
    }
}
