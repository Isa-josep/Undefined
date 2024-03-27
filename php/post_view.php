<?php
    include("../conexion.php");
    $sql = "SELECT * FROM publicaciones";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo "Título: " . $row["titulo"] . "<br>";
            echo "Contenido: " . $row["contenido"] . "<br>";
            echo "Autor ID: " . $row["autor_id"] . "<br>";
            echo "<hr>";
        }
    } 
    else {
        echo "No se encontraron publicaciones.";
    }
    $conn->close();
?>