## 每过 1d 时长，所有商品售货架剩余时间减少 1d（前置函数）

execute if data storage mny:glbs shop[0] as @r at @s run function glbshop:timer

#自我循环
schedule function glbshop:timer_pre 1d append