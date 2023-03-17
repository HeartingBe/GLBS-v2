#矿车执行 引导玩家跳转到某个编号

#通知
#tellraw @p[distance=..5] ["\u00a7b\u00a7l============ < 全球商店 > ============\n           \u00a72------ >编号搜索< ------\n\n","        ",{"text":"<全球商品售货架>","bold":true,"color":"gold","clickEvent":{"action":"suggest_command","value":"/trigger GLBScheck_shop set 填写售货架商品编号"}},"       ",{"text":"<你的历史购买商品>","bold":true,"color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger GLBScheck_bought set 填写你历史购买商品的编号"}},"\n       ",{"text":"<你的历史出售商品>","bold":true,"color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger GLBScheck_sold set 填写你历史出售商品的编号"}},"\n\n              \u00a72------ >编号搜索< ------\n\u00a7b\u00a7l============ < 全球商店 > ============"]

playsound minecraft:entity.villager.work_librarian player @p[distance=..5] ~ ~ ~ 0.5 1

tellraw @p[distance=..5] ["\u00a77▬▬▬▬▬▬▬▬▬▬▬▬▬查找编号▬▬▬▬▬▬▬▬▬▬▬▬▬"]
tellraw @p[distance=..5] [">> ",{"text":"<全球商品>","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger GLBScheck_shop set ?"}}]
tellraw @p[distance=..5] [">> ",{"text":"<我的历史购买商品>","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger GLBScheck_bought set ?"}}]
tellraw @p[distance=..5] [">> ",{"text":"<我的历史出售商品>","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger GLBScheck_sold set ?"}}]
tellraw @p[distance=..5] [">> \u00a76点击来选择功能,将 “?” 替换为编号"]
tellraw @p[distance=..5] ["\u00a77▬▬▬▬▬▬▬▬▬▬▬▬▬查找编号▬▬▬▬▬▬▬▬▬▬▬▬▬"]

#关闭矿车页面
#data mny:glbs summon_in_main -> display main gui
data modify storage mny:glbs summon_in_main set value 1b
execute as @p[distance=..5] run function mny:glbs/summon
function glbshop:kill_minecart