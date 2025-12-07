<?php session_start(); require_once 'Includes/db.php'; ?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.rtl.min.css" integrity="sha384-CfCrinSRH2IR6a4e6fy2q6ioOX7O6Mtm1L9vRvFZ1trBncWmMePhzvafv7oIcWiW" crossorigin="anonymous">
    <style>
      .bg-brown { background-color: #6f4e37; }
      .text-on-brown { color: #ffffff; }
      .navbar-dark .navbar-brand,
      .navbar-dark .nav-link { color: #fff; }
      .dashboard-card { transition: transform 0.3s; }
      .dashboard-card:hover { transform: translateY(-5px); }
      .stat-card { border-radius: 10px; }
      .stat-number { text-align: center; }
    </style>
    <title>LMS Aguilar - Lib Dashboard</title>
  </head>
  <body class="d-flex flex-column min-vh-100">
    <nav class="navbar navbar-expand-lg navbar-dark bg-brown">
      <div class="container-fluid">
        <a class="navbar-brand" href="index.php">Management System</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" href="index.php">Dashboard</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="books.php">Books</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="members.php">Members</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="borrow.php">Borrow Records</a>
            </li>
          </form>
        </div>
      </div>
    </nav>

    <main class="container my-4 flex-grow-1">
      <!-- Dash -->
      <div class="row mb-4">
        <div class="col-md-3 mb-3">
          <div class="card bg-primary text-white stat-card h-100">
            <div class="card-body text-center">
              <h5 class="card-title">Total Books</h5>
              <h2 class="display-4 stat-number">
                <?php
                $result = executeQuery("SELECT COUNT(*) as total FROM books");
                $row = mysqli_fetch_assoc($result);
                echo $row['total'];
                ?>
              </h2>
            </div>
          </div>
        </div>
        <div class="col-md-3 mb-3">
          <div class="card bg-success text-white stat-card h-100">
            <div class="card-body text-center">
              <h5 class="card-title">Total Members</h5>
              <h2 class="display-4 stat-number">
                <?php
                $result = executeQuery("SELECT COUNT(*) as total FROM members");
                $row = mysqli_fetch_assoc($result);
                echo $row['total'];
                ?>
              </h2>
            </div>
          </div>
        </div>
        <div class="col-md-3 mb-3">
          <div class="card bg-warning text-dark stat-card h-100">
            <div class="card-body text-center">
              <h5 class="card-title">Borrowed Books</h5>
              <h2 class="display-4 stat-number">
                <?php
                $result = executeQuery("SELECT COUNT(*) as total FROM books WHERE status = 'Borrowed'");
                $row = mysqli_fetch_assoc($result);
                echo $row['total'];
                ?>
              </h2>
            </div>
          </div>
        </div>
        <div class="col-md-3 mb-3">
          <div class="card bg-danger text-white stat-card h-100">
            <div class="card-body text-center">
              <h5 class="card-title">Overdue Books</h5>
              <h2 class="display-4 stat-number">
                <?php
                $result = executeQuery("SELECT COUNT(*) as total FROM borrow_records WHERE return_date IS NULL AND due_date < CURDATE()");
                $row = mysqli_fetch_assoc($result);
                echo $row['total'];
                ?>
              </h2>
            </div>
          </div>
        </div>
      </div>

      <!-- fast buttons -->
      <div class="row mb-4">
        <div class="col-12">
          <div class="p-4 bg-body rounded-3 shadow-sm">
            <h2 class="mb-3">Quick Actions</h2>
            <div class="row">
              <div class="col-md-3 mb-2">
                <a href="books.php?action=add" class="btn btn-primary w-100">Add New Book</a>
              </div>
              <div class="col-md-3 mb-2">
                <a href="members.php?action=add" class="btn btn-success w-100">Add New Member</a>
              </div>
              <div class="col-md-3 mb-2">
                <a href="borrow.php?action=add" class="btn btn-warning w-100">New Borrow Record</a>
              </div>
              <div class="col-md-3 mb-2">
                <a href="borrow.php" class="btn btn-info w-100">View All Borrows</a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- recent cards -->
      <div class="row">
        <div class="col-md-6 mb-4">
          <div class="card h-100">
            <div class="card-header bg-brown text-white">
              <h5 class="mb-0">Recent Books Added</h5>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th>Title</th>
                      <th>Author</th>
                      <th>Status</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    $result = executeQuery("SELECT title, author, status FROM books ORDER BY book_id DESC LIMIT 5");
                    while ($row = mysqli_fetch_assoc($result)) {
                      echo "<tr>";
                      echo "<td>" . htmlspecialchars($row['title']) . "</td>";
                      echo "<td>" . htmlspecialchars($row['author']) . "</td>";
                      echo "<td><span class='badge " . ($row['status'] == 'Available' ? 'bg-success' : 'bg-warning') . "'>" . $row['status'] . "</span></td>";
                      echo "</tr>";
                    }
                    ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        
        <div class="col-md-6 mb-4">
          <div class="card h-100">
            <div class="card-header bg-brown text-white">
              <h5 class="mb-0">Recent Borrows</h5>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th>Member</th>
                      <th>Book</th>
                      <th>Due Date</th>
                      <th>Status</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    
                    $member_columns = executeQuery("SHOW COLUMNS FROM members");
                    $has_first_name = false;
                    $has_last_name = false;
                    $has_name = false;
                    
                    while ($col = mysqli_fetch_assoc($member_columns)) {
                      if ($col['Field'] == 'first_name') $has_first_name = true;
                      if ($col['Field'] == 'last_name') $has_last_name = true;
                      if ($col['Field'] == 'name') $has_name = true;
                    }
                    
                    
                    if ($has_first_name && $has_last_name) {
                      $member_select = "CONCAT(m.first_name, ' ', m.last_name) as member_name";
                    } elseif ($has_name) {
                      $member_select = "m.name as member_name";
                    } else {
                      $member_select = "m.member_id as member_name";
                    }
                    
                    $result = executeQuery("
                      SELECT $member_select, b.title, br.due_date, br.return_date,
                      CASE 
                        WHEN br.return_date IS NOT NULL THEN 'Returned'
                        WHEN br.due_date < CURDATE() THEN 'Overdue'
                        ELSE 'Borrowed'
                      END as status
                      FROM borrow_records br
                      JOIN members m ON br.member_id = m.member_id
                      JOIN books b ON br.book_id = b.book_id
                      ORDER BY br.borrow_date DESC LIMIT 5
                    ");
                    
                    while ($row = mysqli_fetch_assoc($result)) {
                      $due_date = new DateTime($row['due_date']);
                      $today = new DateTime();
                      $is_overdue = $row['status'] === 'Overdue';
                      
                      echo "<tr>";
                      echo "<td>" . htmlspecialchars($row['member_name']) . "</td>";
                      echo "<td>" . htmlspecialchars($row['title']) . "</td>";
                      echo "<td>" . date('M d, Y', strtotime($row['due_date'])) . "</td>";
                      echo "<td><span class='badge " . 
                        ($row['status'] == 'Returned' ? 'bg-success' : 
                         ($row['status'] == 'Overdue' ? 'bg-danger' : 'bg-warning')) . 
                        "'>" . $row['status'] . "</span></td>";
                      echo "</tr>";
                    }
                    ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>

    <footer class="bg-brown text-white text-center text-lg-start mt-auto">
      <div class="text-center p-3">
        © 2025 LMS Aguilar - Library Management System @BSIS 3B
      </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
  </body>
</html>