#由矿车执行

#把玩家 GLBSuid 存入 #GLBSuid_self GLBSinfo
scoreboard players operation #GLBSuid_self GLBSinfo = @p GLBSuid

#把列表 mny:glbs back 复制到列表 mny:glbs copy
data modify storage mny:glbs copy set from storage mny:glbs back

#执行函数 find_compound_in_list 找到对应uid的元素的entries列表 结果存在复合标签 mny:glbs copy
function mny:glbs/minecart/modify/find_compound_in_list

#data mny:glbs copy -> remove 1 ~ score-#GLBStemp-GLBSinfo
scoreboard players operation #GLBStemp GLBSinfo = @s GLBSback
execute if score #GLBStemp GLBSinfo matches 2.. run function mny:glbs/minecart/modify/delete_pre_element

#display
function mny:glbs/minecart/modify/display