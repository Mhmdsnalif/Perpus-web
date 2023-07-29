<!DOCTYPE html>
<html>
<head>
    <title>Landing Page</title>
    <!-- Link ke Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
    .card-height .card {
        height: 100%;
    }
</style>

</head>
<body>
    <header class="bg-dark text-white py-3">
        <div class="container d-flex justify-content-between">
            <div class="logo">
                <h1>Perpustakaan</h1>
            </div>
            <div class="login">
                <a href="<?php echo base_url('login'); ?>" class="btn btn-primary">Login</a>
            </div>
        </div>
    </header>

    <div class="container my-4">
        <div class="jumbotron text-center">
            <h1 class="display-4">Selamat Datang di Perpustakaan</h1>
            <!-- Konten lainnya untuk halaman landing -->
        </div>

        <!-- Top 3 Buku Paling Sering Dipinjam -->
        <div class="landing-content">
            <h2 class="text-center mb-4">Top 3 Buku Paling Sering Dipinjam</h2>
            <div class="card-deck">
                <?php $top3buku = $this->peminjaman_model->top3buku()->result(); ?>
                <?php foreach ($top3buku as $top) { ?>
                    <div class="card shadow">
                        <img src="assets/upload/buku/<?= $top->foto ?>" class="card-img-top" alt="">
                        <div class="card-body">
                            <h5 class="card-title"><?= $top->judul ?></h5>
                            <p class="card-text"><?= $top->pengarang ?></p>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>

        <!-- Daftar Buku -->
<div class="landing-content mt-4">
    <h2 class="text-center mb-4">Daftar Buku</h2>
</div>

<div class="row card-height">
    <?php foreach ($buku as $b) { ?>
        <div class="col-lg-3 col-md-6 mb-4">
            <div class="card shadow h-100">
                <img src="assets/upload/buku/<?= $b->foto ?>" class="card-img-top" alt="">
                <div class="card-body">
                    <h5 class="card-title"><?= $b->judul ?></h5>
                    <p class="card-text"><?= $b->pengarang ?></p>
                </div>
            </div>
        </div>
    <?php } ?>
</div>


    <!-- Link ke Bootstrap JS dan jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
