##编辑模式 从 sell_op 中删除对应 order 的物品

#判断出售商店里还有没有这个商品
   #有 则命令存储 mny:glbs 的标签 if_found:1b 且在函数 mny:glbs/sell_op/remove_pre 中继续后续步骤
   function mny:glbs/sell_op/remove_pre

   #没有
      execute unless data storage mny:glbs if_found run tellraw @p [">> \u00a7c出售商店中的这个商品已被移除"]
      #sound(幻术师)
      execute unless data storage mny:glbs if_found run playsound minecraft:entity.illusioner.mirror_move player @s ~ ~ ~ 1 1.25

#data mny:glbs if_found -> remove
data remove storage mny:glbs if_found

#更新矿车
execute as @e[type=minecraft:chest_minecart,tag=GLBShop,distance=..5] run function mny:glbs/minecart/modify/pre