#查找售货架

#备份分数 @s GLBScheck_shop 到 #GLBScheck GLBSinfo
# #GLBScheck GLBSinfo 代表要查找的编号
scoreboard players operation #GLBScheck GLBSinfo = @s GLBScheck_shop

#复制备份 mny:glbs copy
data modify storage mny:glbs copy set from storage mny:glbs shop

#在备份列表 mny:glbs copy 中查找是否有符合编号 #GLBScheck GLBSinfo 的元素 使用同一函数glbshop:page/check/find 如果找到 则 mny:glbs shop 存在if_check:1b
function glbshop:page/check/find

# #GLBScheck_num GLBSinfo 存储查找次数 即从第几个元素开始显示
scoreboard players operation @e[type=minecraft:chest_minecart,distance=..3] GLBSshop = #GLBScheck_num GLBSinfo

#判断 if_check:1b
   #未找到
   execute unless data storage mny:glbs if_check run tellraw @s [">> \u00a7c未能在全球商品中找到编号为 ",{"score":{"name":"#GLBScheck","objective":"GLBSinfo"},"color":"yellow"}," \u00a7c的商品"]
   #找到
      #周围没有商店矿车 生成
      execute if data storage mny:glbs if_check unless entity @e[type=minecraft:chest_minecart,tag=GLBShop,limit=1,sort=nearest] run function mny:glbs/summon
      #修改矿车为售货架
      execute if data storage mny:glbs if_check run data modify entity @e[type=minecraft:chest_minecart,tag=GLBShop,limit=1,sort=nearest] Tags set value ["GLBShop","GLBS2"]
      #通知
      execute if data storage mny:glbs if_check run tellraw @s [">> 已从全球商品中找到编号 ",{"score":{"name":"#GLBScheck","objective":"GLBSinfo"},"color":"yellow"}," \u00a7f的商品"]

#令矿车更新
execute as @e[type=minecraft:chest_minecart,tag=GLBShop,distance=..5] run function mny:glbs/minecart/modify/pre

scoreboard players reset @s GLBScheck_shop