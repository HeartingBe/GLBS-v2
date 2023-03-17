#把待退回的物品写入列表 mny:glbs back 对应uid玩家的元素的entries中

#次数控制
scoreboard players set #GLBSn GLBSinfo 96

#重置列表 mny:glbs copy
data remove storage mny:glbs copy

#执行函数 glbshop:back/cut 把列表 mny:glbs back_pre 前 96 个元素后置插入列表 mny:glbs copy 并删除列表 mny:glbs back_pre 前 96 个元素
function glbshop:back/cut

#写入列表 mny:glbs back 对应uid玩家的元素的entries中
function glbshop:back/modify

#如果列表 mny:glbs back_pre 还有元素 在 2t 后函数执行自身
execute if data storage mny:glbs back_pre[0] run schedule function glbshop:back/pre 2t append