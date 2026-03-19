local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiSharedUtilities");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SignalsReact);
local _ = require(l_Parent_0.SduiCoreSystem);
local v5 = require(l_script_FirstAncestor_0.getSduiApiStore);
return function(v6, v7) --[[ Line: 10 ]] --[[ Name: useComponentConfig ]]
    -- upvalues: v2 (copy), v5 (copy), v3 (copy)
    local v10 = v2.useCallback(function(v8) --[[ Line: 12 ]]
        -- upvalues: v7 (copy), v6 (copy), v5 (ref)
        local v9 = if v7 then ("%*_%*"):format(v6, v7) else nil;
        return v5().getRootConfig(v6, v8, v9);
    end, {
        v6, 
        v7
    });
    return v3.useSignalState(v10);
end;