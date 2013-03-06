-- translation for DragonPackage
-- Fifth of the twelve

return {
	["dragon"] = "辰龙",

	["$liutang"] = "021",
	["#liutang"] = "赤发鬼", -- kou 4hp
	["liutang"] = "刘唐",
	["illustrator:liutang"] = "梁山豪杰",
	["cv:liutang"] = "莫名【忆昔端华工作室】",
	["coder:liutang"] = "Slob",
	["xiashu"] = "下书",
	[":xiashu"] = "出牌阶段，你可以弃置一张牌，令任一角色摸三张牌，然后弃置两张手牌。每阶段限一次。",
	["$xiashu1"] = "今特地送一套富贵来与保正哥哥。",
	["$xiashu2"] = "哎，前面的可是宋押司？",
	["$xiashu3"] = "今特使刘唐赍一封书并黄金一百两相谢押司。",
	["~liutang"] = "如此身死，甚是委屈啊！",

	["$hantao"] = "042",
	["#hantao"] = "百胜将", -- guan 4hp (qjwm)
	["hantao"] = "韩滔",
	["taolue"] = "韬略",
	["illustrator:hantao"] = "龙魂",
	["cv:hantao"] = "Sin柠檬【月玲珑】",
	[":taolue"] = "出牌阶段，你可以和一名角色拼点。若你赢，则你可以将其判定区或装备区里的一张牌移动到另一名角色区域内的相应位置。若你没赢，则你须弃置一张牌。每阶段限一次。",
	["changsheng"] = "常胜",
	[":changsheng"] = "<b>锁定技</b>，你拼点的♠牌的点数均视为K。",
	["#Changsheng"] = "%from 的锁定技【%arg】被触发，%from 拼点牌的点数视为K",
	["$taolue1"] = "韬略传家远，平地能擒虎！",
	["$taolue2"] = "斩杀敌将，犹如儿戏！", -- （赢）
	["$taolue3"] = "人上有人，天外有天。", -- （输）
	["$taolue4"] = "进可攻，退可守！", -- 装备区
	["$taolue5"] = "流水无形而无不形。", -- 判定区
	["~hantao"] = "终究还是败了。",

	["$shibao"] = "117",
	["#shibao"] = "南离大将军", -- jiang 4hp
	["shibao"] = "石宝",
	["illustrator:shibao"] = "傲视千雄",
	["cv:shibao"] = "唐银【唐音传媒】",
	["designer:shibao"] = "宇文天启&烨子",
	["coder:shibao"] = "Slob",
	["xiaozhan"] = "骁战",
	[":xiaozhan"] = "当你使用【杀】时，（在结算前）你可以弃置一张牌，令目标角色弃置一张手牌；当你需要使用或打出一张【闪】时，你可以对你攻击范围内的任一其他角色使用一张【杀】，若该【杀】造成伤害，则该【杀】结算完毕后视为你使用或打出一张【闪】。",
	["@xiaozhan"] = "你可以弃置一张牌发动【骁战】，令杀的目标弃置一张手牌。",
	["@xiaozhan-slash"] = "你可以发动【骁战】，对攻击范围内的任一其他角色使用一张【杀】，若造成伤害则视为出了【闪】",
	["$xiaozhan1"] = "劈风刀下不斩无名之鬼！", -- 1效果
	["$xiaozhan2"] = "回马定计，要汝等有来无回！",
	["$xiaozhan3"] = "生亦死，死亦死！", -- 2效果
	["$xiaozhan4"] = "此计，将欲西而示之以东。",
	["~shibao"] = "决不能落在你们手里，啊！",

	["$ruanxiaowu"] = "029",
	["#ruanxiaowu"] = "短命二郎", -- min 3/4hp
	["ruanxiaowu"] = "阮小五",
	["illustrator:ruanxiaowu"] = "黄玉郎",
	["cv:ruanxiaowu"] = "烨子风暴【天子会工作室】",
	["designer:ruanxiaowu"] = "烨子&宇文天启",
	["coder:ruanxiaowu"] = "凌天翼、宇文天启",
	["anxi"] = "暗袭",
	[":anxi"] = "任一角色每受到一次锦囊牌造成的伤害，你可以弃置一张♥或♦手牌，对任一体力不少于你的其他角色造成1点伤害。",
	["shuilao"] = "水牢",
	[":shuilao"] = "出牌阶段，你可以将你的任一装备牌当【画地为牢】使用。",
	["@anxi"] = "%src 受到了锦囊伤害，你可以弃置一张红色手牌发动【暗袭】",
	["$anxi1"] = "你这贼官如此大胆，敢来引老爷！却不是来撸虎须！",
	["$anxi2"] = "趁乱杀他一杀。",
	["$shuilao1"] = "浸你个三天三夜！",
	["$shuilao2"] = "水泊撒下罗天网，乌龟王八罩里边！",
	["~ruanxiaowu"] = "人生在世，草木一秋。",

	["$zhengtianshou"] = "074",
	["#zhengtianshou"] = "白面郎君", -- kou 3hp (cgdk)
	["zhengtianshou"] = "郑天寿",
	["illustrator:zhengtianshou"] = "王寻",
	["cv:zhengtianshou"] = "鸢飞【天子会工作室】",
	["coder:zhengtianshou"] = "凌天翼",
	["wugou"] = "吴钩",
	[":wugou"] = "出牌阶段，你可以将你的两张颜色相同的基本牌当【行刺】使用。",
	["qiaojiang"] = "巧匠",
	[":qiaojiang"] = "你可以将你的任一♠或♣锦囊牌当【杀】、♥或♦锦囊牌当【闪】使用或打出。",
	["$wugou"] = "男儿何不带吴钩，收取关山五十州",
	["$wugou1"] = "突击！",
	["$wugou2"] = "机会来了，动手！",
	["$qiaojiang1"] = "以动制静，以静制动。",
	["$qiaojiang2"] = "全力以赴，一举拿下！",
	["~zhengtianshou"] = "有勇无谋，难以取胜！",

	["$gaoyanei"] = "159",
	["#gaoyanei"] = "花花太岁", -- guan 3hp
	["gaoyanei"] = "高衙内",
	["illustrator:gaoyanei"] = "十年一剑",
	["cv:gaoyanei"] = "疯狂牛魔王【风行天下】",
	["xixue"] = "戏谑",
	[":xixue"] = "<b>锁定技</b>，你对女性角色即将造成的伤害、女性角色即将对你造成的伤害均为体力流失；当任一女性角色死亡时，你回复1点体力。",
	["jiandiao"] = "奸刁",
	[":jiandiao"] = "你每受到一次其他角色造成的伤害，可以选择一项：获得该角色的一张牌，或摸等同于你与该角色当前体力值差数的牌（至少为1且至多为3）。",
	["jiandiao:jian"] = "获得该角色的一张牌",
	["jiandiao:diao"] = "摸体力值差数的牌",
	["jiandiao:nil"] = "不发动",
	["$xixue1"] = "你我不过玩玩而已！", --你对女
	["$xixue2"] = "哈哈，打得好，打得好！", --女对你1
	["$xixue3"] = "不疼，不疼，舒服！", --女对你2
	["$xixue4"] = "唉，落得如此下场，何不早从了我。", --女死1
	["$xixue5"] = "煮熟的鸭子又飞走了。", --女死2
	["$jiandiao1"] = "哼，干你甚事，敢来多管？", --1效果
	["$jiandiao2"] = "谁厉害我欺负谁，谁有钱我讹诈谁！",
	["$jiandiao3"] = "打了你又怎样？你咬我啊！", --2效果
	["$jiandiao4"] = "官小我不做，马瘦我不骑。",
	["~gaoyanei"] = "你，你们都反了！",

	["$shantinggui"] = "044",
	["#shantinggui"] = "圣水将", -- jiang 3hp (bwqz)
	["shantinggui"] = "单廷珪",
	["illustrator:shantinggui"] = "黄玉郎",
	["cv:shantinggui"] = "宇文天启【天子会工作室】",
	["designer:shantinggui"] = "烨子&宇文天启",
	["shuizhen"] = "水阵",
	[":shuizhen"] = "绝密技能，效果不详",
	["yanmo"] = "淹没",
	[":yanmo"] = "绝密技能，效果不详",
	["@shuizhen1"] = "水阵1",
	["@shuizhen2"] = "水阵2",
	["@yanmo"] = "你可以选择一名角色发动【淹没】",
	["$shuizhen1"] = "水火不相容！", --1效果
	["$shuizhen2"] = "灭！",
	["$shuizhen3"] = "（暴雨声）",
	["$shuizhen4"] = "阴雷布，水滔天！", --2效果
	["$shuizhen5"] = "水扩雷势，雷助水势！",
	["$yanmo1"] = "看我决水浸兵之法。",
	["$yanmo2"] = "掘开长堤，水灌兵、粮、马！",
	["~shantinggui"] = "常在河边走哪有不湿鞋！",

	["$lizhu"] = "123",
	["#lizhu"] = "金剑先生", -- min 3hp
	["lizhu"] = "李助",
	["illustrator:lizhu"] = "大熊",
	["cv:lizhu"] = "雨过天青【华人之声】",
	["coder:lizhu"] = "Slob",
	["chuqiao"] = "出鞘",
	[":chuqiao"] = "当你成为一张【杀】的目标后，你可以将你的手牌补至你体力上限的张数。",
	["jianwu"] = "剑舞",
	[":jianwu"] = "你每受到一次其他角色造成的伤害，可以令除你和伤害来源外的所有角色依次选择是否打出一张【杀】（视为你对伤害来源使用该【杀】）。",
	["@jianwu-slash"] = "%src 请求你打出一张【杀】响应【剑舞】，目标为 %dest",
	["$chuqiao1"] = "出鞘之剑，必见真章。",
	["$chuqiao2"] = "剑气动四方。",
	["$jianwu1"] = "风起，云起，剑起！",
	["$jianwu2"] = "恶灵退散！",
	["$jianwu3"] = "万剑归心！",
	["~lizhu"] = "金剑落地，再不能起了～",

	["$yangchun"] = "073",
	["#yangchun"] = "白花蛇", -- kou 4hp (ybyt)
	["yangchun"] = "杨春",
	["illustrator:yangchun"] = "黄玉郎",
	["cv:yangchun"] = "倔强的小红军【剪刀剧团】",
	["coder:yangchun"] = "战栗贵公子",
	["shexin"] = "蛇信",
	[":shexin"] = "出牌阶段，你可以弃置一张非延时类锦囊或装备牌，展示任一有手牌的其他角色的所有手牌，然后弃掉其中除基本牌外的所有牌。每阶段限一次。",
	["$shexin1"] = "此毒，无药可解。",
	["$shexin2"] = "辣手摧花！",
	["~yangchun"] = "居然～比我还狠～",

	["$qiongyaonayan"] = "164",
	["#qiongyaonayan"] = "狼先锋", -- guan 4hp
	["qiongyaonayan"] = "琼妖纳延",
	["illustrator:qiongyaonayan"] = "成吉思汗",
	["cv:qiongyaonayan"] = "裤衩【浮声未歇】",
	["jiaozhen"] = "叫阵",
	[":jiaozhen"] = "回合开始时，你可以进行一次判定：若结果为♠或♣，则你获得以下技能，直到回合结束：摸牌阶段，你少摸一张牌；出牌阶段，你可以将你的任一♠或♣手牌当【决斗】使用；你造成的伤害均视为雷电伤害。",
	["#Jiaozhen"] = "%from 叫阵成功！",
	["#JZThunder"] = "%from 因技能【%arg】的影响，造成的 %arg2 点伤害均为雷电伤害",
	["$jiaozhen1"] = "吾乃兀颜统军帐下先锋是也！", --发动
	["$jiaozhen2"] = "等大军到了再战，今日先歇他一歇！", --判定失败
	["$jiaozhen3"] = "两军对阵，先礼后兵。", --摸牌阶段
	["$jiaozhen4"] = "战书已下，开战！", --决斗
	["$jiaozhen5"] = "你这山氓草寇，敢犯我大辽！", --决斗
	["$jiaozhen6"] = "冲锋陷阵，势若闪电！", --雷电
	["$jiaozhen7"] = "雷厉风行，势如破竹！", --雷电
	["~qiongyaonayan"] = "是谁放的冷箭！",

	["$suochao"] = "019",
	["#suochao"] = "急先锋", -- jiang 4hp
	["suochao"] = "索超",
	["illustrator:suochao"] = "楚河汉界",
	["cv:suochao"] = "大宝今天见【淅雨听风】",
	["chongfeng"] = "冲锋",
	[":chongfeng"] = "若你于一回合内受到和造成不少于2点伤害，则该回合结束后，你可以进行一个额外的回合。",
	["@hatchet"] = "斧",
	["$chongfeng1"] = "上了这战场，冲杀上去便是。",
	["$chongfeng2"] = "我今拿住你时，碎尸万段，死有余辜。",
	["$chongfeng3"] = "冲！",
	["~suochao"] = "成也萧何，败也萧何。",

	["$wangpo"] = "147",
	["#wangpo"] = "枯藤蔓", -- min 3hp (qlfd)
	["wangpo"] = "王婆",
	["illustrator:wangpo"] = "十面埋伏",
	["cv:wangpo"] = "九辨【重华广播剧团】",
	["qianxian"] = "牵线",
	[":qianxian"] = "出牌阶段，你可以弃置一张♠或♣非延时类锦囊，指定两名体力上限不相等的其他角色。若其交给你一张♣手牌，则将其武将牌翻至正面向上，并重置之；否则将其武将牌翻至背面向上，并横置之。每阶段限一次。",
	["@qianxian"] = "%src 对你发动了【牵线】，请给她一张梅花手牌",
	["meicha"] = "梅茶",
	[":meicha"] = "你可以将你的任一♣手牌当【酒】使用。",
	["$qianxian1"] = "吃个‘和合汤’如何？",
	["$qianxian2"] = "这事交给干娘我了。",
	["$meicha1"] = "我这茶别有风味。",
	["$meicha2"] = "好个“宽煎叶儿茶”。",
	["~wangpo"] = "死到眼前，犹做发财梦～",
}
