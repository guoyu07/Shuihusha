-- QianJunWanMa Shuihusha part 1. code by: UbunTenkei

return {
	["QJWM"] = "千军万马",
	["DefaultDesigner"] = "烨子",
	["DefaultCV"] = "水浒杀配音室",
	
	["huarong"] = "小李广花荣",
	["jingzhun"] = "精准",
	[":jingzhun"] = "锁定技，出牌阶段，若你与目标角色的距离等于你的攻击范围，则你对该角色使用的【杀】不可被闪避。",
	["#Jingzhun"] = "%from 的锁定技【%arg】被触发，%to 不可闪避",
	["kaixian"] = "开弦",
	[":kaixian"] = "回合开始阶段，你可以展示一张点数不大于5的手牌，若如此做，你的攻击范围视为该牌的点数直到回合结束。",
	["@kaixian"] = "请展示一张点数不大于5的手牌，该牌的点数就是你的攻击范围",
	["$Kaixian"] = "%from 展示了 %card，本回合内他的攻击范围锁定为 %card 的点数",

	["liying"] = "扑天雕李应",
	["kongliang"] = "控粮",
	[":kongliang"] = "摸牌阶段，你可以摸X张牌，X为你的体力上限与你已损失的体力值之和，若如此做，你须展示你的手牌，弃置其中任意两种花色的所有牌（不足则全弃）。",

	["luzhishen"] = "花和尚鲁智深",
	["liba"] = "力拔",
	[":liba"] = "出牌阶段，当你使用【杀】对目标角色造成伤害时，你可以展示该角色的一张手牌：若此牌不为基本牌，则你弃掉这张牌且该伤害+1。",
	["$ForceDiscardCard"] = "%from 弃掉了 %to 的 %card", 
	["zuohua"] = "坐化",
	[":zuohua"] = "锁定技，杀死你的角色不能执行奖惩。",
	["#Zuohua"] = "%from 的锁定技【%arg】被触发，%to 不能执行奖惩",

	["wusong"] = "行者武松",
	["fuhu"] = "伏虎",
	[":fuhu"] = "其他角色每使用【杀】造成一次伤害，你可以弃置一张基本牌，视为你对该角色使用了一张【杀】，若该基本牌为【酒】，则该【杀】造成的伤害+1。",

	["shijin"] = "九纹龙史进",
	["wubang"] = "舞棒",
	[":wubang"] = "其他角色的武器牌进入弃牌堆时，你可以获得之。",
	["xiagu"] = "侠骨",
	[":xiagu"] = "任意角色受到无属性伤害时，你可以弃置一张装备牌，令该伤害-1。",

	["yanqing"] = "浪子燕青",
	["dalei"] = "打擂",
	[":dalei"] = "出牌阶段，你可以和一名男性角色拼点。若你赢，你获得以下技能直到回合结束：你每对该角色造成1点伤害，可以令除该角色外的任一角色回复1点体力。若你没赢，该角色对你造成1点伤害。每回合限一次。",
	["fuqin"] = "抚琴",
	[":fuqin"] = "你每受到一次伤害，可弃掉伤害来源的X张牌或令任一角色摸X张牌，X为你已损失的体力值。",

	["zhuwwu"] = "神机军师朱武",  
	["pozhen"] = "破阵",
	[":pozhen"] = "锁定技，你使用的非延时类锦囊不能被【无懈可击】或【将计就计】响应。",
	["buzhen"] = "布阵",
	[":buzhen"] = "限定技，你可以跳过你的出牌阶段，交换任意两名角色的位置。",
	["fangzhen"] = "方阵",
	[":fangzhen"] = "锁定技，你不能成为体力比你多的角色使用【杀】或【决斗】的目标。",

	["hantao"] = "百胜将韩滔",
	["taolue"] = "韬略",
	[":taolue"] = "出牌阶段，你可以和一名角色拼点。若你赢，你可以将该角色判定区或装备区里的一张牌移到另一个合理的位置。若你没赢，你须弃置一张牌。每回合限一次。",
	["changsheng"] = "常胜",
	[":changsheng"] = "锁定技，你拼点的黑桃牌点数都视为K。",

	["oupeng"] = "摩云金翅欧鹏",
	["zhanchi"] = "展翅",
	[":zhanchi"] = "限定技，你可以跳过你的判定阶段并弃掉你判定区里的所有牌，永久获得技能“腾飞”（锁定技，回合结束时，你须减1点体力上限，进行一个额外的回合；你的攻击范围与你的当前体力值相等）。",

	["shien"] = "金眼彪施恩",
	["longluo"] = "笼络",
	[":longluo"] = "当你成为【杀】的目标时，你可以亮出牌堆顶的两张牌，将其中的基本牌以任意分配方式交给任意角色并弃掉其余的牌。",
	["xiaozai"] = "消灾",
	[":xiaozai"] = "每当你受到伤害时，可以交给任一除伤害来源外的其他角色两张手牌，将该伤害转移给该角色。",

	["luozhenren"] = "半仙罗真人",  
	["butian"] = "卜天",
	[":butian"] = "在任意角色的判定牌生效前，你可以弃置一张牌，观看牌堆顶的三张牌，将其中的任意一张牌与该判定牌进行交换。",
	["huaxian"] = "化仙",
	[":huaxian"] = "当你进入濒死状态时，可以进行一次判定：若结果为红桃，你回复1点体力。",

	["wangqing"] = "楚王王庆",
	["qibing"] = "起兵",
	[":qibing"] = "锁定技，摸牌阶段，你摸牌的数量为你的当前体力值且至多为4。",
	["jiachu"] = "假楚",
	[":jiachu"] = "主公技，其他民势力角色每受到1点伤害，可弃置一张红桃牌，令你回复1点体力。",

}