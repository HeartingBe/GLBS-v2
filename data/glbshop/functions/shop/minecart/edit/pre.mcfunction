##由编辑模式下的矿车执行

##矿车格数 ≤ 26 -> add tag GLBSmodify
##based on tag GLBSedit?

##add tag GLBSmodify 保持至矿车被修改
tag @s add GLBSmodify

##switch(GLBSedit?)
   ##case 0 -> 编辑模式主菜单
   execute if entity @s[tag=GLBSedit0] run function mny:glbs/minecart/edit/main

   ##case 1 -> 向出售商店添加商品界面
   execute if entity @s[tag=GLBSmodify,tag=GLBSedit1] run function mny:glbs/minecart/edit/sell_add/pre
   
   ##case 2 -> 从出售商店去除商品界面
   execute if entity @s[tag=GLBSmodify,tag=GLBSedit2] run function mny:glbs/minecart/edit/sell_remove/pre

   ##case 3 -> 向回收商店添加商品界面
   execute if entity @s[tag=GLBSmodify,tag=GLBSedit3] run function mny:glbs/minecart/edit/buy_add/pre

   ##case 4 -> 从回收商店去除商品界面
   execute if entity @s[tag=GLBSmodify,tag=GLBSedit4] run function mny:glbs/minecart/edit/sell_remove/pre

   ##case _trans -> 编辑货币转换界面
   execute if entity @s[tag=GLBSmodify,tag=GLBSedit_trans] run function mny:glbs/minecart/edit/trans/pre

#清除内容物(忽略 edit1、edit3、edit_trans)
execute if entity @s[tag=!GLBSedit1,tag=!GLBSedit3,tag=!GLBSedit_trans] run data remove entity @s Items

##防止意外情况 最后均 remove tag GLBSmodify
tag @s remove GLBSmodify

##完成上述操作 -> 更新矿车内容物
function mny:glbs/minecart/modify/pre