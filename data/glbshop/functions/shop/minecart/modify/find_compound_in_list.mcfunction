##data mny:glbs copy
##-> 查找对应uid的复合标签
##-> data mny:glbs copy = <compound>.entries

#thisPlay's uid 存储在 score #GLBSuid_self GLBSinfo

#score #GLBSuid_in_compound GLBSinfo = data mny:glbs copy[0].uid
execute store result score #GLBSuid_in_compound GLBSinfo run data get storage mny:glbs copy[0].uid

#data mny:glbs copy -> 找对应 uid 的复合标签
   #if ==?
      #true
      #->data mny:glbs copy = mny:glbs copy[0].entries
      execute if score #GLBSuid_self GLBSinfo = #GLBSuid_in_compound GLBSinfo run data modify storage mny:glbs copy set from storage mny:glbs copy[0].entries
      #false
      #-> data mny:glbs copy[0] -> remove
      #-> loop
      execute unless score #GLBSuid_self GLBSinfo = #GLBSuid_in_compound GLBSinfo run data remove storage mny:glbs copy[0]
      execute unless score #GLBSuid_self GLBSinfo = #GLBSuid_in_compound GLBSinfo run function mny:glbs/minecart/modify/find_compound_in_list