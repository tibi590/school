<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Buses</title>
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>php</h1>
        <table>
            <?php
                $host = "localhost";
                $user = "root";
                $pass = "admin";
                $db_name = "buses";

                $conn = new mysqli($host, $user, $pass, $db_name);

                $sql = "
                SELECT 
                    routes.id as 'routeid',
                    routes.firstDeparture,
                    routes.lastDeparture,
                    routes.cycle as 'cycle',
                    drivers.fullName,
                    drivers.licenseplate,
                    stops.stopName,
                    routegroups.minutetonextstop
                FROM 
                    assingments INNER JOIN drivers
                      ON assingments.driverId = drivers.id
                    INNER JOIN routes
                      ON assingments.routeId = routes.id
                    INNER JOIN routegroups 
                      ON routegroups.routeId = routes.id
                    INNER JOIN stops 
                      ON routegroups.stopId = stops.id;
                ";

                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    while($row = $result->fetch_assoc()) {
                        foreach ($row as $value) {
                            echo("$value <br>");
                        }
                    }
                } else {
                    echo "0 results";
                }
                $conn->close();
            ?>    
        </table>
    </body>
</html>
