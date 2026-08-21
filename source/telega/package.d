/++
Top level module of the telega library.

Two generations of Telegram Bot API definitions are shipped:

$(UL
    $(LI $(B legacy) - hand-written modules for the older API
        ($(LINK2 https://telega.lmsoftware.ru, import telega.telegram.legacy.*);))
    $(LI $(B generated) - generated modules for Bot API 10.x
        (import telega.telegram.generated.*;))
)

Import the generation you need explicitly to avoid symbol ambiguity.
+/
module telega;

public import telega.botapi;
public import telega.helpers;

public import telega.telegram.legacy.basic;
public import telega.telegram.legacy.groupchat;
public import telega.telegram.legacy.games;
public import telega.telegram.legacy.inline;
public import telega.telegram.legacy.passport;
public import telega.telegram.legacy.payments;
public import telega.telegram.legacy.stickers;
public import telega.telegram.legacy.updmessages;
public import telega.telegram.legacy.webhook;
