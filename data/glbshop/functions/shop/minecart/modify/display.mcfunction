##显示商品

##使用方法：
##data mny:glbs copy = data ???(items to be displayed)
##-> run function mny:glbs/minecart/modify/display

##using data mny:glbs display to display
   #reset data mny:glbs display
   data remove storage mny:glbs display
   #data mny:glbs display = mny:glbs copy[1~24]
   scoreboard players set #GLBSi GLBSinfo 24
   function mny:glbs/minecart/modify/display_copy

##fill void Slot
execute unless data storage mny:glbs display[23] run function mny:glbs/minecart/modify/display_repair

##set Slot
data modify storage mny:glbs display[0].Slot set value 0b
data modify storage mny:glbs display[1].Slot set value 1b
data modify storage mny:glbs display[2].Slot set value 2b
data modify storage mny:glbs display[3].Slot set value 3b
data modify storage mny:glbs display[4].Slot set value 4b
data modify storage mny:glbs display[5].Slot set value 5b
data modify storage mny:glbs display[6].Slot set value 6b
data modify storage mny:glbs display[7].Slot set value 7b

data modify storage mny:glbs display[8].Slot set value 9b
data modify storage mny:glbs display[9].Slot set value 10b
data modify storage mny:glbs display[10].Slot set value 11b
data modify storage mny:glbs display[11].Slot set value 12b
data modify storage mny:glbs display[12].Slot set value 13b
data modify storage mny:glbs display[13].Slot set value 14b
data modify storage mny:glbs display[14].Slot set value 15b
data modify storage mny:glbs display[15].Slot set value 16b

data modify storage mny:glbs display[16].Slot set value 18b
data modify storage mny:glbs display[17].Slot set value 19b
data modify storage mny:glbs display[18].Slot set value 20b
data modify storage mny:glbs display[19].Slot set value 21b
data modify storage mny:glbs display[20].Slot set value 22b
data modify storage mny:glbs display[21].Slot set value 23b
data modify storage mny:glbs display[22].Slot set value 24b
data modify storage mny:glbs display[23].Slot set value 25b

##功能按钮(上下翻页、返回主菜单) -> 后置插入
data modify storage mny:glbs display append from storage mny:glbs botton[]

##矿车 -> display
data modify entity @s Items set from storage mny:glbs display