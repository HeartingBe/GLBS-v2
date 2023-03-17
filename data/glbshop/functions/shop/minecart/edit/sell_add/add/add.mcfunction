##位数数字++

execute unless data storage mny:glbs {modify:{id:"minecraft:barrier"}} store result score #GLBStemp GLBSinfo run data get storage mny:glbs modify.Count
execute unless data storage mny:glbs {modify:{id:"minecraft:barrier"}} unless score #GLBStemp GLBSinfo matches 9 run scoreboard players add #GLBStemp GLBSinfo 1
execute unless data storage mny:glbs {modify:{id:"minecraft:barrier"}} store result storage mny:glbs modify.Count byte 1 run scoreboard players get #GLBStemp GLBSinfo
execute if data storage mny:glbs {modify:{id:"minecraft:barrier"}} run data modify storage mny:glbs modify.id set value "minecraft:paper"