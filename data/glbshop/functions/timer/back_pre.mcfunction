#把列表 mny:glbs copy 第一个元素后置插入列表 mny:glbs back_pre 然后删除列表 mny:glbs copy 第一个元素 然后记分板 #GLBSback_store GLBSinfo +1

data modify storage mny:glbs back_pre append from storage mny:glbs copy[0]
data remove storage mny:glbs copy[0]
scoreboard players add #GLBSback_store GLBSinfo 1