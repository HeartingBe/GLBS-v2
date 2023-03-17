#if hopper around -> kill minecart

tag @s remove GLBSno_hopper

execute unless entity @e[type=minecraft:hopper_minecart,distance=..2] unless block ~-1 ~ ~-1 #glbshop:ban_block unless block ~-1 ~ ~ #glbshop:ban_block unless block ~-1 ~ ~1 #glbshop:ban_block unless block ~ ~ ~-1 #glbshop:ban_block unless block ~ ~ ~ #glbshop:ban_block unless block ~ ~ ~1 #glbshop:ban_block unless block ~1 ~ ~-1 #glbshop:ban_block unless block ~1 ~ ~ #glbshop:ban_block unless block ~1 ~ ~1 #glbshop:ban_block positioned ~ ~-1 ~ unless block ~-1 ~ ~-1 #glbshop:ban_block unless block ~-1 ~ ~ #glbshop:ban_block unless block ~-1 ~ ~1 #glbshop:ban_block unless block ~ ~ ~-1 #glbshop:ban_block unless block ~ ~ ~ #glbshop:ban_block unless block ~ ~ ~1 #glbshop:ban_block unless block ~1 ~ ~-1 #glbshop:ban_block unless block ~1 ~ ~ #glbshop:ban_block unless block ~1 ~ ~1 #glbshop:ban_block run tag @s add GLBSno_hopper

execute if entity @s[tag=!GLBSno_hopper] run tellraw @a[distance=..5] [">> \u00a7c商店它不喜欢漏斗和漏斗矿车!"]

#音效(幻术师)
execute if entity @s[tag=!GLBSno_hopper] as @a[distance=..5] at @s run playsound minecraft:entity.illusioner.mirror_move player @s ~ ~ ~ 1 1.25

execute if entity @s[tag=!GLBSno_hopper] run function glbshop:kill_minecart