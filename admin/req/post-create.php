<?php 
session_start();

if (isset($_SESSION['admin_id']) && isset($_SESSION['username'])) {

    if(isset($_POST['title']) && 
        isset($_FILES['cover']) && 
        isset($_POST['text'])){
        include "../../db_conn.php";
        $title = $_POST['title'];
        $text = $_POST['text'];

        if (empty($title)) {
            $em = "Title is required.";
            header("Location: ../post-add.php?error=$em");
            exit;
        }else if(empty($title)) {
            $em = "Title is required.";
            header("Location: ../post-add.php?error=$em");
            exit;
        }

        $image_name = $_FILES['cover']['name'];
        if ($image_name != "") {
            $image_size = $_FILES['cover']['size'];
            $image_temp = $_FILES['cover']['tmp_name'];
            $error = $_FILES['cover']['error'];
            if ($error === 0) {
                if ($image_size > 130000) {
                    $em = "File is too large!";
                    header("Location: ../post-add.php?error=$em");
                    exit;
                }else {
                    $image_ex = pathinfo($image_name, PATHINFO_EXTENSION);
                    $image_ex = strtolower($image_ex);

                    $allowed_exs = array('jpg', 'jpeg', 'png');

                    if (in_array($image_ex, $allowed_exs)) {
                        $new_image_name = uniqid("COVER-", true).'.'.$image_ex;
                        $image_path = '../../upload/blog/'.$new_image_name;
                        move_uploaded_file($image_temp, $image_path);

                        $sql = "INSERT INTO post(post_title, post_text, cover_url) VALUES (?,?,?)";
                        $stmt = $conn->prepare($sql);
                        $res = $stmt->execute([$title, $text, $new_image_name]);
                    }else {
                        $em = "Filetype not supported!";
                        header("Location: ../post-add.php?error=$em");
                        exit;
                    }
                }
            }

        }else {
            $sql = "INSERT INTO post(post_title, post_text) VALUES (?,?)";
            $stmt = $conn->prepare($sql);
            $res = $stmt->execute([$title, $text]);

        }

        if ($res) {
            $sm = "Successfully Created Post!";
            header("Location: ../post-add.php?success=$sm");
            exit;
        }else {
            $em = "Unknown error occurred.";
            header("Location: ../post-add.php?error=$em");
            exit;
        }

    }else {
        header("Location: ../post-add.php");
	    exit;
    }

}else {
	header("Location: ../admin-login.php");
	exit;
} ?>