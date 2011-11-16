#ifndef QJWMPACKAGE_H
#define QJWMPACKAGE_H

#include "package.h"
#include "card.h"

class QJWMPackage: public Package{
    Q_OBJECT

public:
    QJWMPackage();
};

class DaleiCard: public SkillCard{
    Q_OBJECT

public:
    Q_INVOKABLE DaleiCard();

    virtual bool targetFilter(const QList<const Player *> &targets, const Player *to_select, const Player *Self) const;
    virtual void use(Room *room, ServerPlayer *source, const QList<ServerPlayer *> &targets) const;
};

class BuzhenCard: public SkillCard{
    Q_OBJECT

public:
    Q_INVOKABLE BuzhenCard();
    virtual bool targetFilter(const QList<const Player *> &targets, const Player *to_select, const Player *Self) const;
    virtual bool targetsFeasible(const QList<const Player *> &targets, const Player *Self) const;
    virtual void use(Room *room, ServerPlayer *source, const QList<ServerPlayer *> &targets) const;
};

class TaolueCard: public SkillCard{
    Q_OBJECT

public:
    Q_INVOKABLE TaolueCard();

    virtual bool targetFilter(const QList<const Player *> &targets, const Player *to_select, const Player *Self) const;
    virtual void use(Room *room, ServerPlayer *source, const QList<ServerPlayer *> &targets) const;
};
/*

class XianzhenCard: public SkillCard{
    Q_OBJECT

public:
    Q_INVOKABLE XianzhenCard();

    virtual bool targetFilter(const QList<const Player *> &targets, const Player *to_select, const Player *Self) const;
    virtual void onEffect(const CardEffectStruct &effect) const;
};

class XuanhuoCard: public SkillCard{
    Q_OBJECT

public:
    Q_INVOKABLE XuanhuoCard();

    virtual void onEffect(const CardEffectStruct &effect) const;
};

class XinzhanCard: public SkillCard{
    Q_OBJECT

public:
    Q_INVOKABLE XinzhanCard();

    virtual void use(Room *room, ServerPlayer *source, const QList<ServerPlayer *> &targets) const;
};
*/
#endif // QJWMPACKAGE_H

/*

class Luoying: public TriggerSkill{
public:
    Luoying():TriggerSkill("luoying"){
        events << CardDiscarded << CardUsed << FinishJudge;
        frequency = Frequent;
    }

    virtual int getPriority() const{
        return -1;
    }

    virtual bool triggerable(const ServerPlayer *target) const{
        return ! target->hasSkill(objectName());
    }

    QList<const Card *> getClubs(const Card *card) const{
        QList<const Card *> clubs;

        if(!card->isVirtualCard()){
            if(card->getSuit() == Card::Club)
                clubs << card;

            return clubs;
        }

        foreach(int card_id, card->getSubcards()){
            const Card *c = Sanguosha->getCard(card_id);
            if(c->getSuit() == Card::Club)
                clubs << c;
        }

        return clubs;
    }

    virtual bool trigger(TriggerEvent event, ServerPlayer *player, QVariant &data) const{
        Room *room = player->getRoom();
        QList<const Card *> clubs;

        if(event == CardUsed){
            CardUseStruct use = data.value<CardUseStruct>();
            const SkillCard *skill_card = qobject_cast<const SkillCard *>(use.card);
            if(skill_card && skill_card->subcardsLength() > 0 && skill_card->willThrow()){
                clubs = getClubs(skill_card);
            }
        }else if(event == CardDiscarded){
            const Card *card = data.value<CardStar>();
            if(card->subcardsLength() == 0)
                return false;

            clubs = getClubs(card);
        }else if(event == FinishJudge){
            JudgeStar judge = data.value<JudgeStar>();
            if(room->getCardPlace(judge->card->getEffectiveId()) == Player::DiscardedPile
               && judge->card->getSuit() == Card::Club)
               clubs << judge->card;
        }

        if(clubs.isEmpty())
            return false;

        ServerPlayer *caozhi = room->findPlayerBySkillName(objectName());
        if(caozhi && caozhi->askForSkillInvoke(objectName(), data)){
            if(player->getGeneralName() == "zhenji")
                room->playSkillEffect("luoying", 2);
            else
                room->playSkillEffect("luoying", 1);

            foreach(const Card *club, clubs)
                caozhi->obtainCard(club);
        }

        return false;
    }
};

class Jiushi: public ZeroCardViewAsSkill{
public:
    Jiushi():ZeroCardViewAsSkill("jiushi"){
        analeptic = new Analeptic(Card::NoSuit, 0);
        analeptic->setSkillName("jiushi");
    }

    virtual bool isEnabledAtPlay(const Player *player) const{
        return analeptic->isAvailable(player) && player->faceUp();
    }

    virtual bool isEnabledAtResponse(const Player *player, const QString &pattern) const{
        return  pattern.contains("analeptic") && player->faceUp();
    }

    virtual const Card *viewAs() const{
        return analeptic;
    }

    virtual int getEffectIndex(ServerPlayer *, const Card *) const{
        return qrand() % 2 + 1;
    }

private:
    Analeptic *analeptic;
};

class JiushiFlip: public TriggerSkill{
public:
    JiushiFlip():TriggerSkill("#jiushi-flip"){
        events << CardUsed << Predamaged << Damaged;
    }

    virtual bool trigger(TriggerEvent event, ServerPlayer *player, QVariant &data) const{
        if(event == CardUsed){
            CardUseStruct use = data.value<CardUseStruct>();
            if(use.card->getSkillName() == "jiushi")
                player->turnOver();
        }else if(event == Predamaged){
            player->tag["PredamagedFace"] = player->faceUp();
        }else if(event == Damaged){
            bool faceup = player->tag.value("PredamagedFace").toBool();
            if(!faceup && player->askForSkillInvoke("jiushi", data)){
                player->getRoom()->playSkillEffect("jiushi", 3);
                player->turnOver();
            }
        }

        return false;
    }
};

class Wuyan: public TriggerSkill{
public:
    Wuyan():TriggerSkill("wuyan"){
        events << CardEffect << CardEffected;
        frequency = Compulsory;
    }

    virtual bool triggerable(const ServerPlayer *target) const{
        return true;
    }

    virtual bool trigger(TriggerEvent , ServerPlayer *player, QVariant &data) const{
        CardEffectStruct effect = data.value<CardEffectStruct>();
.from = effect.to;
                log.to << effect.from;
                log.arg = effect.card->objectName();

                room->sendLog(log);

                room->playSkillEffect(objectName());

                return true;
            }
        }

        return false;
    }
};

JujianCard::JujianCard(){
    once = true;
}

void JujianCard::onEffect(const CardEffectStruct &effect) const{
    int n = subcardsLength();
    effect.to->drawCards(n);

    if(n == 3){
        QSet<Card::< card->getTypeId();
        }

        if(types.size() == 1){
            Room *room = effect.from->getRoom();

            LogMessage log;
            log.type = "#JujianRecover";
            log.from = effect.from;
            const Card *card = Sanguosha->getCard(subcards.first());
            log.arg = card->getType();
            room->sendLog(log);

            RecoverStruct recover;
            recover.card = this;
            recover.who = effect.from;
            room->recover(effect.from, recover);
        }
    }
}

class Jujian: public ViewAsSkill{
public:
    Jujian():ViewAsSkill("jujian"){
t Card *viewAs(const QList<CardItem *> &cards) const{
        if(cards.isEmpty())
            return NULL;

        JujianCard *card = new JujianCard;
        card->addSubcards(cards);
        return card;
    }
};

class EnyuanPattern: public CardPattern{
public:
    virtual bool match(const Player *player, const Card *card) const{
        return !player->hasEquip(card) && card->getSuit() == Card::Heart;
    }

    virtual bool willThrow() const{
        return false;
    }
};

class Enyuan: public TriggerSkill{
public:
    Enyuan():TriggerSkill("enyuan"){
        events << HpRecover << Damaged;
        frequency = Compulsory;
    }

    virtual bool trigger(TriggerEvent event, ServerPlayer *player, QVariant &data) const{
        Room *room = player->getRoom();

        if(event == HpRecover){
            RecoverStruct recover = data.value<RecoverStruct>();
            iferPlayer *source = damage.from;
            if(source && source != player){
                room->playSkillEffect(objectName(), qrand() % 2 + 3);

                const Card *card = room->askForCard(source, ".enyuan", "@enyuan");
                if(card){
                    room->showCard(source, card->getEffectiveId());
                    player->obtainCard(card);
                }else{
                    room->loseHp(source);
                }
            }
        }

        return false;
    }
};

XuanhuoCard::XuanhuoCard(){
    once = true;
    will_throw = ferPlayer *> targets = room->getOtherPlayers(effect.to);
    ServerPlayer *target = room->askForPlayerChosen(effect.from, targets, "xuanhuo");
    if(target != effect.from)
        room->moveCardTo(card, target, Player::Hand, false);
}

class Xuanhuo: public OneCardViewAsSkill{
public:
    Xuanhuo():OneCardViewAsSkill("xuanhuo"){

    }

    virtual bool isEnabledAtPlay(const Player *player) const{
        return ! player->hasUsed("XuanhuoCard");
    }

    virtual bool viewFilter(const CardItem *to_select) const{
        return ! to_select->isEquipped() && to_select->getFilteredCard()->getSuit() == Card::Heart;
    }

    virtual const Card *viewAs(CardItem *card_item) const{
        XuanhuoCard *card = new XuanhuoCard;
        card->addSubcard(card_item->getFilteredCard());
        return card;
    }
};

class Huilei: public TriggerSkill{
public:
    Huilei():TriggerSkill("huilei"){
        events << Death;
        frequency = Compulsory;
    }

    virtual bool triggerable(const ServerPlayer *target) const{
        return target->hasSkill(objectName());
    }

    virtual bool tr->throwAllHandCards();

            QString killer_name = killer->getGeneralName();
            if(killer_name == "zhugeliang" || killer_name == "wolong" || killer_name == "shenzhugeliang")
                room->playSkillEffect(objectName(), 1);
            else
                room->playSkillEffect(objectName(), 2);
        }

        return false;
    }
};

class Xuanfeng: public TriggerSkill{
public:
    Xuanfeng():TriggerSkill("xuanfeng"){
        events << CardLost << CardLostDone;
    }

    virtual QString getDefaultChoice(ServerPlayer *) const{
        return "nothing";
    }

    virtual bool trigger(TriggerEvent event, ServerPlayer *lingtong, QVariant &data) const{
        if(event == CardLost){
            CardMoveStar move = data.value<CardMoveStar>();
            if(move->from_place == Player::Equip)
                lingtong->tag["InvokeXuanfeng"] = true;
        }else if(event == CardLostDone && lingtong->tag.value("InvokeXuanfeng", false).toBool()){
            lingtong->tag.remove("InvokeXuanfeng");
            Room *room = lingtong->getRoom();

            QString choice = room->askForChoice(lingtong, objectName(), "slash+damage+nothing");


            if(choice == "slash"){
                QList<ServerPlayer *> targets;
                foreach(ServerPlayer *target, room->getAlivePlayers()){
                    if(lingtong->canSlash(target, false))
                        targets << target;
                }

                ServerPlayer *target = room->askForPlayerChosen(lingtong, targets, "xuanfeng-slash");

                Slash *slash = new Slash(Card::NoSuit, 0);
                slash->setSkillName(objectName());

                CardUseStruct card_use;
                card_use.card = slash;
                card_use.from = lingtong;
                card_use.to << target;
                room->useCard(card_use, false);
            }else if(choice == "damage"){
                room->playSkillEffect(objectName());

                QList<ServerPlayer *> players = room->getOtherPlayers(lingtong), targets;
                foreach(ServerPlayer *p, players){
                    if(lingtong->distanceTo(p) <= 1)
                        targets << p;
                }

                ServerPlayer *target = room->askForPlayerChosen(lingtong, targets, "xuanfeng-damage");

                DamageStruct damage;
                damage.from = lingtong;
                damage.to = target;
                room->damage(damage);
            }
        }

        return false;
    }
};

class Pojun: public TriggerSkill{
public:
    Pojun():TriggerSkill("pojun"){
        events << Damage;
    }

    virtual bool trigger(TriggerEvent , ServerPlayer *player, QVariant &data) const{
        DamageStruct damage = data.value<DamageStruct>();
        if(damage.to->isDead())
            return false;

        if(damage.card && damage.card->inherits("Slash") &&
           player->askForSkillInvoke(objectName(), data))
        {
            player->getRoom()->playSkillEffect(objectName());
XianzhenCard(){
    once = true;
    will_throw = false;
}

bool XianzhenCard::targetFilter(const QList<const Player *> &targets, const Player *to_select, const Player *Self) const{
    return targets.isEmpty() && to_select != Self && ! to_select->isKongcheng();
}

void XianzhenCard::onEffect(const CardEffectStruct &effect) const{
    Room *room = effect.from->getRoom();

    const Card *card = Sanguosha->getCard(subcards.first());
    if(effect.from->pindian(effect.to, "xianzhen", card)){
        PlayerStar target = effect.to;
        effect.froPlayerFlag(effect.from, "xianzhen_failed");
    }
}

XianzhenSlashCard::XianzhenSlashCard(){
    target_fixed = true;
}

void XianzhenSlashCard::onUse(Room *room, const CardUseStruct &card_use) const{
    ServerPlayer *target = card_use.from->tag["XianzhenTarget"].value<PlayerStar>();
    if(target == NULL || target->isDead())
        return;

    if(!card_use.from->canSlash(target, false))
        return;

    const Card *slash = room->askForCard(card_use.from, "slash", "@xianzhen-slash");
    if(slash){
        CardUseStruct use;
        use.card = slash;
        use.from = card_use.from;
        use.to << target;
        room->useCard(use);
    }
}

class XianzhenViewEnabledAtPlay(const Player *player) const{
        return ! player->hasUsed("XianzhenCard") || player->hasFlag("xianzhen_success");
    }

    virtual bool viewFilter(const QList<CardItem *> &selected, const CardItem *to_select) const{
        if(!selected.isEmpty())
            return false;

        if(Self->hasUsed("XianzhenCard"))
            return false;

        return !to_select->isEquipped();
    }

    virtual const Card *viewAs(const QList<CardItem *> &cards) const{
        if(! Self->hasUsed("XianzhenCard")){
            if(cards.length() != 1)
                return NULL;

            XianzhenCard *card = new XianzhenCard;
            card->addSubcards(cards);
            return card;
        }else if(Self->hasFlag("xianzhen_success")){
            if(!cards.isEmpty())
                return NULL;

            return new XianzhenSlashCard;
        }else
            return NULL;
    }
};

class Xianzhen: public TriggerSkill{
public:
    Xianzhen():TriggerSkill("xianzhen"){
        view_as_
    virtual bool viewFilter(const CardItem *to_select) const{
        return !to_select->isEquipped() && to_select->getCard()->objectName() == "analeptic";
    }

    virtual const Card *viewAs(CardItem *card_item) const{
        const Card *c = card_item->getCard();
        Slash *slash = new Slash(c->getSuit(), c->getNumber());
        slash->setSkillName(objectName());
        slash->addSubcard(card_item->getCard());

        return slash;
    }
};

MingceCard::MingceCard(){
    once = true;
    will_throw = false;
}

void MingceCard::onEffect(const CardEffectStruct &effect) const{
    effect.to->obtainCard(this);

    Room *room = effect.to->getRoom();
    QString choice = room->askForChoice(effect.to, "mingce", "use+draw");
    if(choice == "use"){
        QList<ServerPlayer *> players = room->getOtherPlayers(effect.to), targets;
        foreach(Servirtual bool viewFilter(const CardItem *to_select) const{
        const Card *c = to_select->getCard();
        return c->getTypeId() == Card::Equip || c->inherits("Slash");
    }

    virtual const Card *viewAs(CardItem *card_item) const{
        MingceCard *card = new MingceCard;
        if(event == CardEffected){
            if(room->getTag("Zhichi").toString() != player->objectName())
                return false;

            CardEffectStruct effect = data.value<CardEffectStruct>();
            if(effect.card->inherits("Slash") || effect.card->getTypeId() == Card::Trick){
                LogMessage log;
                log.type = "#ZhichiAvoid";
                log.from = player;
                room->sendLog(log);

                return true;
            }
        }

        return false;
    }
};

GanluCard::GanluCard(){
    once = true;
}

void GanluCard::swapEquip(ServerPlayer *first, ServerPlayer *second, int index) const{
    const EquipCard *e1 = first->getEquip(index);
    const EquipCard *e2 = second->getEquip(index);

    Room *room = first->getRoom();

    if(e1)
        first->obtainCard(e1);

    if(e2)
        room->moveCardTo(e2, first, Player::Equip);

*/
