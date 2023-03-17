#更新售货架

##score #GLBStemp GLBSinfo = @s GLBSshop
scoreboard players operation #GLBStemp GLBSinfo = @s GLBSshop

##data mny:glbs copy = mny:glbs shop
data modify storage mny:glbs copy set from storage mny:glbs shop

##data mny:glbs copy -> remove 1 ~ score-#GLBStemp-GLBSinfo
execute if score #GLBStemp GLBSinfo matches 2.. run function mny:glbs/minecart/modify/delete_pre_element

##data mny:glbs copy -> display items
function mny:glbs/minecart/modify/display