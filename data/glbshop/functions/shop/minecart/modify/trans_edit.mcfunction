##填入货币转换编辑界面

data modify storage mny:glbs modify set value [{id:"minecraft:yellow_stained_glass_pane",Count:1b,Slot:0b,tag:{glbs:{shop:1b}}},{id:"minecraft:yellow_stained_glass_pane",Count:1b,Slot:1b,tag:{glbs:{shop:1b}}},{id:"minecraft:yellow_stained_glass_pane",Count:1b,Slot:2b,tag:{glbs:{shop:1b}}},{id:"minecraft:yellow_stained_glass_pane",Count:1b,Slot:3b,tag:{glbs:{shop:1b}}},{id:"minecraft:yellow_stained_glass_pane",Count:1b,Slot:4b,tag:{glbs:{shop:1b}}},{id:"minecraft:light_blue_stained_glass_pane",Count:1b,Slot:5b,tag:{glbs:{shop:1b}}},{id:"minecraft:light_blue_stained_glass_pane",Count:1b,Slot:6b,tag:{glbs:{shop:1b}}},{id:"minecraft:light_blue_stained_glass_pane",Count:1b,Slot:7b,tag:{glbs:{shop:1b}}},{id:"minecraft:white_stained_glass_pane",Count:1b,Slot:8b,tag:{glbs:{shop:1b},display:{Name:'"\\u00a7c归零"',Lore:['""','"\\u00a7f按 \\u00a7eQ \\u00a7f或 \\u00a7e左键 \\u00a7f将物品兑换的金钱数目归零"']}}},{id:"minecraft:light_blue_stained_glass_pane",Count:1b,Slot:14b,tag:{glbs:{shop:1b}}},{id:"minecraft:light_blue_stained_glass_pane",Count:1b,Slot:16b,tag:{glbs:{shop:1b}}},{id:"minecraft:structure_void",Count:1b,Slot:17b,tag:{glbs:{shop:1b},display:{Name:'"\\u00a7c返回编辑模式菜单"',Lore:['""','"\\u00a7f按 \\u00a7eQ \\u00a7f或 \\u00a7e左键 \\u00a7f返回编辑菜单"']}}},{id:"minecraft:red_stained_glass_pane",Count:1b,Slot:18b,tag:{glbs:{shop:1b}}},{id:"minecraft:red_stained_glass_pane",Count:1b,Slot:19b,tag:{glbs:{shop:1b}}},{id:"minecraft:red_stained_glass_pane",Count:1b,Slot:20b,tag:{glbs:{shop:1b}}},{id:"minecraft:red_stained_glass_pane",Count:1b,Slot:21b,tag:{glbs:{shop:1b}}},{id:"minecraft:red_stained_glass_pane",Count:1b,Slot:22b,tag:{glbs:{shop:1b}}},{id:"minecraft:light_blue_stained_glass_pane",Count:1b,Slot:23b,tag:{glbs:{shop:1b}}},{id:"minecraft:light_blue_stained_glass_pane",Count:1b,Slot:24b,tag:{glbs:{shop:1b}}},{id:"minecraft:light_blue_stained_glass_pane",Count:1b,Slot:25b,tag:{glbs:{shop:1b}}},{id:"minecraft:lime_stained_glass_pane",Count:1b,Slot:26b,tag:{glbs:{shop:1b},display:{Name:'"\\u00a7a确认"',Lore:['""','"\\u00a7f按 \\u00a7eQ \\u00a7f或 \\u00a7e左键 \\u00a7f来修改金钱兑换的物品和(或)比率"']}}}]
data modify storage mny:glbs modify[{id:"minecraft:light_blue_stained_glass_pane"}].tag.display.Name set value '"\\u00a7e放入金钱将兑换成的物品"'
data modify storage mny:glbs modify[{id:"minecraft:yellow_stained_glass_pane"}].tag.display.Name set value '"\\u00a7e该位数字 + 1"'
data modify storage mny:glbs modify[{id:"minecraft:red_stained_glass_pane"}].tag.display.Name set value '"\\u00a7e该位数字 - 1"'

#写入 15b 9~13b @e[tag=GLBShop,limit=1,sort=nearest]
data modify storage mny:glbs modify prepend from entity @s Items[{Slot:15b}]

data modify storage mny:glbs modify prepend from entity @s Items[{Slot:9b}]
data modify storage mny:glbs modify prepend from entity @s Items[{Slot:10b}]
data modify storage mny:glbs modify prepend from entity @s Items[{Slot:11b}]
data modify storage mny:glbs modify prepend from entity @s Items[{Slot:12b}]
data modify storage mny:glbs modify prepend from entity @s Items[{Slot:13b}]

# 15b 是商店物品,但不是屏障,换成屏障
execute if data storage mny:glbs modify[{Slot:15b,tag:{glbs:{shop:1b}}}] unless data storage mny:glbs modify[{Slot:15b,id:"minecraft:barrier"}] run data modify storage mny:glbs modify[{Slot:15b}] set value {id:"minecraft:barrier",Count:1b,Slot:15b,tag:{glbs:{shop:1b},display:{Name:'"\\u00a7c请在这里放入金钱将兑换成的物品"',Lore:['"\\u00a7e你应该同时在这里指定数量"']}}}
# 15b 是空的(首次进入的更新,而非编辑过程的更新)
execute unless data storage mny:glbs modify[{Slot:15b}] run data modify storage mny:glbs modify prepend value {id:"minecraft:barrier",Count:1b,Slot:15b,tag:{glbs:{shop:1b},display:{Name:'"\\u00a7c请在这里放入金钱将兑换成的物品"',Lore:['"\\u00a7e你应该同时在这里指定数量"']}}}

# 9~13b 不是纸,改成屏障
execute unless data storage mny:glbs modify[{Slot:9b,id:"minecraft:paper"}] run data modify storage mny:glbs modify[{Slot:9b}] set value {id:"minecraft:barrier",Count:1b,Slot:9b,tag:{glbs:{shop:1b},display:{Name:'"\\u00a7c万位"',Lore:['""','""']}}}
execute unless data storage mny:glbs modify[{Slot:10b,id:"minecraft:paper"}] run data modify storage mny:glbs modify[{Slot:10b}] set value {id:"minecraft:barrier",Count:1b,Slot:10b,tag:{glbs:{shop:1b},display:{Name:'"\\u00a7c千位"',Lore:['""','"\\u00a7f按  \\u00a7e左键 \\u00a7f将该位数字归零"']}}}
execute unless data storage mny:glbs modify[{Slot:11b,id:"minecraft:paper"}] run data modify storage mny:glbs modify[{Slot:11b}] set value {id:"minecraft:barrier",Count:1b,Slot:11b,tag:{glbs:{shop:1b},display:{Name:'"\\u00a7c百位"',Lore:['""','"\\u00a7f按  \\u00a7e左键 \\u00a7f将该位数字归零"']}}}
execute unless data storage mny:glbs modify[{Slot:12b,id:"minecraft:paper"}] run data modify storage mny:glbs modify[{Slot:12b}] set value {id:"minecraft:barrier",Count:1b,Slot:12b,tag:{glbs:{shop:1b},display:{Name:'"\\u00a7c十位"',Lore:['""','"\\u00a7f按  \\u00a7e左键 \\u00a7f将该位数字归零"']}}}
execute unless data storage mny:glbs modify[{Slot:13b,id:"minecraft:paper"}] run data modify storage mny:glbs modify[{Slot:13b}] set value {id:"minecraft:barrier",Count:1b,Slot:13b,tag:{glbs:{shop:1b},display:{Name:'"\\u00a7c个位"',Lore:['""','"\\u00a7f按  \\u00a7e左键 \\u00a7f将该位数字归零"']}}}

# 9~13b 是空的,改成屏障
execute unless data storage mny:glbs modify[{Slot:9b}] run data modify storage mny:glbs modify prepend value {id:"minecraft:barrier",Count:1b,Slot:9b,tag:{glbs:{shop:1b},display:{Name:'"\\u00a7c万位"',Lore:['""','"\\u00a7f按  \\u00a7e左键 \\u00a7f将该位数字归零"']}}}
execute unless data storage mny:glbs modify[{Slot:10b}] run data modify storage mny:glbs modify prepend value {id:"minecraft:barrier",Count:1b,Slot:10b,tag:{glbs:{shop:1b},display:{Name:'"\\u00a7c千位"',Lore:['""','"\\u00a7f按  \\u00a7e左键 \\u00a7f将该位数字归零"']}}}
execute unless data storage mny:glbs modify[{Slot:11b}] run data modify storage mny:glbs modify prepend value {id:"minecraft:barrier",Count:1b,Slot:11b,tag:{glbs:{shop:1b},display:{Name:'"\\u00a7c百位"',Lore:['""','"\\u00a7f按  \\u00a7e左键 \\u00a7f将该位数字归零"']}}}
execute unless data storage mny:glbs modify[{Slot:12b}] run data modify storage mny:glbs modify prepend value {id:"minecraft:barrier",Count:1b,Slot:12b,tag:{glbs:{shop:1b},display:{Name:'"\\u00a7c十位"',Lore:['""','"\\u00a7f按  \\u00a7e左键 \\u00a7f将该位数字归零"']}}}
execute unless data storage mny:glbs modify[{Slot:13b}] run data modify storage mny:glbs modify prepend value {id:"minecraft:barrier",Count:1b,Slot:13b,tag:{glbs:{shop:1b},display:{Name:'"\\u00a7c个位"',Lore:['""','"\\u00a7f按  \\u00a7e左键 \\u00a7f将该位数字归零"']}}}

#写入
data modify entity @s Items set from storage mny:glbs modify