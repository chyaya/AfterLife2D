var lvl = argument0;

var stats = ds_map_create();

stats[?"health"] = 10 + 5*lvl + irandom(lvl*20);
stats[?"damage"] = 1 + 2*lvl + irandom(lvl*2);
stats[?"moveSpeed"] = 50 + irandom(lvl*10);

return stats;