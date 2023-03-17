##位数数字--

execute store result score #GLBStemp GLBSinfo run data get storage mny:glbs modify.Count
execute if score #GLBStemp GLBSinfo matches 1 unless data storage mny:glbs {modify:{id:"minecraft:barrier"}} run data modify storage mny:glbs modify.id set value "minecraft:barrier"
scoreboard players remove #GLBStemp GLBSinfo 1
execute if score #GLBStemp GLBSinfo matches 1.. store result storage mny:glbs modify.Count byte 1 run scoreboard players get #GLBStemp GLBSinfo