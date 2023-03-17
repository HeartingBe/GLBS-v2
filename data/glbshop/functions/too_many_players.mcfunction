#矿车执行该函数 判断7格内是否有不止1个玩家 删除该函数

#统计
execute store result score #GLBS_too_many_players GLBSinfo if entity @a[distance=..7]

#处理
execute if score #GLBS_too_many_players GLBSinfo matches 2.. run function glbshop:kill_minecart