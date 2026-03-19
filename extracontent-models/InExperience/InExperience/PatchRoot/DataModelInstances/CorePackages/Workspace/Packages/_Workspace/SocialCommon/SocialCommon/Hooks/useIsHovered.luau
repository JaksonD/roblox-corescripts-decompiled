local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Utils.InputUtilities);
return function() --[[ Line: 8 ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v4, v5 = v2.useState(false);
    return v4, v2.useCallback(function(_, v7) --[[ Line: 11 ]]
        -- upvalues: v3 (ref), v5 (copy)
        if v3.isPointerInput(v7) then
            v5(true);
        end;
    end, {
        v5
    }), (v2.useCallback(function(_, v9) --[[ Line: 17 ]]
        -- upvalues: v3 (ref), v5 (copy)
        if v3.isPointerInput(v9) then
            v5(false);
        end;
    end, {
        v5
    }));
end;