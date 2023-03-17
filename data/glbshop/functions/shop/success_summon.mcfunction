##玩家成功主动召唤矿车

tellraw @s ["<\u00a7bGLBS\u00a7f> Hello! ",{"selector":"@s","color":"yellow"}]
playsound minecraft:block.shulker_box.open player @s ~ ~ ~ 1 1
function mny:glbs/summon

##开启矿车检测
function glbshop:continue_minecart