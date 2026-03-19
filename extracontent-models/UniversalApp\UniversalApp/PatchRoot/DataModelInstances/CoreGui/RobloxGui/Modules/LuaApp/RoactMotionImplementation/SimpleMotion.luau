local l_RunService_0 = game:GetService("RunService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(script.Parent.stepSpring);
local v4 = require(script.Parent.merge);
local v5 = require(script.Parent.Config);
local v6 = require(script.Parent.MotionType);
local v7 = require(script.Parent.MotionSpecifier);
local v8 = v2.Component:extend("SimpleMotion");
local v9 = {};
l_RunService_0.RenderStepped:Connect(function(v10) --[[ Line: 36 ]]
    -- upvalues: v9 (copy)
    for v11 in pairs(v9) do
        v11(v10);
    end;
end);
v8.init = function(v12) --[[ Line: 42 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy)
    local v13 = {};
    local v14 = {};
    for v15, v16 in pairs(v12.props.style) do
        v14[v15] = 0;
        v13[v15] = v7.extractValue(v16);
    end;
    if v12.props.defaultStyle then
        for v17, v18 in pairs(v12.props.defaultStyle) do
            v13[v17] = v18;
        end;
    end;
    v12.resting = false;
    v12.wasResting = true;
    v12.accumulator = 0;
    v12.state = {
        values = v13, 
        velocities = v14
    };
end;
v8.render = function(v19) --[[ Line: 79 ]] --[[ Name: render ]]
    return v19.props.render(v19.state.values);
end;
v8.update = function(v20, v21) --[[ Line: 83 ]] --[[ Name: update ]]
    -- upvalues: v4 (copy), v5 (copy), v7 (copy), v6 (copy), v3 (copy)
    if v20.resting then
        return;
    else
        local v22 = v4(v20.state.values);
        local v23 = v4(v20.state.velocities);
        local v24 = false;
        v20.accumulator = v20.accumulator + v21 % v5.MAX_ACCUMULATION;
        while v20.accumulator >= v5.UPDATE_RATE do
            v20.accumulator = v20.accumulator - v5.UPDATE_RATE;
            local v25 = true;
            for v26, v27 in pairs(v20.props.style) do
                local v28 = v7.getType(v27);
                local v29 = nil;
                local v30 = nil;
                if v28 == v6.Instant then
                    v29 = v27;
                    v30 = 0;
                    v20.wasResting = false;
                elseif v28 == v6.Spring then
                    local v31, v32 = v3(v5.UPDATE_RATE * v5.TIME_FACTOR, v22[v26], v23[v26], v27.value, v27.stiffness, v27.damping, v27.precision);
                    v29 = v31;
                    v30 = v32;
                else
                    error(("Unsupported MotionType %q"):format(v28));
                end;
                v22[v26] = v29;
                v23[v26] = v30;
                if v29 ~= v20.state.values[v26] or v30 ~= v20.state.velocities[v26] then
                    v24 = true;
                end;
                if v29 ~= v7.extractValue(v27) or v30 ~= 0 then
                    v25 = false;
                end;
            end;
            if v25 then
                v20.resting = true;
                v20.accumulator = 0;
                break;
            end;
        end;
        if v24 then
            v20:setState({
                values = v22, 
                velocities = v23
            });
        end;
        if not v20.wasResting and v20.resting and v20.props.onRested then
            v20.props.onRested();
        end;
        v20.wasResting = v20.resting;
        return;
    end;
end;
v8.didMount = function(v33) --[[ Line: 162 ]] --[[ Name: didMount ]]
    -- upvalues: v9 (copy)
    v33.renderCallback = function(v34) --[[ Line: 163 ]]
        -- upvalues: v33 (copy)
        v33:update(v34);
    end;
    v9[v33.renderCallback] = true;
end;
v8.willUnmount = function(v35) --[[ Line: 169 ]] --[[ Name: willUnmount ]]
    -- upvalues: v9 (copy)
    v9[v35.renderCallback] = nil;
end;
v8.didUpdate = function(v36, v37) --[[ Line: 173 ]] --[[ Name: didUpdate ]]
    if v37 == v36.props then
        return;
    else
        v36.resting = false;
        return;
    end;
end;
return v8;