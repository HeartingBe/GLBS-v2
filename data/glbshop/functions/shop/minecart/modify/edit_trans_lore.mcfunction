#1t 后写入转换货币开关状态提示
execute unless data storage mny:glbs trans_close as @e[type=minecraft:chest_minecart,tag=GLBShop,tag=GLBSedit0] run data modify entity @s Items[{Slot:14b}].tag.display.Lore[-1] set value '"\\u00a7f当前状态 \\u00a77- \\u00a7a开启"'
execute if data storage mny:glbs trans_close as @e[type=minecraft:chest_minecart,tag=GLBShop,tag=GLBSedit0] run data modify entity @s Items[{Slot:14b}].tag.display.Lore[-1] set value '"\\u00a7f当前状态 \\u00a77- \\u00a7c关闭"'