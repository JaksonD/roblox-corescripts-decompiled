local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local v1 = require(l_Parent_0.React);
return function(v2) --[[ Line: 16 ]] --[[ Name: createUseModalNavigation ]]
    -- upvalues: v1 (copy)
    return function() --[[ Line: 17 ]]
        -- upvalues: v1 (ref), v2 (copy)
        local v3 = v1.useContext(v2);
        return {
            closeAffordanceRef = v3.closeAffordanceRef, 
            setContentStartRef = v3.setContentStartRef
        };
    end;
end;