<?php

// Get All Posts
function getAll($conn) {
    $sql = "SELECT * FROM post";
    $stmt = $conn->prepare($sql);
    $stmt->execute();

    if ($stmt->rowCount() >= 1) {
        $data = $stmt->fetchAll();
        return $data;
    } else {
        return 0;
    }
}

// get all posts by category
function getAllPostsByCategory($conn, $category_id) {
    $sql = "SELECT * FROM post WHERE category=? AND publish=1";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$category_id]);

    if ($stmt->rowCount() >= 1) {
        $data = $stmt->fetchAll();
        return $data;
    } else {
        return 0;
    }
}


// getById
function getById($conn, $id) {
    $sql = "SELECT * FROM post WHERE post_id=? AND publish=1";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$id]);

    if ($stmt->rowCount() >= 1) {
        $data = $stmt->fetch();
        return $data;
    } else {
        return 0;
    }
}

// getById Deep - Admin
function getByIdDeep($conn, $id) {
    $sql = "SELECT * FROM post WHERE post_id=?";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$id]);

    if ($stmt->rowCount() >= 1) {
        $data = $stmt->fetch();
        return $data;
    }else {
        return 0;
    }
}

// getCategoryById
function getCategoryById($conn, $id) {
    $sql = "SELECT * FROM category WHERE id=?";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$id]);

    if ($stmt->rowCount() >= 1) {
        $data = $stmt->fetch();
        return $data;
    } else {
        return 0;
    }
}
// get 5 categories
function get5Categories($conn) {
    $sql = "SELECT * FROM category LIMIT 5";
    $stmt = $conn->prepare($sql);
    $stmt->execute();

    if ($stmt->rowCount() >= 1) {
        $data = $stmt->fetchAll();
        return $data;
    } else {
        return 0;
    }
}

function getUserByID($conn, $id) {
    $sql = "SELECT id, fname, username FROM users WHERE id=?";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$id]);

    if ($stmt->rowCount() >= 1) {
        $data = $stmt->fetch();
        return $data;
    } else {
        return 0;
    }
}

// Get All Categories
function getAllCategories($conn) {
    $sql = "SELECT * FROM category ORDER BY category";
    $stmt = $conn->prepare($sql);
    $stmt->execute();

    if ($stmt->rowCount() >= 1) {
        $data = $stmt->fetchAll();
        return $data;
    } else {
        return 0;
    }
}

// Delete By ID
function deleteById($conn, $id) {
    $sql = "DELETE FROM post WHERE post_id=?";
    $stmt = $conn->prepare($sql);
    $res = $stmt->execute([$id]);

    if ($res) {
        return 1;
    } else {
        return 0;
    }
}