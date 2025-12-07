<?php
require_once 'Includes/db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['action'])) {
        $action = $_POST['action'];
        
        if ($action === 'add') {
            // map and sanitize inputs (names match schema: firstname, middlename, lastname, contact, email)
            $firstname = mysqli_real_escape_string($dbconnect, trim($_POST['firstname'] ?? ''));
            $lastname  = mysqli_real_escape_string($dbconnect, trim($_POST['lastname'] ?? ''));
            $middlename_raw = trim($_POST['middlename'] ?? '');
            $contact   = mysqli_real_escape_string($dbconnect, trim($_POST['contact'] ?? ''));
            $email     = mysqli_real_escape_string($dbconnect, trim($_POST['email'] ?? ''));

            // middlename is now optional - process only if provided
            $middlename = '';
            if (!empty($middlename_raw)) {
                $mi_clean = preg_replace('/[^A-Za-z]/', '', $middlename_raw);
                if ($mi_clean !== '') {
                    $middlename = strtoupper(mb_substr($mi_clean, 0, 1, 'UTF-8'));
                }
            }

            $sql = "INSERT INTO members (lastname, middlename, firstname, contact, email, membership_date) 
                    VALUES ('$lastname', '$middlename', '$firstname', '$contact', '$email', CURDATE())";
            executeQuery($sql);
            header('Location: members.php?msg=added');
            exit;
        }
        elseif ($action === 'edit') {
            $id = intval($_POST['id']);
            $firstname = mysqli_real_escape_string($dbconnect, trim($_POST['firstname'] ?? ''));
            $lastname  = mysqli_real_escape_string($dbconnect, trim($_POST['lastname'] ?? ''));
            $middlename_raw = trim($_POST['middlename'] ?? '');
            $contact   = mysqli_real_escape_string($dbconnect, trim($_POST['contact'] ?? ''));
            $email     = mysqli_real_escape_string($dbconnect, trim($_POST['email'] ?? ''));

            // middlename is now optional - process only if provided
            $middlename = '';
            if (!empty($middlename_raw)) {
                $mi_clean = preg_replace('/[^A-Za-z]/', '', $middlename_raw);
                if ($mi_clean !== '') {
                    $middlename = strtoupper(mb_substr($mi_clean, 0, 1, 'UTF-8'));
                }
            }

            $sql = "UPDATE members SET 
                    lastname = '$lastname',
                    middlename = '$middlename',
                    firstname = '$firstname',
                    contact = '$contact',
                    email = '$email'
                    WHERE member_id = $id";
            executeQuery($sql);
            header('Location: members.php?msg=updated');
            exit;
        }
        elseif ($action === 'delete') {
            $id = intval($_POST['id']);
            $sql = "DELETE FROM members WHERE member_id = $id";
            executeQuery($sql);
            header('Location: members.php?msg=deleted');
            exit;
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
    </style>
    <title>Members</title>
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
            <h1>Members Management</h1>
            <a href="members.php?action=add" class="btn btn-success">Add New Member</a>
        </div>

        <?php if (isset($_GET['msg'])): ?>
            <div class="alert alert-success alert-dismissible fade show">
                <?php
                // simple user-friendly messages
                $msgs = [
                  'added'=>'added',
                  'updated'=>'updated',
                  'deleted'=>'deleted'
                ];
                $m = $_GET['msg'];
                echo isset($msgs[$m]) ? "Member {$msgs[$m]} successfully!" : htmlspecialchars($m);
                ?>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        <?php endif; ?>

        <!-- Add/Edit Form -->
        <?php if (isset($_GET['action']) && ($_GET['action'] === 'add' || $_GET['action'] === 'edit')): 
            $member = ['firstname' => '', 'lastname' => '', 'middlename' => '', 'email' => '', 'contact' => ''];
            $action = $_GET['action'];
            $formAction = $action === 'edit' && isset($_GET['id']) ? 'edit' : 'add';
            
            if ($formAction === 'edit' && isset($_GET['id'])) {
                $id = intval($_GET['id']);
                $result = executeQuery("SELECT * FROM members WHERE member_id = $id");
                $member = mysqli_fetch_assoc($result);
            }
        ?>
        <div class="card mb-4">
            <div class="card-header">
                <h5><?php echo $action === 'add' ? 'Add New Member' : 'Edit Member'; ?></h5>
            </div>
            <div class="card-body">
                <form method="POST">
                    <input type="hidden" name="action" value="<?php echo $formAction; ?>">
                    <?php if ($formAction === 'edit'): ?>
                        <input type="hidden" name="id" value="<?php echo htmlspecialchars($member['member_id']); ?>">
                    <?php endif; ?>
                    
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <label class="form-label">First Name *</label>
                            <input type="text" class="form-control" name="firstname" value="<?php echo htmlspecialchars($member['firstname']); ?>" required>
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">Middle Initial</label>
                            <input type="text" class="form-control" name="middlename" maxlength="1" value="<?php echo htmlspecialchars($member['middlename']); ?>">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Last Name *</label>
                            <input type="text" class="form-control" name="lastname" value="<?php echo htmlspecialchars($member['lastname']); ?>" required>
                        </div>
                    </div>
                    
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" value="<?php echo htmlspecialchars($member['email']); ?>">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Contact</label>
                            <input type="text" class="form-control" name="contact" value="<?php echo htmlspecialchars($member['contact']); ?>">
                        </div>
                    </div>
                    
                    <div class="d-flex gap-2">
                        <button type="submit" class="btn btn-success">Save Member</button>
                        <a href="members.php" class="btn btn-secondary">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
        <?php endif; ?>

        <!-- Members Table -->
        <div class="card">
            <div class="card-header">
                <h5>All Members</h5>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>First Name</th>
                                <th>M.I.</th>
                                <th>Last Name</th>
                                <th>Email</th>
                                <th>Contact</th>
                                <th>Joined Date</th>
                                <th style="width: 120px;">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $result = executeQuery("SELECT * FROM members ORDER BY lastname, firstname");
                            while ($row = mysqli_fetch_assoc($result)):
                            ?>
                            <tr>
                                <td><?php echo $row['member_id']; ?></td>
                                <td><?php echo htmlspecialchars($row['firstname']); ?></td>
                                <td><?php echo htmlspecialchars($row['middlename']); ?></td>
                                <td><?php echo htmlspecialchars($row['lastname']); ?></td>
                                <td><?php echo htmlspecialchars($row['email']); ?></td>
                                <td><?php echo htmlspecialchars($row['contact']); ?></td>
                                <td><?php echo date('M d, Y', strtotime($row['membership_date'])); ?></td>
                                <td>
                                    <div style="display: flex; gap: 4px;">
                                        <a href="members.php?action=edit&id=<?php echo $row['member_id']; ?>" 
                                        class="btn btn-warning btn-sm fw-bold text-dark" 
                                        style="flex: 1; min-width: 50px; padding: 2px 5px;">
                                            Edit
                                        </a>
                                        <form method="POST" 
                                            onsubmit="return confirm('Delete this member?');" 
                                            style="flex: 1; margin: 0;">
                                            <input type="hidden" name="action" value="delete">
                                            <input type="hidden" name="id" value="<?php echo $row['member_id']; ?>">
                                            <button type="submit" 
                                                    class="btn btn-danger btn-sm fw-bold" 
                                                    style="width: 100%; min-width: 50px; padding: 2px 5px;">
                                                Delete
                                            </button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            <?php endwhile; ?>
                        </tbody>
                    </table>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>