#data mny:glbs copy -> 出售商店是否存在要去除的商品

#score GLBStemp_order2 GLBSinfo = data mny:glbs copy[0].order
#///warning/// (#GLBSorder是为物品编号的 不可使用)
execute store result score #GLBStemp_order2 GLBSinfo run data get storage mny:glbs copy[0].tag.glbs.order

#score #GLBStemp_order GLBSinfo 存储玩家要去除的商品的 order

#存在?
   #true -> if_found = 1b
   execute if score #GLBStemp_order2 GLBSinfo = #GLBStemp_order GLBSinfo run data modify storage mny:glbs if_found set value 1b
   #false
   #data mny:glbs sell_op <<尾插<< mny:glbs copy[0]
   #data mny:glbs copy[0] -> remove
   #if data mny:glbs copy[0] -> loop
   execute unless score #GLBStemp_order2 GLBSinfo = #GLBStemp_order GLBSinfo run data modify storage mny:glbs sell_op append from storage mny:glbs copy[0]
   execute unless score #GLBStemp_order2 GLBSinfo = #GLBStemp_order GLBSinfo run data remove storage mny:glbs copy[0]
   execute unless score #GLBStemp_order2 GLBSinfo = #GLBStemp_order GLBSinfo if data storage mny:glbs copy[0] run function mny:glbs/sell_op/remove_found_if