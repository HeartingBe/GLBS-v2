## data mny:glbs trans_close

# 开 -> 关
execute unless data storage mny:glbs trans_close run schedule function mny:glbs/minecart/edit/trans_on_off/off 1t append

# 关 -> 开
execute if data storage mny:glbs trans_close run schedule function mny:glbs/minecart/edit/trans_on_off/on 1t append

#如果货币转换模式为开启,修改后应该关闭 反之亦然
#需要修改 GLBSedit0 的 Slot:14b 和 GLBS0 的 Slot:22b
execute unless data storage mny:glbs trans_close as @e[type=minecraft:chest_minecart,tag=GLBSedit0] run data modify entity @s Items[{Slot:14b}].tag.display.Lore[-1] set value '"\\u00a7f当前状态 \\u00a77- \\u00a7c关闭"'
execute unless data storage mny:glbs trans_close as @e[type=minecraft:chest_minecart,tag=GLBS0] run data modify entity @s Items[{Slot:22b}].tag.display.Lore[-1] set value '"\\u00a7f当前状态 \\u00a77- \\u00a7c关闭"'
execute unless data storage mny:glbs trans_close run tellraw @a[distance=..5] [">> \u00a7e金钱兑换功能 -> \u00a7c关闭"]
execute unless data storage mny:glbs trans_close as @a[distance=..5] at @s run playsound minecraft:block.iron_door.close player @s ~ ~ ~ 1 1

execute if data storage mny:glbs trans_close as @e[type=minecraft:chest_minecart,tag=GLBSedit0] run data modify entity @s Items[{Slot:14b}].tag.display.Lore[-1] set value '"\\u00a7f当前状态 \\u00a77- \\u00a7a开启"'
execute if data storage mny:glbs trans_close as @e[type=minecraft:chest_minecart,tag=GLBS0] run data modify entity @s Items[{Slot:22b}].tag.display.Lore[-1] set value '"\\u00a7f当前状态 \\u00a77- \\u00a7a开启"'
execute if data storage mny:glbs trans_close run tellraw @a[distance=..5] [">> \u00a7e金钱兑换功能 -> \u00a7a开启"]
execute if data storage mny:glbs trans_close as @a[distance=..5] at @s run playsound minecraft:block.iron_door.open player @s ~ ~ ~ 1 1

tag @s remove GLBSmodify