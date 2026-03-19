local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Otter);
local v3 = require(l_Parent_0.t);
local v4 = v1.PureComponent:extend("AnimatedComponent");
v4.validateProps = v3.strictInterface({
    values = v3.table, 
    render = v3.callback, 
    options = v3.optional(v3.table)
});
v4.update = function(v5, v6) --[[ Line: 37 ]] --[[ Name: update ]]
    -- upvalues: v1 (copy)
    local v7 = {};
    for v8, v9 in pairs(v6) do
        if type(v8) == "function" then
            v8(v9);
        else
            v7[v8] = v9;
        end;
    end;
    for v10, _ in pairs(v5.state) do
        if not v6[v10] then
            v7[v10] = v1.None;
        end;
    end;
    if next(v7) ~= nil then
        v5:setState(v7);
    end;
end;
v4.init = function(v12) --[[ Line: 56 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v12:update(v12.props.values);
    v12.motor = v2.createGroupMotor(v12.props.values);
    v12.motor:onStep(function(v13) --[[ Line: 59 ]]
        -- upvalues: v12 (copy)
        v12:update(v13);
    end);
end;
v4.didUpdate = function(v14, v15) --[[ Line: 64 ]] --[[ Name: didUpdate ]]
    -- upvalues: v2 (copy)
    local l_values_0 = v14.props.values;
    local l_options_0 = v14.props.options;
    local v18 = l_values_0 ~= v15.values;
    local v19 = l_options_0 ~= v15.options;
    if v18 or v19 then
        local v20 = {};
        for v21, v22 in pairs(l_values_0) do
            v20[v21] = v2.spring(v22, l_options_0);
        end;
        v14.motor:setGoal(v20);
    end;
end;
v4.render = function(v23) --[[ Line: 80 ]] --[[ Name: render ]]
    local l_state_0 = v23.state;
    return v23.props.render(l_state_0);
end;
v4.willUnmount = function(v25) --[[ Line: 85 ]] --[[ Name: willUnmount ]]
    if v25.motor then
        v25.motor:destroy();
        v25.motor = nil;
    end;
end;
return function(v26, v27, v28) --[[ Line: 92 ]]
    -- upvalues: v1 (copy), v4 (copy)
    return v1.createElement(v4, {
        values = v26, 
        options = v28, 
        render = v27
    });
end;