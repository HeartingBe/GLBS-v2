#时间未到 修改timer和Lore

# #GLBStimer_modify GLBSinfo -1
scoreboard players remove #GLBStimer_modify GLBSinfo 1

#生成一块石头 解析Lore 显示剩余时间 修改Lore 已重写 改为插入到辅助盔甲架
#写入Lore
   #生成一块石头 解析Lore 共有1行 石头带有tag:{GLBSlore:1b}
   #loot spawn ~ ~ ~ loot glbshop:timer

   loot replace entity @e[type=minecraft:armor_stand,tag=GLBSLore] armor.head loot glbshop:timer

   #命令存储 mny:glbs copy 第一个元素的Lore的倒数第四个元素(显示剩余时间)设置为石头的Lore
   data modify storage mny:glbs copy[0].tag.display.Lore[-4] set from entity @e[type=minecraft:armor_stand,tag=GLBSLore,limit=1] ArmorItems[3].tag.display.Lore[0]

   #清除石头
   #kill @e[type=minecraft:item,nbt={Item:{tag:{GLBSlore:1b}}}]

#修改timer
execute store result storage mny:glbs copy[0].tag.glbs.timer int 1 run scoreboard players get #GLBStimer_modify GLBSinfo

#结果后置插入回列表 mny:glbs shop
data modify storage mny:glbs shop append from storage mny:glbs copy[0]

#去除列表 mny:glbs copy 第一个元素
data remove storage mny:glbs copy[0]