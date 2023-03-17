#生成商店矿车

#summon minecraft:chest_minecart ~ ~ ~ {CustomDisplayTile:true,DisplayOffset:5,DisplayState:{Name:"minecraft:gold_block"},NoGravity:1b,Invulnerable:1b,CustomName:'"\\u00a7d\\u00a7l全球商店"',CustomNameVisible:1b,Tags:["GLBShop","GLBS1","GLBSload"]}
execute unless data storage mny:glbs summon_in_main run summon minecraft:chest_minecart ~ ~ ~ {CustomDisplayTile:true,DisplayOffset:5,DisplayState:{Name:"minecraft:light_blue_shulker_box"},NoGravity:1b,Invulnerable:1b,CustomName:'"\\u00a7f>> \\u00a7bGlobal Shop"',CustomNameVisible:1b,Tags:["GLBShop","GLBS0","GLBSload"]}
execute if data storage mny:glbs summon_in_main run summon minecraft:chest_minecart ~ ~ ~ {CustomDisplayTile:true,DisplayOffset:5,DisplayState:{Name:"minecraft:light_blue_shulker_box"},NoGravity:1b,Invulnerable:1b,CustomName:'"\\u00a7f>> \\u00a7bGlobal Shop"',CustomNameVisible:1b,Tags:["GLBShop","GLBS1","GLBSload"]}

#初始化记分板 GLBSshop GLBSissell GLBSback GLBSsold GLBSbought
scoreboard players set @e[type=minecraft:chest_minecart,tag=GLBSload] GLBSsell_op 1
scoreboard players set @e[type=minecraft:chest_minecart,tag=GLBSload] GLBSbuy_op 1
scoreboard players set @e[type=minecraft:chest_minecart,tag=GLBSload] GLBSshop 1
scoreboard players set @e[type=minecraft:chest_minecart,tag=GLBSload] GLBSissell 1
scoreboard players set @e[type=minecraft:chest_minecart,tag=GLBSload] GLBSback 1
scoreboard players set @e[type=minecraft:chest_minecart,tag=GLBSload] GLBSsold 1
scoreboard players set @e[type=minecraft:chest_minecart,tag=GLBSload] GLBSbought 1

#填入主菜单 or 世界商店菜单
execute unless data storage mny:glbs summon_in_main run loot replace entity @e[type=minecraft:chest_minecart,tag=GLBSload] container.0 loot glbshop:pre_main
execute unless data storage mny:glbs summon_in_main unless data storage mny:glbs trans_close run data modify entity @e[type=minecraft:chest_minecart,tag=GLBSload,limit=1] Items[{Slot:22b}].tag.display.Lore[-1] set value '"\\u00a7f当前状态 \\u00a77- \\u00a7a开启"'
execute unless data storage mny:glbs summon_in_main if data storage mny:glbs trans_close run data modify entity @e[type=minecraft:chest_minecart,tag=GLBSload,limit=1] Items[{Slot:22b}].tag.display.Lore[-1] set value '"\\u00a7f当前状态 \\u00a77- \\u00a7c关闭"'
execute if data storage mny:glbs summon_in_main run loot replace entity @e[type=minecraft:chest_minecart,tag=GLBSload] container.0 loot glbshop:main
data remove storage mny:glbs summon_in_main

#加入无碰撞体积队伍
team join GLBSmc @e[type=minecraft:chest_minecart,tag=GLBSload]

#清除标签 GLBSload
tag @e[type=minecraft:chest_minecart,tag=GLBSload] remove GLBSload