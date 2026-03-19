local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Utils.checkAndSendEvent);
return function(v2, v3, v4, v5) --[[ Line: 7 ]]
    -- upvalues: v1 (copy)
    assert(type(v4) == "table", "Expected suggestions to be a table");
    local v6 = {
        state = v3, 
        suggestions = ("[%*]"):format((table.concat(v4, ","))), 
        field = v5
    };
    v1(v2, "usernameSuggestionShown", v6);
end;