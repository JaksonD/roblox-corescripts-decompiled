local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v4 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_NavigationEvents_0 = require(l_CorePackages_0.Packages.RoactNavigation).NavigationEvents;
return function(v6) --[[ Line: 24 ]] --[[ Name: EventStreamLogger ]]
    -- upvalues: v3 (copy), v4 (copy), v2 (copy), l_NavigationEvents_0 (copy)
    local v7 = v3(v4);
    local function v8() --[[ Line: 27 ]] --[[ Name: sendEventLog ]]
        -- upvalues: v7 (copy), v6 (copy)
        v7.EventStream:sendEventDeferred(v6.eventContext, v6.eventName, v6.additionalArgs);
    end;
    v2.useEffect(function() --[[ Line: 31 ]]
        -- upvalues: v6 (copy), v7 (copy)
        if v6.when == "OnMount" then
            v7.EventStream:sendEventDeferred(v6.eventContext, v6.eventName, v6.additionalArgs);
        end;
    end, {});
    if v6.when == "OnFocus" then
        return v2.createElement(l_NavigationEvents_0, {
            onDidFocus = v8
        });
    else
        return nil;
    end;
end;