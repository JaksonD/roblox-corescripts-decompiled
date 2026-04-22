return function() --[[ Line: 10 ]]
    local v0 = 20;
    local v1 = {
        on = "icons/menu/chat_on", 
        off = "icons/menu/chat_off"
    };
    v0 = 30;
    v1 = {
        on = "icons/menu/platformChatOn", 
        off = "icons/menu/platformChatOff"
    };
    return {
        label = "CoreScripts.TopBar.Chat", 
        icon = v1, 
        iconSize = v0
    };
end;