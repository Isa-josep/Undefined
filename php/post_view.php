<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../card1.css">
    <title>Publicaciones</title>
</head>
<body>
    <?php
    include("../conexion.php");
    $sql = "SELECT * FROM publicaciones";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            ?>
            <div class="card">
                <img class="card-image" alt="Card Image" src="http://hidroponia.mx/wp-content/uploads/2015/06/aguacate.jpg">
                <div class="card-content">
                    <h2 class="card-title"><?php echo $row["titulo"]; ?></h2>
                    <p class="card-text"><?php echo $row["contenido"]; ?></p>
                    <div class="button-container">
                        <button class="learn-more-button">Learn More</button>
                    </div>
                </div>
            </div>
            <?php
        }
    } 
    else {
        echo "No se encontraron publicaciones.";
    }
    $conn->close();
    ?>
</body>
</html>
