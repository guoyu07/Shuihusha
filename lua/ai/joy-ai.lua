
function SmartAI:useCardStink(card, use)
	local next_player = self.player:getNextAlive()
	if self:isFriend(next_player) then return end
	use.card = card
end

sgs.ai_use_value.Stink = 2
sgs.ai_keep_value.Stink = -1
sgs.dynamic_value.control_card.Stink = true

function SmartAI:useCardPoison(card, use)
	local players = self.room:getAllPlayers()
	players = sgs.QList2Table(players)
	for _, target in ipairs(players) do
		if self.player:distanceTo(target) <= 1 and
			((self:isFriend(target) and target:getMark("poison") > 0) or
			(self:isEnemy(target) and target:getMark("poison") == 0)) then
			use.card = card
			if use.to then
				use.to:append(target)
			end
			return
		end
	end
end

sgs.ai_use_value.Poison = 7
sgs.ai_keep_value.Poison = 1
sgs.dynamic_value.control_card.Poison = true
sgs.dynamic_value.damage_card.Poison = true

-- when enemy using the peach
sgs.ai_skill_invoke["grab_peach"] = function(self, data)
	local struct = data:toCardUse()
	return self:isEnemy(struct.from) and (struct.to:isEmpty() or self:isEnemy(struct.to:first()))
end

function SmartAI:useCardGaleShell(card, use)
	use.broken = true
	for _, enemy in ipairs(self.enemies) do
		if self.player:distanceTo(enemy) <=1 and not self:hasSkills("jijiu|wusheng|longhun",enemy) then
			use.card = card
			if use.to then
				use.to:append(enemy)
			end
			return
		end
	end
end

sgs.ai_armor_value["gale-shell"] = function()
	return -10
end

sgs.ai_card_intention.GaleShell = 80
sgs.ai_use_priority.GaleShell = 0.9

sgs.dynamic_value.control_card.GaleShell = true

