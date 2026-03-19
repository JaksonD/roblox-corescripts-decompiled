local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_pageHeartbeat_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).Events.pageHeartbeat;
local l_userInteractions_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).Events.userInteractions;
local v4 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
return {
    get = function(v5) --[[ Line: 15 ]] --[[ Name: get ]]
        -- upvalues: v4 (copy), l_pageHeartbeat_0 (copy), l_userInteractions_0 (copy)
        local v6 = v4.get(v5);
        return {
            reportPageHeartbeat = function(v7, v8) --[[ Line: 20 ]] --[[ Name: reportPageHeartbeat ]]
                -- upvalues: l_pageHeartbeat_0 (ref), v6 (copy)
                l_pageHeartbeat_0(v6.EventStream, v7, v8);
            end, 
            reportPageChanged = function() --[[ Line: 24 ]] --[[ Name: reportPageChanged ]]
                -- upvalues: l_userInteractions_0 (ref), v6 (copy)
                l_userInteractions_0(v6.EventStream, "luaPage");
            end
        };
    end
};