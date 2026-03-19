local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.NotificationCardContext);
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.React);
local _ = require(l_Parent_1.type);
local v6 = require(l_Parent_1.constants);
return function(v7) --[[ Line: 24 ]] --[[ Name: NotificationCardProvider ]]
    -- upvalues: v6 (copy), v4 (copy), v2 (copy)
    local v8 = {
        thumbnail = v6.CardSizeDefault.thumbnail, 
        cardPadding = v6.Padding.DefaultCardPadding
    };
    if v7.isCompact then
        v8.thumbnail = v6.CardSizeCompact.thumbnail;
        v8.cardPadding = v6.Padding.CompactCardPadding;
    end;
    local v9 = if v7.isCompact then v6.CardTransparency.Compact else v6.CardTransparency.Default;
    return v4.createElement(v2.Provider, {
        value = {
            notificationPayload = v7.notificationPayload, 
            state = v7.state, 
            cardSize = v8, 
            handleActions = v7.handleActions, 
            openMetaActions = v7.openMetaActions, 
            readOnly = v7.readOnly, 
            cardTransparency = v9
        }
    }, v7.children);
end;