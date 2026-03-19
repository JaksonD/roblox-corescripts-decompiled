local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Core_0 = l_Parent_0.Core;
local v4 = require(l_Parent_1.Roact);
local v5 = require(l_Parent_1.t);
local v6 = require(l_Parent_1.Otter);
local l_Button_0 = require(l_Core_0.ImageSet.ImageSetComponent).Button;
local v8 = require(l_Core_0.Style.withStyle);
local v9 = require(script.Parent.NavigationDirection);
local v10 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local v11 = v4.PureComponent:extend("ArrowNav");
v11.validateProps = v5.intersection(v5.strictInterface({
    AnchorPoint = v5.optional(v5.Vector2), 
    Position = v5.optional(v5.UDim2), 
    Image = v5.table, 
    Visible = v5.optional(v5.union(v5.boolean, v5.table)), 
    navDirection = v5.optional(v5.userdata), 
    onPressHoldInputBegan = v5.optional(v5.callback), 
    onPressHoldInputEnded = v5.optional(v5.callback), 
    defaultUseProps = v5.optional(v5.strictInterface({
        scrollingFrameRef = v5.table, 
        buttonRefs = v5.optional(v5.table), 
        buttonWidth = v5.optional(v5.number), 
        numButtons = v5.optional(v5.number), 
        padOutsideEdges = v5.optional(v5.boolean), 
        buttonPadding = v5.number, 
        updateCanvasPosition = v5.callback
    }))
}), function(v12) --[[ Line: 63 ]]
    if v12.defaultUseProps then
        if v12.defaultUseProps.buttonRefs ~= nil then
            if v12.defaultUseProps.buttonWidth ~= nil then
                return false, "Cannot set both buttonWidth and buttonRefs";
            elseif v12.defaultUseProps.numButtons ~= nil then
                return false, "Cannot set both numButtons and buttonRefs";
            end;
        end;
        if v12.defaultUseProps.buttonWidth ~= nil and v12.defaultUseProps.numButtons == nil then
            return false, "If setting buttonWidth must also set numButtons";
        elseif v12.defaultUseProps.buttonWidth == nil and v12.defaultUseProps.numButtons ~= nil then
            return false, "If setting numButtons must also set buttonWidth";
        elseif v12.defaultUseProps.buttonRefs == nil and v12.defaultUseProps.buttonWidth == nil and v12.defaultUseProps.numButtons == nil then
            return false, "Must set either buttonRefs or (buttonWidth and numButtons)";
        end;
    end;
    return true;
end);
v11.defaultProps = {
    AnchorPoint = Vector2.new(0, 0), 
    Position = UDim2.new(0, 0, 0, 0), 
    Visible = true
};
v11.init = function(v13) --[[ Line: 97 ]] --[[ Name: init ]]
    v13.holdConn = nil;
    v13.timeOfInputBegan = 0;
    v13.handleInputBegan = function(_, v15) --[[ Line: 101 ]]
        -- upvalues: v13 (copy)
        local l_navDirection_0 = v13.props.navDirection;
        if v13.props.onPressHoldInputBegan then
            v13.props.onPressHoldInputBegan(v15, l_navDirection_0);
            return;
        else
            v13:onPressHoldInputBegan(v15, l_navDirection_0);
            return;
        end;
    end;
    v13.handleInputEnded = function(_, v18) --[[ Line: 110 ]]
        -- upvalues: v13 (copy)
        local l_navDirection_1 = v13.props.navDirection;
        if v13.props.onPressHoldInputEnded then
            v13.props.onPressHoldInputEnded(v18, l_navDirection_1);
            return;
        else
            v13:onPressHoldInputEnded(v18, l_navDirection_1);
            return;
        end;
    end;
end;
v11.getGoal = function(v20, v21) --[[ Line: 120 ]] --[[ Name: getGoal ]]
    -- upvalues: v6 (copy), v10 (copy)
    return v6.spring(v20:getScrollToLocation(v21), v10);
end;
v11.didMount = function(v22) --[[ Line: 124 ]] --[[ Name: didMount ]]
    v22:setMotor(0);
end;
v11.setMotor = function(v23, v24) --[[ Line: 128 ]] --[[ Name: setMotor ]]
    -- upvalues: v6 (copy)
    v23.motor = v6.createSingleMotor(v24);
    v23.motor:onStep(function(v25) --[[ Line: 130 ]]
        -- upvalues: v23 (copy)
        v23.props.defaultUseProps.updateCanvasPosition(Vector2.new(v25, 0));
    end);
    v23.motor:onComplete(function(v26) --[[ Line: 133 ]]
        -- upvalues: v23 (copy)
        v23.props.defaultUseProps.updateCanvasPosition(Vector2.new(v26, 0));
    end);
end;
v11.render = function(v27) --[[ Line: 138 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v4 (copy), l_Button_0 (copy)
    return v8(function(v28) --[[ Line: 139 ]]
        -- upvalues: v4 (ref), l_Button_0 (ref), v27 (copy)
        local l_Theme_0 = v28.Theme;
        return v4.createElement(l_Button_0, {
            AnchorPoint = v27.props.AnchorPoint, 
            Position = v27.props.Position, 
            Image = v27.props.Image, 
            Visible = v27.props.Visible, 
            BackgroundTransparency = 1, 
            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
            Size = UDim2.fromOffset(36, 36), 
            [v4.Event.InputBegan] = v27.handleInputBegan, 
            [v4.Event.InputEnded] = v27.handleInputEnded
        });
    end);
end;
v11.willUnmount = function(v30) --[[ Line: 155 ]] --[[ Name: willUnmount ]]
    v30:disconnectHoldConn();
    if v30.motor then
        v30.motor:destroy();
        v30.motor = nil;
    end;
end;
v11.getNewCanvasPosition = function(v31, v32) --[[ Line: 163 ]] --[[ Name: getNewCanvasPosition ]]
    return v31.props.defaultUseProps.scrollingFrameRef.current.CanvasPosition + Vector2.new(v32, 0);
end;
v11.disconnectHoldConn = function(v33) --[[ Line: 168 ]] --[[ Name: disconnectHoldConn ]]
    if v33.holdConn == nil then
        return;
    else
        v33.holdConn:Disconnect();
        v33.holdConn = nil;
        return;
    end;
end;
v11.onPressHoldInputBegan = function(v34, v35, v36) --[[ Line: 176 ]] --[[ Name: onPressHoldInputBegan ]]
    -- upvalues: l_RunService_0 (copy), v9 (copy)
    if v35.UserInputState ~= Enum.UserInputState.Begin then
        return;
    else
        v34.timeOfInputBegan = tick();
        v34:disconnectHoldConn();
        v34.holdConn = l_RunService_0.RenderStepped:connect(function(v37) --[[ Line: 182 ]]
            -- upvalues: v34 (copy), v9 (ref), v36 (copy)
            local v38 = tick() - v34.timeOfInputBegan;
            local v39 = v9.IsLeft == v36 and -1 or 1;
            local v40 = v34:getNewCanvasPosition(v39 * 500 * v37 * v38 ^ 2);
            v34.props.defaultUseProps.updateCanvasPosition(v40);
        end);
        return;
    end;
end;
v11.onPressHoldInputEnded = function(v41, v42, v43) --[[ Line: 191 ]] --[[ Name: onPressHoldInputEnded ]]
    -- upvalues: v6 (copy)
    if v42.UserInputState ~= Enum.UserInputState.End then
        return;
    else
        local l_current_0 = v41.props.defaultUseProps.scrollingFrameRef.current;
        if tick() - v41.timeOfInputBegan <= 0.5 then
            if v41.motor then
                v41.motor:destroy();
            end;
            v41:setMotor(l_current_0.CanvasPosition.X);
            v41.motor:setGoal(v41:getGoal(v43));
        else
            v41.motor:setGoal(v6.instant(l_current_0.CanvasPosition.X));
        end;
        v41:disconnectHoldConn();
        return;
    end;
end;
v11.getScrollToLocation = function(v45, v46) --[[ Line: 209 ]] --[[ Name: getScrollToLocation ]]
    -- upvalues: v9 (copy)
    local v47 = v45:getButtonSizes();
    if v46 == v9.IsLeft then
        return v45:getScrollToLeftLocation(v47);
    else
        return v45:getScrollToRightLocation(v47);
    end;
end;
v11.getButtonSizes = function(v48) --[[ Line: 219 ]] --[[ Name: getButtonSizes ]]
    local l_buttonRefs_0 = v48.props.defaultUseProps.buttonRefs;
    local l_buttonWidth_0 = v48.props.defaultUseProps.buttonWidth;
    local l_numButtons_0 = v48.props.defaultUseProps.numButtons;
    if l_buttonWidth_0 and l_numButtons_0 then
        return table.create(l_numButtons_0, l_buttonWidth_0);
    else
        local v52 = {};
        for _, v54 in ipairs(l_buttonRefs_0) do
            table.insert(v52, v54.current and v54.current.AbsoluteSize.X or 0);
        end;
        return v52;
    end;
end;
v11.getScrollToLeftLocation = function(v55, v56) --[[ Line: 236 ]] --[[ Name: getScrollToLeftLocation ]]
    local l_current_1 = v55.props.defaultUseProps.scrollingFrameRef.current;
    local l_buttonPadding_0 = v55.props.defaultUseProps.buttonPadding;
    local v59 = l_current_1.CanvasPosition.X - l_current_1.AbsoluteSize.X * 0.4;
    local v60 = 0;
    for _, v62 in ipairs(v56) do
        if v59 <= v60 + v62 + l_buttonPadding_0 then
            return v60;
        else
            v60 = v60 + (v62 + l_buttonPadding_0);
        end;
    end;
    return v60;
end;
v11.getScrollToRightLocation = function(v63, v64) --[[ Line: 253 ]] --[[ Name: getScrollToRightLocation ]]
    local l_current_2 = v63.props.defaultUseProps.scrollingFrameRef.current;
    local l_buttonPadding_1 = v63.props.defaultUseProps.buttonPadding;
    local l_padOutsideEdges_0 = v63.props.defaultUseProps.padOutsideEdges;
    local v68 = l_current_2.CanvasPosition.X + l_current_2.AbsoluteSize.X * 0.4;
    local v69 = -l_current_2.AbsoluteSize.X;
    if l_padOutsideEdges_0 then
        v69 = v69 + l_buttonPadding_1;
    end;
    for _, v71 in ipairs(v64) do
        if v68 < v69 then
            return v69;
        else
            v69 = v69 + (v71 + l_buttonPadding_1);
        end;
    end;
    return v69;
end;
return v11;