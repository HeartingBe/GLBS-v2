#小伙伴你好,感谢你使用我的数据包
#这个函数允许你把自己的金钱记分板与该数据包连接
#经过正确的修改,全球商店就会完全使用你的金钱记分板
#金钱记分板默认是 money, 如果你用的也是它, 就不必修改啦
#如果你需要修改, 只需修改这个函数, 不用(也不要)修改其他的内容

#>> 修改方法: 你的 <金钱> 记分板替换 指令1 和 指令2 的 money

#这是一个修改示例, 假如你的金钱记分板是 JinBi 则：

   #命令1 修改为(此处是为了注释, 你修改的时候前面不必加 "#" 符号)
   #execute unless data storage mny:glbs money_modify run scoreboard players operation @p GLBSmoney = @p JinBi

   #命令2 修改为(此处是为了注释, 你修改的时候前面不必加 "#" 符号)
   #execute if data storage mny:glbs money_modify run scoreboard players operation @p JinBi = @p GLBSmoney


#=============================只能修改两分割线之间的内容=============================#
#命令1
execute unless data storage mny:glbs money_modify run scoreboard players operation @p GLBSmoney = @p money

#命令2
execute if data storage mny:glbs money_modify run scoreboard players operation @p money = @p GLBSmoney
#=============================只能修改两分割线之间的内容=============================#

#下面两个命令不允许修改
execute if data storage mny:glbs money_modify run scoreboard players reset @p GLBSmoney
data remove storage mny:glbs money_modify