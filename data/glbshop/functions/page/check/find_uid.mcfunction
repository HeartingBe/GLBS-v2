#把列表 mny:glbs copy 第一个元素的uid 存在记分板 #GLBSuid_in_list GLBSinfo
execute store result score #GLBSuid_in_list GLBSinfo run data get storage mny:glbs copy[0].uid

#判断
   #相同 把列表 mny:glbs copy 设置为其本身第一个元素的entries列表
   execute if score #GLBSuid_in_list GLBSinfo = #GLBSuid_self GLBSinfo run data modify storage mny:glbs copy set from storage mny:glbs copy[0].entries

   #不同 删除列表 mny:glbs copy 第一个元素 然后函数调用自身
   execute unless score #GLBSuid_in_list GLBSinfo = #GLBSuid_self GLBSinfo run data remove storage mny:glbs copy[0]
   execute unless score #GLBSuid_in_list GLBSinfo = #GLBSuid_self GLBSinfo run function glbshop:page/check/find_uid