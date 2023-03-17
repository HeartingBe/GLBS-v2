##物品是否还存在

#data mny:glbs copy = mny:glbs sell_op
data modify storage mny:glbs copy set from storage mny:glbs sell_op

#data mny:glbs sell_op -> remove
data remove storage mny:glbs sell_op

#score #GLBStemp_order GLBSinfo = Item.tag.glbs.order
#-> function mny:glbs/sell_op/remove_found_if
#如果找到 -> 停止执行 mny:glbs/sell_op/remove_found_if -> 命令存储 mny:glbs if_found 将置 1b
execute store result score #GLBStemp_order GLBSinfo run data get entity @s Item.tag.glbs.order
function mny:glbs/sell_op/remove_found_if

#///warning///
#data mny:glbs copy 可能剩余元素,在写回列表 sell_op 之前不能使用

#if if_found:1b -> 找到
#-> function mny:glbs/sell_op/remove_found
#data mny:glbs copy 有剩余 -> 在函数 mny:glbs/sell_op/remove_found 最后 >>尾插>> data mny:glbs sell_op
execute if data storage mny:glbs if_found run function mny:glbs/sell_op/remove_found