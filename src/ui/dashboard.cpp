#include "dashboard.h"
#include "engine.h"
#include "client.h"
#include "standard.h"
#include "playercarddialog.h"

#include <QPainter>
#include <QGraphicsScene>
#include <QGraphicsProxyWidget>
#include <QGraphicsSceneMouseEvent>
#include <QMenu>
#include <QPixmapCache>

Dashboard::Dashboard(QGraphicsItem *button_widget)
#ifdef USE_RCC
    :left_pixmap(":system/dashboard-equip.png"), right_pixmap(":system/dashboard-avatar.png"),
#else
    :left_pixmap("image/system/dashboard-equip.png"), right_pixmap("image/system/dashboard-avatar.png"),
#endif
    button_widget(button_widget), selected(NULL), avatar(NULL),
    weapon(NULL), armor(NULL), defensive_horse(NULL), offensive_horse(NULL),
    view_as_skill(NULL), filter(NULL)
{
    settings = new QSettings("image/system/dashboard.ini", QSettings::IniFormat);

    createLeft();
    createMiddle();
    createRight();

    death_item = NULL;

    if(button_widget)
        button_widget->setParentItem(this);

    int middle_width = middle->rect().width();
    setMiddleWidth(middle_width);

    sort_type = 0;

    animations = new EffectAnimation();
}

void Dashboard::createLeft(){
    left = new QGraphicsRectItem(QRectF(left_pixmap.rect()), this);

    plate = new Pixmap("image/mode/02p.png");
    plate->setParentItem(left);
    //plate->setZValue(0.4);
    QString game_mode = ServerInfo.GameMode;
    QString plate_path = QString("image/mode/%1.png").arg(game_mode);
    if(ServerInfo.EnableHegemony)
        plate_path = "image/mode/hegemony.png";
    else if(ServerInfo.EnableEndless)
        plate_path = "image/mode/endless.png";
    if(!Sanguosha->isExist(plate_path)){
        QString gm = game_mode;
        gm.chop(1);
        plate_path = QString("image/mode/%1.png").arg(gm);
    }
    if(!Sanguosha->isExist(plate_path))
        plate->hide();
    else{
        plate->show();
        plate->setPixmap(QPixmap(plate_path));
        plate->setToolTip(Sanguosha->translate(":" + game_mode));
        if(game_mode.startsWith("_")){
            QString plate_tip = Sanguosha->translate("#Mini" + game_mode.right(2));
            QString p;
            for(int i=0; i < plate_tip.length();i ++){
                p.append(plate_tip.at(i));
                if((i + 1) % 20 == 0)
                    p.append("<br />");
            }
            plate->setToolTip(p);
            plate->setPos(17, -4);
        }
        else
            plate->setPos(17, 0);
    }

    equips << &weapon << &armor << &defensive_horse << &offensive_horse;

    int i;
    for(i=0; i<4; i++){
        QRectF rect(8, 40 + 32 *i, 117, 25);
        equip_rects[i] = new QGraphicsRectItem(rect, left);
        equip_rects[i]->setPen(Qt::NoPen);
    }
}

int Dashboard::getButtonWidgetWidth() const{
    if(button_widget)
        return button_widget->boundingRect().width();
    else
        return 0;
}

void Dashboard::createMiddle(){
    middle = new QGraphicsRectItem(this);

#ifdef USE_RCC
    QPixmap middle_pixmap(":system/dashboard-hand.png");
#else
    QPixmap middle_pixmap("image/system/dashboard-hand.png");
#endif
    QBrush middle_brush(middle_pixmap);
    middle->setBrush(middle_brush);
    middle->setRect(0, 0, middle_pixmap.width(), middle_pixmap.height());
    //middle->setZValue(-1);

    trusting_item = new QGraphicsRectItem(this);
    trusting_item->setRect(middle->rect());
    QBrush trusting_brush(QColor(0x26, 0x1A, 0x42));
    trusting_item->setBrush(trusting_brush);
    trusting_item->setOpacity(0.36);
    trusting_item->setZValue(2.0);

    trusting_text = new QGraphicsSimpleTextItem(tr("Trusting ..."), this);
    trusting_text->setFont(Config.BigFont);
    trusting_text->setBrush(Qt::white);
    trusting_text->setZValue(2.1);

    trusting_item->hide();
    trusting_text->hide();
}

void Dashboard::createRight(){
    right = new QGraphicsRectItem(QRectF(right_pixmap.rect()), this);

    avatar = new Pixmap;
    avatar->setPos(22, 64);
    avatar->setParentItem(right);

    small_avatar = new Pixmap;
    small_avatar->setPos(21, 63);
    small_avatar->setParentItem(right);
    //small_avatar->setOpacity(0.75);

    if(button_widget){
        kingdom = new QGraphicsPixmapItem(button_widget);
        kingdom->setPos(57, 0);
        role = new QGraphicsPixmapItem(button_widget);
        role->setPos(69, 133);
    }else{
        kingdom = new QGraphicsPixmapItem(right);
        kingdom->setPos(91, 54);
        role = new QGraphicsPixmapItem(right);
        role->setPos(91, 204);
    }

    mark_item = new QGraphicsTextItem(right);
    settings->beginGroup("mark_item");
    QList<QVariant> coord = settings->value("pos").toList();
    mark_item->setPos(coord.at(0).toReal(), coord.at(1).toReal());
    mark_item->setOpacity(settings->value("opacity").toReal());
    settings->endGroup();
    mark_item->setDefaultTextColor(Qt::white);

    phase_icon = new Pixmap;
    phase_icon->setParentItem(right);
    settings->beginGroup("phase_icon");
    coord = settings->value("pos").toList();
    phase_icon->setPos(coord.at(0).toReal(), coord.at(1).toReal());
    phase_icon->setOpacity(settings->value("opacity").toReal());
    settings->endGroup();

#ifdef USE_RCC
    ready_item = new QGraphicsPixmapItem(QPixmap(":system/ready.png"), avatar);
#else
    ready_item = new QGraphicsPixmapItem(QPixmap("image/system/ready.png"), avatar);
#endif
    settings->beginGroup("ready_item");
    coord = settings->value("pos").toList();
    ready_item->setPos(coord.at(0).toReal(), coord.at(1).toReal());
    ready_item->setZValue(coord.at(2).toReal());
    ready_item->setOpacity(settings->value("opacity").toReal());
    settings->endGroup();
    ready_item->hide();

    chain_icon = new Pixmap("image/state/chain.png");
    chain_icon->setParentItem(right);
    settings->beginGroup("chain_icon");
    coord = settings->value("pos").toList();
    chain_icon->setPos(coord.at(0).toReal(), coord.at(1).toReal());
    chain_icon->setZValue(coord.at(2).toReal());
    chain_icon->setOpacity(settings->value("opacity").toReal());
    settings->endGroup();
    chain_icon->hide();

    back_icon = new Pixmap("image/system/cover/big-back.png");
    back_icon->setParentItem(right);
    back_icon->setPos(22, 64);
    back_icon->setZValue(0.2);
    //back_icon->setOpacity(0.6);
    back_icon->hide();

    jail_icon = new Pixmap("image/system/cover/big-jail.png");
    jail_icon->setParentItem(right);
    jail_icon->setPos(back_icon->pos());
    jail_icon->setZValue(back_icon->zValue() + 0.1);
    jail_icon->setOpacity(back_icon->opacity());
    jail_icon->hide();

    handcard_pixmap = new QGraphicsPixmapItem(right);
    handcard_pixmap->setPixmap(QPixmap("image/system/handcard2.png"));
    settings->beginGroup("handcard_item");
    coord = settings->value("pos").toList();
    handcard_pixmap->setPos(coord.at(0).toReal(), coord.at(1).toReal());
    handcard_pixmap->setZValue(0.3);
    handcard_num = new QGraphicsSimpleTextItem(handcard_pixmap);
    coord = settings->value("text_pos").toList();
    handcard_num->setPos(coord.at(0).toReal(), coord.at(1).toReal());
    settings->endGroup();

    QFont serifFont("Times", 10, QFont::Bold);
    handcard_num->setFont(serifFont);
    handcard_num->setBrush(Qt::yellow);

    //handcard_pixmap->hide();

    action_item = NULL;

    ecst_area = new QGraphicsRectItem(0, 0, 94, 96, right);
    ecst_area->setPos(22, 64);
    ecst_area->setZValue(0.3);
    ecst_area->setBrush(QColor(0x00, 0x00, 0xDD, 255 * 0.35));
    ecst_area->setVisible(false);

    wake_icon = new Pixmap("image/state/sleep.png");
    wake_icon->setParentItem(right);
    settings->beginGroup("wake_icon");
    coord = settings->value("pos").toList();
    wake_icon->setPos(coord.at(0).toReal(), coord.at(1).toReal());
    wake_icon->setZValue(coord.at(2).toReal());
    wake_icon->setOpacity(settings->value("opacity").toReal());
    settings->endGroup();
    wake_icon->hide();

    conjur_icon = new Pixmap();
    conjur_icon->setPos(-52, 27);
    conjur_icon->setParentItem(right);
    conjur_icon->setZValue(0.5);
    conjur_icon->hide();

    conjur_item = new QGraphicsSimpleTextItem(this);
    conjur_item->setParentItem(right);
    conjur_item->setBrush(Qt::yellow);
    QFont font = Config.SmallFont;
    font.setPixelSize(15);
    conjur_item->setFont(font);
    conjur_item->setPos(35, 70);
    conjur_item->hide();
}

void Dashboard::setRole(const QString &new_role, int index){
    role->setPixmap(QPixmap(QString("image/system/roles/dashboard/%1-%2.png").arg(new_role).arg(index)));
}

void Dashboard::setWakeState(){
    if(Self->getWakeSkills().isEmpty())
        return;
    if(Self->getMark("_wake") > 0)
        wake_icon->setPixmap(QPixmap("image/state/wake.png"));
    else
        wake_icon->setPixmap(QPixmap("image/state/sleep.png"));
}

void Dashboard::setConjuring(){
    QStringList conjurs = Self->getAllMarkName(3, "_jur");
    if(!conjurs.isEmpty()){
        QString conjur = conjurs.first();
        conjur_icon->setPixmap(QPixmap(QString("image/system/conjuring/%1_d.png").arg(conjur)));
        conjur_icon->show();

        conjur_item->setText(QString("%1 %2 %3")
                          .arg(Sanguosha->translate(conjur))
                          .arg(Sanguosha->translate("multiply"))
                          .arg(Self->getMark(conjur)));
        conjur_item->show();
    }
    else{
        conjur_icon->hide();
        conjur_item->hide();
    }
}

void Dashboard::setPhaseState(){
    if(Self->getPhase() != Player::NotActive){
        static QList<QPixmap> phase_pixmaps;
        if(phase_pixmaps.isEmpty()){
            QStringList names;
            names << "round_start" << "start" << "judge" << "draw"
                    << "play" << "discard" << "finish";
            foreach(QString name, names)
                phase_pixmaps << QPixmap(QString("image/system/phase/dashboard/%1.png").arg(name));
        }
        int index = static_cast<int>(Self->getPhase());
        phase_icon->setPixmap(phase_pixmaps.at(index));
    }
    else
        phase_icon->setPixmap(QPixmap());
}

void Dashboard::setActionState(){
    if(action_item == NULL){
        action_item = new QGraphicsPixmapItem(right);
        action_item->setPixmap(QPixmap("image/system/3v3/actioned.png"));
        action_item->setPos(64, 138);
    }

    action_item->setVisible(Self->hasFlag("actioned"));
}

void Dashboard::setFilter(const FilterSkill *filter){
    this->filter = filter;
    doFilter();
}

const FilterSkill *Dashboard::getFilter() const{
    return filter;
}

void Dashboard::doFilter(){
    foreach(CardItem *card_item, card_items)
        card_item->filter(filter);
}

void Dashboard::setTrust(bool trust){
    trusting_item->setVisible(trust);
    trusting_text->setVisible(trust);
}

void Dashboard::addCardItem(CardItem *card_item){
    card_item->filter(filter);

    if(ClientInstance->getStatus() == Client::Playing)
        card_item->setEnabled(card_item->getFilteredCard()->isAvailable(Self));
    else{
        card_item->setEnabled(true);
        card_item->setEnabled(false);
    }

    card_item->setPos(mapFromScene(card_item->pos()));
    card_item->setParentItem(this);
    card_item->setRotation(0.0);
    card_item->setFlags(ItemIsFocusable);
    card_item->setZValue(0.1);
    card_items << card_item;

    connect(card_item, SIGNAL(clicked()), this, SLOT(onCardItemClicked()));
    connect(card_item, SIGNAL(thrown()), this, SLOT(onCardItemThrown()));
    connect(card_item, SIGNAL(enter_hover()), this, SLOT(onCardItemHover()));
    connect(card_item, SIGNAL(leave_hover()), this, SLOT(onCardItemLeaveHover()));

    sortCards(sort_type);

    handcard_num->setText(QString::number(Self->getHandcardNum()));
    //handcard_num->parentItem()->show();
}

void Dashboard::setPlayer(const ClientPlayer *player){
    connect(player, SIGNAL(state_changed()), this, SLOT(refresh()));
    connect(player, SIGNAL(kingdom_changed()), this, SLOT(updateAvatar()));
    connect(player, SIGNAL(general_changed()), this, SLOT(updateAvatar()));
    connect(player, SIGNAL(action_taken()), this, SLOT(setActionState()));
    connect(player, SIGNAL(ready_changed(bool)), this, SLOT(updateReadyItem(bool)));
    connect(player, SIGNAL(waked()), this, SLOT(setWakeState()));
    connect(player, SIGNAL(phase_changed()), this, SLOT(setPhaseState()));
    //connect(player, SIGNAL(ecst_changed()), this, SLOT(setEcstState()));
    connect(player, SIGNAL(conjuring_changed()), this, SLOT(setConjuring()));

    mark_item->setDocument(player->getMarkDoc());

    updateAvatar();
}

void Dashboard::updateAvatar(){
    const General *general = Self->getAvatarGeneral();
    avatar->setToolTip(Self->getAllSkillDescription());
    if(!avatar->changePixmap(general->getPixmapPath("big"))){
        QPixmap pixmap(General::BigIconSize);
        pixmap.fill(Qt::black);

        QPainter painter(&pixmap);

        painter.setPen(Qt::white);
        painter.setFont(Config.SmallFont);
        painter.drawText(0, 0, pixmap.width(), pixmap.height(),
                         Qt::AlignCenter,
                         Sanguosha->translate(Self->getGeneralName()));

        avatar->setPixmap(pixmap);
    }

    QString folder = button_widget ? "button" : "icon";
    kingdom->setPixmap(QPixmap(QString("image/kingdom/%1/%2.png").arg(folder).arg(Self->getKingdom())));

    avatar->show();
    kingdom->show();

    update();
}

void Dashboard::updateSmallAvatar(){
    const General *general2 = Self->getGeneral2();
    if(general2){
        small_avatar->setToolTip(Self->getAllSkillDescription());
        bool success = small_avatar->changePixmap(general2->getPixmapPath("tiny"));

        if(!success){
            QPixmap pixmap(General::TinyIconSize);
            pixmap.fill(Qt::black);

            QPainter painter(&pixmap);

            painter.setPen(Qt::white);
            painter.drawText(0, 0, pixmap.width(), pixmap.height(),
                             Qt::AlignCenter,
                             Sanguosha->translate(Self->getGeneral2Name()));

            small_avatar->setPixmap(pixmap);
        }
    }
    updateAvatar();

    update();
}

void Dashboard::updateReadyItem(bool visible){
    ready_item->setVisible(visible);
}

// similar with Photo::refresh, just an alias to update
void Dashboard::refresh(){
    update();
}

Pixmap *Dashboard::getAvatar(){
    return avatar;
}

void Dashboard::selectCard(const QString &pattern, bool forward){
    if(selected)
        selected->select(); // adjust the position

    // find all cards that match the card type
    QList<CardItem*> matches;

    foreach(CardItem *card_item, card_items){
        if(card_item->isEnabled()){
            if(pattern == "." || card_item->getFilteredCard()->match(pattern))
                matches << card_item;
        }
    }

    if(matches.isEmpty()){
        unselectAll();
        return;
    }

    int index = matches.indexOf(selected);
    int n = matches.length();
    if(forward)
        index = (index + 1) % n;
    else
        index = (index - 1 + n) % n;

    CardItem *to_select = matches[index];

    if(to_select != selected){
        if(selected)
            selected->unselect();
        to_select->select();
        selected = to_select;
        auto_select = true;

        emit card_selected(selected->getFilteredCard());
    }
}

const Card *Dashboard::getSelected() const{
    if(view_as_skill && pending_card)
        return pending_card;
    else if(selected)
        return selected->getFilteredCard();
    else
        return NULL;
}

void Dashboard::unselectAll(){
    selected = NULL;

    foreach(CardItem *card_item, card_items){
        card_item->unselect();
        //card_item->goBack();
    }
}

void Dashboard::hideAvatar(){
    avatar->hide();

    if(button_widget == NULL)
        kingdom->hide();
}

void Dashboard::installDelayedTrick(CardItem *card){
    judging_area << card;
    const DelayedTrick *trick = DelayedTrick::CastFrom(card->getCard());
    QGraphicsPixmapItem *item = new QGraphicsPixmapItem(this);
    item->setPixmap(QPixmap(trick->getIconPath()));
    QString tooltip = trick->getDescription();
    if(trick->isVirtualCard())
        tooltip = QString("%1<br/>----------<br/>%2").arg(tooltip)
                .arg(Sanguosha->getCard((trick->getSubcards()).at(0))->getDescription());
    item->setToolTip(tooltip);
    item->setPos(3 + delayed_tricks.length() * 27, 5);
    delayed_tricks << item;

    card->setHomePos(mapToScene(QPointF(34, 37)));
    card->goBack(true,false);

    update();
}

QRectF Dashboard::boundingRect() const{
    qreal width = left->boundingRect().width() + middle->rect().width() + right->boundingRect().width();
    qreal height = middle->rect().height();
    return QRectF(0, 0, width, height);
}

int Dashboard::getTextureWidth() const{
    return middle->brush().texture().width() + left_pixmap.width() + right_pixmap.width();
}

void Dashboard::setMiddleWidth(int middle_width){
    int left_width = left_pixmap.width();
    qreal middle_height = middle->rect().height();

    middle->setRect(0, 0, middle_width + getButtonWidgetWidth(), middle_height);
    middle->setX(left_width);

    if(button_widget)
        button_widget->setX(left_width + middle_width);

    right->setX(left_width + middle_width + getButtonWidgetWidth());

    trusting_item->setRect(middle->rect());
    trusting_item->setX(left_width);
    trusting_text->setPos(middle_width/2, middle_height/2);
}

void Dashboard::setWidth(int width){
    if(width == 0){
        setMiddleWidth(middle->brush().texture().width());

        prepareGeometryChange();
        adjustCards();

    }else if(width > 500){
        qreal left_width = left->boundingRect().width();
        qreal right_width = right->boundingRect().width();
        qreal button_width = getButtonWidgetWidth();
        qreal middle_width = width - left_width - right_width - button_width;

        setMiddleWidth(middle_width);

        prepareGeometryChange();
        adjustCards();
    }
}

QGraphicsProxyWidget *Dashboard::addWidget(QWidget *widget, int x, bool from_left){
    QGraphicsProxyWidget *proxy_widget = new QGraphicsProxyWidget(this);
    proxy_widget->setWidget(widget);
    proxy_widget->setParentItem(from_left ? left : right);
    proxy_widget->setPos(x, -32);

    return proxy_widget;
}

QPushButton *Dashboard::createButton(const QString &name){
    QPushButton *button = new QPushButton;
    button->setEnabled(false);

    QPixmap icon_pixmap(QString("image/system/button/%1.png").arg(name));
    QPixmap icon_pixmap_disabled(QString("image/system/button/%1-disabled.png").arg(name));

    QIcon icon(icon_pixmap);
    icon.addPixmap(icon_pixmap_disabled, QIcon::Disabled);

    //button->setIcon(icon);
    //button->setIconSize(icon_pixmap.size());
    button->setFixedSize(icon_pixmap.size());
    button->setObjectName(name);
    button->setProperty("game_control",true);

    button->setAttribute(Qt::WA_TranslucentBackground);

    return button;
}

QPushButton *Dashboard::addButton(const QString &name, int x, bool from_left){
    QPushButton *button = createButton(name);
    addWidget(button, x, from_left);
    return button;
}

QProgressBar *Dashboard::addProgressBar(){
    QProgressBar *progress_bar = new QProgressBar;
    progress_bar->setObjectName("dash-bar");
    progress_bar->setMinimum(0);
    progress_bar->setMaximum(100);
    progress_bar->setFixedSize(472, 20);
    progress_bar->setTextVisible(false);

    QGraphicsProxyWidget *widget = new QGraphicsProxyWidget(right);
    widget->setWidget(progress_bar);
    widget->setParentItem(middle);
    settings->beginGroup("progress_bar");
    QList<QVariant> coord = settings->value("pos").toList();
    widget->setPos(coord.at(0).toReal(), coord.at(1).toReal());
    widget->setOpacity(settings->value("opacity").toReal());
    settings->endGroup();

    progress_bar->hide();

    return progress_bar;
}

void Dashboard::drawHp(QPainter *painter) const{
    int hp = qMax(0, Self->getHp());
    int max_hp = Self->getMaxHP();
    int index = Self->isWounded() ? qMin(hp, 5) : 5;
    QPixmap *magatama = MagatamaWidget::GetMagatama(index);
    QPixmap *zero_magatama = MagatamaWidget::GetMagatama(0);

    qreal start_x = left_pixmap.width() + middle->rect().width();

    if(max_hp > 8){
        painter->drawPixmap(start_x + 20, 5, *magatama);
        QFont serifFont("Georgia", 14, QFont::Bold);
        painter->setFont(serifFont);
        painter->setBrush(Qt::yellow);
        painter->drawText(start_x + 45, 23, QString(" %1 / %2").arg(hp).arg(max_hp));
        return;
    }
    else if(max_hp > 6){
        magatama = MagatamaWidget::GetSmallMagatama(index);
        zero_magatama = MagatamaWidget::GetSmallMagatama(0);
    }

    qreal total_width = magatama->width() * max_hp;
    qreal skip = (121 - total_width)/ (max_hp + 1);

    int i;
    for(i=0; i<hp; i++)
        painter->drawPixmap(start_x + skip *(i+1) + i * magatama->width(), 5, *magatama);
    for(i=hp; i<max_hp; i++)
        painter->drawPixmap(start_x + skip *(i+1) + i * magatama->width(), 5, *zero_magatama);
}

void Dashboard::killPlayer(){
    if(death_item){
        delete death_item;
        death_item = NULL;
    }

    death_item = new QGraphicsPixmapItem(QPixmap(Self->getDeathPixmapPath()), this);
    settings->beginGroup("death_item");
    QList<QVariant> coord = settings->value("pos").toList();
    death_item->setPos(coord.at(0).toReal(), coord.at(1).toReal());
    death_item->setOpacity(settings->value("opacity").toReal());
    settings->endGroup();

    filter = NULL;

    avatar->makeGray();
    small_avatar->makeGray();
}

void Dashboard::revivePlayer(){
    if(death_item){
        delete death_item;
        death_item = NULL;
    }

    updateAvatar();
}

void Dashboard::paint(QPainter *painter, const QStyleOptionGraphicsItem *, QWidget *){
    // draw the left side and right side
    painter->drawPixmap(left->pos(), left_pixmap);
    painter->drawPixmap(right->pos(), right_pixmap);

    // draw player's name
    painter->setPen(Qt::white);
    QRectF name_rect(24 + right->x(), 42 + right->y(), 90, 12);
    painter->drawText(name_rect, Config.UserName, QTextOption(Qt::AlignHCenter));

    if(!Self)
        return;

    // draw player's equip area
    painter->setPen(Qt::white);

    drawEquip(painter, weapon, 0);
    drawEquip(painter, armor, 1);
    drawEquip(painter, defensive_horse, 2);
    drawEquip(painter, offensive_horse, 3);

    drawHp(painter);

    chain_icon->setVisible(Self->isChained());
    back_icon->setVisible(!Self->faceUp());
    jail_icon->setVisible(Self->containsTrick("indulgence", false));
    wake_icon->setVisible(!Self->getWakeSkills().isEmpty());
    ecst_area->setVisible(Self->hasFlag("ecst"));

    middle->setToolTip(tr("HandcardNum:%1").arg(handcard_num->text()));
}

void Dashboard::mousePressEvent(QGraphicsSceneMouseEvent *){
    CardItem *to_select = NULL;
    int i;
    for(i=0; i<4; i++){
        if(equip_rects[i]->isUnderMouse()){
            to_select = *equips.at(i);
            break;
        }
    }

    if(to_select && to_select->isMarkable()){
        to_select->mark(!to_select->isMarked());

        update();
    }
}

void Dashboard::drawEquip(QPainter *painter, const CardItem *equip, int order){
    if(!equip)
        return;

    static const int width = 145;
    static const int start_y = 40;

    int y = start_y + order * 32;

    const EquipCard *card = qobject_cast<const EquipCard *>(equip->getCard());
    painter->setPen(Qt::black);

    // draw image or name
    QString path = QString("image/equips/%1.png").arg(card->objectName());
    QPixmap label;
    if(!QPixmapCache::find(path, &label)){
        label.load(path);
        QPixmapCache::insert(path, label);
    }

    if(label.isNull()){
        painter->setPen(Qt::white);
        QString text = QString("%1").arg(card->label());
        painter->drawText(10, y + 20, text);
    }else{
        QFont font("Algerian",12);
        font.setBold(true);
        painter->setFont(font);
        painter->drawPixmap(8,y + 2,label.width(),label.height(),label);
    }

    // draw the suit of equip
    QRect suit_rect(width - 19, y + 10, 13, 13);
    painter->drawPixmap(suit_rect, equip->getSuitPixmap(true));

    // draw the number of equip

    //painter->drawText(width - 4,y + 23,QString("%1").arg(card->getNumberString()));
    painter->drawPixmap(width - 14,y + 3,equip->getNumberPixmap());

    painter->setPen(Qt::white);
    if(equip->isMarked())
        painter->drawRect(8,y + 2,label.width(),label.height());
}

void Dashboard::adjustCards(){
    int MaxCards = Config.MaxCards;

    int n = card_items.length();

    if(n > MaxCards){
        if(n > MaxCards * 2)
            MaxCards *= 2;

        if(n > MaxCards * 2)
            MaxCards *= 2;

        QList<CardItem *> all_items;

        int i, j, row_count = (n-1) / MaxCards + 1;
        int diff = (CardItem::NormalY - CardItem::PendingY) / (row_count -1);

        for(i=0; i<row_count; i ++){
            QList<CardItem *> row;
            for(j=0; j<MaxCards; j++){
                int index = i*MaxCards + j;
                if(index >= n)
                    break;

                row << card_items.at(index);
            }

            QListIterator<CardItem *> itor(row);
            itor.toBack();
            while(itor.hasPrevious())
                all_items.prepend(itor.previous());

            adjustCards(row, CardItem::NormalY - diff * i);
        }

        // reset Z value
        for(i=0; i<n; i++)
            all_items.at(i)->setZValue(2.0 + 0.0001 * i);
    }else{
        adjustCards(card_items, CardItem::NormalY);

        if(view_as_skill)
            adjustCards(pendings, CardItem::PendingY);
    }
}

void Dashboard::adjustCards(const QList<CardItem *> &list, int y){
    if(list.isEmpty())
        return;

    int max_width = middle->rect().width() - getButtonWidgetWidth();
    int start_x = left->boundingRect().width();

    if(list.length() == 1){
        list.first()->setHomePos(QPointF(start_x, y));
        list.first()->goBack();
        return;
    }

    int n = list.size();
    int card_width = list.first()->boundingRect().width();
    int total_width = qMin(card_width * n, max_width);
    int card_skip = (total_width - n * card_width ) / (n-1) + card_width;

    int i;
    for(i=0; i<n; i++){
        if(card_items.length() <= Config.MaxCards)
            list[i]->setZValue(2.0 + 0.0001 * i);

        QPointF home_pos(start_x + i * card_skip, y);
        list[i]->setHomePos(home_pos);
        list[i]->goBack();
    }
}

void Dashboard::installEquip(CardItem *equip){
    equip->setHomePos(mapToScene(QPointF(34, 37)));
    equip->goBack(true,false);

    int index = -1;
    const EquipCard *equip_card = qobject_cast<const EquipCard *>(equip->getCard());
    switch(equip_card->location()){
    case EquipCard::WeaponLocation: weapon = equip; index = 0; break;
    case EquipCard::ArmorLocation: armor = equip; index = 1; break;
    case EquipCard::DefensiveHorseLocation: defensive_horse = equip; index = 2; break;
    case EquipCard::OffensiveHorseLocation: offensive_horse = equip; index = 3; break;
    }

    if(index >= 0)
        equip_rects[index]->setToolTip(equip_card->getDescription());

    update();
}

CardItem *Dashboard::takeCardItem(int card_id, Player::Place place){
    CardItem *card_item = NULL;

    if(place == Player::Hand){
        card_item = CardItem::FindItem(card_items, card_id);
        if(card_item == selected)
            selected = NULL;
        card_items.removeOne(card_item);
        adjustCards();

        if(Self->isKongcheng())
            handcard_num->parentItem()->hide();
        else
            handcard_num->setText(QString::number(Self->getHandcardNum()));

        if(card_item)
            card_item->hideFrame();
    }else if(place == Player::Equip){
        foreach(CardItem **equip_ptr, equips){
            CardItem *equip = *equip_ptr;
            if(equip && equip->getCard()->getId() == card_id){
                card_item = equip;
                *equip_ptr = NULL;

                int index = equips.indexOf(equip_ptr);
                equip_rects[index]->setToolTip(QString());
                break;
            }
        }

    }else if(place == Player::Judging){
        card_item = CardItem::FindItem(judging_area, card_id);
        if(card_item){
            card_item->hideFrame();
            int index = judging_area.indexOf(card_item);
            judging_area.removeAt(index);
            delete delayed_tricks.takeAt(index);
            for(int i=0; i<delayed_tricks.count(); i++){
                delayed_tricks.at(i)->setPos(3 + i * 27, 5);
            }
        }
    }

    if(card_item){
        card_item->disconnect(this);
        update();
        return card_item;
    }else{
        return NULL;
    }
}

typedef bool (*CompareFunc)(const CardItem *, const CardItem *);

static bool CompareByColor(const CardItem *a, const CardItem *b){
    return Card::CompareByColor(a->getCard(), b->getCard());
}

static bool CompareBySuitNumber(const CardItem *a, const CardItem *b){
    return Card::CompareBySuitNumber(a->getCard(), b->getCard());
}

static bool CompareByType(const CardItem *a, const CardItem *b){
    return Card::CompareByType(a->getCard(), b->getCard());
}

static bool CompareByAvailability(const CardItem *a, const CardItem *b){
    bool x = a->isEnabled();
    bool y = b->isEnabled();
    if(x != y)
        return y;
    else
        return CompareBySuitNumber(a, b);
}

void Dashboard::sortCards(int sort_type){
    this->sort_type = sort_type;

    static CompareFunc compare_funcs[] = {
        NULL,
        CompareByColor,
        CompareBySuitNumber,
        CompareByType,
        CompareByAvailability,
    };

    CompareFunc func = compare_funcs[sort_type];
    if(func)
        qSort(card_items.begin(), card_items.end(), func);

    adjustCards();
}

void Dashboard::sortCardsAuto(){
    QAction *action = qobject_cast<QAction *>(sender());
    if(action)
        sortCards(action->data().toInt());
}

void Dashboard::reverseSelection(){
    if(view_as_skill == NULL)
        return;

    QSet<CardItem *> selected_set = pendings.toSet();
    unselectAll();

    foreach(CardItem *item, card_items)
        item->setEnabled(false);

    pendings.clear();

    foreach(CardItem *item, card_items){
        if(view_as_skill->viewFilter(pendings, item) && !selected_set.contains(item)){
            item->select();
            pendings << item;

            item->setEnabled(true);
        }
    }

    if(pending_card && pending_card->isVirtualCard() && pending_card->parent() == NULL)
        delete pending_card;
    pending_card = view_as_skill->viewAs(pendings);

    emit card_selected(pending_card);
}

void Dashboard::disableAllCards(){
    foreach(CardItem *card_item, card_items){
        card_item->setEnabled(false);
    }
}

void Dashboard::enableCards(){
    foreach(CardItem *card_item, card_items){
        card_item->setEnabled(card_item->getFilteredCard()->isAvailable(Self));
    }
}

void Dashboard::enableAllCards(){
    foreach(CardItem *card_item, card_items)
        card_item->setEnabled(true);
}

void Dashboard::startPending(const ViewAsSkill *skill){
    view_as_skill = skill;
    pendings.clear();

    foreach(CardItem **equip_ptr, equips){
        CardItem *equip = *equip_ptr;
        if(equip)
            connect(equip, SIGNAL(mark_changed()), this, SLOT(onMarkChanged()));
    }

    updatePending();
    adjustCards();
}

void Dashboard::stopPending(){
    view_as_skill = NULL;
    pending_card = NULL;
    emit card_selected(NULL);

    foreach(CardItem **equip_ptr, equips){
        CardItem *equip = *equip_ptr;
        if(equip){
            equip->setMarkable(false);
            disconnect(equip, SIGNAL(mark_changed()));
        }
    }

    pendings.clear();
    adjustCards();
}

void Dashboard::onCardItemClicked(){
    CardItem *card_item = qobject_cast<CardItem *>(sender());
    if(!card_item)
        return;

    if(auto_select)
        unselectAll();
    if(view_as_skill){
        if(card_item->isPending()){
            card_item->unselect();
            pendings.removeOne(card_item);
        }else{
            card_item->select();
            pendings << card_item;
        }

        updatePending();

    }else{
        if(card_item->isPending()){
            unselectAll();
            emit card_selected(NULL);
        }else{
            unselectAll();
            card_item->select();
            //card_item->goBack();
            selected = card_item;

            emit card_selected(selected->getFilteredCard());
        }
    }
    auto_select = false;
}

void Dashboard::updatePending(){
    foreach(CardItem *c, card_items){
        if(!c->isPending()||pendings.isEmpty()){
            c->setEnabled(view_as_skill->viewFilter(pendings, c));
        }
    }

    foreach(CardItem **equip_ptr, equips){
        CardItem *equip = *equip_ptr;
        if(equip && !equip->isMarked())
            equip->setMarkable(view_as_skill->viewFilter(pendings, equip));
    }

    const Card *new_pending_card = view_as_skill->viewAs(pendings);
    if(pending_card != new_pending_card){
        pending_card = new_pending_card;
        emit card_selected(pending_card);
    }
}


void Dashboard::onCardItemThrown(){
    CardItem *card_item = qobject_cast<CardItem *>(sender());
    if(card_item){
        if(!view_as_skill)
            selected = card_item;
        emit card_to_use();
    }
}

void Dashboard::onCardItemHover()
{
    QGraphicsItem *card_item = qobject_cast<QGraphicsItem *>(sender());
    if(!card_item)return;

    animations->emphasize(card_item);
}

void Dashboard::onCardItemLeaveHover()
{
    QGraphicsItem *card_item = qobject_cast<QGraphicsItem *>(sender());
    if(!card_item)return;

    animations->effectOut(card_item);
}

void Dashboard::onMarkChanged(){
    CardItem *card_item = qobject_cast<CardItem *>(sender());

    Q_ASSERT(card_item->isEquipped());

    if(card_item){
        if(card_item->isMarked()){
            if(!pendings.contains(card_item))
                pendings.append(card_item);
        }else
            pendings.removeOne(card_item);

        updatePending();
    }
}

const ViewAsSkill *Dashboard::currentSkill() const{
    return view_as_skill;
}

const Card *Dashboard::pendingCard() const{
    return pending_card;
}

int Dashboard::getRightPosition()
{
    return left_pixmap.width() + middle->rect().width();
}

int Dashboard::getMidPosition()
{
    return left_pixmap.width();
}
