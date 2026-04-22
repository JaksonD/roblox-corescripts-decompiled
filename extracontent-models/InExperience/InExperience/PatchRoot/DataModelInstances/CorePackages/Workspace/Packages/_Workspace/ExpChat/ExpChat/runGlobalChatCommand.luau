local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ExpChatShared);
local v3 = require(l_Parent_0.SharedFlags);
local v4 = require(l_script_FirstAncestor_0.Stores.GetMessagesStore);
local v5 = require(l_script_FirstAncestor_0.Stores.GetChannelTabsStore);
local v6 = require(l_script_FirstAncestor_0.Actions.UniverseChatSystemMessageAdded);
local l_FFlagExpChatUseMessagesStore_0 = v3.FFlagExpChatUseMessagesStore;
local l_FFlagExpChatUseChannelTabsStore_0 = v3.FFlagExpChatUseChannelTabsStore;
local l_context_0 = v2.context;
local l_GlobalCommands_0 = v2.GlobalCommands;
local v11 = v2.Logger:new("ExpChat/" .. script.Name);
return function(v12, v13) --[[ Line: 17 ]]
    -- upvalues: l_context_0 (copy), v11 (copy), l_GlobalCommands_0 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), v4 (copy), l_FFlagExpChatUseChannelTabsStore_0 (copy), v5 (copy), v6 (copy)
    if not l_context_0.translator then
        v11:warning("context.translator is nil, cannot execute command");
        return false;
    else
        for _, v15 in ipairs(l_GlobalCommands_0.getGlobalEnabledCommands()) do
            for _, v17 in ipairs(v15.alias) do
                if v12 == v17 or string.find(v12, "^" .. v17 .. "%s") ~= nil then
                    local v18 = v15.clientRun(l_context_0.store, v13, v12, l_context_0);
                    if v18 ~= nil then
                        local l_key_0 = v18.key;
                        local v20 = nil;
                        if type(l_key_0) == "string" and l_key_0 ~= "" then
                            v20 = l_context_0.translator:FormatByKey(l_key_0, v18.args);
                        elseif type(l_key_0) == "table" and #l_key_0 > 0 then
                            local v21 = {};
                            for _, v23 in l_key_0 do
                                table.insert(v21, l_context_0.translator:FormatByKey(v23, v18.args));
                            end;
                            v20 = table.concat(v21, "\n");
                        end;
                        if v20 then
                            if l_FFlagExpChatUseMessagesStore_0 then
                                v4(false).addSystemMessage(v20, "RBXGlobal");
                                if l_FFlagExpChatUseChannelTabsStore_0 then
                                    v5(false).markChannelUnread("RBXGlobal");
                                end;
                            else
                                l_context_0.store:dispatch(v6(v20, "RBXGlobal"));
                            end;
                        end;
                    end;
                    return true;
                end;
            end;
        end;
        return false;
    end;
end;