#矿车执行 引导玩家跳转到某一页

#通知
#tellraw @p ["\u00a7b\u00a7l============ < 全球商店 > ============\n           \u00a72------ >页面跳转< ------\n\n","        ",{"text":"<全球商品售货架>","bold":true,"color":"gold","clickEvent":{"action":"suggest_command","value":"/trigger GLBSpage_shop set 填写售货架页面"}},"        ",{"text":"<你正在出售的商品>","bold":true,"color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger GLBSpage_issell set 填写你正在出售商品的页面"}},"\n       ",{"text":"<你的历史购买商品>","bold":true,"color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger GLBSpage_bought set 填写你历史购买商品的页面"}},"       ",{"text":"<你的历史出售商品>","bold":true,"color":"gold","clickEvent":{"action":"suggest_command","value":"/trigger GLBSpage_sold set 填写你历史出售商品的页面"}},"\n\n              \u00a72------ >页面跳转< ------\n\u00a7b\u00a7l============ < 全球商店 > ============"]

playsound minecraft:entity.villager.work_librarian player @p[distance=..5] ~ ~ ~ 0.5 1

tellraw @p[distance=..5] ["\u00a77▬▬▬▬▬▬▬▬▬▬▬▬▬跳转页面▬▬▬▬▬▬▬▬▬▬▬▬▬"]
tellraw @p[distance=..5] [">> ",{"text":"<全球商品>","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger GLBSpage_shop set ?"}}]
tellraw @p[distance=..5] [">> ",{"text":"<我正在出售的商品>","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger GLBSpage_issell set ?"}}]
tellraw @p[distance=..5] [">> ",{"text":"<我的历史购买商品>","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger GLBSpage_bought set ?"}}]
tellraw @p[distance=..5] [">> ",{"text":"<我的历史出售商品>","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger GLBSpage_sold set ?"}}]
tellraw @p[distance=..5] [">> \u00a76点击来选择功能,将 “?” 替换为页面序号"]
tellraw @p[distance=..5] ["\u00a77▬▬▬▬▬▬▬▬▬▬▬▬▬跳转页面▬▬▬▬▬▬▬▬▬▬▬▬▬"]

#关闭矿车页面
#data mny:glbs summon_in_main -> display main gui
data modify storage mny:glbs summon_in_main set value 1b
execute as @p run function mny:glbs/summon
function glbshop:kill_minecart