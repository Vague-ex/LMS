
// staff.php, Unused code since im too lazy to finish it
<?php
session_start();
require_once 'Includes/db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['action'])) {
        $action = $_POST['action'];
        
        if ($action === 'add') {
            $name = mysqli_real_escape_string($dbconnect, $_POST['name']);
            $role = mysqli_real_escape_string($dbconnect, $_POST['role']);
            $username = mysqli_real_escape_string($dbconnect, $_POST['username']);
            $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
            
           
            $check_sql = "SELECT COUNT(*) as count FROM staff WHERE username = '$username'";
            $check_result = executeQuery($check_sql);
            $check_row = mysqli_fetch_assoc($check_result);
            
            if ($check_row['count'] > 0) {
                header('Location: staff.php?error=username_exists');
                exit;
            }
            
            $sql = "INSERT INTO staff (name, role, username, password) 
                    VALUES ('$name', '$role', '$username', '$password')";
            executeQuery($sql);
            header('Location: staff.php?msg=added');
        }
        elseif ($action === 'edit') {
            $staff_id = intval($_POST['staff_id']);
            $name = mysqli_real_escape_string($dbconnect, $_POST['name']);
            $role = mysqli_real_escape_string($dbconnect, $_POST['role']);
            $username = mysqli_real_escape_string($dbconnect, $_POST['username']);
            
            // Check if username exists for other users
            $check_sql = "SELECT COUNT(*) as count FROM staff WHERE username = '$username' AND staff_id != $staff_id";
            $check_result = executeQuery($check_sql);
            $check_row = mysqli_fetch_assoc($check_result);
            
            if ($check_row['count'] > 0) {
                header('Location: staff.php?error=username_exists&id=' . $staff_id);
                exit;
            }
            
            $sql = "UPDATE staff SET 
                    name = '$name',
                    role = '$role',
                    username = '$username'";
            
            // Update password only if provided
            if (!empty($_POST['password'])) {
                $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
                $sql .= ", password = '$password'";
            }
            
            $sql .= " WHERE staff_id = $staff_id";
            
            executeQuery($sql);
            header('Location: staff.php?msg=updated');
        }
        elseif ($action === 'delete') {
            $staff_id = intval($_POST['staff_id']);
            
            // Prevent deleting last admin
            $check_sql = "SELECT COUNT(*) as admin_count FROM staff WHERE role = 'Admin'";
            $check_result = executeQuery($check_sql);
            $check_row = mysqli_fetch_assoc($check_result);
            
            $user_sql = "SELECT role FROM staff WHERE staff_id = $staff_id";
            $user_result = executeQuery($user_sql);
            $user_row = mysqli_fetch_assoc($user_result);
            
            if ($user_row['role'] == 'Admin' && $check_row['admin_count'] <= 1) {
                header('Location: staff.php?error=last_admin');
                exit;
            }
            
            $sql = "DELETE FROM staff WHERE staff_id = $staff_id";
            executeQuery($sql);
            header('Location: staff.php?msg=deleted');
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
    <title>Staff Management - LMS Aguilar</title>
</head>
<body class="d-flex flex-column min-vh-100">
    <nav class="navbar navbar-expand-lg navbar-dark bg-brown">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.php">LMS Aguilar</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="index.php">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="books.php">Books</a></li>
                    <li class="nav-item"><a class="nav-link" href="members.php">Members</a></li>
                    <li class="nav-item"><a class="nav-link" href="borrow.php">Borrow</a></li>
                    <li class="nav-item"><a class="nav-link active" href="staff.php">Staff</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <main class="container my-4 flex-grow-1">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1>Staff Management</h1>
            <a href="staff.php?action=add" class="btn btn-info">Add New Staff</a>
        </div>

        <?php if (isset($_GET['msg'])): ?>
            <div class="alert alert-success alert-dismissible fade show">
                Staff member <?php echo $_GET['msg']; ?> successfully!
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        <?php endif; ?>
        
        <?php if (isset($_GET['error'])): ?>
            <div class="alert alert-danger alert-dismissible fade show">
                <?php 
                if ($_GET['error'] == 'username_exists') echo 'Username already exists!';
                elseif ($_GET['error'] == 'last_admin') echo 'Cannot delete the last admin!';
                ?>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        <?php endif; ?>

        <!-- Add/Edit Form -->
        <?php if (isset($_GET['action']) && ($_GET['action'] === 'add' || $_GET['action'] === 'edit')): 
            $staff = ['name' => '', 'role' => 'Librarian', 'username' => ''];
            $action = $_GET['action'];
            $formAction = $action === 'edit' && isset($_GET['id']) ? 'edit' : 'add';
            
            if ($formAction === 'edit' && isset($_GET['id'])) {
                $staff_id = intval($_GET['id']);
                $result = executeQuery("SELECT * FROM staff WHERE staff_id = $staff_id");
                $staff = mysqli_fetch_assoc($result);
            }
        ?>
        <div class="card mb-4">
            <div class="card-header">
                <h5><?php echo $action === 'add' ? 'Add New Staff' : 'Edit Staff'; ?></h5>
            </div>
            <div class="card-body">
                <form method="POST">
                    <input type="hidden" name="action" value="<?php echo $formAction; ?>">
                    <?php if ($formAction === 'edit'): ?>
                        <input type="hidden" name="staff_id" value="<?php echo $staff['staff_id']; ?>">
                    <?php endif; ?>
                    
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">Full Name *</label>
                            <input type="text" class="form-control" name="name" value="<?php echo htmlspecialchars($staff['name']); ?>" required maxlength="100">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Role *</label>
                            <select class="form-select" name="role" required>
                                <option value="Librarian" <?php echo $staff['role'] == 'Librarian' ? 'selected' : ''; ?>>Librarian</option>
                                <option value="Admin" <?php echo $staff['role'] == 'Admin' ? 'selected' : ''; ?>>Admin</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">Username *</label>
                            <input type="text" class="form-control" name="username" value="<?php echo htmlspecialchars($staff['username']); ?>" required maxlength="50">
                            <div class="form-text">Username must be unique</div>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label"><?php echo $formAction === 'add' ? 'Password *' : 'Password (leave blank to keep current)'; ?></label>
                            <input type="password" class="form-control" name="password" <?php echo $formAction === 'add' ? 'required' : ''; ?>>
                        </div>
                    </div>
                    
                    <div class="d-flex gap-2">
                        <button type="submit" class="btn btn-info">Save Staff</button>
                        <a href="staff.php" class="btn btn-secondary">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
        <?php endif; ?>

        <!-- Staff Table -->
        <div class="card">
            <div class="card-header">
                <h5>All Staff Members</h5>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Role</th>
                                <th>Username</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $result = executeQuery("SELECT * FROM staff ORDER BY role, name");
                            while ($row = mysqli_fetch_assoc($result)):
                            ?>
                            <tr>
                                <td><?php echo $row['staff_id']; ?></td>
                                <td><?php echo htmlspecialchars($row['name']); ?></td>
                                <td>
                                    <span class="badge <?php echo $row['role'] == 'Admin' ? 'bg-danger' : 'bg-primary'; ?>">
                                        <?php echo $row['role']; ?>
                                    </span>
                                </td>
                                <td><?php echo htmlspecialchars($row['username']); ?></td>
                                <td>
                                    <div class="d-flex gap-2">
                                        <a href="staff.php?action=edit&id=<?php echo $row['staff_id']; ?>" class="btn btn-sm btn-warning">Edit</a>
                                        <form method="POST" onsubmit="return confirm('Delete this staff member?');">
                                            <input type="hidden" name="action" value="delete">
                                            <input type="hidden" name="staff_id" value="<?php echo $row['staff_id']; ?>">
                                            <button type="submit" class="btn btn-sm btn-danger">Delete</button>
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
    </main>

    <footer class="bg-brown text-white text-center p-3 mt-auto">
        © 2025 EIS Aguilar - Staff Management
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>