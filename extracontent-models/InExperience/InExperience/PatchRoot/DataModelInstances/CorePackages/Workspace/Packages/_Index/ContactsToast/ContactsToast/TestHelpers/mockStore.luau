local l_Parent_0 = script:FindFirstAncestor("ContactsToast").Parent;
local v1 = require(l_Parent_0.Rodux);
return function(v2, v3) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    local v5 = v3 or function(v4) --[[ Line: 6 ]]
        return v4;
    end;
    return v1.Store.new(v5, v2 or {}, {
        v1.thunkMiddleware
    });
end;