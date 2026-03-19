local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_0.utils.lerp);
local v4 = v2.Component:extend("StackViewOverlayFrame");
v4.init = function(v5) --[[ Line: 10 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v5._signalDisconnect = nil;
    v5._ref = v2.createRef();
end;
v4.render = function(v6) --[[ Line: 16 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v2 (copy)
    local l_navigationOptions_0 = v6.props.navigationOptions;
    local l_initialTransitionValue_0 = v6.props.initialTransitionValue;
    local v9 = v3(1, l_navigationOptions_0.overlayTransparency, l_initialTransitionValue_0);
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_navigationOptions_0.overlayColor3, 
        BackgroundTransparency = v9, 
        BorderSizePixel = 0, 
        ref = v6._ref
    });
end;
v4.didUpdate = function(v10, v11) --[[ Line: 31 ]] --[[ Name: didUpdate ]]
    local l_transitionChangedSignal_0 = v10.props.transitionChangedSignal;
    if l_transitionChangedSignal_0 ~= v11.transitionChangedSignal then
        if v10._signalDisconnect then
            v10._signalDisconnect();
        end;
        v10._signalDisconnect = l_transitionChangedSignal_0(function(...) --[[ Line: 39 ]]
            -- upvalues: v10 (copy)
            v10:_transitionChanged(...);
        end);
    end;
end;
v4.didMount = function(v13) --[[ Line: 45 ]] --[[ Name: didMount ]]
    v13._isMounted = true;
    v13._signalDisconnect = v13.props.transitionChangedSignal(function(...) --[[ Line: 47 ]]
        -- upvalues: v13 (copy)
        v13:_transitionChanged(...);
    end);
end;
v4.willUnmount = function(v14) --[[ Line: 52 ]] --[[ Name: willUnmount ]]
    v14._isMounted = false;
    if v14._signalDisconnect then
        v14._signalDisconnect();
        v14._signalDisconnect = nil;
    end;
end;
v4._transitionChanged = function(v15, v16) --[[ Line: 60 ]] --[[ Name: _transitionChanged ]]
    -- upvalues: v3 (copy)
    if not v15._isMounted then
        return;
    else
        if v15._ref.current then
            local l_navigationOptions_1 = v15.props.navigationOptions;
            local v18 = v3(1, l_navigationOptions_1.overlayTransparency, v16);
            v15._ref.current.BackgroundTransparency = v18;
        end;
        return;
    end;
end;
return v4;