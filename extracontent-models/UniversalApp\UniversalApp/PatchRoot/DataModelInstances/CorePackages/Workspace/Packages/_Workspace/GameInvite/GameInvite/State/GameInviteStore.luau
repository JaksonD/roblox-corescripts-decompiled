local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.Rodux);
local v3 = require(l_Parent_0.Reducers.GameInviteReducer);
return v2.Store.new(v3, nil, {
    v2.thunkMiddleware
});