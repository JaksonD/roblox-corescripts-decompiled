local l_Parent_0 = script:FindFirstAncestor("ExpChatServer").Parent;
local v1 = require(l_Parent_0.Rodux);
local v2 = require(script.Parent.installReducer);
return function() --[[ Line: 6 ]] --[[ Name: createStore ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.Store.new(v2, nil, {
        v1.thunkMiddleware
    });
end;