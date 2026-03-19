local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.NotificationCardContext);
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.React);
local _ = require(l_Parent_1.type);
local v6 = require(l_Parent_1.constants);
local v7 = require(l_Parent_1.analytics.analyticsService);
local l_utils_0 = l_Parent_1.utils;
local v9 = require(l_utils_0.toastNotificationHelper);
return function(v10) --[[ Line: 23 ]] --[[ Name: NotificationCardProvider ]]
    -- upvalues: v7 (copy), v6 (copy), v9 (copy), v4 (copy), v2 (copy)
    local l_EventStream_0 = v7.EventStream;
    local v12 = {
        thumbnail = v6.CardSizeDefault.thumbnail, 
        cardPadding = v6.Padding.DefaultCardPadding
    };
    if v10.isCompact then
        v12.thumbnail = v6.CardSizeCompact.thumbnail;
        v12.cardPadding = v6.Padding.CompactCardPadding;
    end;
    local v13 = if v10.isCompact then v6.CardTransparency.Compact else v6.CardTransparency.Default;
    local function v15(v14) --[[ Line: 36 ]]
        -- upvalues: v9 (ref), l_EventStream_0 (copy)
        v9.fireEvent(l_EventStream_0, v14);
    end;
    return v4.createElement(v2.Provider, {
        value = {
            state = v10.state, 
            cardSize = v12, 
            handleActions = v10.handleActions, 
            sendEvent = v15, 
            cardTransparency = v13, 
            notificationReceivedTimestampMs = v10.notificationReceivedTimestampMs, 
            timers = v10.timers, 
            displayTimestampMs = v10.displayTimestampMs
        }
    }, v10.children);
end;