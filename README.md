# GLBS-v2

A datapack for adding a shopping system to vanilla minecraft

经过测试，GLBS-v2 兼容到 minecraft 1.17.x，与插件端的兼容性需要测试。

tip: 如果你正在游玩更高版本的 minecraft，恭喜你，我正在最新版本的 minecraft 上重构 GLBS！带来了一系列优化，并提供基于 item_display 的全新 UI 界面，请留意 GLBS 的更新信息。

---

### 基本功能

- 玩家
  - 上架
  - 购买
  - 退回
  - 查询与定位
- 管理员
  - 配置服务器出售与回收选项

---

### 使用方法

#### 玩家

`/trigger GLBS set 1`
打开 GLBS

#### 管理员

`/scoreboard players set #GLBStimer GLBSinfo <物品上架时间上限>`
修改物品上架时间上限(单位：游戏日 = 20分钟 默认是 72 游戏日 ≈ 1 现实日)

`/function glbshop:instant_timer`
立刻度过 1 个游戏日的商品上架时间统计周期
GLBS 以 1 游戏日为 1 个周期处理商品的上架时间上限
执行该函数将立刻进行一次处理，不会影响游戏内的实际时间

`/function glbshop:delete`
抹去本数据包的全部存储信息
回到首次载入这个数据包时的状态，非必要慎用

`/function glbshop:function/order`
快速设置 - 禁止时间流逝、禁止天气变化、
禁止命令方块发送消息、死亡不掉落、
时间调整为正午，天气调整为晴天（测试专用）

---

### 自定义禁用物品

在原版中，生存玩家能获得的对商店构成威胁的仅有漏斗，它能从中吸走物品而无法被检测。
但我考虑到你可能会和其他模组一起使用，也许会有类似漏斗一样的方块需要防范。
鉴于这点，我在写防漏斗机制时并不是单一地使用漏斗，而是引用了一个方块标签，
它位于：
`.../data/glbshop/tags/blocks/ban_block.json`
文件中
将你的希望和漏斗作同样处理的方块 ID 添加进这个方块标签，让 GLBS 更加安全！
正确的添加格式是在 values 数组中继续添加字符串，也可以添加具有下列形式的 json 对象：

```json
{
    "id": "<namespace>:<id>",
    "required": false
}
```



---

GLBS 提供了一个接口函数来兼容你的服务器经济记分板（默认使用 "money"），如果有必要，请修改它：

`.../data/glbshop/functions/money.mcfunction`:

```
#>> 修改方法: 服务器的 <金钱> 记分板替换 指令1 和 指令2 的 money

#这是一个修改示例, 假如服务器的金钱记分板是 myMoney 则：

   #命令1 修改为(此处是为了注释, 你修改的时候前面不必加 "#" 符号)
   #execute unless data storage mny:glbs money_modify run scoreboard players operation @p GLBSmoney = @p myMoney

   #命令2 修改为(此处是为了注释, 你修改的时候前面不必加 "#" 符号)
   #execute if data storage mny:glbs money_modify run scoreboard players operation @p myMoney = @p GLBSmoney


#=====================只能修改两分割线之间的内容=====================#
#命令1
execute unless data storage mny:glbs money_modify run scoreboard players operation @p GLBSmoney = @p myMoney

#命令2
execute if data storage mny:glbs money_modify run scoreboard players operation @p myMoney = @p GLBSmoney
#=====================只能修改两分割线之间的内容=====================#

#下面两个命令不允许修改
execute if data storage mny:glbs money_modify run scoreboard players reset @p GLBSmoney
data remove storage mny:glbs money_modify
```

---

### 技术性信息

命名空间 `glbshop`
scoreboard 前缀 `GLBS`
实体标签前缀 `GLBS`
单次命令执行上限 `524280`(原版默认为 `65536`，GLBS 将它扩大到 `8` 倍)
