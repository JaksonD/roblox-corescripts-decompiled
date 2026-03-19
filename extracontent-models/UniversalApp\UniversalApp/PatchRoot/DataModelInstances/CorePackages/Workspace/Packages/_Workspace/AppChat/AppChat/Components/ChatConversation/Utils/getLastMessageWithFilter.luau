local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Cryo);
return function(v2, v3) --[[ Line: 13 ]] --[[ Name: getLastMessageWithFilter ]]
    -- upvalues: v1 (copy)
    if not v2 or #v2 == 0 then
        return nil;
    else
        local v4 = v1.List.findWhere(v2, v3);
        return v4 and v2[v4].messageId or nil;
    end;
end;