local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatDialogTelemetryLayer);
local v3 = require(l_Parent_0.React);
return function(v4) --[[ Line: 10 ]]
    -- upvalues: v3 (copy), v2 (copy)
    return function(v5) --[[ Line: 11 ]]
        -- upvalues: v3 (ref), v2 (ref), v4 (copy)
        local v6 = if v5.navigation then v5.navigation.getParam("conversationId") else nil;
        local v7 = v3.useMemo(function() --[[ Line: 14 ]]
            -- upvalues: v6 (copy)
            return {
                conversationId = v6
            };
        end, {
            v6
        });
        return v3.createElement(v2.Provider, {
            value = v7
        }, v3.createElement(v4, v5));
    end;
end;