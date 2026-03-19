local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_CorePackages_0.Packages.Otter);
local l_ImageSetButton_0 = v6.Core.ImageSet.ImageSetButton;
local l_withStyle_0 = v6.Style.withStyle;
local v10 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v11 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local v12 = v4.PureComponent:extend("ArrowNav");
v12.validateProps = v5.intersection(v5.strictInterface({
    AnchorPoint = v5.optional(v5.Vector2), 
    Position = v5.optional(v5.UDim2), 
    Image = v5.table, 
    Visible = v5.optional(v5.union(v5.boolean, v5.table)), 
    navDirection = v5.optional(v5.string), 
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
}), function(v13) --[[ Line: 53 ]]
    if v13.defaultUseProps then
        if v13.defaultUseProps.buttonRefs ~= nil then
            if v13.defaultUseProps.buttonWidth ~= nil then
                return false, "Cannot set both buttonWidth and buttonRefs";
            elseif v13.defaultUseProps.numButtons ~= nil then
                return false, "Cannot set both numButtons and buttonRefs";
            end;
        end;
        if v13.defaultUseProps.buttonWidth ~= nil and v13.defaultUseProps.numButtons == nil then
            return false, "If setting buttonWidth must also set numButtons";
        elseif v13.defaultUseProps.buttonWidth == nil and v13.defaultUseProps.numButtons ~= nil then
            return false, "If setting numButtons must also set buttonWidth";
        elseif v13.defaultUseProps.buttonRefs == nil and v13.defaultUseProps.buttonWidth == nil and v13.defaultUseProps.numButtons == nil then
            return false, "Must set either buttonRefs or (buttonWidth and numButtons)";
        end;
    end;
    return true;
end);
v12.defaultProps = {
    AnchorPoint = Vector2.new(0, 0), 
    Position = UDim2.new(0, 0, 0, 0), 
    Visible = true
};
v12.init = function(v14) --[[ Line: 87 ]] --[[ Name: init ]]
    -- upvalues: l_RunService_0 (copy), v10 (copy), v7 (copy)
    v14.holdConn = nil;
    v14.timeOfInputBegan = 0;
    v14.handleInputBegan = function(_, v16) --[[ Line: 91 ]]
        -- upvalues: v14 (copy)
        (v14.props.onPressHoldInputBegan or v14.onPressHoldInputBegan)(v16, v14.props.navDirection);
    end;
    v14.handleInputEnded = function(_, v18) --[[ Line: 96 ]]
        -- upvalues: v14 (copy)
        (v14.props.onPressHoldInputEnded or v14.onPressHoldInputEnded)(v18, v14.props.navDirection);
    end;
    v14.getNewCanvasPosition = function(v19) --[[ Line: 101 ]]
        -- upvalues: v14 (copy)
        return v14.props.defaultUseProps.scrollingFrameRef.current.CanvasPosition + Vector2.new(v19, 0);
    end;
    v14.disconnectHoldConn = function() --[[ Line: 106 ]]
        -- upvalues: v14 (copy)
        if v14.holdConn == nil then
            return;
        else
            v14.holdConn:Disconnect();
            v14.holdConn = nil;
            return;
        end;
    end;
    v14.onPressHoldInputBegan = function(v20, v21) --[[ Line: 114 ]]
        -- upvalues: v14 (copy), l_RunService_0 (ref), v10 (ref)
        if v20.UserInputState ~= Enum.UserInputState.Begin then
            return;
        else
            v14.timeOfInputBegan = tick();
            v14.disconnectHoldConn();
            v14.holdConn = l_RunService_0.RenderStepped:connect(function(v22) --[[ Line: 120 ]]
                -- upvalues: v14 (ref), v10 (ref), v21 (copy)
                local v23 = tick() - v14.timeOfInputBegan;
                local v24 = v10.NavigationDirection.IS_LEFT == v21 and -1 or 1;
                local v25 = v14.getNewCanvasPosition(v24 * 500 * v22 * v23 ^ 2);
                v14.props.defaultUseProps.updateCanvasPosition(v25);
            end);
            return;
        end;
    end;
    v14.onPressHoldInputEnded = function(v26, v27) --[[ Line: 129 ]]
        -- upvalues: v14 (copy), v7 (ref)
        if v26.UserInputState ~= Enum.UserInputState.End then
            return;
        else
            local l_current_0 = v14.props.defaultUseProps.scrollingFrameRef.current;
            if tick() - v14.timeOfInputBegan <= 0.5 then
                if v14.motor then
                    v14.motor:destroy();
                end;
                v14:setMotor(l_current_0.CanvasPosition.X);
                v14.motor:setGoal(v14:getGoal(v27));
            else
                v14.motor:setGoal(v7.instant(l_current_0.CanvasPosition.X));
            end;
            v14.disconnectHoldConn();
            return;
        end;
    end;
end;
v12.getGoal = function(v29, v30) --[[ Line: 148 ]] --[[ Name: getGoal ]]
    -- upvalues: v7 (copy), v11 (copy)
    return v7.spring(v29:getScrollToLocation(v30), v11);
end;
v12.didMount = function(v31) --[[ Line: 152 ]] --[[ Name: didMount ]]
    v31:setMotor(0);
end;
v12.setMotor = function(v32, v33) --[[ Line: 156 ]] --[[ Name: setMotor ]]
    -- upvalues: v7 (copy)
    v32.motor = v7.createSingleMotor(v33);
    v32.motor:onStep(function(v34) --[[ Line: 158 ]]
        -- upvalues: v32 (copy)
        v32.props.defaultUseProps.updateCanvasPosition(Vector2.new(v34, 0));
    end);
    v32.motor:onComplete(function(v35) --[[ Line: 161 ]]
        -- upvalues: v32 (copy)
        v32.props.defaultUseProps.updateCanvasPosition(Vector2.new(v35, 0));
    end);
end;
v12.render = function(v36) --[[ Line: 166 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v4 (copy), l_ImageSetButton_0 (copy)
    return l_withStyle_0(function(v37) --[[ Line: 167 ]]
        -- upvalues: v4 (ref), l_ImageSetButton_0 (ref), v36 (copy)
        local l_Theme_0 = v37.Theme;
        return v4.createElement(l_ImageSetButton_0, {
            AnchorPoint = v36.props.AnchorPoint, 
            Position = v36.props.Position, 
            Image = v36.props.Image, 
            Visible = v36.props.Visible, 
            BackgroundTransparency = 1, 
            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
            Size = UDim2.fromOffset(36, 36), 
            [v4.Event.InputBegan] = v36.handleInputBegan, 
            [v4.Event.InputEnded] = v36.handleInputEnded
        });
    end);
end;
v12.willUnmount = function(v39) --[[ Line: 183 ]] --[[ Name: willUnmount ]]
    v39.disconnectHoldConn();
    if v39.motor then
        v39.motor:destroy();
        v39.motor = nil;
    end;
end;
v12.getScrollToLocation = function(v40, v41) --[[ Line: 191 ]] --[[ Name: getScrollToLocation ]]
    -- upvalues: v10 (copy)
    local v42 = false;
    local l_current_1 = v40.props.defaultUseProps.scrollingFrameRef.current;
    local l_buttonPadding_0 = v40.props.defaultUseProps.buttonPadding;
    local v45 = {};
    local l_buttonRefs_0 = v40.props.defaultUseProps.buttonRefs;
    local l_buttonWidth_0 = v40.props.defaultUseProps.buttonWidth;
    local l_numButtons_0 = v40.props.defaultUseProps.numButtons;
    local l_padOutsideEdges_0 = v40.props.defaultUseProps.padOutsideEdges;
    if l_buttonWidth_0 and l_numButtons_0 then
        v45 = table.create(l_numButtons_0, l_buttonWidth_0);
    else
        for _, v51 in l_buttonRefs_0 do
            table.insert(v45, v51.current and v51.current.Size.X.Offset or 0);
        end;
    end;
    local v52 = 0;
    if v41 == v10.NavigationDirection.IS_LEFT then
        local v53 = l_current_1.CanvasPosition.X - l_current_1.AbsoluteSize.X * 0.4;
        for _, v55 in v45 do
            if v52 + v55 + l_buttonPadding_0 < v53 then
                v52 = v52 + v55 + l_buttonPadding_0;
            else
                v42 = true;
            end;
            if v42 then
                break;
            end;
        end;
        if not v42 then
            return v52;
        end;
    else
        local v56 = l_current_1.CanvasPosition.X + l_current_1.AbsoluteSize.X * 0.4;
        v52 = -l_current_1.AbsoluteSize.X;
        if l_padOutsideEdges_0 then
            v52 = v52 + l_buttonPadding_0;
        end;
        for _, v58 in v45 do
            if v56 < v52 then
                return v52;
            else
                v52 = v52 + v58 + l_buttonPadding_0;
            end;
        end;
    end;
    v42 = false;
    return v52;
end;
return v12;