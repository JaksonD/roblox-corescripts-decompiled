local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.Constants);
local v5 = require(l_Modules_0.LuaApp.FitChildren);
local v6 = require(l_Modules_0.LuaApp.RoactMotion);
local v7 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v8 = require(l_Modules_0.LuaApp.Components.LocalizedTextLabel);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local l_DEFAULT_CONTEXTUAL_MENU_CANCEL_HEIGHT_0 = v4.DEFAULT_CONTEXTUAL_MENU_CANCEL_HEIGHT;
local v11 = v2.PureComponent:extend("FramePopup");
v11.defaultProps = {
    enableCancelButton = true, 
    Selectable = false
};
v11.init = function(v12) --[[ Line: 31 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_DEFAULT_CONTEXTUAL_MENU_CANCEL_HEIGHT_0 (copy), v7 (copy), v8 (copy), v4 (copy), v5 (copy), l_withStyle_0 (copy)
    v12.state = {
        hidden = true
    };
    v12.yAnchorPoint = v12.state.hidden and 0 or 1;
    v12.stiffness = nil;
    v12.damping = nil;
    v12.onRested = nil;
    v12.closeCallback = function() --[[ Line: 42 ]]
        -- upvalues: v12 (copy)
        v12:close();
    end;
    v12.renderCancelButton = function(v13) --[[ Line: 46 ]]
        -- upvalues: v2 (ref), l_DEFAULT_CONTEXTUAL_MENU_CANCEL_HEIGHT_0 (ref), v12 (copy), v7 (ref), v8 (ref), v4 (ref)
        return v2.createElement("TextButton", {
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            LayoutOrder = 3, 
            BackgroundColor3 = v13.Theme.BackgroundUIDefault.Color, 
            BackgroundTransparency = v13.Theme.BackgroundUIDefault.Transparency, 
            Size = UDim2.new(1, 0, 0, l_DEFAULT_CONTEXTUAL_MENU_CANCEL_HEIGHT_0), 
            Text = "", 
            [v2.Event.Activated] = v12.closeCallback
        }, {
            Icon = v2.createElement(v7, {
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ClipsDescendants = false, 
                Image = "LuaApp/icons/navigation/close", 
                ImageColor3 = v13.Theme.IconDefault.Color, 
                ImageTransparency = v13.Theme.IconDefault.Transparency, 
                Position = UDim2.new(0, 20, 0.5, 0), 
                Size = UDim2.new(0, 20, 0, 20)
            }), 
            Cancel = v2.createElement(v8, {
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundColor3 = v4.Color.WHITE, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Position = UDim2.new(0, 60, 0.5, 0), 
                Size = UDim2.new(1, -70, 1, 0), 
                Text = "Feature.GamePage.LabelCancelField", 
                Font = v13.Font.Body.Font, 
                TextSize = v13.Font.BaseSize * v13.Font.Body.RelativeSize, 
                TextColor3 = v13.Theme.TextDefault.Color, 
                TextTransparency = v13.Theme.TextDefault.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            })
        });
    end;
    v12.renderPopupFrame = function(v14, v15) --[[ Line: 89 ]]
        -- upvalues: v12 (copy), v2 (ref), v5 (ref)
        local v16 = v12.props[v2.Children];
        local l_enableCancelButton_0 = v12.props.enableCancelButton;
        local l_contentPosition_0 = v12.props.contentPosition;
        local l_screenSize_0 = v12.props.screenSize;
        local v20 = UDim2.new(0, 0, 1, 0);
        if l_contentPosition_0 then
            v20 = UDim2.new(0, 0, 0, l_screenSize_0.Y);
        end;
        local l_ReducedMotion_0 = v14.Settings.ReducedMotion;
        return v2.createElement(v5.FitFrame, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            Position = v20, 
            AnchorPoint = if l_ReducedMotion_0 then Vector2.new(0, 1) else Vector2.new(0, v15.animValue), 
            BorderSizePixel = 0, 
            fitAxis = v5.FitAxis.Height
        }, {
            UIPadding = l_contentPosition_0 and v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_screenSize_0.X * l_contentPosition_0.X.Scale + l_contentPosition_0.X.Offset), 
                PaddingBottom = UDim.new(0, l_screenSize_0.Y - (l_screenSize_0.Y * l_contentPosition_0.Y.Scale + l_contentPosition_0.Y.Offset))
            }), 
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom
            }), 
            Frame = v2.createElement(v5.FitFrame, {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, 0), 
                fitAxis = v5.FitAxis.Height
            }, v16), 
            Separator = l_enableCancelButton_0 and v2.createElement("Frame", {
                BackgroundColor3 = v14.Theme.BackgroundUIDefault.Color, 
                BackgroundTransparency = v14.Theme.BackgroundUIDefault.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 1)
            }, {
                SeparatorBar = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundColor3 = v14.Theme.Divider.Color, 
                    BackgroundTransparency = v14.Theme.Divider.Transparency, 
                    BorderSizePixel = 0
                })
            }), 
            Cancel = l_enableCancelButton_0 and v12.renderCancelButton(v14)
        });
    end;
    v12.onRender = function(v22) --[[ Line: 149 ]]
        -- upvalues: l_withStyle_0 (ref), v2 (ref), v12 (copy)
        return l_withStyle_0(function(v23) --[[ Line: 150 ]]
            -- upvalues: v2 (ref), v22 (copy), v12 (ref)
            if v23.Settings.ReducedMotion then
                return v2.createElement("CanvasGroup", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    GroupTransparency = 1 - v22.animValue
                }, {
                    PopupFrame = v12.renderPopupFrame(v23, v22)
                });
            else
                return v12.renderPopupFrame(v23, v22);
            end;
        end);
    end;
end;
v11.open = function(v24) --[[ Line: 168 ]] --[[ Name: open ]]
    v24.yAnchorPoint = 1;
    v24.stiffness = nil;
    v24.damping = nil;
    v24.onRested = nil;
    v24:setState({
        hidden = false
    });
end;
v11.close = function(v25) --[[ Line: 179 ]] --[[ Name: close ]]
    local l_onCancel_0 = v25.props.onCancel;
    v25.yAnchorPoint = 0;
    v25.stiffness = 270;
    v25.damping = nil;
    v25.onRested = l_onCancel_0;
    v25:setState({
        hidden = true
    });
end;
v11.didMount = function(v27) --[[ Line: 192 ]] --[[ Name: didMount ]]
    v27:open();
end;
v11.render = function(v28) --[[ Line: 196 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v6 (copy)
    return v2.createElement("TextButton", {
        Size = UDim2.new(1, 0, 1, 0), 
        AutoButtonColor = false, 
        BackgroundTransparency = 1, 
        Text = "", 
        [v2.Event.Activated] = v28.closeCallback, 
        Selectable = v28.props.Selectable
    }, {
        AnimatedPopup = v2.createElement(v6.SimpleMotion, {
            style = {
                animValue = v6.spring(v28.yAnchorPoint, v28.stiffness, v28.damping)
            }, 
            onRested = v28.onRested, 
            render = v28.onRender
        })
    });
end;
return v3.connect(function(v29, _) --[[ Line: 215 ]]
    return {
        screenSize = v29.ScreenSize
    };
end)(v11);