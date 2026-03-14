local l_Parent_0 = script:FindFirstAncestor("ExpChatShared").Parent;
local v1 = require(l_Parent_0.Rodux);
local v2 = require(script.Parent.RaiseActionAsEventMiddleware);
local v3 = require(script.Parent.Reducers);
return function(v4) --[[ Line: 7 ]] --[[ Name: createStore ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    return v1.Store.new(v1.combineReducers(v3), v4, {
        v1.thunkMiddleware, 
        v2
    });
end;