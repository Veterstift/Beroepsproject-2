<?php

    if (isset($key) && $key == "��a}�%k)�fӽ��g�?") {
?>
<input type="checkbox" id="checkbox">
	<header class="header">
		<h2 class="u-name">ADMIN <b>DASHBOARD</b>
			<label for="checkbox">
				<i id="navbtn" class="fa fa-bars" aria-hidden="true"></i>
			</label>
		</h2>
		<div class="d-flex align-items-center">
			<i class="fa fa-user" aria-hidden="true"></i>
			<span><?php echo $_SESSION['username']; ?></span>
		</div>
	</header>
	<div class="body">
		<nav class="side-bar">
			<div class="user-p">
				<!--<h4>Admin: <?php //echo $_SESSION['username']; ?></h4>-->
			</div>
			<ul id="navList">
				<li>
					<a href="users.php">
						<i class="fa fa-users" aria-hidden="true" style="margin-right: 5px;"></i>
						<span>Users</span>
					</a>
				</li>
				<li>
					<a href="post.php">
						<i class="fa fa-wpforms" aria-hidden="true"></i>
						<span>Posts</span>
					</a>
				</li>
				<li>
					<a href="category.php">
						<i class="fa fa-window-restore" aria-hidden="true"></i>
						<span>Categories</span>
					</a>
				</li>
				<li>
					<a href="comment.php">
						<i class="fa fa-info-circle" aria-hidden="true"></i>
						<span>Comments</span>
					</a>
				</li>
                <li>
					<a href="settings.php">
						<i class="fa fa-cog" aria-hidden="true"></i>
						<span>Settings</span>
					</a>
				</li>
				<li>
					<a href="../logout.php">
						<i class="fa fa-power-off" aria-hidden="true"></i>
						<span>Logout</span>
					</a>
				</li>
			</ul>
		</nav>
		<section class="section-1">

<?php
    }
?>