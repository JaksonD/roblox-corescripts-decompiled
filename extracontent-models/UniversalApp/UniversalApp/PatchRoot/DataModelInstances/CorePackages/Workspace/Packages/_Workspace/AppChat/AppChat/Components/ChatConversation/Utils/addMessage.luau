local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.ArgCheck);
return function(v2, v3, v4) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    v1.isType(v2, "table", "addMessage.messages");
    v1.isType(v3, "string", "addMessage.value");
    if v3 == "" then
        return v2;
    else
        table.insert(v2, v4 and {
            placeId = v3
        } or {
            content = v3
        });
        return v2;
    end;
end;