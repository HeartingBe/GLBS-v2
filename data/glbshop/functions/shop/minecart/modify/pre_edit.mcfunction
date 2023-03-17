##edit0 -> 编辑模式主菜单
execute if entity @s[tag=GLBSedit0] run function mny:glbs/minecart/modify/edit

##edit1 -> 向出售商店添加商品 需要保留某些nbt
execute if entity @s[tag=GLBSedit1] run function mny:glbs/minecart/modify/sell_add

##edit2 -> 从出售商店去除商品
execute if entity @s[tag=GLBSedit2] run function mny:glbs/minecart/modify/sell_remove

##edit3 -> 向回收商店添加商品 需要保留某些nbt 和出售商店共用
execute if entity @s[tag=GLBSedit3] run function mny:glbs/minecart/modify/sell_add

##edit4 -> 从回收商店去除回收物品
execute if entity @s[tag=GLBSedit4] run function mny:glbs/minecart/modify/buy_remove

##edit_trans -> 编辑货币转换 需要保留某些nbt
execute if entity @s[tag=GLBSedit_trans] run function mny:glbs/minecart/modify/trans_edit