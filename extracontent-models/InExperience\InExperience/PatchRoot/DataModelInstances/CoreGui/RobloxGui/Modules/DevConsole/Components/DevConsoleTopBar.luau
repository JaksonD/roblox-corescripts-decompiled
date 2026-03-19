local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("CoreGui").RobloxGui;
local l_TextService_0 = game:GetService("TextService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(script.Parent.Parent.Constants);
local l_FrameHeight_0 = v5.TopBarFormatting.FrameHeight;
local v7 = 0.5 * l_FrameHeight_0;
local v8 = (l_FrameHeight_0 - v7) / 2;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize("Developer Console", v5.DefaultFontSize.TopBar, v5.Font.TopBar, Vector2.new(0, 0));
local v11 = require(script.Parent.Parent.Components.LiveUpdateElement);
local v12 = require(script.Parent.Parent.Actions.SetDevConsolePosition);
local v13 = v3.Component:extend("DevConsoleTopBar");
v13.init = function(v14) --[[ Line: 24 ]] --[[ Name: init ]]
    -- upvalues: l_UserInputService_0 (copy), v3 (copy)
    v14.inputChangedConnection = nil;
    v14.inputChangedDisconnectRetries = 0;
    v14.inputBegan = function(_, v16) --[[ Line: 29 ]]
        -- upvalues: v14 (copy), l_UserInputService_0 (ref)
        if v14.props.isMinimized then
            return;
        else
            if v16.UserInputType == Enum.UserInputType.MouseButton1 then
                local l_AbsolutePosition_0 = v14.ref.current.AbsolutePosition;
                local v18 = Vector3.new(l_AbsolutePosition_0.X, l_AbsolutePosition_0.Y, 0);
                if v14.inputChangedConnection then
                    v14.inputChangedConnection:Disconnect();
                    v14.inputChangedConnection = nil;
                end;
                v14.inputChangedConnection = l_UserInputService_0.InputChanged:Connect(function(v19) --[[ Line: 44 ]]
                    -- upvalues: v14 (ref)
                    v14.inputChanged(nil, v19);
                end);
                v14:setState({
                    startPos = v18, 
                    startOffset = v16.Position, 
                    moving = true
                });
                v14.inputChangedDisconnectRetries = 1;
            end;
            return;
        end;
    end;
    v14.inputChanged = function(_, v21) --[[ Line: 58 ]]
        -- upvalues: v14 (copy)
        if v14.state.moving then
            if v21.UserInputType == Enum.UserInputType.MouseMovement then
                local v22 = v14.state.startPos - v14.state.startOffset + v21.Position;
                local v23 = UDim2.new(0, v22.X, 0, v22.Y);
                v14.props.dispatchSetDevConsolePosition(v23);
                return;
            end;
        elseif v14.inputChangedConnection then
            if v14.inputChangedDisconnectRetries > 0 then
                v14.inputChangedDisconnectRetries = v14.inputChangedDisconnectRetries - 1;
                return;
            else
                v14.inputChangedConnection:Disconnect();
                v14.inputChangedConnection = nil;
            end;
        end;
    end;
    v14.inputEnded = function(_, v25) --[[ Line: 75 ]]
        -- upvalues: v14 (copy)
        if v25.UserInputType == Enum.UserInputType.MouseButton1 and v25.UserInputState == Enum.UserInputState.End then
            if v14.inputChangedConnection then
                v14.inputChangedConnection:Disconnect();
                v14.inputChangedConnection = nil;
            end;
            v14:setState({
                moving = false
            });
        end;
    end;
    v14.ref = v3.createRef();
end;
v13.render = function(v26) --[[ Line: 95 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v5 (copy), l_l_TextService_0_TextSize_0 (copy), l_FrameHeight_0 (copy), v11 (copy), v7 (copy), v8 (copy)
    local l_isMinimized_0 = v26.props.isMinimized;
    local l_formFactor_0 = v26.props.formFactor;
    local l_onMinimizeClicked_0 = v26.props.onMinimizeClicked;
    local l_onMaximizeClicked_0 = v26.props.onMaximizeClicked;
    local l_onCloseClicked_0 = v26.props.onCloseClicked;
    local _ = v26.state.moving;
    local v33 = {
        WindowTitle = v3.createElement("TextLabel", {
            Text = "Developer Console", 
            TextSize = v5.DefaultFontSize.TopBar, 
            TextColor3 = Color3.new(1, 1, 1), 
            Font = v5.Font.TopBar, 
            Size = UDim2.new(0, l_l_TextService_0_TextSize_0.X, 0, l_FrameHeight_0), 
            Position = UDim2.new(0, 4, 0, 0), 
            BackgroundColor3 = v5.Color.BaseGray, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    };
    local v34 = l_l_TextService_0_TextSize_0.X + 8;
    local v35 = UDim2.new(0, v34, 0, 0);
    local v36 = UDim2.new(1, -2 * v34, 0, l_FrameHeight_0);
    if l_isMinimized_0 then
        v35 = UDim2.new(0, 0, 1, 0);
        v36 = UDim2.new(1, 0, 1, 0);
    elseif v26.ref.current then
        v36 = UDim2.new(0, v26.ref.current.AbsoluteSize.X - 2 * l_l_TextService_0_TextSize_0.X, 0, l_FrameHeight_0);
    end;
    local l_topBarLiveUpdate_0 = v26.props.topBarLiveUpdate;
    v33.LiveStatsModule = v3.createElement(v11, {
        topBarLiveUpdate = l_topBarLiveUpdate_0, 
        size = v36, 
        position = v35
    });
    if l_formFactor_0 == v5.FormFactor.Large then
        if not l_isMinimized_0 then
            v33.MinButton = v3.createElement("ImageButton", {
                Size = UDim2.new(0, v7, 0, v7), 
                Position = UDim2.new(1, -2 * l_FrameHeight_0 + v8, 0, v8), 
                BorderColor3 = Color3.new(1, 0, 0), 
                BackgroundColor3 = v5.Color.BaseGray, 
                BackgroundTransparency = 1, 
                Image = v5.Image.Minimize, 
                [v3.Event.Activated] = l_onMinimizeClicked_0
            });
        else
            v33.MaxButton = v3.createElement("ImageButton", {
                Size = UDim2.new(0, v7, 0, v7), 
                Position = UDim2.new(1, -2 * l_FrameHeight_0 + v8, 0, v8), 
                BorderColor3 = Color3.new(0, 0, 1), 
                BackgroundColor3 = v5.Color.BaseGray, 
                BackgroundTransparency = 1, 
                Image = v5.Image.Maximize, 
                [v3.Event.Activated] = l_onMaximizeClicked_0
            });
        end;
    end;
    v33.CloseButton = v3.createElement("ImageButton", {
        Size = UDim2.new(0, v7, 0, v7), 
        Position = UDim2.new(1, -l_FrameHeight_0 + v8, 0, v8), 
        BorderColor3 = Color3.new(0, 1, 0), 
        BackgroundColor3 = v5.Color.BaseGray, 
        BackgroundTransparency = 1, 
        ZIndex = 2, 
        Image = v5.Image.Close, 
        [v3.Event.Activated] = l_onCloseClicked_0
    });
    return v3.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 0, l_FrameHeight_0), 
        BackgroundColor3 = v5.Color.Black, 
        BackgroundTransparency = 0.5, 
        AutoButtonColor = false, 
        LayoutOrder = 1, 
        [v3.Ref] = v26.ref, 
        [v3.Event.InputBegan] = v26.inputBegan, 
        [v3.Event.InputEnded] = v26.inputEnded
    }, v33);
end;
return v4.UNSTABLE_connect2(nil, function(v38) --[[ Line: 191 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v12 (copy)
    return {
        dispatchSetDevConsolePosition = function(v39) --[[ Line: 193 ]] --[[ Name: dispatchSetDevConsolePosition ]]
            -- upvalues: v38 (copy), v12 (ref)
            v38(v12(v39));
        end
    };
end)(v13);