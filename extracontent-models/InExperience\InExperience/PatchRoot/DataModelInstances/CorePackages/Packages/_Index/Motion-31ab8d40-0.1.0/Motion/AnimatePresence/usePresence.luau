local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.PresenceContext);
local l_isPresent_0 = require(script.Parent.PresenceUtils).isPresent;
return function() --[[ Line: 37 ]] --[[ Name: usePresence ]]
    -- upvalues: v1 (copy), v2 (copy), l_isPresent_0 (copy)
    local v4 = v1.useContext(v2);
    local l_id_0 = v4.id;
    local _ = v4.isPresent;
    local l_onExitComplete_0 = v4.onExitComplete;
    local l_passThroughData_0 = v4.passThroughData;
    local v9 = v1.useCallback(function() --[[ Line: 49 ]]
        -- upvalues: l_onExitComplete_0 (copy), l_id_0 (copy)
        if l_onExitComplete_0 then
            l_onExitComplete_0(l_id_0);
        end;
    end, {
        l_onExitComplete_0, 
        l_id_0
    });
    return {
        isPresent = l_isPresent_0(v4), 
        id = l_id_0, 
        onExitComplete = v9, 
        passThroughData = l_passThroughData_0
    };
end;