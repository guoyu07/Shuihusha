-- QianJunWanMa Shuihusha part 1. code by: UbunTenkei

return {
	["QJWM"] = "千军万马",
	["DefaultDesigner"] = "烨子",
	["DefaultCV"] = "水浒杀配音室",
	["DefaultCoder"] = "宇文天启",
	["UnknowNick"] = "无绰号",

	["#_huarong"] = "小李广",
	["huarong"] = "花荣",
	["cv:huarong"] = "烨子",
	["jingzhun"] = "精准",
	[":jingzhun"] = "<b>锁定技</b>，出牌阶段，若你与目标角色的距离等于你的攻击范围，则你对该角色使用的【杀】不可被闪避。",
	["#Jingzhun"] = "%from 的锁定技【%arg】被触发，%to 不可闪避",
	["kaixian"] = "开弦",
	[":kaixian"] = "回合开始阶段，你可以展示一张点数不大于5的手牌，若如此做，你的攻击范围视为该牌的点数直到回合结束。",
	["@kaixian"] = "请展示一张点数不大于5的手牌，你的攻击范围将视为该牌的点数直到回合结束",
	["$Kaixian"] = "%from 展示了 %card，本回合 %from 的攻击范围视为 %card 的点数",
	["$jingzhun1"] = "箭迸寒星！",
	["$jingzhun2"] = "百发百中！",
	["$kaixian1"] = "弓开秋月分明。",
	["$kaixian2"] = "汝等可敢踏前一步？！",

	["#_liying"] = "扑天雕",
	["liying"] = "李应",
	["cv:liying"] = "烨子",
	["kong1iang"] = "控粮",
	[":kong1iang"] = "摸牌阶段，你可以摸X张牌，X为你的体力上限与你已损失的体力值之和，若如此做，你须展示你的手牌，弃置其中任意两种花色的所有牌（不足则全弃）。",
	["$kong1iang1"] = "大军未动，粮草先行！",
	["$kong1iang2"] = "粮草器械，尽在掌控之中。",

	["#_luzhishen"] = "花和尚",
	["luzhishen"] = "鲁智深",
	["cv:luzhishen"] = "声声melody猎狐",
	["liba"] = "力拔",
	[":liba"] = "出牌阶段，当你使用【杀】对目标角色造成伤害时，你可以展示该角色的一张手牌：若此牌不为基本牌，则你弃掉这张牌且该伤害+1。",
	["$ForceDiscardCard"] = "%from 弃掉了 %to 的 %card",
	["zuohua"] = "坐化",
	[":zuohua"] = "<b>锁定技</b>，杀死你的角色不能执行奖惩。",
	["#Zuohua"] = "%from 的锁定技【%arg】被触发，%to 不能执行奖惩",
	["$liba1"] = "哪用如此罗嗦，连根拔起便是！",
	["$liba2"] = "打甚鸟紧，看洒家的。",
	["$zuohua2"] = "听潮而圆，听信而寂。",
	["$zuohua1"] = "钱塘江上潮信来，今日方知我是我。",

	["#_wusong"] = "行者",
	["wusong"] = "武松",
	["fuhu"] = "伏虎",
	["cv:wusong"] = "声声melody猎狐",
	[":fuhu"] = "其他角色每使用【杀】造成一次伤害，你可以弃置一张基本牌，视为你对该角色使用了一张【杀】，若该基本牌为【酒】，则该【杀】造成的伤害+1。",
	["@fuhu"] = "你可以弃置一张基本牌，发动【伏虎】（视为对 %src 使用一张【杀】）",
	["$Fuhu"] = "%from 弃置了 %card，这张【杀】具有伤害+1的效果",
	["$fuhu1"] = "小小大虫，有何可惧？",
	["$fuhu2"] = "哨棒断了，俺还有一双拳头！",

	["#_shijin"] = "九纹龙",
	["shijin"] = "史进",
	["wubang"] = "舞棒",
	["cv:shijin"] = "烨子",
	[":wubang"] = "其他角色的武器牌进入弃牌堆时，你可以获得之。",
	["xiagu"] = "侠骨",
	[":xiagu"] = "任意角色受到无属性伤害时，你可以弃置一张装备牌，令该伤害-1.",
	["@xiagu"] = "你可以弃置一张装备牌发动【侠骨】（令该伤害-1）",
	["$Xiagu"] = "%from 发动了【侠骨】，弃置了 %card，令 %to 受到的伤害 -1",
	["$wubang1"] = "哪位教头再来点拨？",
	["$wubang2"] = "看我耍枪弄棒！",
	["$xiagu1"] = "大郎在此，这厮休得无礼。",
	["$xiagu2"] = "诸位哥哥，小弟来挡！",

	["#_yanqing"] = "浪子",
	["yanqing"] = "燕青",
	["dalei"] = "打擂",
	["cv:yanqing"] = "烨子",
	[":dalei"] = "出牌阶段，你可以和一名男性角色拼点。若你赢，你获得以下技能直到回合结束：你每对该角色造成1点伤害，可以令除该角色外的任一角色回复1点体力。若你没赢，该角色对你造成1点伤害。每回合限一次。",
	["fuqin"] = "抚琴",
	[":fuqin"] = "你每受到一次伤害，可弃掉伤害来源的X张牌或令任一角色摸X张牌，X为你已损失的体力值。",
	["fuqin:yan"] = "弃掉伤害来源的X张牌",
	["fuqin:qing"] = "令任一角色摸X张牌",
	["fuqin:nil"] = "不发动",
	["$dalei1"] = "梁山好汉只需一人，便可溃汝相扑天下！",
	["$dalei2"] = "来，擂台上见真章！",
	["$fuqin1"] = "听听最后的旋律吧！",
	["$fuqin2"] = "一曲激昂助士气！",

	["#_zhuwu"] = "神机军师",
	["zhuwu"] = "朱武",
	["pozhen"] = "破阵",
	["cv:zhuwu"] = "烨子",
	[":pozhen"] = "<b>锁定技</b>，你使用的非延时类锦囊不能被【无懈可击】或【将计就计】响应。",
	["buzhen"] = "布阵",
	[":buzhen"] = "<font color=purple><b>限定技</b></font>，你可以跳过你的出牌阶段，交换任意两名角色的位置。",
	["@buvr"] = "布阵",
	["@buzhen"] = "你可以选择两名角色发动【布阵】（交换他们的位置）",
	["fangzhen"] = "方阵",
	[":fangzhen"] = "<b>锁定技</b>，你不能成为体力比你多的角色使用【杀】或【决斗】的目标。",
	["$pozhen1"] = "洞察先机，无有不破！",
	["$pozhen2"] = "意志被摧毁了吗？",
	["$buzhen"] = "汝当作先锋，汝可为接应，大军严守生门，此战可定也！",

	["#_hantao"] = "百胜将",
	["hantao"] = "韩滔",
	["taolue"] = "韬略",
	["cv:hantao"] = "声声melody猎狐",
	[":taolue"] = "出牌阶段，你可以和一名角色拼点。若你赢，你可以将该角色判定区或装备区里的一张牌移到另一个合理的位置。若你没赢，你须弃置一张牌。每回合限一次。",
	["changsheng"] = "常胜",
	[":changsheng"] = "<b>锁定技</b>，你拼点的黑桃牌点数都视为K。",
	["#Changsheng"] = "%from 的锁定技【%arg】被触发，%from 拼点牌的点数视为K",
	["$changsheng1"] = "进可攻，退可守！",
	["$changsheng2"] = "流水无形而无不形。",
	["$taolue1"] = "斩杀敌将，犹如儿戏！",
	["$taolue2"] = "人上有人，天外有天。",

	["#_oupeng"] = "摩云金翅",
	["oupeng"] = "欧鹏",
	["zhanchi"] = "展翅",
	["cv:oupeng"] = "烨子",
	[":zhanchi"] = "<font color=purple><b>限定技</b></font>，你可以跳过你的判定阶段并弃掉你判定区里的所有牌，永久获得技能“腾飞”（<b>锁定技</b>，回合结束时，你须减1点体力上限，进行一个额外的回合；你的攻击范围与你的当前体力值相等）。",
	["@vfui"] = "展翅",
	["tengfei"] = "腾飞",
	[":tengfei"] = "<b>锁定技</b>，回合结束时，你须减1点体力上限，进行一个额外的回合；你的攻击范围等于你的当前体力值。",
	["#Tengfei"] = "%from 的锁定技【%arg】被触发，将进行一个额外的回合",
	["$zhanchi1"] = "迦楼罗，重生！",
	["$zhanchi2"] = "我要飞得更高！",
	["$zhanchi3"] = "以吾之血，毕其功于一役！",

	["#_shien"] = "金眼彪",
	["shien"] = "施恩",
	["longluo"] = "笼络",
	["cv:shien"] = "烨子",
	[":longluo"] = "当你成为【杀】的目标时，你可以亮出牌堆顶的两张牌，将其中的基本牌以任意分配方式交给任意角色并弃掉其余的牌。",
	["xiaozai"] = "消灾",
	[":xiaozai"] = "每当你受到伤害时，可以交给任一除伤害来源外的其他角色两张手牌，将该伤害转移给该角色。",
	["@xiaozai"] = "你可以交给除你和伤害来源外的一名角色两张手牌，将该伤害转移给该角色",
	["$longluo1"] = "小小心意，不成敬意。",
	["$longluo2"] = "好汉，且慢！",
	["$xiaozai1"] = "上下使得银两，可免三百杀威棒！",
	["$xiaozai2"] = "财可通神，只当破财消灾。",

	["#_luozhenren"] = "半仙",
	["luozhenren"] = "罗真人",
	["cv:luozhenren"] = "东方胤弘",
	["butian"] = "卜天",
	[":butian"] = "在任意角色的判定牌生效前，你可以弃置一张牌，观看牌堆顶的三张牌，将其中的任意一张牌与该判定牌进行交换。",
	["@butian-card"] = "请弃置一张牌，发动技能【卜天】（更改 %src 的 %arg 判定结果）",
	["huaxian"] = "化仙",
	[":huaxian"] = "当你进入濒死状态时，可以进行一次判定：若结果为红桃，你回复1点体力。",
	["$butian1"] = "掐指一算，万事尽知。",
	["$butian2"] = "天道？哈哈哈～",
	["$huaxian1"] = "脚著谢公屐，身登青云梯。",
	["$huaxian2"] = "天劫已度，上可登仙。",

	["#_wangqing"] = "楚王",
	["wangqing"] = "王庆",
	["qibing"] = "起兵",
	["cv:wangqing"] = "声声melody猎狐",
	[":qibing"] = "<b>锁定技</b>，摸牌阶段，你摸牌的数量为你的当前体力值且至多为4。\
★起兵是锁定技，不受自恃（段三娘技能）影响",
	["jiachu"] = "假楚",
	[":jiachu"] = "<font color=red><b>主公技</b></font>，其他民势力角色每受到1点伤害，可弃置一张红桃牌，令你回复1点体力。",
	["@jiachu"] = "你可以弃置一张红桃牌，令 %src 回复1点体力",
	["$qibing1"] = "吾军势大，霸业可成！",
	["$qibing2"] = "有此八州，天子可推，天下可得！",
	["$jiachu1"] = "江山已固。",
	["$jiachu2"] = "好一片繁华景象！",

-- last words
	["~huarong"] = "宋大哥！",
	["~liying"] = "兵粮寸断，以何取胜？！",
	["~wusong"] = "天人归天，这就是命啊！",
	["~shijin"] = "何以别离久，何以不得安。",
	["~yanqing"] = "主人，小乙辜负你了。",
	["~zhuwu"] = "生门已破，此战败也。",
	["~hantao"] = "终究还是败了。",
	["~oupeng"] = "呃～啊！连珠箭！",
	["~shien"] = "唉，散尽钱财，亦不能避祸，都不是等闲之辈啊！",
	["~luozhenren"] = "灾祸易躲，天命难违。",
	["~wangqing"] = "来世再不渡清江。",
}