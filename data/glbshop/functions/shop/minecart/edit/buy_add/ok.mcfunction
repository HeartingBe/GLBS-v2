#向回收商店添加商品 -> 通过

#通知
tellraw @p[tag=GLBSop,distance=..5] [">> 成功向回收商店添加物品,回收价 ",{"score":{"name":"#GLBStemp_price","objective":"GLBSinfo"},"color":"yellow"}," \u00a7f金钱"]

#写进命令存储 mny:glbs modify 暂存
data modify storage mny:glbs modify set from entity @s Items[{Slot:10b}]

#标记为回收商店物品
data merge storage mny:glbs {modify:{tag:{glbs:{shop:1b,buy_op:1b}}}}

#写入价格
execute store result storage mny:glbs modify.tag.glbs.price int 1 run scoreboard players get #GLBStemp_price GLBSinfo

#去掉 Slot:10b
data remove storage mny:glbs modify.Slot

#写入数量
data modify storage mny:glbs modify.tag.glbs.Count set from storage mny:glbs modify.Count

#写入Lore
   #生成一块石头 解析Lore(由于石头也要解析编号 故编号自加1需在解析Lore之后) 共有9行 石头带有tag:{GLBSlore:1b}
   loot spawn ~ ~ ~ loot glbshop:buy_op

   #石头的Lore后置插入命令存储 mny:glbs modify
   data modify storage mny:glbs modify.tag.display.Lore append from entity @e[type=minecraft:item,limit=1,nbt={Item:{tag:{GLBSlore:1b}}}] Item.tag.display.Lore[]

   #清除石头
   kill @e[type=minecraft:item,nbt={Item:{tag:{GLBSlore:1b}}}]

#编号
#把order设置为 #GLBSorder 的 GLBSinfo 记分板
execute store result storage mny:glbs modify.tag.glbs.order int 1 run scoreboard players get #GLBSorder GLBSinfo
# #GLBSorder 的 GLBSinfo 记分板 +1
scoreboard players add #GLBSorder GLBSinfo 1

#把命令存储 mny:glbs modify 后置插入 mny:glbs buy_op
data modify storage mny:glbs buy_op append from storage mny:glbs modify

#重置界面 和出售商店共用
function mny:glbs/minecart/edit/sell_add/ok_reset_complete

#音效
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1