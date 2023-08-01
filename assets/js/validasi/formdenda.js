function validateForm() {
    var denda = document.forms["myForm"]["denda"].value;

    if (denda == "") {
        validasi('Denda wajib di isi!', 'warning');
        return false;
    }

}

function validateFormUpdate() {
    var denda = document.forms["myFormUpdate"]["denda"].value;

    if (denda == "") {
        validasi('Denda tidak boleh kosong!', 'warning');
        return false;
    }

}

function validasi(judul, status) {
    Swal.fire({
        title: judul,
        icon: status,
        confirmButtonColor: '#4e73df',
    });
}
