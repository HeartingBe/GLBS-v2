# 3x3x2 不能有漏斗
execute unless entity @e[type=minecraft:hopper_minecart,distance=..2] unless block ~-1 ~ ~-1 #glbshop:ban_block unless block ~-1 ~ ~ #glbshop:ban_block unless block ~-1 ~ ~1 #glbshop:ban_block unless block ~ ~ ~-1 #glbshop:ban_block unless block ~ ~ ~ #glbshop:ban_block unless block ~ ~ ~1 #glbshop:ban_block unless block ~1 ~ ~-1 #glbshop:ban_block unless block ~1 ~ ~ #glbshop:ban_block unless block ~1 ~ ~1 #glbshop:ban_block positioned ~ ~-1 ~ unless block ~-1 ~ ~-1 #glbshop:ban_block unless block ~-1 ~ ~ #glbshop:ban_block unless block ~-1 ~ ~1 #glbshop:ban_block unless block ~ ~ ~-1 #glbshop:ban_block unless block ~ ~ ~ #glbshop:ban_block unless block ~ ~ ~1 #glbshop:ban_block unless block ~1 ~ ~-1 #glbshop:ban_block unless block ~1 ~ ~ #glbshop:ban_block unless block ~1 ~ ~1 #glbshop:ban_block run tag @s add GLBSno_hopper