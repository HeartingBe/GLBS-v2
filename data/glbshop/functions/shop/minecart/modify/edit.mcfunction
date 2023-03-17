##填入编辑模式主菜单

execute as @p run loot replace entity @e[type=minecraft:chest_minecart,tag=GLBShop,limit=1,sort=nearest] container.0 loot glbshop:edit_main

#1t 后写入转换货币开关状态提示
schedule function mny:glbs/minecart/modify/edit_trans_lore 1t append

data merge entity @s {CustomName:'"\\u00a7f++ \\u00a7c编辑模式"',DisplayState:{Name:"minecraft:crafting_table"}}