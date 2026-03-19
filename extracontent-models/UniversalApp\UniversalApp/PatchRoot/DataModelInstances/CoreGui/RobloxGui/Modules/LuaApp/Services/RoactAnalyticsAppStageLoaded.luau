local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Events_0 = l_Modules_0.LuaApp.Analytics.Events;
local v2 = require(l_Events_0.appStageLoaded);
local v3 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
return {
    get = function(v4) --[[ Line: 14 ]] --[[ Name: get ]]
        -- upvalues: v3 (copy), v2 (copy)
        local v5 = v3.get(v4);
        return {
            reportAppReady = function(v6) --[[ Line: 19 ]] --[[ Name: reportAppReady ]]
                -- upvalues: v2 (ref), v5 (copy)
                v2(v5.EventStream, v6, "appReady");
            end
        };
    end
};