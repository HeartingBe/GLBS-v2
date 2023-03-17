##玩家无uid -> 分配uid

##分配
scoreboard players operation @s GLBSuid = #GLBSuid GLBSinfo

##initialize
   #initialize list -> back 退回
   data modify storage mny:glbs back append value {uid:0,entries:[]}
   execute store result storage mny:glbs back[-1].uid int 1 run scoreboard players get @s GLBSuid
   #initialize list -> bought 历史购买
   data modify storage mny:glbs bought append value {uid:0,entries:[]}
   execute store result storage mny:glbs bought[-1].uid int 1 run scoreboard players get @s GLBSuid
   #initialize list -> sold 历史出售
   data modify storage mny:glbs sold append value {uid:0,earn:0,entries:[]}
   execute store result storage mny:glbs sold[-1].uid int 1 run scoreboard players get @s GLBSuid

##uid++
scoreboard players add #GLBSuid GLBSinfo 1