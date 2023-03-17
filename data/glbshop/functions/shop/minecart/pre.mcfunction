##main - 矿车

##5格内有非商店管理员玩家 -> kill
execute if entity @s[tag=!GLBSdie] if entity @s[tag=GLBSedit] if entity @a[tag=!GLBSop,distance=..5] run function mny:glbs/minecart/force_stop_edit

##非编辑模式 -> 有空位 -> 执行
execute if entity @s[tag=!GLBSdie] unless entity @s[tag=GLBSedit] unless data entity @s Items[26] run function mny:glbs/minecart/function_choose

##编辑模式 -> 有空位 -> 执行
execute if entity @s[tag=!GLBSdie] if entity @s[tag=GLBSedit] unless data entity @s Items[26] run function mny:glbs/minecart/edit/pre