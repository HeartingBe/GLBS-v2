##由矿车执行 显示该玩家历史购买的物品

#score #GLBSuid_self GLBSinfo = thisPlayer GLBSuid
scoreboard players operation #GLBSuid_self GLBSinfo = @p GLBSuid

#data mny:glbs copy = mny:glbs bought
data modify storage mny:glbs copy set from storage mny:glbs bought

#data mny:glbs copy
#-> 查找对应uid的子元素
#-> data mny:glbs copy = <compound>.entries
function mny:glbs/minecart/modify/find_compound_in_list

#score #GLBStemp GLBSinfo = @s GLBSbought
scoreboard players operation #GLBStemp GLBSinfo = @s GLBSbought

#data mny:glbs copy -> remove 1 ~ #GLBStemp GLBSinfo
execute if score #GLBStemp GLBSinfo matches 2.. run function mny:glbs/minecart/modify/delete_pre_element

#display
function mny:glbs/minecart/modify/display