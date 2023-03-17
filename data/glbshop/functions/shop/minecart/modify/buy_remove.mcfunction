#更新编辑模式下的回收商店

##score #GLBStemp GLBSinfo = @s GLBSbuy_op
scoreboard players operation #GLBStemp GLBSinfo = @s GLBSbuy_op

##data mny:glbs copy = mny:glbs buy_op
data modify storage mny:glbs copy set from storage mny:glbs buy_op

##data mny:glbs copy -> remove 1 ~ score-#GLBStemp-GLBSinfo
execute if score #GLBStemp GLBSinfo matches 2.. run function mny:glbs/minecart/modify/delete_pre_element

#修改Lore 傻逼mojang没有路径居然还创建 必须保证有元素
execute if data storage mny:glbs copy[0] run data modify storage mny:glbs copy[].tag.display.Lore[-2] set value '"\\u00a7c\\u00a7l按 \\u00a7e\\u00a7lQ \\u00a7c\\u00a7l来从回收商店中移除这个回收物品"'

##data mny:glbs copy -> display items
function mny:glbs/minecart/modify/display