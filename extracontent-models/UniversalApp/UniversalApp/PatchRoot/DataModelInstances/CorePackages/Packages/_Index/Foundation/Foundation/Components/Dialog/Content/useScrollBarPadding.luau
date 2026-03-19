local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Utility.isScrollingFrameOverflowingY);
return function() --[[ Line: 8 ]] --[[ Name: useScrollBarPadding ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v4, v5 = v2.useState(false);
    local v6, v7 = v2.useState(0);
    return v4, v6, (v2.useCallback(function(v8) --[[ Line: 12 ]]
        -- upvalues: v3 (ref), v5 (copy), v7 (copy)
        local v9 = v3(v8, 1);
        v5(v9);
        v7(if v9 then v8.ScrollBarThickness else 0);
    end, {}));
end;