data modify storage mny:glbs modify set from entity @s Items[{Slot:13b}]
execute unless data storage mny:glbs {modify:{id:"minecraft:barrier"}} run function mny:glbs/minecart/edit/sell_add/div/div
data modify entity @s Items[{Slot:13b}] set from storage mny:glbs modify