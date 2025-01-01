<?php
session_start();
$logged = false;
if (isset($_SESSION['user_id']) && isset($_SESSION['username'])) {
    $logged = true;
    $user_id = $_SESSION['user_id'];
}


?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Beroepsproject 2</title>
    <link rel="icon" type="image/x-icon" href="img/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
    <?php
        include 'inc/NavBar.php';
        include_once("admin/data/Post.php");
        include_once("db_conn.php");
        $posts = getAll($conn);
        $categories = get5Categories($conn);
    ?>

<div class="container mt-5">
    <!-- INDEX PAGINA TEGELS -->
    <section class="row index-blog-posts">
        <div class="cards-wrapper">
            <?php foreach ($posts as $post) { ?>
            <div class="posts-container">
                <article class="cards-post">
                    <a href="blog-view.php?post_id=<?= $post['post_id'] ?>" class="card main-blog-card h-100 index-page-card">
                        <img src="upload/blog/<?= $post['cover_url'] ?>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h3 class="card-title"><?= $post['post_title'] ?></h3>
                            <p class="card-date"><?= date('F j, Y', strtotime($post['crated_at'])) ?></p>
                        </div>
                    </a>
                </article>
            </div>
            <?php } ?>
        </div>
    </section>

    <!-- INDEX PAGINA CONTENT -->
    <section class="penci-section">
        <div class="container">
            <h3>
                <span>
                    <span>TEST</span>
                </span>
            </h3>
        </div>
    </section>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>