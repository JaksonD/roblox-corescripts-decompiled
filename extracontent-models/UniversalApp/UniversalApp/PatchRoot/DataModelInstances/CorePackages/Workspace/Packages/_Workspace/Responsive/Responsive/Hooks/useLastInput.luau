local l_script_FirstAncestor_0 = script:FindFirstAncestor("Responsive");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.InputMode);
return function() --[[ Line: 6 ]] --[[ Name: useLastInput ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v4, v5 = v2.useState(v3.last);
    v2.useEffect(function() --[[ Line: 8 ]]
        -- upvalues: v5 (copy), v3 (ref)
        v5(v3.last);
        local v6 = v3.connect(function() --[[ Line: 10 ]]
            -- upvalues: v5 (ref), v3 (ref)
            v5(v3.last);
        end);
        return function() --[[ Line: 13 ]]
            -- upvalues: v6 (copy)
            v6:disconnect();
        end;
    end, {});
    return v4 or "";
end;