##tag == GLBSop -> 进入编辑模式
##else -> 阻止

execute if data storage mny:glbs trans_close run tellraw @a[distance=..5] [">> \u00a7c管理员没有开放金钱兑换权限"]

#功能是开启状态 -> 通过
execute unless data storage mny:glbs trans_close run data modify entity @s Tags set value ["GLBShop","GLBStrans"]

tag @s remove GLBSmodify