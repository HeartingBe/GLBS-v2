#物品执行该函数 在列表 mny:glbs copy 中找出记录对应uid玩家历史购买的元素

#玩家uid 存储在 #GLBSuid_self GLBSinfo 记分板

#将列表 mny:glbs copy 首个元素的uid 存入 #GLBSuid_in_list 的 GLBSinfo 记分板
execute store result score #GLBSuid_in_list GLBSinfo run data get storage mny:glbs copy[0].uid

#搜索列表 mny:glbs copy 中对应出售者 uid 的元素
   #否 把列表 mny:glbs copy 首个元素后置插入列表 列表 mny:glbs sold 然后删除列表 mny:glbs copy 的首个元素 然后函数调用自身
   execute unless score #GLBSuid_self GLBSinfo = #GLBSuid_in_list GLBSinfo run data modify storage mny:glbs sold append from storage mny:glbs copy[0]
   execute unless score #GLBSuid_self GLBSinfo = #GLBSuid_in_list GLBSinfo run data remove storage mny:glbs copy[0]
   execute unless score #GLBSuid_self GLBSinfo = #GLBSuid_in_list GLBSinfo run function mny:glbs/minecart/modify/bought_find