local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.ArgCheck);
return function(v2, v3) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    v1.isType(v2, "string", "patternMatcher.string");
    v1.isType(v3, "string", "patternMatcher.pattern");
    local v4, v5 = v2:lower():find(v3);
    if not v4 then
        return false, nil;
    else
        return true, {
            prefix = v2:sub(1, v4 - 1), 
            suffix = v2:sub(v5 + 1)
        };
    end;
end;