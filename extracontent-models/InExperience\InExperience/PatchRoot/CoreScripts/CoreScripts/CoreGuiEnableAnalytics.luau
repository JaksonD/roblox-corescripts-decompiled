local l_StarterGui_0 = game:GetService("StarterGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_EventStream_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventStream;
local v4 = {};
v4.__index = v4;
v4.new = function() --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: l_EventStream_0 (copy), l_RbxAnalyticsService_0 (copy), l_StarterGui_0 (copy), v4 (copy)
    local v5 = {
        evenStream = l_EventStream_0.new(l_RbxAnalyticsService_0), 
        playSessionStart = os.clock()
    };
    v5.sendCoreGuiAnalytic = function(v6, v7) --[[ Line: 25 ]]
        -- upvalues: v5 (copy), l_RbxAnalyticsService_0 (ref)
        local v8 = nil;
        v8 = math.round((os.clock() - v5.playSessionStart) * 1000);
        local v9 = {
            placeid = tostring(game.PlaceId), 
            universeid = tostring(game.GameId), 
            type = tostring(v6.Name), 
            enabled = tostring(v7), 
            sessionid = l_RbxAnalyticsService_0:GetSessionId(), 
            playSessionDurationMs = tostring(v8)
        };
        v5.evenStream:sendEventDeferred("core_gui_type", "core_gui_type", v9);
    end;
    v5.signalConnection = l_StarterGui_0.CoreGuiChangedSignal:Connect(function(v10, v11) --[[ Line: 42 ]]
        -- upvalues: v5 (copy)
        v5.sendCoreGuiAnalytic(v10, v11);
    end);
    setmetatable(v5, v4);
    return v5;
end;
v4.DisconnectSignal = function(v12) --[[ Line: 50 ]] --[[ Name: DisconnectSignal ]]
    v12.signalConnection:Disconnect();
end;
local _ = v4.new();
return v4;