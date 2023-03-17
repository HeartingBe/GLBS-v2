##data mny:glbs copy -> remove 1 ~ score-#GLBStemp-GLBSinfo

data remove storage mny:glbs copy[0]

scoreboard players remove #GLBStemp GLBSinfo 1

execute if score #GLBStemp GLBSinfo matches 2.. run function mny:glbs/minecart/modify/delete_pre_element