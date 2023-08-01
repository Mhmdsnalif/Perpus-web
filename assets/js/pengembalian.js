$(document).ready(function() {
    $('#dtHorizontalExample').DataTable({
        "scrollX": true
    });
    $('.dataTables_length').addClass('bs-select');

    $('#loding').hide();
});

function konfirmasi(id) {
    var base_url = $('#baseurl').val();

    swal.fire({
        title: "Hapus Data ini?",
        icon: "warning",
        closeOnClickOutside: false,
        showCancelButton: true,
        confirmButtonText: 'Iya',
        confirmButtonColor: '#4e73df',
        cancelButtonText: 'Batal',
        cancelButtonColor: '#d33',
    }).then((result) => {
        if (result.value) {
            Swal.fire({
                title: "Memuat...",
                onBeforeOpen: () => {
                    Swal.showLoading()
                },
                timer: 1000,
                showConfirmButton: false,
            }).then(
                function() {
                    window.location.href = base_url + "pengembalian/proses_hapus/" + id;
                }
            );
        }
    });

}

function ambilDataPinjam() {
    var link = $('#baseurl').val();
    var base_url = link + 'pengembalian/getPinjam';
    var pinjam = $('[name="pinjam"]').val();
    var datenow = $('[name="tglnow"]').val().split('-');

    $('#loding').show();

    if (pinjam == '') {
        $('#tglpinjam').text("-");
        $('#tempo').text("-");
        $('#lambat').text("-");
        $('#denda').text("-");
        $("[name='terlambat']").val("-");
        $("[name='denda']").val("-");
        $("#tbody").empty();
        $('#loding').hide();
    } else {
        $.ajax({
            type: 'POST',
            data: 'id=' + pinjam,
            url: base_url,
            dataType: 'json',
            success: function(hasil) {
                $("#tbody").empty();
                $('#loding').hide();

                $('#tglpinjam').text(hasil[0].tgl_pinjam);
                $('#tempo').text(hasil[0].tempo);

                $.ajax({
                    type: 'GET',
                    url: link + 'denda/getDendaperhari', // Ubah "denda" sesuai dengan controller yang digunakan untuk mengambil dendaperhari dari database
                    dataType: 'json',
                    success: function(response) {
                        var dendaperhari = parseFloat(response.denda);
                        if (isNaN(dendaperhari)) {
                            dendaperhari = 0;
                        }

                        if (selisih(hasil[0].tempo.split('-'), datenow) > 0) {
                            $('#lambat').text(selisih(hasil[0].tempo.split('-'), datenow) + " hari");
                            $("[name='terlambat']").val(selisih(hasil[0].tempo.split('-'), datenow) + " hari");
                            $("[name='denda']").val(denda(selisih(hasil[0].tempo.split('-'), datenow), dendaperhari));
                            $('#denda').text(denda(selisih(hasil[0].tempo.split('-'), datenow), dendaperhari));
                        } else {
                            $('#lambat').text("-");
                            $("[name='terlambat']").val("-");
                            $('#denda').text("-");
                            $("[name='denda']").val("-");
                        }

                        ambilBuku(hasil[0].id_pinjam);
                    }
                });
            }
        });
    }
}

function ambilBuku(idpinjam) {
    var link = $('#baseurl').val();
    var base_url = link + 'pengembalian/getListBuku';
    var pinjam = idpinjam;

    $.ajax({
        type: 'POST',
        data: 'id=' + pinjam,
        url: base_url,
        dataType: 'json',
        success: function(hasil) {
            for (var i = 0; i < hasil.length; i++) {
                var newRow = $("<tr class='bounceIn'>");
                var cols = "";
                var counter = i + 1;

                cols += '<td>' + counter + '.</td>';
                cols += '<td>' + hasil[i].id_buku + '</td>';
                cols += '<td>' + hasil[i].judul + '</td>';
                cols += '<td>' + hasil[i].isbn + '</td>';
                cols += '<td>' + hasil[i].pengarang + '</td>';
                cols += '<td>' + hasil[i].qty + '</td>';

                newRow.append(cols);
                $("table").append(newRow);
            }
        }
    });
}

function selisih(first, second) {
    // Copy date parts of the timestamps, discarding the time parts.
    var one = new Date(first[0], first[1], first[2]);
    var two = new Date(second[0], second[1], second[2]);

    // Do the math.
    var millisecondsPerDay = 1000 * 60 * 60 * 24;
    var millisBetween = two.getTime() - one.getTime();
    var days = millisBetween / millisecondsPerDay;

    // Round down.
    return Math.floor(days);
}

function denda(terlambat, dendaperhari) {
    var hari = terlambat;
    var total = hari * dendaperhari;
    return "Rp." + total;
}
