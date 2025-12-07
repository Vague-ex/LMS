<?php
session_start();

// Sample data - In production, this would come from a database
$stats = [
    'books' => 3,
    'members' => 2,
    'newspapers' => 1,
    'magazines' => 0,
    'issued' => 2,
    'returned' => 1,
    'not_returned' => 1
];

$user = [
    'name' => 'ronald',
    'status' => 'Online'
];

$current_date = date('m/d/Y');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SAIDE Library - Control Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <!-- Top Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-orange">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="#">SAIDELibrary</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fas fa-user-shield"></i> Admin</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">dashboard</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav class="col-md-3 col-lg-2 d-md-block bg-dark sidebar">
                <div class="position-sticky pt-3">
                    <!-- User Profile -->
                    <div class="user-profile text-center mb-4">
                        <div class="user-avatar mb-2">
                            <i class="fas fa-user-circle fa-4x text-warning"></i>
                        </div>
                        <h6 class="text-white"><?php echo htmlspecialchars($user['name']); ?></h6>
                        <span class="badge bg-success"><?php echo htmlspecialchars($user['status']); ?></span>
                    </div>

                    <hr class="text-secondary">
                    <p class="text-secondary small px-3">HEADER</p>

                    <!-- Menu Items -->
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link active" href="#">
                                <i class="fas fa-tachometer-alt"></i> Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="fas fa-users"></i> Members
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="fas fa-book"></i> Books
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="fas fa-bookmark"></i> Magazines
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="fas fa-newspaper"></i> Newspapers
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="fas fa-plane-departure"></i> Issued
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="fas fa-undo"></i> Returned
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="fas fa-exclamation-triangle"></i> Not Returned
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-bs-toggle="collapse" data-bs-target="#actionsMenu">
                                <i class="fas fa-cog"></i> ACTIONS
                                <i class="fas fa-chevron-left float-end"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <!-- Main Content -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
                    <h1 class="h2">SAIDE Library <small class="text-muted">Control panel</small></h1>
                </div>

                <!-- Statistics Cards Row 1 -->
                <div class="row mb-4">
                    <!-- Books Card -->
                    <div class="col-md-3 mb-3">
                        <div class="card stat-card card-cyan">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <h1 class="display-4 fw-bold"><?php echo $stats['books']; ?></h1>
                                        <p class="mb-0">Books</p>
                                    </div>
                                    <div class="stat-icon">
                                        <i class="fas fa-book fa-3x"></i>
                                    </div>
                                </div>
                                <a href="#" class="btn btn-sm btn-light mt-3 w-100">
                                    More info <i class="fas fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- Members Card -->
                    <div class="col-md-3 mb-3">
                        <div class="card stat-card card-green">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <h1 class="display-4 fw-bold"><?php echo $stats['members']; ?></h1>
                                        <p class="mb-0">Members</p>
                                    </div>
                                    <div class="stat-icon">
                                        <i class="fas fa-users fa-3x"></i>
                                    </div>
                                </div>
                                <a href="#" class="btn btn-sm btn-light mt-3 w-100">
                                    More info <i class="fas fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- Newspapers Card -->
                    <div class="col-md-3 mb-3">
                        <div class="card stat-card card-orange">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <h1 class="display-4 fw-bold"><?php echo $stats['newspapers']; ?></h1>
                                        <p class="mb-0">NewsPapers</p>
                                    </div>
                                    <div class="stat-icon">
                                        <i class="fas fa-newspaper fa-3x"></i>
                                    </div>
                                </div>
                                <a href="#" class="btn btn-sm btn-light mt-3 w-100">
                                    More info <i class="fas fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- Magazines Card -->
                    <div class="col-md-3 mb-3">
                        <div class="card stat-card card-red">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <h1 class="display-4 fw-bold"><?php echo $stats['magazines']; ?></h1>
                                        <p class="mb-0">Magazines</p>
                                    </div>
                                    <div class="stat-icon">
                                        <i class="fas fa-bookmark fa-3x"></i>
                                    </div>
                                </div>
                                <a href="#" class="btn btn-sm btn-light mt-3 w-100">
                                    More info <i class="fas fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Statistics Cards Row 2 -->
                <div class="row">
                    <!-- Issued Card -->
                    <div class="col-md-3 mb-3">
                        <div class="card small-stat-card card-cyan">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div class="icon-box bg-white me-3">
                                        <i class="fas fa-plane-departure fa-2x text-cyan"></i>
                                    </div>
                                    <div>
                                        <h6 class="mb-0">ISSUED</h6>
                                        <h3 class="mb-0 fw-bold"><?php echo $stats['issued']; ?></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Returned Card -->
                    <div class="col-md-3 mb-3">
                        <div class="card small-stat-card card-red-light">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div class="icon-box bg-white me-3">
                                        <i class="fas fa-thumbs-up fa-2x text-danger"></i>
                                    </div>
                                    <div>
                                        <h6 class="mb-0">RETURNED</h6>
                                        <h3 class="mb-0 fw-bold"><?php echo $stats['returned']; ?></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Not Returned Card -->
                    <div class="col-md-3 mb-3">
                        <div class="card small-stat-card card-green">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div class="icon-box bg-white me-3">
                                        <i class="fas fa-thumbs-down fa-2x text-success"></i>
                                    </div>
                                    <div>
                                        <h6 class="mb-0">NOT RETURNED</h6>
                                        <h3 class="mb-0 fw-bold"><?php echo $stats['not_returned']; ?></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Date Today Card -->
                    <div class="col-md-3 mb-3">
                        <div class="card small-stat-card card-orange">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div class="icon-box bg-white me-3">
                                        <i class="fas fa-calendar-check fa-2x text-warning"></i>
                                    </div>
                                    <div>
                                        <h6 class="mb-0">DATE TODAY</h6>
                                        <h3 class="mb-0 fw-bold"><?php echo $current_date; ?></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Footer -->
                <footer class="mt-5 pt-3 border-top">
                    <p class="text-center text-muted small">
                        <strong> Library Management System</strong> 
                        <span class="float-end">Version 0.1</span>
                    </p>

                    </p>
                </footer>
            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>