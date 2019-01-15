var itemId = 0;

inv_create_item(itemId++,spr_no_item, "", noone, noone, noone); //Don't remove this one!
inv_create_item(itemId++,sprWeapon, "Weapon", sItem_Weapon_OnAdd, sItem_Weapon_OnRemove, noone);
inv_create_item(itemId++,sprArmor, "Armor", sItem_Armor_OnAdd, sItem_Armor_OnRemove, noone);
inv_create_item(itemId++,sprShoes, "Shoes", sItem_Shoes_OnAdd, sItem_Shoes_OnRemove, noone);
inv_create_item(itemId++,sprPortion, "Portion", noone, noone, sItem_Portion_OnUse);

