<?php
require_once 'Includes/db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['action'])) {
        $action = $_POST['action'];
        
        if ($action === 'add') {
            $title = mysqli_real_escape_string($dbconnect, $_POST['title']);
            $author = mysqli_real_escape_string($dbconnect, $_POST['author']);
            $publisher = mysqli_real_escape_string($dbconnect, $_POST['publisher']);
            $year = intval($_POST['year']);
            $category = mysqli_real_escape_string($dbconnect, $_POST['category']);
            $status = mysqli_real_escape_string($dbconnect, $_POST['status']);
            
            $sql = "INSERT INTO books (title, author, publisher, year, category, status) 
                    VALUES ('$title', '$author', '$publisher', $year, '$category', '$status')";
            executeQuery($sql);
            header('Location: books.php?msg=added');
        }
        elseif ($action === 'edit') {
            $book_id = intval($_POST['book_id']);
            $title = mysqli_real_escape_string($dbconnect, $_POST['title']);
            $author = mysqli_real_escape_string($dbconnect, $_POST['author']);
            $publisher = mysqli_real_escape_string($dbconnect, $_POST['publisher']);
            $year = intval($_POST['year']);
            $category = mysqli_real_escape_string($dbconnect, $_POST['category']);
            $status = mysqli_real_escape_string($dbconnect, $_POST['status']);
            
            $sql = "UPDATE books SET 
                    title = '$title',
                    author = '$author',
                    publisher = '$publisher',
                    year = $year,
                    category = '$category',
                    status = '$status'
                    WHERE book_id = $book_id";
            executeQuery($sql);
            header('Location: books.php?msg=updated');
        }
        elseif ($action === 'delete') {
            $book_id = intval($_POST['book_id']);
            
            
            $check_sql = "SELECT COUNT(*) as count FROM borrow_records WHERE book_id = $book_id AND return_date IS NULL";
            $check_result = executeQuery($check_sql);
            $check_row = mysqli_fetch_assoc($check_result);
            
            if ($check_row['count'] > 0) {
                header('Location: books.php?error=borrowed');
                exit;
            }
            
            $sql = "DELETE FROM books WHERE book_id = $book_id";
            executeQuery($sql);
            header('Location: books.php?msg=deleted');
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
    <title>Books</title>
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
            <h1>Books Management</h1>
            <a href="books.php?action=add" class="btn btn-primary">Add New Book</a>
        </div>

        <?php if (isset($_GET['msg'])): ?>
            <div class="alert alert-success alert-dismissible fade show">
                Book <?php echo $_GET['msg']; ?> successfully!
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        <?php endif; ?>
        
        <?php if (isset($_GET['error']) && $_GET['error'] == 'borrowed'): ?>
            <div class="alert alert-danger alert-dismissible fade show">
                Cannot delete book that is currently borrowed!
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        <?php endif; ?>

        <!-- for editing/adding -->
        <?php if (isset($_GET['action']) && ($_GET['action'] === 'add' || $_GET['action'] === 'edit')): 
            $book = ['title' => '', 'author' => '', 'publisher' => '', 'year' => date('Y'), 'category' => '', 'status' => 'Available'];
            $action = $_GET['action'];
            $formAction = $action === 'edit' && isset($_GET['id']) ? 'edit' : 'add';
            
            if ($formAction === 'edit' && isset($_GET['id'])) {
                $book_id = intval($_GET['id']);
                $result = executeQuery("SELECT * FROM books WHERE book_id = $book_id");
                $book = mysqli_fetch_assoc($result);
            }
        ?>
        <div class="card mb-4">
            <div class="card-header">
                <h5><?php echo $action === 'add' ? 'Add New Book' : 'Edit Book'; ?></h5>
            </div>
            <div class="card-body">
                <form method="POST">
                    <input type="hidden" name="action" value="<?php echo $formAction; ?>">
                    <?php if ($formAction === 'edit'): ?>
                        <input type="hidden" name="book_id" value="<?php echo $book['book_id']; ?>">
                    <?php endif; ?>
                    
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">Title *</label>
                            <input type="text" class="form-control" name="title" value="<?php echo htmlspecialchars($book['title']); ?>" required maxlength="150">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Author *</label>
                            <input type="text" class="form-control" name="author" value="<?php echo htmlspecialchars($book['author']); ?>" required maxlength="100">
                        </div>
                    </div>
                    
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">Publisher *</label>
                            <input type="text" class="form-control" name="publisher" value="<?php echo htmlspecialchars($book['publisher']); ?>" required maxlength="100">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Category/Genre *</label>
                            <input type="text" class="form-control" name="category" value="<?php echo htmlspecialchars($book['category']); ?>" required maxlength="50">
                        </div>
                    </div>
                    
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">Publication Year *</label>
                            <input type="number" class="form-control" name="year" value="<?php echo $book['year']; ?>" min="1000" max="<?php echo date('Y'); ?>" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Status *</label>
                            <select class="form-select" name="status" required>
                                <option value="Available" <?php echo $book['status'] == 'Available' ? 'selected' : ''; ?>>Available</option>
                                <option value="Borrowed" <?php echo $book['status'] == 'Borrowed' ? 'selected' : ''; ?>>Borrowed</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="d-flex gap-2">
                        <button type="submit" class="btn btn-primary">Save Book</button>
                        <a href="books.php" class="btn btn-secondary">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
        <?php endif; ?>

        <!-- Books Table -->
        <div class="card">
            <div class="card-header">
                <h5>All Books</h5>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Author</th>
                                <th>Publisher</th>
                                <th>Year</th>
                                <th>Category</th>
                                <th>Status</th>
                                <th style="width: 120px;">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $result = executeQuery("SELECT * FROM books ORDER BY book_id DESC");
                            while ($row = mysqli_fetch_assoc($result)):
                            ?>
                            <tr>
                                <td><?php echo $row['book_id']; ?></td>
                                <td><?php echo htmlspecialchars($row['title']); ?></td>
                                <td><?php echo htmlspecialchars($row['author']); ?></td>
                                <td><?php echo htmlspecialchars($row['publisher']); ?></td>
                                <td><?php echo $row['year']; ?></td>
                                <td><?php echo htmlspecialchars($row['category']); ?></td>
                                <td>
                                    <span class="badge <?php echo $row['status'] == 'Available' ? 'bg-success' : 'bg-warning'; ?>">
                                        <?php echo $row['status']; ?>
                                    </span>
                                </td>
                                <td>
                                    <div style="display: flex; gap: 4px;">
                                        <a href="books.php?action=edit&id=<?php echo $row['book_id']; ?>" 
                                        class="btn btn-warning btn-sm" 
                                        style="flex: 1; min-width: 50px; padding: 2px 5px;">
                                            Edit
                                        </a>
                                        <form method="POST" 
                                            onsubmit="return confirm('Delete this book?');" 
                                            style="flex: 1; margin: 0;">
                                            <input type="hidden" name="action" value="delete">
                                            <input type="hidden" name="book_id" value="<?php echo $row['book_id']; ?>">
                                            <button type="submit" 
                                                    class="btn btn-danger btn-sm" 
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
    </main>


    <footer class="bg-brown text-white text-center p-3 mt-auto">
         © 2025 LMS Aguilar - Library Management System @BSIS 3B
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>