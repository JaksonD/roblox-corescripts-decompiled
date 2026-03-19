local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Signals);
local v2 = nil;
local v3, v4 = v1.createSignal(false);
return ((function() --[[ Line: 11 ]] --[[ Name: createSettingsHubService ]]
    -- upvalues: v2 (ref), v3 (copy), v4 (copy)
    return {
        register = function(v5) --[[ Line: 14 ]] --[[ Name: register ]]
            -- upvalues: v2 (ref)
            v2 = v5;
        end, 
        hubRef = function() --[[ Line: 19 ]] --[[ Name: hubRef ]]
            -- upvalues: v2 (ref)
            return v2 and v2.HubRef or nil;
        end, 
        showMenuButtonsContainer = v3, 
        setShowMenuButtonsContainer = v4
    };
end)());