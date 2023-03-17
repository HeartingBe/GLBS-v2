#翻页商店

#周围没有商店矿车 生成
execute unless entity @e[type=minecraft:chest_minecart,tag=GLBShop,limit=1,sort=nearest] run function mny:glbs/summon

#修改为售货架
data modify entity @e[type=minecraft:chest_minecart,tag=GLBShop,limit=1,sort=nearest] Tags set value ["GLBShop","GLBS2"]

#通知
tellraw @s [">> 已翻到全球商品的第 ",{"score":{"name":"@s","objective":"GLBSpage_shop"},"color":"yellow"}," \u00a7e页"]

#由于显示第 n 页需要减去前面 n-1 页数量的元素 故页数-1
scoreboard players remove @s GLBSpage_shop 1

#乘以每页的展示数 再+1
scoreboard players operation @s GLBSpage_shop *= #GLBSperpage GLBSinfo
scoreboard players add @s GLBSpage_shop 1

#设置 GLBSshop 记分板
scoreboard players operation @e[type=minecraft:chest_minecart,tag=GLBShop,limit=1,sort=nearest] GLBSshop = @s GLBSpage_shop

#令矿车更新
execute as @e[type=minecraft:chest_minecart,tag=GLBShop,distance=..5] run function mny:glbs/minecart/modify/pre

scoreboard players reset @s GLBSpage_shop