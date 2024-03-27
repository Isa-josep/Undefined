<?php
    require ('../vendor/autoload.php');
    require('../.env');
    $dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
    $dotenv->load();
    print_r($_ENV);
?>