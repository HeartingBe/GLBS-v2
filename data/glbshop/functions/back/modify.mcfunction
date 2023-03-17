#退回物品

#将物品修改完后 存放在复合标签 mny:glbs modify 中

   #将列表 mny:glbs copy 的第一个元素复制到复合标签 mny:glbs modify
   data modify storage mny:glbs modify set from storage mny:glbs copy[0]

   #修改Lore
   data modify storage mny:glbs modify.tag.display.Lore[-4] set value '""'
   data modify storage mny:glbs modify.tag.display.Lore[-3] set value '"\\u00a74商品已被退回"'
   data modify storage mny:glbs modify.tag.display.Lore[-2] set value '"\\u00a7f\\u00a7l按 \\u00a7e\\u00a7lQ \\u00a7f\\u00a7l取回物品"'

   #标记为退回物品
   data modify storage mny:glbs modify.tag.glbs.back set value 1b
   data remove storage mny:glbs modify.tag.glbs.sell

#经以上步骤 复合标签 mny:glbs modify 即可写入该玩家的退回列表
   #将列表 mny:glbs back 复制到列表 mny:glbs copy2 此处不能使用列表 mny:glbs copy 因为timer函数中列表 mny:glbs copy 是列表 mny:glbs shop 的备份
   data modify storage mny:glbs copy2 set from storage mny:glbs back

   #直接删除列表 mny:glbs back
   data remove storage mny:glbs back

   # #GLBSself_if GLBSinfo 记分板存储玩家的uid,此时它应该是被退回物品的uid
   execute store result score #GLBSuid_self GLBSinfo run data get storage mny:glbs modify.tag.glbs.uid
   #物品执行函数 mny:glbs/buy/back_found_if 逐项判断
   #如果检测到对应uid的子元素 将停止执行mny:glbs/buy/back_found_if 并且命令存储 mny:glbs 将存在标签 if_back:1b
   function mny:glbs/buy/back_found_if

   #如果命令存储 mny:glbs 存在标签 if_back:1b 即找到了子元素 执行函数 mny:glbs/buy/back_found 且此时 mny:glbs copy2 中一般还存在元素 全部后置插入回 mny:glbs back
   execute if data storage mny:glbs if_back run function mny:glbs/buy/back_found
   execute if data storage mny:glbs if_back run data modify storage mny:glbs back append from storage mny:glbs copy2[]

   #去除命令存储 mny:glbs 的标签 if_back:1b
   data remove storage mny:glbs if_back

#去除列表 mny:glbs copy 第一个元素 如果列表 mny:glbs copy 还存在元素 函数调用自身
data remove storage mny:glbs copy[0]
execute if data storage mny:glbs copy[0] run function glbshop:back/modify