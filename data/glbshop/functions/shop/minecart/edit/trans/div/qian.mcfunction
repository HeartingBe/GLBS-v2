data modify storage mny:glbs modify set from entity @s Items[{Slot:10b}]
execute unless data storage mny:glbs {modify:{id:"minecraft:barrier"}} run function mny:glbs/minecart/edit/trans/div/div
data modify entity @s Items[{Slot:10b}] set from storage mny:glbs modify