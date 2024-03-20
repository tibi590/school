<!DOCTYPE html>
<html lang="hu">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/style.css" rel="stylesheet">
        <title>Buses</title>
    </head>
    <body>
        <div class="container">
            <div class="route_container">
                <?php
                    $host = "localhost";
                    $user = "root";
                    $pass = "admin";
                    $db_name = "buses";

                    $conn = new mysqli($host, $user, $pass, $db_name);

                    $sql = "
                        SELECT
                            routes.routeNumber,
                            routes.firstDeparture,
                            routes.lastDeparture,
                            routes.cycle,
                            routes.isGoingUp,
                            routegroups.minuteToNextStop,
                            drivers.fullName,
                            stops.stopName
                        FROM 
                            drivers INNER JOIN assingments
                              on assingments.driverId = drivers.id 
                            INNER JOIN routes 
                              on assingments.routeId = routes.id
                            INNER JOIN routegroups
                              on routegroups.routeId = routes.id
                            INNER JOIN stops
                              on routegroups.stopID = stops.id;";

                    $res = $conn->query($sql);

                    if ($res->num_rows > 0) {
                        while($row = $res->fetch_assoc()) {
                            $routeNumber = $row['routeNumber'];
                            $firstDeparture = $row['firstDeparture'];
                            $lastDeparture = $row['lastDeparture'];
                            $cycle = $row['cycle'];
                            $isGoingUp = $row['isGoingUp'];
                            $minuteToNextStop = $row['minuteToNextStop'];
                            $driverName = $row['fullName'];
                            $stopname = $row['fullName'];
                        }
                    } else {
                        echo "0 results";
                    }
                    $conn->close();
                ?>

                <div class="route">
                    <div class="head">
                        <h1 class="route_number">100</h1>
                        <h1 class="route_direction">↑ Oda</h1>
                    </div>
                    <h2>Holmai Peter</h2>
                </div>               
                <div class="route">
                    <h1 class="route_number">101</h1>
                    <h1 class="route_direction">↑ Oda</h1>
                    <h2>Holmai Peter</h2>
                </div>               
                <div class="route">
                    <h1 class="route_number">102</h1>
                    <h1 class="route_direction">↑ Oda</h1>
                    <h2>Holmai Peter</h2>
                </div>               
                <div class="route">
                    <h1 class="route_number">103</h1>
                    <h1 class="route_direction">↑ Oda</h1>
                    <h2>Holmai Peter</h2>
                </div>               
                <div class="route">
                    <h1 class="route_number">104</h1>
                    <h1 class="route_direction">↑ Oda</h1>
                    <h2>Holmai Peter</h2>
                </div>               

                <div class="route">
                    <h1 class="route_number">100</h1>
                    <h1 class="route_direction">↓ Vissza</h1>
                    <h2>Holmai Peter</h2>
                </div>               
                <div class="route">
                    <h1 class="route_number">101</h1>
                    <h1 class="route_direction">↓ Vissza</h1>
                    <h2>Holmai Peter</h2>
                </div>               
                <div class="route">
                    <h1 class="route_number">102</h1>
                    <h1 class="route_direction">↓ Vissza</h1>
                    <h2>Holmai Peter</h2>
                </div>               
                <div class="route">
                    <h1 class="route_number">103</h1>
                    <h1 class="route_direction">↓ Vissza</h1>
                    <h2>Holmai Peter</h2>
                </div>               
                <div class="route">
                    <h1 class="route_number">104</h1>
                    <h1 class="route_direction">↓ Vissza</h1>
                    <h2>Holmai Peter</h2>
                </div>               
            </div>

            <div class="information_container">
                <div class="information"></div>               
                <div class="information"></div>               
            </div>
        </div>
    </body>
</html>
