data modify storage mny:glbs modify set from entity @s Items[{Slot:11b}]
execute unless data storage mny:glbs {modify:{id:"minecraft:barrier"}} run function mny:glbs/minecart/edit/trans/div/div
data modify entity @s Items[{Slot:11b}] set from storage mny:glbs modify