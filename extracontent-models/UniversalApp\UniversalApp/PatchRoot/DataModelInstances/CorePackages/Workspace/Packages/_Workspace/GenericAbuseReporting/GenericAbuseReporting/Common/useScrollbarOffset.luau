local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.React);
return function(v2, v3) --[[ Line: 8 ]] --[[ Name: useScrollbarOffset ]]
    -- upvalues: v1 (copy)
    local v4, v5 = v1.useState(false);
    v1.useEffect(function() --[[ Line: 11 ]]
        -- upvalues: v2 (copy), v3 (copy), v5 (copy)
        if v2.Y > v3.Y then
            v5(true);
            return;
        else
            v5(false);
            return;
        end;
    end, {
        v2, 
        v3
    });
    if v4 then
        return 16;
    else
        return 0;
    end;
end;