#玩家背包里有商店物品 穷举清除

#清除拿在光标上的商店物品
clear @s #mny:glbs{glbs:{shop:1b}}

#清除放在格子上的物品
execute if data entity @s Inventory[{Slot:0b}].tag.glbs.shop run item replace entity @s hotbar.0 with minecraft:air
execute if data entity @s Inventory[{Slot:1b}].tag.glbs.shop run item replace entity @s hotbar.1 with minecraft:air
execute if data entity @s Inventory[{Slot:2b}].tag.glbs.shop run item replace entity @s hotbar.2 with minecraft:air
execute if data entity @s Inventory[{Slot:3b}].tag.glbs.shop run item replace entity @s hotbar.3 with minecraft:air
execute if data entity @s Inventory[{Slot:4b}].tag.glbs.shop run item replace entity @s hotbar.4 with minecraft:air
execute if data entity @s Inventory[{Slot:5b}].tag.glbs.shop run item replace entity @s hotbar.5 with minecraft:air
execute if data entity @s Inventory[{Slot:6b}].tag.glbs.shop run item replace entity @s hotbar.6 with minecraft:air
execute if data entity @s Inventory[{Slot:7b}].tag.glbs.shop run item replace entity @s hotbar.7 with minecraft:air
execute if data entity @s Inventory[{Slot:8b}].tag.glbs.shop run item replace entity @s hotbar.8 with minecraft:air

execute if data entity @s Inventory[{Slot:9b}].tag.glbs.shop run item replace entity @s inventory.0 with minecraft:air
execute if data entity @s Inventory[{Slot:10b}].tag.glbs.shop run item replace entity @s inventory.1 with minecraft:air
execute if data entity @s Inventory[{Slot:11b}].tag.glbs.shop run item replace entity @s inventory.2 with minecraft:air
execute if data entity @s Inventory[{Slot:12b}].tag.glbs.shop run item replace entity @s inventory.3 with minecraft:air
execute if data entity @s Inventory[{Slot:13b}].tag.glbs.shop run item replace entity @s inventory.4 with minecraft:air
execute if data entity @s Inventory[{Slot:14b}].tag.glbs.shop run item replace entity @s inventory.5 with minecraft:air
execute if data entity @s Inventory[{Slot:15b}].tag.glbs.shop run item replace entity @s inventory.6 with minecraft:air
execute if data entity @s Inventory[{Slot:16b}].tag.glbs.shop run item replace entity @s inventory.7 with minecraft:air
execute if data entity @s Inventory[{Slot:17b}].tag.glbs.shop run item replace entity @s inventory.8 with minecraft:air
execute if data entity @s Inventory[{Slot:18b}].tag.glbs.shop run item replace entity @s inventory.9 with minecraft:air
execute if data entity @s Inventory[{Slot:19b}].tag.glbs.shop run item replace entity @s inventory.10 with minecraft:air
execute if data entity @s Inventory[{Slot:20b}].tag.glbs.shop run item replace entity @s inventory.11 with minecraft:air
execute if data entity @s Inventory[{Slot:21b}].tag.glbs.shop run item replace entity @s inventory.12 with minecraft:air
execute if data entity @s Inventory[{Slot:22b}].tag.glbs.shop run item replace entity @s inventory.13 with minecraft:air
execute if data entity @s Inventory[{Slot:23b}].tag.glbs.shop run item replace entity @s inventory.14 with minecraft:air
execute if data entity @s Inventory[{Slot:24b}].tag.glbs.shop run item replace entity @s inventory.15 with minecraft:air
execute if data entity @s Inventory[{Slot:25b}].tag.glbs.shop run item replace entity @s inventory.16 with minecraft:air
execute if data entity @s Inventory[{Slot:26b}].tag.glbs.shop run item replace entity @s inventory.17 with minecraft:air
execute if data entity @s Inventory[{Slot:27b}].tag.glbs.shop run item replace entity @s inventory.18 with minecraft:air
execute if data entity @s Inventory[{Slot:28b}].tag.glbs.shop run item replace entity @s inventory.19 with minecraft:air
execute if data entity @s Inventory[{Slot:29b}].tag.glbs.shop run item replace entity @s inventory.20 with minecraft:air
execute if data entity @s Inventory[{Slot:30b}].tag.glbs.shop run item replace entity @s inventory.21 with minecraft:air
execute if data entity @s Inventory[{Slot:31b}].tag.glbs.shop run item replace entity @s inventory.22 with minecraft:air
execute if data entity @s Inventory[{Slot:32b}].tag.glbs.shop run item replace entity @s inventory.23 with minecraft:air
execute if data entity @s Inventory[{Slot:33b}].tag.glbs.shop run item replace entity @s inventory.24 with minecraft:air
execute if data entity @s Inventory[{Slot:34b}].tag.glbs.shop run item replace entity @s inventory.25 with minecraft:air
execute if data entity @s Inventory[{Slot:35b}].tag.glbs.shop run item replace entity @s inventory.26 with minecraft:air