SELECT 
    routes.routeNumber as 'routeid',
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
