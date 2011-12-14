-- translation for EventsPackage

return {
	["events"] = "事件牌",
	["events_package"] = "事件卡牌包",

	["jiefachang"] = "梁山好汉劫法场",
	[":jiefachang"] = "回合结束时，对任一武将牌背面朝上的角色使用。将目标角色的武将牌翻回正面。<br />拔刀相助：出牌阶段，你可以弃置这张牌，然后弃掉任一角色判定区里的一张牌。",
	["@jiefachang"] = "你可以使用【梁山好汉劫法场】事件牌，令一名武将牌背面向上的角色翻面",

	["daojia"] = "时迁盗甲",
	[":daojia"] = "场上一张【顺手牵羊】结算完毕后，对除你以外一名装备防具的角色使用。你获得该角色的防具。<br />偷天换日：出牌阶段，你可以将这张牌与牌堆顶第一张牌进行交换。",
	["@daojia"] = "你可以使用【时迁盗甲】事件牌，获取一名其他角色的防具",

	["tifanshi"] = "浔阳楼题反诗",
	[":tifanshi"] = "你使用【酒】执行第一项效果后，对自己使用。你摸X张牌，X为场上存活反贼数。<br />揭竿而起：出牌阶段，你可以弃置这张牌，令任一其他角色弃置一张牌。",
	["@tifanshi"] = "你可以使用【浔阳楼题反诗】事件牌，摸和场上反贼数目相同的牌",

	["ninedaygirl"] = "宋公明遇九天玄女",
	[":ninedaygirl"] = "当你受到一次大于1点的伤害时，对自己使用。防止此伤害。<br />仙人指路：出牌阶段，你可以弃置这张牌并指定任一有手牌的其他角色。你展示该角色的一张手牌并获得之。",
	["@ninedaygirl"] = "你可以使用【宋公明遇九天玄女】事件牌，防止自己所受到的 %src 点伤害",
	["#NineGirl"] = "%from 受到的 %arg 点伤害被无效化",

	["lieren"] = "烈刃", 
	["yinghun"] = "英魂", 
	["haoshi"] = "好施", 
	["dimeng"] = "缔盟", 
	["wansha"] = "完杀", 
	["weimu"] = "帷幕", 
	["#WanshaOne"] = "%from 的锁定技【完杀】被触发，只能 %from 自救",
	["#WanshaTwo"] = "%from 势力角色的判定牌结果为黑桃或梅花且生效后，可以让你摸一张牌", 
	[":duanliang"] = "出牌阶段，你可以将你的一张黑桃或草花基本牌或装备牌当【兵粮寸断】使用；你可以对与你距离为2以内的角色使用【兵粮寸断】", 
	[":huoshou"] = "【南蛮入侵】对你无效;你是任何【南蛮入侵】造成伤害的来源", 
	[":zaiqi"] = "摸牌阶段，若你已受伤，你可以放弃摸牌并展示牌堆顶的X张牌，X为你已损失的体力值，其中每有一张红桃牌，你回复1点体力，然后弃掉这些红桃牌，将其余的牌收入手牌", 
	[":juxiang"] = "锁定技，【南蛮性角色对你使用【杀】时，需连续使用两张【闪】才能抵消", 
	[":benghuai"] = "锁定技，回合结束阶段，若你的体力不是全场最少的(或同时为最少)，则你必须减1点体力或1点体力上限", 
	[":baonue"] = "主公技，其他群雄角色每造成一次伤害，可进行一次判定，若为黑桃，你回复1点体力", 
	[":benghuai:"] = "请选择减体力还是体力上限:", 
	["benghuai:hp"] = "体力", 
	["benghuai:max_hp"] = "体力上限", 
	["guixin:yes"] = "您可分别从每名其他角色处（手牌、装备区和判断区）取得一张牌，若如此做，将你的武将牌翻面", 
	["baonue:yes"] = "你可进行一次判定，若判定结果为黑桃，则董卓回复一点体力", 
	["yinghun:d1tx"] = "摸一张牌，弃X张", 
	["yinghun:dxt1"] = "摸X张牌，弃一张牌", 
	["zaiqi:yes"] = "你可以放弃摸牌并展示牌堆顶的X张牌，X为你已损失的体力值，其中每有一张红桃牌，你回复1点体力，然后弃掉这些红桃牌，将其余的牌收入手牌", 
	["lieren:yes"] = "可与受到该伤害的角色拼点：若你赢，你获得对方的一张牌", 
	["songwei:yes"] = "可以让曹丕摸一张牌", 
	["haoshi:yes"] = "额外摸两张牌，若此时你的手牌超过五张，你必须将一半(向下取整)的手牌交给除你外手牌数最少的一名角色", 
	[":yinghun:"] = "请选择英魂技能的选项:", 
	["xingshang:yes"] = "你可以获得阵亡者的所有手牌和装备牌", 
	["@luanwu-slash"] = "请打出一张杀以响应【乱武】", 
	["@roulin1-jink-1"] = "董卓拥有【肉林】技能，您必须出两张【闪】来闪避", 
	["@roulin1-jink-2"] = "董卓拥有【肉林】技能，您还需要出一张【闪】来闪避", 
	["@roulin2-jink-1"] = "你拥有【肉林】技能，女性出的【杀】您必须出两张【闪】才能闪避", 
	["@roulin2-jink-2"] = "你拥有【肉林】技能，您还需出张【闪】才能闪避", 
	["@haoshi"] = "请选择好施的对象", 
	["@fangzhu"] = "请指定要放逐的对象", 
	["@yinghun"] = "请指定要英魂的对象", 
	["#Dimeng"] = "%from (原来 %arg 手牌) 与 %to (原来 %arg2 手牌) 交换了手牌", 
	["#BenghuaiLoseHp"] = "%from 的【崩坏】锁定技被触发，流失了一点体力",
	["#BenghuaiLoseMaxHp"] = "%from 的【崩坏】锁定技被触发，流失了一点体力上限",
}
