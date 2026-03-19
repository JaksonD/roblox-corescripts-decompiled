local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_0.utils.invariant);
local v4 = v2.Component:extend("StackViewCard");
v4.init = function(v5) --[[ Line: 29 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    local l_index_0 = v5.props.navigation.state.index;
    v5._isMounted = false;
    v5._positionLastValue = l_index_0;
    v5._ref = v2.createRef();
end;
v4.render = function(v7) --[[ Line: 38 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v2 (copy)
    local l_forceHidden_0 = v7.props.forceHidden;
    local l_cardColor3_0 = v7.props.cardColor3;
    local l_initialPosition_0 = v7.props.initialPosition;
    local l_renderScene_0 = v7.props.renderScene;
    local l_scene_0 = v7.props.scene;
    v3(type(l_renderScene_0) == "function", "renderScene must be a function");
    return v2.createElement("Frame", {
        Position = l_initialPosition_0, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_cardColor3_0, 
        BackgroundTransparency = l_cardColor3_0 == nil and 1 or nil, 
        BorderSizePixel = 0, 
        ClipsDescendants = false, 
        Visible = not l_forceHidden_0, 
        ref = v7._ref
    }, {
        Content = l_renderScene_0(l_scene_0)
    });
end;
v4.didMount = function(v13) --[[ Line: 61 ]] --[[ Name: didMount ]]
    v13._isMounted = true;
    v13._positionDisconnector = v13.props.position:onStep(function(...) --[[ Line: 65 ]]
        -- upvalues: v13 (copy)
        v13:_onPositionStep(...);
    end);
end;
v4.willUnmount = function(v14) --[[ Line: 70 ]] --[[ Name: willUnmount ]]
    v14._isMounted = false;
    if v14._positionDisconnector then
        v14._positionDisconnector();
        v14._positionDisconnector = nil;
    end;
end;
v4.didUpdate = function(v15, v16) --[[ Line: 79 ]] --[[ Name: didUpdate ]]
    local l_position_0 = v15.props.position;
    local l_positionStep_0 = v15.props.positionStep;
    if l_position_0 ~= v16.position then
        v15._positionDisconnector();
        v15._positionDisconnector = l_position_0:onStep(function(...) --[[ Line: 85 ]]
            -- upvalues: v15 (copy)
            v15:_onPositionStep(...);
        end);
    end;
    if l_positionStep_0 ~= v16.positionStep then
        v15:_onPositionStep(v15._positionLastValue);
    end;
end;
v4._onPositionStep = function(v19, v20) --[[ Line: 97 ]] --[[ Name: _onPositionStep ]]
    if not v19._isMounted then
        return;
    else
        local l_positionStep_1 = v19.props.positionStep;
        if l_positionStep_1 then
            l_positionStep_1(v19._ref, v20);
        end;
        v19._positionLastValue = v20;
        return;
    end;
end;
return v4;