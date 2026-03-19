local l_Parent_0 = script:FindFirstAncestor("AppShortcutBar").Parent;
local v1 = require(l_Parent_0.Signals);
local v2 = require(l_Parent_0.SignalsReact);
return function() --[[ Line: 13 ]] --[[ Name: createShortcutBarStatusStore ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v3, v4 = v1.createSignal(false);
    local function v5() --[[ Line: 16 ]] --[[ Name: useShortcutBarVisible ]]
        -- upvalues: v2 (ref), v3 (copy)
        return v2.useSignalState(v3);
    end;
    return {
        getShortcutBarVisible = v3, 
        setShortcutBarVisible = v4, 
        useShortcutBarVisible = v5
    };
end;