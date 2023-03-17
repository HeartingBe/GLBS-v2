#玩家钱足够 成功购买

#扣除钱
scoreboard players operation @p GLBSmoney -= #GLBSprice GLBSinfo

#通知
execute as @p[distance=..5] run tellraw @s [">> 你花了 ",{"score":{"name":"#GLBSprice","objective":"GLBSinfo"},"color":"yellow"}," \u00a7f金钱从出售商店中购买了这个商品,还剩 ",{"score":{"name":"@s","objective":"GLBSmoney"},"color":"yellow"}," \u00a7f金钱"]

#将列表 mny:glbs copy 首个元素写入该玩家的历史购买物品
#使用格式相同 将物品修改完后 存放在复合标签 mny:glbs modify 中

   #将物品复制到复合标签 mny:glbs modify
   data modify storage mny:glbs modify set from entity @s Item
   #修改数量
   data modify storage mny:glbs modify.Count set from storage mny:glbs modify.tag.glbs.Count

   #修改Lore
      #移除商品 Lore 第 -4 行 并修改第 -2 行
      data remove storage mny:glbs modify.tag.display.Lore[-4]
      data modify storage mny:glbs modify.tag.display.Lore[-2] set value '"\\u00a7a\\u00a7l已购买"'

   #将复合标签 mny:glbs modify 代表的商品的 sell_op:1b标签去除 代表其不再是出售商店的商品
   data remove storage mny:glbs modify.tag.glbs.sell_op

#经以上步骤 复合标签 mny:glbs modify 即可写入该玩家的历史购买
   #写入购买玩家历史购买
      #将列表 mny:glbs bought 复制到列表 mny:glbs copy2
      data modify storage mny:glbs copy2 set from storage mny:glbs bought

      #直接删除列表 mny:glbs bought
      data remove storage mny:glbs bought

      #物品执行函数 mny:glbs/buy/successbought_if 逐项判断
      #如果检测到对应uid的子元素 将停止执行mny:glbs/buy/successbought_if 并且命令存储 mny:glbs 将存在标签 if_bought:1b
      function mny:glbs/buy/successbought_if

      #如果命令存储 mny:glbs 存在标签 if_bought:1b 即找到了子元素 执行函数 mny:glbs/buy/successbought 且此时 mny:glbs copy2 中一般还存在元素 全部后置插入回 mny:glbs bought
      execute if data storage mny:glbs if_bought run function mny:glbs/buy/successbought
      execute if data storage mny:glbs if_bought run data modify storage mny:glbs bought append from storage mny:glbs copy2[]

      #去除命令存储 mny:glbs 的标签 if_bought:1b
      data remove storage mny:glbs if_bought


#将列表 mny:glbs modify 修改为正常物品格式 并生成掉落物
data remove storage mny:glbs modify.tag.glbs
data remove storage mny:glbs modify.tag.display.Lore[-1]
data remove storage mny:glbs modify.tag.display.Lore[-1]
data remove storage mny:glbs modify.tag.display.Lore[-1]
data remove storage mny:glbs modify.tag.display.Lore[-1]
data remove storage mny:glbs modify.tag.display.Lore[-1]
data remove storage mny:glbs modify.tag.display.Lore[-1]
data remove storage mny:glbs modify.tag.display.Lore[-1]
data remove storage mny:glbs modify.tag.display.Lore[-1]
   #如果 Lore 没有元素 则去除Lore
   execute unless data storage mny:glbs modify.tag.display.Lore[0] run data remove storage mny:glbs modify.tag.display.Lore
   #如果复合标签 display 没有Lore 也没有Name 则去除display
   execute unless data storage mny:glbs modify.tag.display.Lore unless data storage mny:glbs modify.tag.display.Name run data remove storage mny:glbs modify.tag.display

#生成石头 携带标签GLBSitem
execute as @p[distance=..5] at @s run summon minecraft:item ~ ~ ~ {Tags:["GLBSitem"],PickupDelay:0s,Invulnerable:1b,Item:{id:"minecraft:stone",Count:1b}}
   #规定可以捡起的玩家
   data modify entity @e[type=minecraft:item,tag=GLBSitem,limit=1] Owner set from entity @p[distance=..5] UUID
   #更改物品信息
   data modify entity @e[type=minecraft:item,tag=GLBSitem,limit=1] Item set from storage mny:glbs modify
#去除标签GLBSitem
tag @e[type=minecraft:item,tag=GLBSitem] remove GLBSitem