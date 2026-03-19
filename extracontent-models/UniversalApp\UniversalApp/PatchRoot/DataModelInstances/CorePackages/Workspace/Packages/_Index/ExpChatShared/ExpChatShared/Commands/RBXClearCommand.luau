local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChatShared");
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v2 = require(l_Actions_0.ChatWindowMessagesCleared);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FFlagExpChatUseMessagesStore_0 = require(l_Parent_0.SharedFlags).FFlagExpChatUseMessagesStore;
local _ = require(script.Parent.types);
return {
    name = script.Name, 
    alias = {
        "/clear", 
        "/cls"
    }, 
    clientRun = function(v6, _, _, v9) --[[ Line: 14 ]] --[[ Name: clientRun ]]
        -- upvalues: l_FFlagExpChatUseMessagesStore_0 (copy), v2 (copy)
        if l_FFlagExpChatUseMessagesStore_0 then
            if v9 and v9.messagesStore then
                v9.messagesStore.clearWindowMessages();
            else
                return {
                    key = "CoreScripts.TextChat.MessageStatus.Warning.Unknown", 
                    args = {}, 
                    metadata = "Roblox.Clear.Error.ContextNotAvailable"
                };
            end;
        else
            v6:dispatch(v2());
        end;
        return {
            key = "", 
            metadata = "Roblox.Clear.Info.Success"
        };
    end
};