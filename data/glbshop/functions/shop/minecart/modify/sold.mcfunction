##由矿车执行 显示该玩家历史出售的物品

#score #GLBSuid_self GLBSinfo = thisPlayer GLBSuid
scoreboard players operation #GLBSuid_self GLBSinfo = @p GLBSuid

#score #GLBStemp GLBSinfo = @s GLBSsold
scoreboard players operation #GLBStemp GLBSinfo = @s GLBSsold

#data mny:glbs copy = mny:glbs sold
data modify storage mny:glbs copy set from storage mny:glbs sold

#data mny:glbs copy
#-> 查找对应uid的子元素
#-> data mny:glbs copy = <compound>.entries
function mny:glbs/minecart/modify/find_compound_in_list

#data mny:glbs copy -> remove 1 ~ #GLBStemp GLBSinfo
execute if score #GLBStemp GLBSinfo matches 2.. run function mny:glbs/minecart/modify/delete_pre_element

#display
function mny:glbs/minecart/modify/display