local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent.Parent;
if require(l_Parent_0.Flags.FFlagTopBarDeprecateChatRodux) then
    return nil;
else
    local l_Actions_0 = script.Parent.Parent.Actions;
    local v4 = require(l_Actions_0.UpdateChatMessages);
    local v5 = require(l_Actions_0.UpdateUnreadMessagesBadge);
    local v6 = require(l_Actions_0.UpdateChatVisible);
    local v7 = require(l_Actions_0.SetCanChat);
    local v8 = {
        canChat = false, 
        visible = true, 
        lastReadMessages = 0, 
        unreadMessages = 0
    };
    return (v1.createReducer(v8, {
        [v5.name] = function(v9, v10) --[[ Line: 28 ]]
            if v9.visible then
                return {
                    canChat = v9.canChat, 
                    visible = true, 
                    lastReadMessages = 0, 
                    unreadMessages = 0
                };
            else
                return {
                    canChat = v9.canChat, 
                    visible = false, 
                    lastReadMessages = 0, 
                    unreadMessages = v10.messages
                };
            end;
        end, 
        [v4.name] = function(v11, v12) --[[ Line: 46 ]]
            if v11.visible then
                return {
                    canChat = v11.canChat, 
                    visible = true, 
                    lastReadMessages = v12.messages, 
                    unreadMessages = 0
                };
            else
                return {
                    canChat = v11.canChat, 
                    visible = false, 
                    lastReadMessages = v11.lastReadMessages, 
                    unreadMessages = v12.messages - v11.lastReadMessages
                };
            end;
        end, 
        [v6.name] = function(v13, v14) --[[ Line: 64 ]]
            if v14.visible then
                return {
                    canChat = v13.canChat, 
                    visible = true, 
                    lastReadMessages = v13.lastReadMessages + v13.unreadMessages, 
                    unreadMessages = 0
                };
            else
                return {
                    canChat = v13.canChat, 
                    visible = false, 
                    lastReadMessages = v13.lastReadMessages, 
                    unreadMessages = v13.unreadMessages
                };
            end;
        end, 
        [v7.name] = function(v15, v16) --[[ Line: 82 ]]
            return {
                canChat = v16.canChat, 
                visible = v15.visible, 
                lastReadMessages = v15.lastReadMessages, 
                unreadMessages = v15.unreadMessages
            };
        end
    }));
end;