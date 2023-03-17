#通知
execute as @p run tellraw @s [">> \u00a7e成功从出售商店中移除了这个商品"]

#data mny:glbs sell_op <<尾插<< mny:glbs copy 剩余元素

#///warning///
#先删除首个元素
data remove storage mny:glbs copy[0]

data modify storage mny:glbs sell_op append from storage mny:glbs copy[]