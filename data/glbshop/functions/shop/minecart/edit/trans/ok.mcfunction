#更改货币转换 -> 通过

#通知
tellraw @p[tag=GLBSop,distance=..5] [">> \u00a7e成功修改金钱兑换的物品和(或)比率"]

#写进命令存储 mny:glbs modify 暂存
data modify storage mny:glbs modify set from entity @s Items[{Slot:15b}]

#金钱数量 -> #GLBStrans_money GLBSinfo
scoreboard players operation #GLBStrans_money GLBSinfo = #GLBStemp_price GLBSinfo
#物品数量 -> #GLBStrans_num GLBSinfo
execute store result score #GLBStrans_num GLBSinfo run data get storage mny:glbs modify.Count

#modify -> 写入 mny:glbs trans -> 变成商店物品 -> 写入Lore
data modify storage mny:glbs trans[{Slot:15b}] set from storage mny:glbs modify
data modify storage mny:glbs trans[{Slot:15b}].tag.glbs.shop set value 1b
   #写入Lore
   #生成石头 解析Lore 石头带有tag:{GLBSlore:1b}
   loot spawn ~ ~ ~ loot glbshop:trans_item_lore

   #石头的Lore 后置插入 mny:glbs trans[{Slot:15b}].tag.display.Lore
   data modify storage mny:glbs trans[{Slot:15b}].tag.display.Lore append from entity @e[type=minecraft:item,limit=1,nbt={Item:{tag:{GLBSlore:1b}}}] Item.tag.display.Lore[]

   #清除石头
   kill @e[type=minecraft:item,nbt={Item:{tag:{GLBSlore:1b}}}]

#更新 mny:glbs trans[{Slot:11b}] 的 Lore
   #写入Lore
   #生成石头 解析Lore 石头带有tag:{GLBSlore:1b}
   loot spawn ~ ~ ~ loot glbshop:trans_item_money

   #石头的Lore[0] 设置到 mny:glbs trans[{Slot:11b}].tag.display.Lore[-3]
   data modify storage mny:glbs trans[{Slot:11b}].tag.display.Lore[-3] set from entity @e[type=minecraft:item,limit=1,nbt={Item:{tag:{GLBSlore:1b}}}] Item.tag.display.Lore[0]

   #清除石头
   kill @e[type=minecraft:item,nbt={Item:{tag:{GLBSlore:1b}}}]

#去掉 Slot 和 Count 方便扣除时比较
data remove storage mny:glbs modify.Slot
data remove storage mny:glbs modify.Count
#data storage mny:glbs modify -> storage mny:glbs trans_item
data modify storage mny:glbs trans_item set from storage mny:glbs modify

#音效
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1

#返回编辑界面主菜单
data modify entity @s Tags set value ["GLBShop","GLBSedit","GLBSedit0"]