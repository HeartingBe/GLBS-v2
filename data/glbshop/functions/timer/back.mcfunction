#时间到 退回物品 #已重写 删除该函数

#将物品修改完后 存放在复合标签 mny:glbs modify 中

   #将列表 mny:glbs copy 的第一个元素复制到复合标签 mny:glbs modify
   data modify storage mny:glbs modify set from storage mny:glbs copy[0]

   #写入Lore 已取消 改为直接去掉Lore
      #移除商品 Lore 第 -4、-2 行 并在商品的 Lore 中插入"已退回" "按 Q 取回"提示
      #data remove storage mny:glbs modify.tag.display.Lore[-4]
      #data remove storage mny:glbs modify.tag.display.Lore[-2]
      #data modify storage mny:glbs modify.tag.display.Lore insert -2 value '{"text":"","italic":false,"extra":[{"text":"已退回 ","color":"dark_red"},{"text":"理由：主动退回","color":"dark_gray"}]}'
      #data modify storage mny:glbs modify.tag.display.Lore insert -2 value '{"text":"","italic":false,"extra":[{"text":"按 ","color":"aqua"},{"text":"Q","color":"yellow"},{"text":" 取回","color":"aqua"}]}'
      data remove storage mny:glbs modify.tag.display.Lore[-1]
      data remove storage mny:glbs modify.tag.display.Lore[-1]
      data remove storage mny:glbs modify.tag.display.Lore[-1]
      data remove storage mny:glbs modify.tag.display.Lore[-1]
      data remove storage mny:glbs modify.tag.display.Lore[-1]
      data remove storage mny:glbs modify.tag.display.Lore[-1]
      data remove storage mny:glbs modify.tag.display.Lore[-1]
      data remove storage mny:glbs modify.tag.display.Lore[-1]
      data remove storage mny:glbs modify.tag.display.Lore[-1]
      #如果Lore没有元素 去掉Lore
      execute unless data storage mny:glbs modify.tag.display.Lore[0] run data remove storage mny:glbs modify.tag.display.Lore

   #去掉glbs 在此之前先保存uid 
   execute store result score #GLBSself_if GLBSinfo run data get storage mny:glbs modify.tag.glbs.uid
   data remove storage mny:glbs modify.tag.glbs
   
   #如果没有Name也没有Lore也没有color 去掉display
   execute unless data storage mny:glbs modify.tag.display.Name unless data storage mny:glbs modify.tag.display.Lore unless data storage mny:glbs modify.tag.display.color run data remove storage mny:glbs modify.tag.display

   #下面是难点 判断物品的tag是否是空标签 如果是需要移除 否则会造成存在空标签tag:{}而导致无法和其它同样的物品堆叠
   #把命令存储 mny:glbs if_empty_tag 设置为 {}
   data modify storage mny:glbs if_empty_tag set value {}
   #把命令存储 mny:glbs if_empty_tag 和命令存储 mny:glbs modify.tag 执行合并操作 把结果存储在记分板 #GLBSif_empty_tag GLBSinfo
   execute store success score #GLBSif_empty_tag GLBSinfo run data modify storage mny:glbs if_empty_tag merge from storage mny:glbs modify.tag
      #结果为0 说明命令存储 mny:glbs modify.tag是空标签 删除
      execute if score #GLBSif_empty_tag GLBSinfo matches 0 run data remove storage mny:glbs modify.tag

#经以上步骤 复合标签 mny:glbs modify 即可写入该玩家的退回列表
   #将列表 mny:glbs back 复制到列表 mny:glbs copy2 此处不能使用列表 mny:glbs copy 因为timer函数中列表 mny:glbs copy 是列表 mny:glbs shop 的备份
   data modify storage mny:glbs copy2 set from storage mny:glbs back

   #直接删除列表 mny:glbs back
   data remove storage mny:glbs back

   # #GLBSself_if GLBSinfo 记分板已提前存储玩家的uid
   #物品执行函数 mny:glbs/buy/back_found_if 逐项判断
   #如果检测到对应uid的子元素 将停止执行mny:glbs/buy/back_found_if 并且命令存储 mny:glbs 将存在标签 if_back:1b
   function mny:glbs/buy/back_found_if

   #如果命令存储 mny:glbs 存在标签 if_back:1b 即找到了子元素 执行函数 mny:glbs/buy/back_found 且此时 mny:glbs copy2 中一般还存在元素 全部后置插入回 mny:glbs back
   execute if data storage mny:glbs if_back run function mny:glbs/buy/back_found
   execute if data storage mny:glbs if_back run data modify storage mny:glbs back append from storage mny:glbs copy2[]

   #去除命令存储 mny:glbs 的标签 if_back:1b
   data remove storage mny:glbs if_back