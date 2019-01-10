var prop = ds_list_create();

var data = ds_map_create();

data[?"health_min"] = 50;
data[?"health_max"] = 100;

ds_list_add(prop, data);


return prop;