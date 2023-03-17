#重置存储查找次数记分板 #GLBScheck_num GLBSinfo
scoreboard players reset #GLBScheck_num GLBSinfo
#把玩家 GLBSuid 存到记分板 #GLBSuid_self GLBSinfo
scoreboard players operation #GLBSuid_self GLBSinfo = @p GLBSuid
#重置if_check
data remove storage mny:glbs if_check

#判断翻页
execute if score @s GLBSpage_shop matches 1.. run function glbshop:page/shop
execute if score @s GLBSpage_issell matches 1.. run function glbshop:page/issell
execute if score @s GLBSpage_bought matches 1.. run function glbshop:page/bought
execute if score @s GLBSpage_sold matches 1.. run function glbshop:page/sold