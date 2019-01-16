var itemId = 0;

inv_create_item(itemId++,spr_no_item, "", noone, noone); //Don't remove this one!
inv_create_item(itemId++,sprWeapon, "Weapon", sItem_Weapon_OnAddOrRemove, noone);
inv_create_item(itemId++,sprArmor, "Armor", sItem_Armor_OnAddOrRemove, noone);
inv_create_item(itemId++,sprShoes, "Shoes", sItem_Shoes_OnAddOrRemove, noone);
inv_create_item(itemId++,sprPortion, "Portion", noone, sItem_Portion_OnUse);

