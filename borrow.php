<?php
require_once 'Includes/db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['action'])) {
        $action = $_POST['action'];
        
        if ($action === 'add') {
            $book_id = intval($_POST['book_id']);
            $member_id = intval($_POST['member_id']);
            $borrow_date = mysqli_real_escape_string($dbconnect, $_POST['borrow_date']);
            $due_date = mysqli_real_escape_string($dbconnect, $_POST['due_date']);
            
            // Start transaction
            mysqli_begin_transaction($dbconnect);
            
            try {
                // Insert borrow record
                $sql = "INSERT INTO borrow_records (book_id, member_id, borrow_date, due_date) 
                        VALUES ($book_id, $member_id, '$borrow_date', '$due_date')";
                executeQuery($sql);
                
                // Update book status
                $update_sql = "UPDATE books SET status = 'Borrowed' WHERE book_id = $book_id";
                executeQuery($update_sql);
                
                mysqli_commit($dbconnect);
                header('Location: borrow.php?msg=added');
            } catch (Exception $e) {
                mysqli_rollback($dbconnect);
                header('Location: borrow.php?error=failed');
            }
        }
        elseif ($action === 'return') {
            $borrow_id = intval($_POST['borrow_id']);
            $book_id = intval($_POST['book_id']);
            $return_date = date('Y-m-d');
            
            // Start transaction
            mysqli_begin_transaction($dbconnect);
            
            try {
                // Update borrow record
                $sql = "UPDATE borrow_records SET return_date = '$return_date' WHERE borrow_id = $borrow_id";
                executeQuery($sql);
                
                // Update book status
                $update_sql = "UPDATE books SET status = 'Available' WHERE book_id = $book_id";
                executeQuery($update_sql);
                
                mysqli_commit($dbconnect);
                header('Location: borrow.php?msg=returned');
            } catch (Exception $e) {
                mysqli_rollback($dbconnect);
                header('Location: borrow.php?error=failed');
            }
        }
        elseif ($action === 'delete') {
            $borrow_id = intval($_POST['borrow_id']);
            
            $sql = "DELETE FROM borrow_records WHERE borrow_id = $borrow_id";
            executeQuery($sql);
            header('Location: borrow.php?msg=deleted');
        }
    }
}
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.rtl.min.css">
    <style>
      .bg-brown { background-color: #6f4e37; }
      .navbar-dark .navbar-brand,
      .navbar-dark .nav-link { color: #fff; }
      .overdue { background-color: #ffcccc !important; }
    </style>
    <title>Borrows</title>
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
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1>Borrow Records Management</h1>
            <div>
                <a href="borrow.php?action=add" class="btn btn-warning">New Borrow Record</a>
            </div>
        </div>

        <?php if (isset($_GET['msg'])): ?>
            <div class="alert alert-success alert-dismissible fade show">
                Record <?php echo $_GET['msg']; ?> successfully!
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        <?php endif; ?>
        
        <?php if (isset($_GET['error'])): ?>
            <div class="alert alert-danger alert-dismissible fade show">
                Operation failed! Please try again.
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        <?php endif; ?>

        <!-- Stats Bar -->
        <div class="row mb-4">
            <div class="col-md-3">
                <div class="card bg-primary text-white">
                    <div class="card-body text-center">
                        <h5>Total Borrow Records</h5>
                        <h3>
                            <?php
                            $total_result = executeQuery("SELECT COUNT(*) as total FROM borrow_records");
                            $total_row = mysqli_fetch_assoc($total_result);
                            echo $total_row['total'];
                            ?>
                        </h3>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card bg-warning text-dark">
                    <div class="card-body text-center">
                        <h5>Currently Borrowed</h5>
                        <h3>
                            <?php
                            $active_result = executeQuery("SELECT COUNT(*) as active FROM borrow_records WHERE return_date IS NULL");
                            $active_row = mysqli_fetch_assoc($active_result);
                            echo $active_row['active'];
                            ?>
                        </h3>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card bg-success text-white">
                    <div class="card-body text-center">
                        <h5>Returned Books</h5>
                        <h3>
                            <?php
                            $returned_result = executeQuery("SELECT COUNT(*) as returned FROM borrow_records WHERE return_date IS NOT NULL");
                            $returned_row = mysqli_fetch_assoc($returned_result);
                            echo $returned_row['returned'];
                            ?>
                        </h3>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card bg-danger text-white">
                    <div class="card-body text-center">
                        <h5>Overdue Books</h5>
                        <h3>
                            <?php
                            $overdue_result = executeQuery("SELECT COUNT(*) as overdue FROM borrow_records WHERE return_date IS NULL AND due_date < CURDATE()");
                            $overdue_row = mysqli_fetch_assoc($overdue_result);
                            echo $overdue_row['overdue'];
                            ?>
                        </h3>
                    </div>
                </div>
            </div>
        </div>

        <!-- Add Form -->
        <?php if (isset($_GET['action']) && $_GET['action'] === 'add'): ?>
        <div class="card mb-4">
            <div class="card-header">
                <h5>Create New Borrow Record</h5>
            </div>
            <div class="card-body">
                <form method="POST">
                    <input type="hidden" name="action" value="add">
                    
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">Member *</label>
                            <select class="form-select" name="member_id" required>
                                <option value="">Select Member</option>
                                <?php
                                // Check what column names exist in members table
                                $member_query = executeQuery("SELECT * FROM members LIMIT 1");
                                $member_fields = mysqli_fetch_fields($member_query);
                                $name_field = 'member_id'; // default
                                
                                foreach ($member_fields as $field) {
                                    if (strpos($field->name, 'name') !== false || strpos($field->name, 'Name') !== false) {
                                        $name_field = $field->name;
                                        break;
                                    }
                                }
                                
                                $members = executeQuery("SELECT member_id, $name_field FROM members ORDER BY $name_field");
                                while ($member = mysqli_fetch_assoc($members)) {
                                    echo "<option value='{$member['member_id']}'>" . htmlspecialchars($member[$name_field]) . "</option>";
                                }
                                ?>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Book *</label>
                            <select class="form-select" name="book_id" required>
                                <option value="">Select Book</option>
                                <?php
                                $books = executeQuery("SELECT book_id, title, author FROM books WHERE status = 'Available' ORDER BY title");
                                while ($book = mysqli_fetch_assoc($books)) {
                                    echo "<option value='{$book['book_id']}'>" . htmlspecialchars($book['title']) . " by " . htmlspecialchars($book['author']) . "</option>";
                                }
                                ?>
                            </select>
                        </div>
                    </div>
                    
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">Borrow Date *</label>
                            <input type="date" class="form-control" name="borrow_date" value="<?php echo date('Y-m-d'); ?>" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Due Date *</label>
                            <input type="date" class="form-control" name="due_date" value="<?php echo date('Y-m-d', strtotime('+14 days')); ?>" required>
                        </div>
                    </div>
                    
                    <div class="d-flex gap-2">
                        <button type="submit" class="btn btn-warning">Create Borrow Record</button>
                        <a href="borrow.php" class="btn btn-secondary">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
        <?php endif; ?>

        <!-- Borrow Records Table -->
        <div class="card">
            <div class="card-header">
                <div class="d-flex justify-content-between align-items-center">
                    <h5>All Borrow Records</h5>
                    <div>
                        <a href="borrow.php?filter=active" class="btn btn-sm btn-warning">Active</a>
                        <a href="borrow.php?filter=returned" class="btn btn-sm btn-success">Returned</a>
                        <a href="borrow.php?filter=overdue" class="btn btn-sm btn-danger">Overdue</a>
                        <a href="borrow.php" class="btn btn-sm btn-secondary">All</a>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <?php
                // Build filter
                $filter = isset($_GET['filter']) ? $_GET['filter'] : 'all';
                $where_clause = '';
                
                switch ($filter) {
                    case 'active':
                        $where_clause = "WHERE br.return_date IS NULL";
                        break;
                    case 'returned':
                        $where_clause = "WHERE br.return_date IS NOT NULL";
                        break;
                    case 'overdue':
                        $where_clause = "WHERE br.return_date IS NULL AND br.due_date < CURDATE()";
                        break;
                    default:
                        $where_clause = "";
                }
                
                // Get members table structure to build proper query
                $member_columns = executeQuery("SHOW COLUMNS FROM members");
                $has_first_name = false;
                $has_last_name = false;
                $has_name = false;
                
                while ($col = mysqli_fetch_assoc($member_columns)) {
                    if ($col['Field'] == 'first_name') $has_first_name = true;
                    if ($col['Field'] == 'last_name') $has_last_name = true;
                    if ($col['Field'] == 'name') $has_name = true;
                }
                
                // Build the member name selection
                if ($has_first_name && $has_last_name) {
                    $member_select = "CONCAT(m.first_name, ' ', m.last_name) as member_name";
                } elseif ($has_name) {
                    $member_select = "m.name as member_name";
                } else {
                    $member_select = "m.member_id as member_name";
                }
                
                // Query to get all borrow records
                $query = "
                    SELECT br.*, 
                    $member_select,
                    b.title as book_title, b.author, b.book_id,
                    CASE 
                        WHEN br.return_date IS NOT NULL THEN 'Returned'
                        WHEN br.due_date < CURDATE() THEN 'Overdue'
                        ELSE 'Borrowed'
                    END as status
                    FROM borrow_records br
                    JOIN members m ON br.member_id = m.member_id
                    JOIN books b ON br.book_id = b.book_id
                    $where_clause
                    ORDER BY br.borrow_date DESC
                ";
                
                $result = executeQuery($query);
                $num_rows = mysqli_num_rows($result);
                ?>
                
                <div class="alert alert-secondary mb-3">
                    Showing <?php echo $num_rows; ?> record(s) 
                    (Filter: <?php echo ucfirst($filter); ?>)
                </div>
                
                <?php if ($num_rows > 0): ?>
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Member</th>
                                <th>Book</th>
                                <th>Borrow Date</th>
                                <th>Due Date</th>
                                <th>Return Date</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php while ($row = mysqli_fetch_assoc($result)):
                                $isReturned = $row['status'] === 'Returned';
                                $isOverdue = $row['status'] === 'Overdue';
                            ?>
                            <tr class="<?php echo $isOverdue ? 'overdue' : ''; ?>">
                                <td><?php echo $row['borrow_id']; ?></td>
                                <td><?php echo htmlspecialchars($row['member_name']); ?></td>
                                <td><?php echo htmlspecialchars($row['book_title']); ?></td>
                                <td><?php echo date('M d, Y', strtotime($row['borrow_date'])); ?></td>
                                <td><?php echo date('M d, Y', strtotime($row['due_date'])); ?></td>
                                <td>
                                    <?php if ($row['return_date']): ?>
                                        <span class="text-success"><?php echo date('M d, Y', strtotime($row['return_date'])); ?></span>
                                    <?php else: ?>
                                        <span class="text-muted">Not returned</span>
                                    <?php endif; ?>
                                </td>
                                <td>
                                    <span class="badge 
                                        <?php 
                                        if ($isReturned) echo 'bg-success';
                                        elseif ($isOverdue) echo 'bg-danger';
                                        else echo 'bg-warning';
                                        ?>
                                    ">
                                        <?php echo $row['status']; ?>
                                    </span>
                                </td>
                                <td>
                                    <div class="d-flex gap-2">
                                        <?php if (!$isReturned): ?>
                                            <form method="POST" class="d-inline">
                                                <input type="hidden" name="action" value="return">
                                                <input type="hidden" name="borrow_id" value="<?php echo $row['borrow_id']; ?>">
                                                <input type="hidden" name="book_id" value="<?php echo $row['book_id']; ?>">
                                                <button type="submit" class="btn btn-sm btn-success">Mark Returned</button>
                                            </form>
                                        <?php endif; ?>
                                        <form method="POST" class="d-inline" onsubmit="return confirm('Delete this borrow record?');">
                                            <input type="hidden" name="action" value="delete">
                                            <input type="hidden" name="borrow_id" value="<?php echo $row['borrow_id']; ?>">
                                            <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            <?php endwhile; ?>
                        </tbody>
                    </table>
                </div>
                <?php else: ?>
                <div class="alert alert-warning text-center">
                    No borrow records found.
                    <?php if ($filter !== 'all'): ?>
                        <a href="borrow.php" class="alert-link">Show all records</a>
                    <?php endif; ?>
                </div>
                <?php endif; ?>
            </div>
        </div>
    </main>

    <footer class="bg-brown text-white text-center p-3 mt-auto">
         © 2025 LMS Aguilar - Library Management System @BSIS 3B
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>