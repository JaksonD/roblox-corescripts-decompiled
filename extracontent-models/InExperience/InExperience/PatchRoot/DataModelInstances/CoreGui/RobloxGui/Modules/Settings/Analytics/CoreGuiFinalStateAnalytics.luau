local l_StarterGui_0 = game:GetService("StarterGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_EventStream_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventStream;
local v4 = {};
v4.__index = v4;
v4.new = function() --[[ Line: 22 ]] --[[ Name: new ]]
    -- upvalues: l_EventStream_0 (copy), l_RbxAnalyticsService_0 (copy), v4 (copy)
    local v5 = {
        evenStream = l_EventStream_0.new(l_RbxAnalyticsService_0)
    };
    setmetatable(v5, v4);
    return v5;
end;
v4.sendCoreGuiFinalAnalytic = function(v6) --[[ Line: 30 ]] --[[ Name: sendCoreGuiFinalAnalytic ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), l_StarterGui_0 (copy)
    local v7 = {
        placeid = tostring(game.PlaceId), 
        universeid = tostring(game.GameId), 
        sessionid = l_RbxAnalyticsService_0:GetSessionId()
    };
    for _, v9 in Enum.CoreGuiType:GetEnumItems() do
        v7[v9.Name] = tostring(l_StarterGui_0:GetCoreGuiEnabled(v9));
    end;
    local v10 = "";
    pcall(function() --[[ Line: 43 ]]
        -- upvalues: v10 (ref), l_StarterGui_0 (ref)
        v10 = tostring(l_StarterGui_0:GetCore("ResetButtonCallback"));
    end);
    v7.ResetButtonCallback = v10;
    v6.evenStream:sendEventDeferred("core_gui_final_state", "core_gui_final_state", v7);
end;
return v4;