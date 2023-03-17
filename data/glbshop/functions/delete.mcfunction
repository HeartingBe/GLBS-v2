#重置全部内容

tellraw @a [">> \u00a7e成功重置全球商店的全部信息"]
playsound minecraft:item.shield.break player @s ~ ~ ~ 1 1

kill @e[type=minecraft:chest_minecart,tag=GLBShop]

data remove storage mny:glbs shop
data remove storage mny:glbs back
data remove storage mny:glbs back_pre
data remove storage mny:glbs bought
data remove storage mny:glbs sold
data remove storage mny:glbs modify
data remove storage mny:glbs copy
data remove storage mny:glbs copy2
data remove storage mny:glbs copy3
data remove storage mny:glbs test
data remove storage mny:glbs test2

#已修改过货币转换功能的开关状态的标志 -> 去除
data modify storage mny:glbs trans_on_off_modified set value 1b

# 停止函数 timer_pre 的 schedule
schedule clear glbshop:timer_pre

#金钱记分板
scoreboard objectives remove GLBSmoney
#信息存储记分板
scoreboard objectives remove GLBSinfo
#商店触发记分板
scoreboard objectives remove GLBS
#出售触发记分板
scoreboard objectives remove GLBSsell
#翻页触发记分板
   scoreboard objectives remove GLBSpage_shop
   scoreboard objectives remove GLBSpage_issell
   scoreboard objectives remove GLBSpage_bought
   scoreboard objectives remove GLBSpage_sold
#查找触发记分板
   scoreboard objectives remove GLBScheck_shop
   scoreboard objectives remove GLBScheck_bought
   scoreboard objectives remove GLBScheck_sold
#虚拟uid
scoreboard objectives remove GLBSuid
#翻页记录记分板
   #查看出售商店
   scoreboard objectives remove GLBSsell_op
   #查看回收商店
   scoreboard objectives remove GLBSbuy_op
   #查看售货架
   scoreboard objectives remove GLBSshop
   #查看正在出售
   scoreboard objectives remove GLBSissell
   #查看被退回
   scoreboard objectives remove GLBSback
   #查看历史出售
   scoreboard objectives remove GLBSsold
   #查看历史购买
   scoreboard objectives remove GLBSbought

data remove storage mny:glbs trans
data remove storage mny:glbs trans_item

function glbshop:load