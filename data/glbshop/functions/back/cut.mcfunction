#把列表 mny:glbs back_pre 前 96 个元素后置插入列表 mny:glbs copy 并删除列表 mny:glbs back_pre 前 96 个元素

data modify storage mny:glbs copy append from storage mny:glbs back_pre[0]
data remove storage mny:glbs back_pre[0]

#还剩次数且 back_pre 还存在第一个元素 调用自身
scoreboard players remove #GLBSn GLBSinfo 1
execute if score #GLBSn GLBSinfo matches 1.. if data storage mny:glbs back_pre[0] run function glbshop:back/cut