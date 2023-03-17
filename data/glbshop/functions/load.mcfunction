## load

#音效
execute as @a at @s run playsound minecraft:block.note_block.bell player @s
#通知
tellraw @a ["\u00a77▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬"]
tellraw @a [">> [\u00a7e全球商店V2.1\u00a7f] -> \u00a7a载入"]
tellraw @a [">> 作者: \u00a7eMini_Ye"]
tellraw @a [">> 所属: \u00a7e虚灵工坊"]
tellraw @a [">> Bilibili: \u00a7e创小业"]
tellraw @a [">> minecraft: \u00a7eMini_Ye"]
tellraw @a ["\u00a77▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬"]

#命令连锁次数 x8
gamerule maxCommandChainLength 524280

# 设置 timer 函数
schedule clear glbshop:timer_pre
schedule function glbshop:timer_pre 1d append
schedule clear glbshop:1s
function glbshop:1s

#添加队伍 GLBSmc 商店矿车加入队伍取消碰撞体积
team add GLBSmc
team modify GLBSmc collisionRule never

#计时记分板 已知用处：玩家上架冷却
scoreboard objectives add GLBStimer dummy
#金钱记分板 转换为使用 GLBSmoney，自定义金钱记分板默认为 money
scoreboard objectives add GLBSmoney dummy
scoreboard objectives add money dummy

#主记分板
scoreboard objectives add GLBSinfo dummy
   #物品在售货架的时间上限 默认 72d
   execute unless score #GLBStimer GLBSinfo matches 1.. run scoreboard players set #GLBStimer GLBSinfo 72
   #商店编号
   execute unless score #GLBSorder GLBSinfo matches 1.. run scoreboard players set #GLBSorder GLBSinfo 1
   #uid
   execute unless score #GLBSuid GLBSinfo matches 1.. run scoreboard players set #GLBSuid GLBSinfo 1
   #每页展示数 TODO 强制24
   execute unless score #GLBSperpage GLBSinfo matches 24 run scoreboard players set #GLBSperpage GLBSinfo 24
#召唤商店触发记分板
scoreboard objectives add GLBS trigger
#出售触发记分板
scoreboard objectives add GLBSsell trigger
#翻页触发记分板
   scoreboard objectives add GLBSpage_shop trigger
   scoreboard objectives add GLBSpage_issell trigger
   scoreboard objectives add GLBSpage_bought trigger
   scoreboard objectives add GLBSpage_sold trigger
#查找触发记分板
   scoreboard objectives add GLBScheck_shop trigger
   scoreboard objectives add GLBScheck_bought trigger
   scoreboard objectives add GLBScheck_sold trigger
#虚拟uid
scoreboard objectives add GLBSuid dummy
#翻页记录记分板
   #查看出售商店
   scoreboard objectives add GLBSsell_op dummy
   #查看回收商店
   scoreboard objectives add GLBSbuy_op dummy
   #查看售货架
   scoreboard objectives add GLBSshop dummy
   #查看正在出售
   scoreboard objectives add GLBSissell dummy
   #查看被退回
   scoreboard objectives add GLBSback dummy
   #查看历史出售
   scoreboard objectives add GLBSsold dummy
   #查看历史购买
   scoreboard objectives add GLBSbought dummy

#货币转换功能默认关闭，trans_on_off_modified 表示管理员进行过设置
execute unless data storage mny:glbs trans_on_off_modified run data modify storage mny:glbs trans_close set value 1b

#初始化功能按钮 TODO 简化
data modify storage mny:glbs botton set value [{Slot:8b,id:"minecraft:lime_stained_glass_pane",Count:1b,tag:{glbs:{shop:1b},display:{Name:'{"text":"上一页","color":"yellow","italic":false}',Lore:['{"text":""}','{"text":"","italic":false,"extra":[{"text":"按 ","color":"white"},{"text":"Q","color":"yellow"},{"text":" 或 ","color":"white"},{"text":"左键","color":"yellow"},{"text":" 来翻到上一页","color":"white"}]}']}}},{Slot:17b,id:"minecraft:structure_void",Count:1b,tag:{glbs:{shop:1b},display:{Name:'{"text":"返回上一级菜单","color":"red","italic":false}',Lore:['{"text":""}','{"text":"","italic":false,"extra":[{"text":"按 ","color":"white"},{"text":"Q","color":"yellow"},{"text":" 或 ","color":"white"},{"text":"左键","color":"yellow"},{"text":" 来返回主菜单","color":"white"}]}']}}},{Slot:26b,id:"minecraft:lime_stained_glass_pane",Count:1b,tag:{glbs:{shop:1b},display:{Name:'{"text":"下一页","color":"yellow","italic":false}',Lore:['{"text":""}','{"text":"","italic":false,"extra":[{"text":"按 ","color":"white"},{"text":"Q","color":"yellow"},{"text":" 或 ","color":"white"},{"text":"左键","color":"yellow"},{"text":" 来翻到下一页","color":"white"}]}']}}}]

#初始化分数 TODO 检查是否有误
execute unless score #GLBStrans_money GLBSinfo matches 1.. run scoreboard players set #GLBStrans_money GLBSinfo 1
execute unless score #GLBStrans_num GLBSinfo matches 1.. run scoreboard players set #GLBStrans_num GLBSinfo 1

#初始化金钱转换的矿车物品数据
execute unless data storage mny:glbs trans_item run data modify storage mny:glbs trans_item set value {id:"minecraft:emerald"}
execute unless data storage mny:glbs trans run data modify storage mny:glbs trans set value [{Slot:0b,id:"minecraft:black_stained_glass_pane"},{Slot:1b,id:"minecraft:black_stained_glass_pane"},{Slot:2b,id:"minecraft:black_stained_glass_pane"},{Slot:3b,id:"minecraft:black_stained_glass_pane"},{Slot:4b,id:"minecraft:black_stained_glass_pane"},{Slot:5b,id:"minecraft:black_stained_glass_pane"},{Slot:6b,id:"minecraft:black_stained_glass_pane"},{Slot:7b,id:"minecraft:black_stained_glass_pane"},{Slot:8b,id:"minecraft:black_stained_glass_pane"},{Slot:9b,id:"minecraft:black_stained_glass_pane"},{Slot:10b,id:"minecraft:black_stained_glass_pane"},{Slot:11b,id:"minecraft:paper",tag:{display:{Name:'"\\u00a76金钱"',Lore:['"\\u00a77▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬"','"\\u00a7e物品 \\u00a7f>> \\u00a7e金钱"','"\\u00a7d1 \\u00a7f>> \\u00a7d1"','"\\u00a7f按 \\u00a7eQ \\u00a7f或 \\u00a7e左键 \\u00a7f兑换"','"\\u00a77▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬"']}}},{Slot:12b,id:"minecraft:black_stained_glass_pane"},{Slot:13b,id:"minecraft:black_stained_glass_pane"},{Slot:14b,id:"minecraft:black_stained_glass_pane"},{Slot:15b,id:"minecraft:emerald",tag:{display:{Lore:['"\\u00a77▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬"','"\\u00a7e金钱 \\u00a7f>> \\u00a7e物品"','"\\u00a7d1 \\u00a7f>> \\u00a7d1"','"\\u00a7f按 \\u00a7e左键 \\u00a7f兑换"','"\\u00a77▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬"']}}},{Slot:16b,id:"minecraft:black_stained_glass_pane"},{Slot:17b,id:"minecraft:structure_void",tag:{display:{Name:'"\\u00a7c返回主菜单"',Lore:['""','"\\u00a7f按 \\u00a7eQ \\u00a7f或 \\u00a7e左键 \\u00a7c回到主菜单"']}}},{Slot:18b,id:"minecraft:black_stained_glass_pane"},{Slot:19b,id:"minecraft:black_stained_glass_pane"},{Slot:20b,id:"minecraft:black_stained_glass_pane"},{Slot:21b,id:"minecraft:black_stained_glass_pane"},{Slot:22b,id:"minecraft:black_stained_glass_pane"},{Slot:23b,id:"minecraft:black_stained_glass_pane"},{Slot:24b,id:"minecraft:black_stained_glass_pane"},{Slot:25b,id:"minecraft:black_stained_glass_pane"},{Slot:26b,id:"minecraft:black_stained_glass_pane"}]
data modify storage mny:glbs trans[] merge value {Count:1b,tag:{glbs:{shop:1b}}}
data modify storage mny:glbs trans[{id:"minecraft:black_stained_glass_pane"}].tag.display.Name set value '"\\u00a7d小业是个呆瓜"'
execute store result storage mny:glbs trans[{Slot:15b}].Count byte 1 run scoreboard players get #GLBStrans_num GLBSinfo