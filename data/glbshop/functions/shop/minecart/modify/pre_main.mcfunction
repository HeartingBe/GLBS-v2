#更新主菜单

execute as @p run loot replace entity @e[type=minecraft:chest_minecart,tag=GLBShop,limit=1,sort=nearest] container.0 loot glbshop:pre_main

#写入转换货币开关状态提示
execute unless data storage mny:glbs trans_close run data modify entity @s Items[{Slot:22b}].tag.display.Lore[-1] set value '"\\u00a7f当前状态 \\u00a77- \\u00a7a开启"'
execute if data storage mny:glbs trans_close run data modify entity @s Items[{Slot:22b}].tag.display.Lore[-1] set value '"\\u00a7f当前状态 \\u00a77- \\u00a7c关闭"'