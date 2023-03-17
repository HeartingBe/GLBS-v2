##close
tellraw @p ["<\u00a7bGLBS\u00a7f> \u00a7eSee you next time~ "]
execute as @p at @s run playsound minecraft:block.shulker_box.close player @s ~ ~ ~ 1 1
function glbshop:kill_minecart