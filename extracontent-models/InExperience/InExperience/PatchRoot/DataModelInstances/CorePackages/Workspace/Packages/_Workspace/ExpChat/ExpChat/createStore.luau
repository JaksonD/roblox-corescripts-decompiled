local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v1 = require(l_Parent_0.Rodux);
local l_RaiseActionAsEventMiddleware_0 = require(l_Parent_0.ExpChatShared).RaiseActionAsEventMiddleware;
local v3 = require(script.Parent.installReducer);
return function(v4) --[[ Line: 8 ]] --[[ Name: createStore ]]
    -- upvalues: v1 (copy), v3 (copy), l_RaiseActionAsEventMiddleware_0 (copy)
    return v1.Store.new(v3, v4, {
        v1.thunkMiddleware, 
        l_RaiseActionAsEventMiddleware_0
    });
end;