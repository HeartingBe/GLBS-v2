##由矿车执行 显示该玩家正在出售的物品

#score #GLBSuid_self GLBSinfo = thisPlayer GLBSuid
scoreboard players operation #GLBSuid_self GLBSinfo = @p GLBSuid

#data mny:glbs copy2 = mny:glbs shop
data modify storage mny:glbs copy2 set from storage mny:glbs shop

#data mny:glbs copy -> remove
data remove storage mny:glbs copy

#如果 data mny:glbs copy2 有元素
#-> run function mny:glbs/minecart/modify/issell_find
#-> 找出对应uid的元素
#-> 存进列表 mny:glbs copy
execute if data storage mny:glbs copy2[0] run function mny:glbs/minecart/modify/issell_find

#display(@s == 矿车)
   #score #GLBStemp GLBSinfo = @s GLBSissell 
   scoreboard players operation #GLBStemp GLBSinfo = @s GLBSissell

   #data mny:glbs copy -> remove 1 ~ #GLBStemp-GLBSinfo
   execute if score #GLBStemp GLBSinfo matches 2.. run function mny:glbs/minecart/modify/delete_pre_element

   #display
   function mny:glbs/minecart/modify/display