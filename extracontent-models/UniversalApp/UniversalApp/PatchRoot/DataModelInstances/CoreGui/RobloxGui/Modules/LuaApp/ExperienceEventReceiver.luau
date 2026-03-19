local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_MessageBus_0 = require(l_CorePackages_0.Workspace.Packages.MessageBus).MessageBus;
local v4 = require(l_Modules_0.Common.Signal);
local v5 = {};
v5.__index = v5;
local v6 = require(l_Modules_0.LuaApp.Flags.FFlagUseImprovedGameProtocolMessages);
v5.onLaunched = function(v7, v8) --[[ Line: 16 ]] --[[ Name: onLaunched ]]
    -- upvalues: v6 (copy), l_MessageBus_0 (copy)
    local v9 = "";
    v9 = if v6 then l_MessageBus_0.getMessageId("Game", "launchSuccess") else l_MessageBus_0.getMessageId("Game", "launch");
    return v7.subscribe(v9, v8);
end;
v5.onLeft = function(v10, v11) --[[ Line: 26 ]] --[[ Name: onLeft ]]
    -- upvalues: l_MessageBus_0 (copy)
    local v12 = l_MessageBus_0.getMessageId("Game", "onGameLeave");
    return v10.subscribe(v12, v11);
end;
v5.UnsubscribeFromAllMessages = function(v13) --[[ Line: 31 ]] --[[ Name: UnsubscribeFromAllMessages ]]
    v13.subscriber:unsubscribeFromAllMessages();
end;
v5.new = function() --[[ Line: 35 ]] --[[ Name: new ]]
    -- upvalues: l_MessageBus_0 (copy), v4 (copy), v5 (copy)
    local v14 = {
        signalTable = {}, 
        subscriber = l_MessageBus_0.Subscriber.new()
    };
    v14.subscribe = function(v15, v16) --[[ Line: 40 ]]
        -- upvalues: v14 (copy), v4 (ref)
        assert(type(v16) == "function", "Expected callback to be a function");
        local v17 = v14.signalTable[v15];
        if v17 == nil then
            v17 = v4.new();
            v14.signalTable[v15] = v17;
            v14.subscriber:subscribe({
                mid = v15
            }, function(v18) --[[ Line: 49 ]]
                -- upvalues: v17 (ref)
                v17:fire(v18);
            end);
        end;
        return v17:connect(v16);
    end;
    setmetatable(v14, v5);
    return v14;
end;
return v5;