local l_script_FirstAncestor_0 = script:FindFirstAncestor("ReactUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Flags.getFFlagUseToggleStateImprovements)();
return function(v4) --[[ Line: 10 ]] --[[ Name: useToggleState ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v5, v6 = v2.useState(v4 or false);
    local v7 = v2.useCallback(function() --[[ Line: 19 ]]
        -- upvalues: v6 (copy)
        v6(true);
    end, {});
    local v8 = v2.useCallback(function() --[[ Line: 23 ]]
        -- upvalues: v6 (copy)
        v6(false);
    end, {});
    local v9 = nil;
    if v3 then
        v9 = v2.useCallback(function() --[[ Line: 29 ]]
            -- upvalues: v6 (copy)
            v6(function(v10) --[[ Line: 30 ]]
                return not v10;
            end);
        end, {});
    end;
    return {
        enabled = v5, 
        enable = v7, 
        disable = v8, 
        toggle = if v3 then v9 else nil, 
        set = if v3 then v6 else nil
    };
end;