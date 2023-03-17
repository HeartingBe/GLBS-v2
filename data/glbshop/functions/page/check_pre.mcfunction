#重置存储查找次数记分板 #GLBScheck_num GLBSinfo
scoreboard players reset #GLBScheck_num GLBSinfo
#把玩家 GLBSuid 存到记分板 #GLBSuid_self GLBSinfo
scoreboard players operation #GLBSuid_self GLBSinfo = @p GLBSuid
#重置if_check
data remove storage mny:glbs if_check

#判断查找
execute if score @s GLBScheck_shop matches 1.. run function glbshop:page/check/shop
execute if score @s GLBScheck_bought matches 1.. run function glbshop:page/check/bought
execute if score @s GLBScheck_sold matches 1.. run function glbshop:page/check/sold