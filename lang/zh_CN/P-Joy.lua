-- translation for JoyPackage

return {
	["kuso"] = "重口味包",

	["shit"] = "屎",
	[":shit"] = "当此牌在<font color='red'><b>你的回合</b></font>内从你的<font color='red'>手牌</font>进入<font color='red'>弃牌堆</font>时，\
	你将受到自己对自己的1点伤害（黑桃为流失1点体力），其中方块为无属性伤害、梅花为雷电伤害、红桃为火焰伤害\
	造成伤害的牌为此牌，在你的回合内，你可多次食用",
	["$ShitLostHp"] = "%from 吃了 %card, 将流失1点体力",
	["$ShitDamage"] = "%from 吃了 %card, 将受到自己对自己的1点伤害",

	["stink"] = "屁",
	[":stink"] = "出牌阶段对下家使用，除非目标角色打出一张【闪】或【行刺】，否则必须和自己的下家（你的下下家）交换位置；若目标打出了【行刺】，你受到其造成的一点伤害",
	["@haochou"] = "你的上家（%src）对你放了一个臭屁，你可以【闪】开，也可以用【行刺】千年杀之~ 否则，嘿嘿……",
	["#StinkSuccess"] = "实在是太臭了，%from 赶紧跑到了 %to 的后面",
	["#StinkHit"] = "%from 听声辨味忍无可忍，对 %to 使用了【行刺】，只听 %to 一声惨叫",
	["#StinkJink"] = "%from 察觉不对，打出了【闪】，逃之夭夭",

-- equips
	["joy"] = "欢乐包",

	["monkey"] = "猴子",
	[":monkey"] = "装备后，当场上有其他角色使用【桃】时，你可以弃掉【猴子】，阻止【桃】的结算并将其收为手牌",
	["grab_peach"] = "偷桃",

	["gale-shell"] = "狂风甲",
	[":gale-shell"] = "锁定技，每次受到火焰伤害时，该伤害+1；你可以将狂风甲装备和你距离为1以内的一名角色的装备区内",
	["#GaleShellDamage"] = "%from 装备【狂风甲】的负面技能被触发，由 %arg 点火焰伤害增加到 %arg2 点火焰伤害",

	["poison"] = "毒",
	[":poison"] = "出牌阶段，对和你距离为1以内的一名角色使用，令其进入中毒状态或解除中毒状态。当回复体力时，有20%的几率解除中毒状态。进入中毒状态的角色有以下负面效果：<br/>1、回合开始时随机丢失自己区域内的一张牌<br/>2、使用酒时失去一点体力",
	["#Poison_in"] = "%from 不幸中毒，脸色青紫，看起来情况不是很好",
	["#Poison_out"] = "%from 解毒成功，身体恢复了健康",
	["$Poison_lost"] = "%from 毒发，剧痛难忍，丢失了 %card",
	["#Poison_ana"] = "%from 毒发！剧痛难忍，将自己抓出了条条血痕",

-- generals
	["joyer"] = "满头包",

	["#miheng"] = "孤胆愤青",
	["miheng"] = "祢衡",
	["designer:miheng"] = "Log67、宇文天启",
	["cv:miheng"] = "",
	["yulu"] = "语录",
	[":yulu"] = "出牌阶段，你可以将2~5张手牌按一定顺序移出游戏作为语录的词汇：红桃视为〖我〗，黑桃视为〖日〗，方片视为〖你〗，梅花视为〖妹〗",
	["numa"] = "怒骂",
	[":numa"] = "回合结束阶段，你可以大声朗读（使用）当前语录（见详解）",
	["jieao"] = "桀骜",
	[":jieao"] = "锁定技，回合开始阶段，若你的手牌数小于当前体力值，立即摸2张牌",
	["word"] = "语录表",
	["yuluword"] = "请选择一张手牌加入语录表",
	["numah"] = "我",
	["numas"] = "日",
	["numad"] = "你",
	["numac"] = "妹",
	["#Numasingle"] = "%from 说：%arg",
	["#Numa_hc"] = "语录词汇匹配成功！效果：回复1点体力",
	["#Numa_dc"] = "语录词汇匹配成功！效果：令一名角色弃掉两张手牌",
	["#Numa_cc"] = "语录词汇匹配成功！效果：清空一名角色的判定区",
	["#Numa_sd"] = "语录词汇匹配成功！效果：令一名其他角色给你一张手牌，然后其回复1点体力",
	["#Numa_hs"] = "语录词汇匹配成功！效果：做一次判定，若为肉或梁山聚义，你永久获得技能【反唇】（你可以把对你造成伤害的牌加入语录）",
	["fanchun"] = "反唇",
	[":fanchun"] = "祢衡专用隐藏技，你可以把对你造成伤害的牌加入语录表",
	["#Numa_hsc"] = "语录词汇匹配成功！效果：指定一名其他女性角色，你和她各回复1点体力",
	["#Numa_hsd"] = "语录词汇匹配成功！效果：指定一名其他男性角色，你和他各回复1点体力",
	["#Numa_dsh"] = "语录词汇匹配成功！效果：令一名角色对你使用【杀】，否则将所有牌给你",
	["#Numa_sdc"] = "语录词汇匹配成功！效果：视为对任意一名角色使用一张【杀】；若〖日〗牌点数小于5，此杀为雷杀，若大于9，此杀为火杀",
	["#Numa_shc"] = "语录词汇匹配成功！效果：令一名角色对自己造成1点伤害，然后其回复一点体力",
	["#Numa_hhh"] = "语录词汇匹配成功！效果：将自己翻面并摸三张牌",
	["#Numa_sss"] = "语录词汇匹配成功！效果：令一名角色翻面并摸X张牌，X为你损失的体力",
	["#Numa_ddd"] = "语录词汇匹配成功！效果：将自己当前语录表的词汇牌给一名角色",
	["#Numa_ccc"] = "语录词汇匹配成功！效果：清空一名角色的装备区",
	["#Numa_dcdc"] = "语录词汇匹配成功！效果：指定一名角色开始一个额外的回合",
	["#Numa_hsdc"] = "语录词汇匹配成功！效果：视为喝酒后对任意一名角色使用一张【杀】",
	["#Numa_ccsh"] = "语录词汇匹配成功！效果：回复体力至体力上限",
	["#Numa_dsdc"] = "语录词汇匹配成功！效果：令一名角色观看另一名角色的手牌",
	["#Info_dsdc"] = "%from 观看了 %to 的手牌",
	["#Numa_dshc"] = "语录词汇匹配成功！效果：自杀",
	["numat"] = "测试员特权",
	["numat:kno"] = "不，还不能死！",
	["numat:kyes"] = "不想活了……",
	["#Numa_dshcc"] = "语录词汇匹配成功！效果：弃掉一名角色四张牌，之后对自己造成2点伤害",
	["#Numa_hsdcc"] = "语录词汇匹配成功！效果：限定技，对一名角色连续造成1点雷电伤害、1点火焰伤害、1点无属性伤害，之后自己流失2点体力",
	["#Numa_dcshc"] = "语录词汇匹配成功！效果：限定技，自减1点体力并从每名角色那里获得一张手牌，然后将你的武将牌翻面",
	["#Numa_ssdcc"] = "语录词汇匹配成功！效果：限定技，立即激活场上存在的一个【闪电】",
	["#Numa_ssscc"] = "语录词汇匹配成功！效果：限定技，指定一名体力上限比你多的角色并令其进行二选一：1.增加2点体力上限并永久获得技能【负伤】；2.增加1点体力上限并永久获得技能【顿悟】",
	["numa:bthx"] = "MaxHP+2，获得【负伤】",
	["numa:wump"] = "MaxHP+1，获得【顿悟】",
	["#Numa_4wd"] = "语录词汇貌似匹配完成……效果：觉醒技，增加2点体力上限并失去当前的所有技能",
	["#Numa_tequan"] = "%from 使用了测试员特权，取消了当前语法的效果",
	["numat:suno"] = "我不要变素将！",
	["numat:suyes"] = "变素将？我喜欢~",
	["#Numa_5wd"] = "语录词汇匹配紊乱……效果：觉醒技，减去1点体力上限",
	["numat:lhno"] = "我错了……",
	["numat:lhyes"] = "体力上限我不要了~",
	["#Numa_wds"] = "语录系统故障，原因为负载过多……效果：觉醒技，减去2点体力上限",
	["#Numa_git"] = "语录词汇匹配失败！你没有获得任何效果",
	["~miheng"] = "独在异乡为异客，穿越之后倍思亲……",

	["#maque"] = "国粹精品", -- hp12
	["maque"] = "麻雀",
	["designer:maque"] = "宇文天启",
	["cv:maque"] = "",
	["timer"] = "计时",
	[":timer"] = "锁定技，回合开始时，你失去1点体力上限。",
	["lingyu"] = "领域",
	[":lingyu"] = "锁定技，除了【肉】，回合内你的所有卡牌都无法按牌面说明使用。",
	["eding"] = "额定",
	[":eding"] = "锁定技，分发起始手牌时，共发你13张牌作为手牌。任何时候，你的牌（包括“碰”牌）只能有13张，除非满足游戏结束条件。",
	["zhuangche"] = "撞车",
	[":zhuangche"] = "若其他角色非弃牌阶段进入弃牌堆的牌正好和你手中对子的点数相同，你可以将其凑成一副置于你的武将牌上，称为“副”。\
	★对子：两张相同点数的牌",
	["@zhuangche"] = "%src 的 %arg 进入弃牌堆，点数为 %dest，你可以发动【撞车】。",
	["zouma"] = "走马",
	[":zouma"] = "锁定技，你的判定、出牌、弃牌阶段自动跳过。摸牌阶段，你只能摸一张牌，之后须将满足一副规则的牌作为“副”置于你的武将牌上。\
	★一副规则：三张点数相同或点数连续的牌",
	["fu1"] = "一副",
	["fu2"] = "二副",
	["fu3"] = "三副",
	["fu4"] = "四副",
	["@zouma"] = "你须将满足一副规则的牌作为“副”置于你的武将牌上。",
	["jizha"] = "叽喳",
	[":jizha"] = "锁定技，当你只有一个对子，其余全是“副”牌的时候（此时总牌数为14张），游戏结束。你所在的阵营获得游戏胜利。",
--	[":jizha"] = "锁定技，当你有七个对子，或只有一个对子，其余全是“一副”牌的时候（此时总牌数为14张），游戏结束。你所在的阵营获得游戏胜利。",
}
