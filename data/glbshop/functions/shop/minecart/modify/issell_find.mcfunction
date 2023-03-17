##在 data mny:glbs copy2 中找出对应uid的元素 -> 存入 mny:glbs copy

#score GLBSuid_in_list GLBSinfo = data mny:glbs copy2[0].uid
execute store result score #GLBSuid_in_list GLBSinfo run data get storage mny:glbs copy2[0].tag.glbs.uid

#if == -> data mny:glbs copy = mny:glbs copy2[0]
execute if score #GLBSuid_in_list GLBSinfo = #GLBSuid_self GLBSinfo run data modify storage mny:glbs copy append from storage mny:glbs copy2[0]

#data mny:glbs copy2[0] -> remove
data remove storage mny:glbs copy2[0]

#if data mny:glbs copy2[0] -> loop
execute if data storage mny:glbs copy2[0] run function mny:glbs/minecart/modify/issell_find