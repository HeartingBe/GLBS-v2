#玩家领取其通过出售商品所得收益

#判断周围是不是有多于1个的玩家
   #统计周围一定距离内的玩家数量 结果存储在记分板 #GLBS_too_many_players GLBSinfo
   execute store result score #GLBS_too_many_players GLBSinfo if entity @a[distance=..7]

   #是 失败
   execute if score #GLBS_too_many_players GLBSinfo matches 2.. run tellraw @a[distance=..5] [">> \u00a7c领取收入失败,你周围有其他玩家"]

   #否 成功
      #把玩家的uid存入 #GLBSuid_self GLBSinfo
      execute if score #GLBS_too_many_players GLBSinfo matches 1 run scoreboard players operation #GLBSuid_self GLBSinfo = @p GLBSuid

      #复制备份 mny:glbs copy
      execute if score #GLBS_too_many_players GLBSinfo matches 1 run data modify storage mny:glbs copy set from storage mny:glbs sold

      #删除列表 mny:glbs sold
      execute if score #GLBS_too_many_players GLBSinfo matches 1 run data remove storage mny:glbs sold

      #在列表mny:glbs copy 中查找对应uid的子元素 首个元素即是
      execute if score #GLBS_too_many_players GLBSinfo matches 1 run function mny:glbs/minecart/earn_find

      #把列表mny:glbs copy 首个元素的 earn 值存入记分板 #GLBSearn GLBSinfo
      execute if score #GLBS_too_many_players GLBSinfo matches 1 store result score #GLBSearn GLBSinfo run data get storage mny:glbs copy[0].earn

      #判断是否有收益
         #如果 =0 提示
         execute if score #GLBS_too_many_players GLBSinfo matches 1 if score #GLBSearn GLBSinfo matches 0 run tellraw @p [">> \u00a7c过去的时间里你还没有卖出商品哦"]

         #如果 >0 取回
            #此时不带有 mny:glbs money_modify:1b 执行函数 glbshop:money 把玩家使用的记分板搬到 GLBSmoney 
            execute if score #GLBS_too_many_players GLBSinfo matches 1 if score #GLBSearn GLBSinfo matches 1.. run function glbshop:money
            #音效
            execute if score #GLBS_too_many_players GLBSinfo matches 1 if score #GLBSearn GLBSinfo matches 1.. run playsound minecraft:entity.experience_orb.pickup player @p ~ ~ ~ 1 1
            #粒子效果
            execute if score #GLBS_too_many_players GLBSinfo matches 1 if score #GLBSearn GLBSinfo matches 1.. at @p run particle minecraft:block minecraft:gold_block ~ ~1 ~ 0.5 0.5 0.5 1 50 normal
            #作 + 运算
            execute if score #GLBS_too_many_players GLBSinfo matches 1 if score #GLBSearn GLBSinfo matches 1.. run scoreboard players operation @p GLBSmoney += #GLBSearn GLBSinfo
            #通知(必须在 + 运算后)
            execute if score #GLBS_too_many_players GLBSinfo matches 1 if score #GLBSearn GLBSinfo matches 1.. as @p run tellraw @s [">> 过去的时间里你出售物品赚了 ",{"score":{"name":"#GLBSearn","objective":"GLBSinfo"},"color":"yellow"}," \u00a7f金钱,现在你有 ",{"score":{"name":"@s","objective":"GLBSmoney"},"color":"yellow"}," \u00a7f金钱"]
            #修改命令存储 mny:glbs money_modify:1b 执行函数 glbshop:money 把 GLBSmoney 搬到玩家使用的记分板
            execute if score #GLBS_too_many_players GLBSinfo matches 1 if score #GLBSearn GLBSinfo matches 1.. run data modify storage mny:glbs money_modify set value 1b
            execute if score #GLBS_too_many_players GLBSinfo matches 1 if score #GLBSearn GLBSinfo matches 1.. run function glbshop:money

      #清除收益记录
      execute if score #GLBS_too_many_players GLBSinfo matches 1 run data modify storage mny:glbs copy[0].earn set value 0
      #剩余元素重新写回列表 mny:glbs sold
      execute if score #GLBS_too_many_players GLBSinfo matches 1 run data modify storage mny:glbs sold append from storage mny:glbs copy[]

#重新生成并kill自身 关闭交互界面
#data mny:glbs summon_in_main -> display main gui
#data modify storage mny:glbs summon_in_main set value 1b
#execute as @p run function mny:glbs/summon
#function glbshop:kill_minecart