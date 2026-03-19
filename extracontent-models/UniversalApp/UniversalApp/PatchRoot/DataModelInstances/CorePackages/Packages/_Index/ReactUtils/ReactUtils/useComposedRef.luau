local l_Parent_0 = script:FindFirstAncestor("ReactUtils").Parent;
local v1 = require(l_Parent_0.React);
local function _(v2, v3) --[[ Line: 9 ]] --[[ Name: forwardRefValue ]]
    if type(v2) == "function" then
        v2(v3);
        return;
    else
        if type(v2) == "table" then
            v2.current = v3;
        end;
        return;
    end;
end;
return function(v5, v6) --[[ Line: 22 ]] --[[ Name: useComposedRef ]]
    -- upvalues: v1 (copy)
    return (v1.useCallback(function(v7) --[[ Line: 23 ]]
        -- upvalues: v5 (copy), v6 (copy)
        local l_v5_0 = v5;
        if type(l_v5_0) == "function" then
            l_v5_0(v7);
        elseif type(l_v5_0) == "table" then
            l_v5_0.current = v7;
        end;
        l_v5_0 = v6;
        if type(l_v5_0) == "function" then
            l_v5_0(v7);
            return;
        else
            if type(l_v5_0) == "table" then
                l_v5_0.current = v7;
            end;
            return;
        end;
    end, {
        v5, 
        v6
    }));
end;