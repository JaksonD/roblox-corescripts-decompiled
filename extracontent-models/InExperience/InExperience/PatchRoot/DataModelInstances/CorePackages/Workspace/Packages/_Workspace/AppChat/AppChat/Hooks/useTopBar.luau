local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Stores.GetTopBarStore);
return function(v4) --[[ Line: 14 ]] --[[ Name: useTopBar ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v5 = v3(false);
    local v7 = v2.useCallback(function(v6) --[[ Line: 17 ]]
        -- upvalues: v5 (copy), v4 (copy)
        v5.setScreenTopBar(v4, v6);
    end, {
        v4
    });
    local v8 = v2.useCallback(function() --[[ Line: 21 ]]
        -- upvalues: v5 (copy), v4 (copy)
        v5.clearScreenTopBar(v4);
    end, {
        v4
    });
    return {
        setScreenTopBar = v7, 
        clearScreenTopBar = v8
    };
end;