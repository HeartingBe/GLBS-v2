#下翻 只可能是 2 3 4 5 6 调用
#对应记分板 GLBSsell_op GLBSbuy_op GLBSshop GLBSissell GLBSback GLBSsold GLBSbought

scoreboard players add @s[tag=GLBSedit2] GLBSsell_op 24
scoreboard players add @s[tag=GLBSedit4] GLBSbuy_op 24
scoreboard players add @s[tag=GLBSsell] GLBSsell_op 24
scoreboard players add @s[tag=GLBSbuy] GLBSbuy_op 24
scoreboard players add @s[tag=GLBS2] GLBSshop 24
scoreboard players add @s[tag=GLBS3] GLBSissell 24
scoreboard players add @s[tag=GLBS4] GLBSback 24
scoreboard players add @s[tag=GLBS5] GLBSbought 24
scoreboard players add @s[tag=GLBS6] GLBSsold 24

tag @s remove GLBSmodify