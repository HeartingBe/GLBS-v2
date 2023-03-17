#分离全球商店物品

#把列表 mny:glbs copy 第一个元素的 timer 存储在 #GLBStimer_modify GLBSinfo
execute store result score #GLBStimer_modify GLBSinfo run data get storage mny:glbs copy[0].tag.glbs.timer

#判断
   #如果 #GLBStimer_modify GLBSinfo = 1 执行函数 function glbshop:timer/back 退回 已重写 改为先存储在列表 mny:glbs back_pre 中,一个游戏刻退回 4 页
   #execute if score #GLBStimer_modify GLBSinfo matches 1 run function glbshop:timer/back

   #执行函数 function glbshop:timer/back_pre 把列表 mny:glbs copy 第一个元素后置插入列表 mny:glbs back_pre 然后删除列表 mny:glbs copy 第一个元素 然后记分板 #GLBSback_store GLBSinfo +1
   execute if score #GLBStimer_modify GLBSinfo matches 1 run function glbshop:timer/back_pre

   #如果 #GLBStimer_modify GLBSinfo ≥ 2 执行函数 function glbshop:timer/modify 减少一游戏日 把结果后置插入回列表 mny:glbs shop
   execute if score #GLBStimer_modify GLBSinfo matches 2.. run function glbshop:timer/modify
   
   #如果列表 mny:glbs copy 还有元素 函数调用自身
   execute if data storage mny:glbs copy[0] run function glbshop:timer/pre