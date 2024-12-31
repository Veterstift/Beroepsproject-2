<?php 
session_start();

if (isset($_SESSION['admin_id']) && isset($_SESSION['username'])) {
 ?>

<!DOCTYPE html>
<html>
<head>
	<title>Dashboard - Users</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="../css/side-bar.css">
	<link rel="stylesheet" href="../css/style.css">
</head>
<body>
	<?php 
        $key = "��a}�%k)�fӽ��g�?";
        include "inc/side-nav.php";
        include_once("data/admin.php");
		include_once("../db_conn.php");
		$admin = getByID($conn, $_SESSION['admin_id']);

    ?>

    <div class="main-table">
		<h3 class="mb-3">Admin Profile </h3>
		<?php if (isset($_GET['error'])) { ?>
		<div class="alert alert-warning">
			<?=htmlspecialchars($_GET['error'])?>
		</div>
		<?php } ?>

		<?php if (isset($_GET['success'])) { ?>
		<div class="alert alert-success">
			<?=htmlspecialchars($_GET['success'])?>
		</div>
		<?php } ?>
        <form class="shadow p-3" 
    	      action="req/admin-edit.php" 
    	      method="post">
        <h3>Change Profile Info</h3>
        <div class="mb-3">
		    <label class="form-label">First name</label>
		    <input type="text" 
		        class="form-control"
		        name="fname"
                value="<?=$admin['first_name']?>">
		  </div>
		  <div class="mb-3">
		    <label class="form-label">Last name</label>
		    <input type="text" 
		        class="form-control"
		        name="lname"
                value="<?=$admin['first_name']?>">
		  </div>
          <div class="mb-3">
		    <label class="form-label">Username</label>
		    <input type="text" 
		        class="form-control"
		        name="username"
                value="<?=$admin['username']?>">
		  </div>

		  <button type="submit" class="btn btn-primary">Save</button>
		</form>

        <form class="shadow p-3 mt-5" 
    	      action="req/admin-edit-pass.php" 
    	      method="post">
        <h3 id="cpassword">Change Password</h3>
        <?php if (isset($_GET['perror'])) { ?>
		<div class="alert alert-warning">
			<?=htmlspecialchars($_GET['perror'])?>
		</div>
		<?php } ?>

		<?php if (isset($_GET['psuccess'])) { ?>
		<div class="alert alert-success">
			<?=htmlspecialchars($_GET['psuccess'])?>
		</div>
		<?php } ?>

        <?php if (isset($_GET['perror'])) { ?>
            <div class="alert alert-warning">
                <?=htmlspecialchars($_GET['perror'])?>
            </div>
        <?php } ?>

        <?php if (isset($_GET['psuccess'])) { ?>
            <div class="alert alert-success">
                <?=htmlspecialchars($_GET['psuccess'])?>
            </div>
        <?php } ?>

        <div class="mb-3">
		    <label class="form-label">Current Password</label>
		    <input type="password" 
		        class="form-control"
		        name="cpass">
		  </div>

          <div class="mb-3">
		    <label class="form-label">New Password</label>
		    <input type="password" 
		        class="form-control"
		        name="new_pass">
		  </div>
          
          <div class="mb-3">
		    <label class="form-label">Confirm New Password</label>
		    <input type="password" 
		        class="form-control"
		        name="cnew_pass">
		  </div>

		  <button type="submit" class="btn btn-primary">Save</button>
		</form>


	</div>
	</section>
	</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>

<?php }else {
	header("Location: ../admin-login.php");
	exit;
} ?>