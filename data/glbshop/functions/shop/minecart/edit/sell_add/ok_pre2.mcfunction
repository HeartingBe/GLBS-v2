#价格是否合法

scoreboard players set #GLBStemp_price GLBSinfo 0

#计算价格
execute store result score #GLBStemp GLBSinfo run data get entity @s[nbt=!{Items:[{Slot:12b,id:"minecraft:barrier"}]}] Items[{Slot:12b}].Count 10000
scoreboard players operation #GLBStemp_price GLBSinfo += #GLBStemp GLBSinfo

execute store result score #GLBStemp GLBSinfo run data get entity @s[nbt=!{Items:[{Slot:13b,id:"minecraft:barrier"}]}] Items[{Slot:13b}].Count 1000
scoreboard players operation #GLBStemp_price GLBSinfo += #GLBStemp GLBSinfo

execute store result score #GLBStemp GLBSinfo run data get entity @s[nbt=!{Items:[{Slot:14b,id:"minecraft:barrier"}]}] Items[{Slot:14b}].Count 100
scoreboard players operation #GLBStemp_price GLBSinfo += #GLBStemp GLBSinfo

execute store result score #GLBStemp GLBSinfo run data get entity @s[nbt=!{Items:[{Slot:15b,id:"minecraft:barrier"}]}] Items[{Slot:15b}].Count 10
scoreboard players operation #GLBStemp_price GLBSinfo += #GLBStemp GLBSinfo

execute store result score #GLBStemp GLBSinfo run data get entity @s[nbt=!{Items:[{Slot:16b,id:"minecraft:barrier"}]}] Items[{Slot:16b}].Count
scoreboard players operation #GLBStemp_price GLBSinfo += #GLBStemp GLBSinfo

#不合法
execute if score #GLBStemp_price GLBSinfo matches 0 run tellraw @p[distance=..5,tag=GLBSop] [">> \u00a7c需要指定出售商品的价格"]

#合法
execute unless score #GLBStemp_price GLBSinfo matches 0 run function mny:glbs/minecart/edit/sell_add/ok