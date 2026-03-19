local l_Parent_0 = script.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local v2 = require(script.Parent.reportCounter);
local v3 = require(script.Parent.customFields);
return {
    customFields = v3, 
    reportNewDevtoolsConnection = function() --[[ Line: 12 ]] --[[ Name: reportNewDevtoolsConnection ]]
        -- upvalues: v2 (copy), v3 (copy)
        v2({
            eventName = "react_new_devtools_connection", 
            lastUpdated = {
                2025, 
                8, 
                28
            }, 
            description = "A new connection to React Devtools", 
            links = "https://roblox.atlassian.net/wiki/spaces/luauee/pages/3836510338/DevTools+Telemetry", 
            customFields = v3
        });
    end, 
    reportFailedDevtoolsConnection = function(v4) --[[ Line: 23 ]] --[[ Name: reportFailedDevtoolsConnection ]]
        -- upvalues: v2 (copy), l_Object_0 (copy), v3 (copy)
        v2({
            eventName = "react_failed_devtools_connection", 
            lastUpdated = {
                2025, 
                8, 
                28
            }, 
            description = "A failed connection to React Devtools", 
            links = "https://roblox.atlassian.net/wiki/spaces/luauee/pages/3836510338/DevTools+Telemetry", 
            customFields = l_Object_0.assign({}, v3, {
                error_type = v4
            })
        });
    end
};