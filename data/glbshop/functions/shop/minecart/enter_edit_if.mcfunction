##tag == GLBSop -> 进入编辑模式
##else -> 阻止

execute as @p[tag=GLBSop,distance=..5] if entity @a[tag=!GLBSop,distance=..5] run tellraw @a[distance=..5] [">> \u00a7c周围有普通权限玩家,商店拒绝进入编辑模式"]
execute unless entity @a[tag=GLBSop,distance=..5] as @a[distance=..5] run tellraw @a[distance=..5] [">> \u00a7c你不是商店管理员,商店拒绝进入编辑模式"]
execute unless entity @a[tag=!GLBSop,distance=..5] run tellraw @a[distance=..5] [">> \u00a7e已进入编辑模式"]
execute unless entity @a[tag=!GLBSop,distance=..5] run data modify entity @s Tags set value ["GLBShop","GLBSedit","GLBSedit0"]

tag @s remove GLBSmodify