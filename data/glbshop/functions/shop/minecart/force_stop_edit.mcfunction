##编辑模式周围有普通权限玩家 -> kill

tellraw @a[tag=GLBSop,distance=..5] [">> \u00a7c附近有普通权限玩家,编辑模式已中断"]
execute as @a[tag=GLBSop,distance=..5] at @s run playsound minecraft:item.shield.break player @s ~ ~ ~ 1 1
function glbshop:kill_minecart