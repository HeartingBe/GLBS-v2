##管理员确认更改货币转换

# 15b 不是商店物品
execute if data entity @s Items[{Slot:15b,tag:{glbs:{shop:1b}}}] run tellraw @p[distance=..5,tag=GLBSop] [">> \\u00a7c需要放入金钱的兑换物品"]

#通过
execute unless data entity @s Items[{Slot:15b,tag:{glbs:{shop:1b}}}] run function mny:glbs/minecart/edit/trans/ok_pre2