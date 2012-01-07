-- ZhechongYannan Shuihusha part 7.

return {
	["CGDK"] = "长歌当哭",

	["#_wuyong"] = "智多星",
	["wuyong"] = "吴用",
-- —— 体力值3 烨子 KOU 003
	["yunchou"] = "运筹",
	[":yunchou"] = "出牌阶段，你可以将你的任一锦囊牌当任一非延时类锦囊使用。每回合限一次。",
	["zhiqu"] = "智取",
	[":zhiqu"] = "你可以将你的任一装备牌当【将计就计】或【无懈可击】使用。",

	["#_ruanxiaoqi"] = "活阎罗",
	["ruanxiaoqi"] = "阮小七",
	["jueming"] = "绝命",
	[":jueming"] = "<b>锁定技</b>，你的回合外，若你的当前体力值为1，你不能成为【杀】、【决斗】和【行刺】的目标。",
	["jiuhan"] = "酒酣",
	[":jiuhan"] = "你在你濒死状态下使用【酒】，可以额外回复1点体力。",
	["#Jiuhan"] = "%from 发动了【%arg】，额外回复 %arg2 点体力。",

	["#_xiebao"] = "双尾蝎",
	["xiebao"] = "解宝",
-- —— 体力值4 烨子 MIN 035
	["liehuo"] = "猎获",
	[":liehuo"] = "出牌阶段，你使用【杀】对目标角色造成伤害时或该【杀】被【闪】抵消时，若目标角色的手牌数大于或等于你的手牌数，你可获得该角色的一张手牌。",
--[Q]装备【贯石斧】的解宝对角色使用【杀】被【闪】抵消时，手牌数小于该角色，如何结算？
--[A]解宝可以先发动武将技能【猎获】获得该角色的一张手牌，再发动武器技能【贯石斧】对该角色造成1点伤害时可以第二次发动【猎获】获得该角色的一张手牌。
--[Q]解宝使用属性【杀】触发连环后对处于连环状态的角色造成伤害时，是否可以发动【猎获】？
--[A]不可以。该角色不是【杀】的目标角色。

	["#_xiaorang"] = "圣手书生",
	["xiaorang"] = "萧让",
-- 体力值3 烨子 MIN 046
	["linmo"] = "临摹",
	[":linmo"] = "若其他角色对你使用的基本牌或非延时类锦囊结算完毕时进入弃牌堆，你可以将其置于你的武将牌上，称为“字”；出牌阶段，你可以将你的任一手牌当任意一张“字”使用。每回合限一次；回合结束时，你须将所有的“字”移入弃牌堆。",
	["zhaixing"] = "摘星",
	[":zhaixing"] = "在任意角色的判定牌生效前，若其为方块，你可以用自己的一张牌替换之，然后摸一张牌。",

	["#_yanglin"] = "锦豹子",
	["yanglin"] = "杨林",
-- 体力值3 烨子KOU 051
	["citan"] = "刺探",
	[":citan"] = "其他角色的弃牌阶段结束时，若该角色在此阶段中弃置的牌不少于两张，你可以观看一次该角色的手牌，并可以将其中的任意一张牌交给除该角色外的任一角色。每回合限一次。",

	["#_guosheng"] = "赛仁贵",
	["guosheng"] = "郭盛",
-- 体力值4 烨子 JIANG 055
	["bingji"] = "并戟",
	[":bingji"] = "出牌阶段，你可以弃置两张同类别的牌，视为你对至多X名其他角色（至少一名）使用一张【杀】，X为你已损失的体力值。",

	["#_fanrui"] = "混世魔王",
	["fanrui"] = "樊瑞",
-- 体力值3 烨子KOU 061
	["kongmen"] = "空门",
	[":kongmen"] = "<b>锁定技</b>，每当你失去最后一张手牌时，你回复1点体力。",
	["wudao"] = "悟道",
	[":wudao"] = "觉醒技，任意角色的回合开始时，若你没有手牌，你须摸两张牌，然后减1点体力上限，并永久获得技能“卜天”和“奇门”。",

	["#_malin"] = "铁笛仙",
	["malin"] = "马麟",
-- 体力值3 烨子KOU 067
	["lingdi"] = "灵笛",
	[":lingdi"] = "出牌阶段，你可以弃置一张牌并指定一名武将牌背面朝上和一名武将牌正面朝上的角色，令他们分别将其武将牌翻面。每回合限一次。",
	["qiaodou"] = "巧斗",
	[":qiaodou"] = "你每受到一次伤害，可以将伤害来源的武将牌翻面。",

	["#_tongwei"] = "出洞蛟",
	["tongwei"] = "童威",
-- 体力值3 烨子 MIN 068
	["dalang"] = "大浪",
	[":dalang"] = "你可以跳过你的判定阶段和摸牌阶段，将任一角色判定区里任意数量的牌依次移到另一个合理的位置。",
	["qianshui"] = "潜水",
	[":qianshui"] = "<b>锁定技</b>，没有装备武器的其他角色使用的【杀】或【行刺】对你无效。",

	["#_zhengtianshou"] = "白面郎君",
	["zhengtianshou"] = "郑天寿",
-- 体力值3 烨子KOU 074
	["wugou"] = "吴钩",
	[":wugou"] = "出牌阶段，你可以将两张相同颜色的基本牌当一张【行刺】使用。",
	["qiaojiang"] = "巧匠",
	[":qiaojiang"] = "你可以将你的任一黑色锦囊牌当【杀】、红色锦囊牌当【闪】使用或打出。",

	["#_lili"] = "催命判官",
	["lili"] = "李立",
-- 体力值3 烨子KOU 096
	["duoming"] = "夺命",
	[":duoming"] = "每当你使用【杀】对其他角色造成一次伤害，若该角色没有手牌，你可以令其减1点体力上限。",
	["moucai"] = "谋财",
	[":moucai"] = "其他角色每受到一次伤害，若该角色的手牌数大于你的当前体力值，你可以获得其一张手牌。",

	["#_lili"] = "母夜叉",
	["lili"] = "孙二娘",
-- 体力值3 烨子KOU 103
	["heidian"] = "黑店",
	[":heidian"] = "<b>锁定技</b>，其他角色每对你造成一次伤害，须弃置一张手牌；每当其他角色失去最后一张手牌时，须交给你一张装备区里的牌，否则失去1点体力。",
	["renrou"] = "人肉",
	[":renrou"] = "你可以立即获得死亡角色的所有牌，并以任意分配方式交给其他角色。", --遗计分牌
}
