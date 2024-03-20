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
      on routegroups.stopID = stops.id;
