-- verson 0.3 --
CREATE OR REPLACE FUNCTION postgis_viewer_image(IN param_sql text, IN param_spatial_type text DEFAULT 'geometry', IN param_rgb integer[] DEFAULT null::integer[] ) RETURNS bytea AS
$$
  DECLARE var_result bytea;
  DECLARE var_bandtypes text[] := ARRAY['8BUI', '8BUI', '8BUI'];
  BEGIN
      IF param_spatial_type = 'geometry' THEN
        EXECUTE 'SELECT ST_AsPNG(ST_AsRaster((' || param_sql || '), 200,200,$1,$2, ARRAY[0,0,0]))' INTO STRICT var_result USING var_bandtypes, param_rgb ;
      ELSIF param_spatial_type = 'raster' THEN
        EXECUTE 'SELECT ST_AsPNG((' || param_sql || '), ARRAY[1,2,3])' INTO STRICT var_result;
	  ELSE -- assume raw
		EXECUTE param_sql INTO STRICT var_result;
      END IF;
      RETURN var_result;
 END 
$$
LANGUAGE plpgsql STABLE SECURITY DEFINER;
