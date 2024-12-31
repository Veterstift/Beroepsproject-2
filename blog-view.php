<?php
session_start();
$logged = false;
if (isset($_SESSION['user_id']) && isset($_SESSION['username'])) 
    $logged = true;

if (isset($_GET['post_id'])) {
        include_once("admin/data/post.php");
		include_once("admin/data/comment.php");
		include_once("db_conn.php");
        $id = $_GET['post_id'];
		$post = getById($conn, $id);
        $comments = getCommentsByPostID($conn, $id);


?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog - <?=$post['post_title']?></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <?php
        include 'inc/NavBar.php';
    ?>

    <div class="container mt-5">
        <section class="d-flex">

            <main class="main-blog">

                <div class="card main-blog-card mb-5">
                    <img src="upload/blog/<?=$post['cover_url']?>" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title"><?=$post['post_title']?></h5>
                        <p class="card-text"><?=$post['post_text']?></p>
                    <hr>
                        <div class="d-flex justify-content-between">
                            <div class="react-btns">
                                <i class="fa fa-thumbs-up like" aria-hidden="true">
                                </i> Likes (
                                <?php
                                    echo likeCountByPostID($conn, $post['post_id']);
                                ?> )

                                <i class="fa fa-comment" aria-hidden="true">
                                </i> comments (
                                <?php
                                    echo CountByPostID($conn, $post['post_id']);
                                ?> )
                            </div>
                        <small class="text-body-secondary"><?=$post['crated_at']?></small>
                    </div>

                    <form action="php/comment.php" 
                        method="post"
                        id="comments">

                        <h5 class="mt-4">Add Comment</h5><br>
                        <?php if(isset($_GET['error'])){ ?>
                            <div class="alert alert-danger" role="alert">
                            <?php echo htmlspecialchars($_GET['error']); ?>
                            </div>
                            <?php } ?>

                            <?php if(isset($_GET['success'])){ ?>
                            <div class="alert alert-success" role="alert">
                            <?php echo htmlspecialchars($_GET['success']); ?>
                            </div>
                        <?php } ?>
                        <div class="mb-3">
                            <input type="text" 
                                class="form-control"
                                name="comment">
                            <input type="text" 
                                class="form-control"
                                name="post_id"
                                value="<?=$id?>"
                                hidden>
                        </div>
                    
                        <button type="submit" class="btn btn-primary">Comment</button>
		            </form> <hr>
                    <div>
                        <div class="comments">
                            <?php if($comments != 0){ 
                                foreach ($comments as $comment){
                                    $u = getUserByID($conn, $comment['user_id']);
                            ?>
                            <div class="comment d-flex">
                                <div>
                                    <img src="img/user-default.png" width="30" height="30">
                                </div>
                                <div class="p-2">
                                    <span>@ <?=$u['username'] ?></span>
                                    <p><?=$comment['comment']?></p>
                                    <small class="text-body-secondary"><?=$comment['crated_at']?></small>
                                </div>
                            </div><hr>
                            <?php }} ?>
                        </div>
                    </div>
                    
                    </div>
                </div>

            </main>
            
            <aside class="aside-main">
                <div class="list-group category-aside">
                    <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
                        Category
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">Category 1</a>
                    <a href="#" class="list-group-item list-group-item-action">Category 2</a>
                    <a href="#" class="list-group-item list-group-item-action">Category 3</a>
                </div>
            </aside>
        </section>
    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>

<?php }else {
	header("Location: blog.php");
	exit;
} ?>