##data mny:glbs display = mny:glbs copy[1~24]

data modify storage mny:glbs display append from storage mny:glbs copy[0]

data remove storage mny:glbs copy[0]

scoreboard players remove #GLBSi GLBSinfo 1

execute if score #GLBSi GLBSinfo matches 0 run scoreboard players reset #GLBSi GLBSinfo

execute if score #GLBSi GLBSinfo matches 1.. run function mny:glbs/minecart/modify/display_copy