local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiSharedUtilities");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SignalsReact);
local v4 = require(l_script_FirstAncestor_0.getSduiApiStore);
return function(v5, v6) --[[ Line: 7 ]] --[[ Name: useDataUpdatedTimestamp ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy)
    local v9 = v2.useCallback(function(v7) --[[ Line: 8 ]]
        -- upvalues: v6 (copy), v5 (copy), v4 (ref)
        local v8 = if v6 then ("%*_%*"):format(v5, v6) else nil;
        return v4().getDataUpdatedTimestamp(v5, v7, v8);
    end, {
        v5, 
        v6
    });
    return v3.useSignalState(v9);
end;