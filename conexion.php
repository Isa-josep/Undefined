<?php
    require ('vendor/autoload.php');
    $dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
    $dotenv->load();
    
    $db_host = $_ENV['DB_HOST'];
    $db_user = $_ENV['DB_USER'];
    $db_pass = $_ENV['DB_PASS'];
    $db_name = $_ENV['DB_NAME'];

    $conn = new mysqli($db_host, $db_user, $db_pass, $db_name);
    // print_r($_ENV);
    if ($conn->connect_error) {
        die("Error de conexión: " );
    }
    echo "Conexión exitosa";
?>