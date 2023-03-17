#更新回收商店

##score #GLBStemp GLBSinfo = @s GLBSbuy_op
scoreboard players operation #GLBStemp GLBSinfo = @s GLBSbuy_op

##data mny:glbs copy = mny:glbs buy_op
data modify storage mny:glbs copy set from storage mny:glbs buy_op

##data mny:glbs copy -> remove 1 ~ score-#GLBStemp-GLBSinfo
execute if score #GLBStemp GLBSinfo matches 2.. run function mny:glbs/minecart/modify/delete_pre_element

##data mny:glbs copy -> display items
function mny:glbs/minecart/modify/display