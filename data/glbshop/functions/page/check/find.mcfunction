#在备份列表 mny:glbs copy 中查找是否有符合编号 #GLBScheck GLBSinfo 的元素

#每一次执行都为 #GLBScheck_num GLBSinfo 加 1 分 方便查找后的翻页(不必再从第一页开始翻)
scoreboard players add #GLBScheck_num GLBSinfo 1

#将列表 mny:glbs copy 首个元素的order 存入 #GLBScheck_order 的 GLBSinfo 记分板
execute store result score #GLBScheck_order GLBSinfo run data get storage mny:glbs copy[0].tag.glbs.order

#判断
   #是 向命令存储 mny:glbs 添加 if_check:1b
   execute if score #GLBScheck_order GLBSinfo = #GLBScheck GLBSinfo run data modify storage mny:glbs if_check set value 1b
   #否 删除列表 mny:glbs copy 的首个元素 如果列表 mny:glbs copy 仍然存在首个元素,函数调用自身
   execute unless score #GLBScheck_order GLBSinfo = #GLBScheck GLBSinfo run data remove storage mny:glbs copy[0]
   execute unless score #GLBScheck_order GLBSinfo = #GLBScheck GLBSinfo if data storage mny:glbs copy[0] run function glbshop:page/check/find