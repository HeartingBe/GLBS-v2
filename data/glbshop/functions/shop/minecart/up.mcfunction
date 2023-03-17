#上翻 只可能是 2 3 4 5 6 调用
#对应记分板 GLBSsell_op GLBSbuy_op GLBSshop GLBSissell GLBSback GLBSsold GLBSbought

##up -> 首页
scoreboard players set @s[tag=GLBSedit2,scores={GLBSsell_op=..24}] GLBSsell_op 1
scoreboard players set @s[tag=GLBSedit4,scores={GLBSbuy_op=..24}] GLBSbuy_op 1
scoreboard players set @s[tag=GLBSsell,scores={GLBSsell_op=..24}] GLBSsell_op 1
scoreboard players set @s[tag=GLBSbuy,scores={GLBSbuy_op=..24}] GLBSbuy_op 1
scoreboard players set @s[tag=GLBS3,scores={GLBSissell=..24}] GLBSissell 1
scoreboard players set @s[tag=GLBS4,scores={GLBSback=..24}] GLBSback 1
scoreboard players set @s[tag=GLBS5,scores={GLBSbought=..24}] GLBSbought 1
scoreboard players set @s[tag=GLBS6,scores={GLBSsold=..24}] GLBSsold 1

##up -> 非首页
scoreboard players remove @s[tag=GLBSedit2,scores={GLBSsell_op=25..}] GLBSsell_op 24
scoreboard players remove @s[tag=GLBSedit4,scores={GLBSbuy_op=25..}] GLBSbuy_op 24
scoreboard players remove @s[tag=GLBSsell,scores={GLBSsell_op=25..}] GLBSsell_op 24
scoreboard players remove @s[tag=GLBSbuy,scores={GLBSbuy_op=25..}] GLBSbuy_op 24
scoreboard players remove @s[tag=GLBS2,scores={GLBSshop=25..}] GLBSshop 24
scoreboard players remove @s[tag=GLBS3,scores={GLBSissell=25..}] GLBSissell 24
scoreboard players remove @s[tag=GLBS4,scores={GLBSback=25..}] GLBSback 24
scoreboard players remove @s[tag=GLBS5,scores={GLBSbought=25..}] GLBSbought 24
scoreboard players remove @s[tag=GLBS6,scores={GLBSsold=25..}] GLBSsold 24

tag @s remove GLBSmodify