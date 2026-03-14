local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local l_getFFlagAppChatRebrandIconUpdates_0 = require(l_Parent_0.SharedFlags).getFFlagAppChatRebrandIconUpdates;
return function() --[[ Line: 16 ]]
    -- upvalues: l_getFFlagAppChatRebrandIconUpdates_0 (copy)
    local v2 = 20;
    local v3 = {
        on = "icons/menu/chat_on", 
        off = "icons/menu/chat_off"
    };
    if l_getFFlagAppChatRebrandIconUpdates_0() then
        v2 = 30;
        v3 = {
            on = "icons/menu/platformChatOn", 
            off = "icons/menu/platformChatOff"
        };
    end;
    return {
        label = "CoreScripts.TopBar.Chat", 
        icon = v3, 
        iconSize = v2
    };
end;