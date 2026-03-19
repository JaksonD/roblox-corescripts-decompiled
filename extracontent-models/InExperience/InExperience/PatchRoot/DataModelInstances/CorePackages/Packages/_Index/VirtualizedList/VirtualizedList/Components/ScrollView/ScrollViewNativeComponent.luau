local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_console_0 = v1.console;
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local v5 = require(l_Parent_0.React);
local l_Change_0 = v5.Change;
local l_Event_0 = v5.Event;
local v8 = require(l_Parent_0.Otter);
local v9 = {
    restingPositionLimit = 1, 
    restingVelocityLimit = 10
};
local v10 = v5.Component:extend("ScrollViewNativeComponent");
v10.init = function(v11, v12) --[[ Line: 62 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v9 (copy), v8 (copy)
    v11.props = v12;
    v11._nativeRef = v5.createRef();
    v11.lastScrollEventTime = 0;
    v11.animationConfig = if v11.props.animationConfig then v11.props.animationConfig else v9;
    v11.motor = v8.createGroupMotor({
        x = 0, 
        y = 0
    });
    v11.motorStepDisconnect = v11.motor:onStep(function(v13) --[[ Line: 74 ]]
        -- upvalues: v11 (copy)
        v11._nativeRef.current.CanvasPosition = Vector2.new(v13.x, v13.y);
    end);
    v11._nativeRef.animateScrollTo = function(v14, v15) --[[ Line: 78 ]]
        -- upvalues: v11 (copy)
        v11:_startAnimatedScroll(v14, v15);
    end;
end;
v10._validateAnimatedScrollInputs = function(v16, v17, v18) --[[ Line: 83 ]] --[[ Name: _validateAnimatedScrollInputs ]]
    -- upvalues: l_console_0 (copy)
    if not v16._nativeRef.current then
        l_console_0.error("scrollTo animation failed: ScrollViewNativeComponent._nativeRef instance is undefined");
    end;
    if v16._nativeRef.current.ScrollingDirection == Enum.ScrollingDirection.X then
        if v16._nativeRef.current.AbsoluteCanvasSize.X < v17 then
            l_console_0.warn("scrollTo animation goal out of bounds, setting X goal to: " .. tostring(v16._nativeRef.current.AbsoluteCanvasSize.X - v16._nativeRef.current.AbsoluteWindowSize.X));
            return;
        elseif v17 < 0 then
            l_console_0.warn("scrollTo animation goal out of bounds, setting X goal to: 0");
            return;
        end;
    elseif v16._nativeRef.current.AbsoluteCanvasSize.Y < v18 then
        l_console_0.warn("scrollTo animation goal out of bounds, setting Y goal to: " .. tostring(v16._nativeRef.current.AbsoluteCanvasSize.Y - v16._nativeRef.current.AbsoluteWindowSize.Y));
        return;
    elseif v18 < 0 then
        l_console_0.warn("scrollTo animation goal out of bounds, setting Y goal to: 0");
    end;
end;
v10._startAnimatedScroll = function(v19, v20, v21) --[[ Line: 113 ]] --[[ Name: _startAnimatedScroll ]]
    -- upvalues: v8 (copy)
    if _G.__DEV__ then
        v19:_validateAnimatedScrollInputs(v20, v21);
    end;
    local l_CanvasPosition_0 = v19._nativeRef.current.CanvasPosition;
    v19.motor:setGoal({
        x = v8.instant(l_CanvasPosition_0.X), 
        y = v8.instant(l_CanvasPosition_0.Y)
    });
    v19.motor:step(0);
    v19.motor:setGoal({
        x = v8.spring(v20, v19.animationConfig), 
        y = v8.spring(v21, v19.animationConfig)
    });
end;
v10.render = function(v23) --[[ Line: 136 ]] --[[ Name: render ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy), l_Change_0 (copy), l_Event_0 (copy), v5 (copy)
    local v26 = if l_Array_0.isArray(v23.props.style) then l_Array_0.reduce(v23.props.style, function(v24, v25) --[[ Line: 138 ]]
        -- upvalues: l_Object_0 (ref)
        return l_Object_0.assign(v24, v25);
    end, {}) else v23.props.style;
    local v39 = l_Object_0.assign({
        Name = "RCTScrollView", 
        ScrollingEnabled = v23.props.scrollEnabled == nil or v23.props.scrollEnabled, 
        Size = UDim2.new(1, 0, 1, 0), 
        CanvasPosition = v23.props.CanvasPosition, 
        CanvasSize = v23.props.CanvasSize or UDim2.new(0, 0, 0, 0), 
        AutomaticCanvasSize = v23.props.AutomaticCanvasSize or Enum.AutomaticSize.XY, 
        ScrollBarThickness = (not (not v23.props.horizontal or v23.props.showsHorizontalScrollIndicator ~= false) or not v23.props.horizontal and v23.props.showsVerticalScrollIndicator == false) and 0 or nil, 
        ref = v23._nativeRef, 
        [l_Change_0.AbsoluteWindowSize] = v23.props.onLayout, 
        [l_Change_0.CanvasPosition] = function(v27) --[[ Line: 157 ]]
            -- upvalues: v23 (copy)
            local v28 = os.clock() * 1000;
            if (v23.props.scrollEventThrottle or 0) < v28 - v23.lastScrollEventTime then
                v23.props.onScroll(v27);
                v23.lastScrollEventTime = v28;
            end;
        end, 
        [l_Event_0.InputBegan] = function(v29, v30) --[[ Line: 165 ]]
            -- upvalues: v23 (copy)
            if (v30.UserInputType == Enum.UserInputType.MouseWheel or v30.UserInputType == Enum.UserInputType.Touch) and v23.motor ~= nil then
                v23.motor:stop();
            end;
            if v30.UserInputType == Enum.UserInputType.Touch then
                v23.props.onTouchStart(v29, v30);
            end;
        end, 
        [l_Event_0.InputEnded] = function(v31, v32) --[[ Line: 179 ]]
            -- upvalues: v23 (copy)
            if v32.UserInputType == Enum.UserInputType.Touch then
                v23.props.onTouchEnd(v31, v32);
            end;
        end, 
        [l_Event_0.InputChanged] = function(v33, v34) --[[ Line: 184 ]]
            -- upvalues: v23 (copy)
            if v34.UserInputType == Enum.UserInputType.Touch then
                v23.props.onTouchMove(v33, v34);
            end;
        end, 
        [l_Event_0.SelectionChanged] = v23.props.onSelectionChanged and function(v35, v36, v37, v38) --[[ Line: 190 ]]
            -- upvalues: v23 (copy)
            v23.props.onSelectionChanged(v35, v36, v37, v38);
        end or nil
    }, v26);
    return v5.createElement("ScrollingFrame", v39, {
        Layout = if not v23.props.inverted or v23.props.getItemLayout then nil else v5.createElement("UIListLayout", {
            HorizontalAlignment = if v23.props.horizontal then Enum.HorizontalAlignment.Right else Enum.HorizontalAlignment.Center, 
            VerticalAlignment = if v23.props.horizontal then Enum.VerticalAlignment.Center else Enum.VerticalAlignment.Bottom
        }), 
        [1] = v23.props.children
    });
end;
v10.willUnmount = function(v40) --[[ Line: 212 ]] --[[ Name: willUnmount ]]
    if v40.motor ~= nil then
        v40.motor:destroy();
    end;
    if v40.motorStepDisconnect ~= nil then
        v40.motorStepDisconnect();
    end;
end;
return v10;