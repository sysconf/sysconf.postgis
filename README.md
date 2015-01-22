# Sysconf profile for postgis_webviewer_php

A Sysconf profile

This is a SYSCONF profile. SYSCONF is a method and tool to manage custom system files for easy install, backup and sync.

This profile provides a
[postgis_webviewer_php](http://www.postgis.us/downloads/postgis_webviewer_php.zip) service.
postgis_webviewer_php is a
[minimalist Web based PostGIS 2.0 Spatial Geometry/Raster Viewer](http://www.bostongis.com/blog/index.php?/archives/175-Minimalist-Web-based-PHP-PostGIS-2.0-Spatial-GeometryRaster-Viewer.html)
written in PHP by Bborie Park.

## Services

```
# netstat -tlpn
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 0.0.0.0:5432            0.0.0.0:*               LISTEN      29057/postgres
tcp6       0      0 :::5432                 :::*                    LISTEN      29057/postgres
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      -
tcp6       0      0 :::80                   :::*                    LISTEN      -
```

* The main service is PostgreSQL, running on port 5432 (managed by
  parent profile [sysconf.gitted.postgresql](https://github.com/geonef/sysconf.gitted.postgresql).
* You can also access the PostgreSQL service on the port 5432.


## Gitted import/export

This profile does not import/export anything by itself.

But its dependencies:
* sysconf.gitted [provides import/export](https://github.com/geonef/sysconf.gitted/tree/master/tree/etc/gitted/sync) of the ```sysconf/``` directory
* sysconf.gitted.postgresql
  [provides import/export](https://github.com/geonef/sysconf.gitted.postgresql/tree/master/tree/etc/gitted/sync)
  of the PostgreSQL data


## Gitted integration

* To create a new Gitted repository, follow the instructions at
  [How to setup Gitted for an application](https://github.com/geonef/sysconf.gitted/blob/master/doc/howto-create-new.md)

* Then add this Sysconf profile:
```
git subtree add -P sysconf/sysconf.gitted.postgis git@github.com:geonef/sysconf.gitted.postgis.git master
```

* And the dependency
```
git subtree add -P sysconf/sysconf.gitted.postgresql git@github.com:geonef/sysconf.gitted.postgresql.git master
```

* Integrate it in the dependency chain, for example:
```
echo sysconf.gitted.postgis >sysconf/actual/deps
```

* Then push it to the container:
```
sysconf/gitted-client register
git push <name> master
```


## Authors

Written by Jean-Francois Gigand <jf@geonef.fr>.
Feel free to contact me!
