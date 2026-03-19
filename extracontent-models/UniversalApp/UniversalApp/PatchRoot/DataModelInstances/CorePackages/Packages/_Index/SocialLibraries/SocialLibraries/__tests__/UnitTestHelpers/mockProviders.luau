local l_script_FirstAncestor_0 = script:FindFirstAncestor("Packages");
local v1 = require(l_script_FirstAncestor_0.Dev.RoactRodux);
local v2 = require(script.Parent.Parent.Parent.dependencies);
local l_Roact_0 = v2.Roact;
local l_Rodux_0 = v2.Rodux;
local v5 = require(script.Parent.mockStyle);
local v6 = require(script.Parent.mockNavigation);
local v7 = l_Rodux_0.Store.new(function() --[[ Line: 10 ]]
    return {};
end, {}, {
    l_Rodux_0.thunkMiddleware
});
return function(v8, v9) --[[ Line: 14 ]]
    -- upvalues: v7 (copy), v6 (copy), v5 (copy), l_Roact_0 (copy), v1 (copy)
    v9 = v9 or {};
    local v10 = v9.store or v7;
    local v11 = v9.mockNavigation or v6;
    local v12 = v5(v11(v8));
    return l_Roact_0.createElement(v1.StoreProvider, {
        store = v10
    }, {
        children = v12
    });
end;