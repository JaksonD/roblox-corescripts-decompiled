local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_CorePackages_0.Packages.t);
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v8 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v9 = require(l_RobloxGui_0.Modules.Settings.BackButtonController);
local v10 = v2.PureComponent:extend("MenuBackButton");
local v11 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local v12 = require(l_RobloxGui_0.Modules.Settings.Theme);
v10.validateProps = v4.strictInterface({
    HubBar = v4.instanceOf("ImageLabel"), 
    backEnabled = v4.boolean, 
    BackBarRef = v4.optional(v4.table), 
    LayoutOrder = v4.optional(v4.integer)
});
v10.defaultProps = {
    backEnabled = v9.hasReturnUniverse()
};
v10.init = function(v13) --[[ Line: 33 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy), v2 (copy)
    v13:setState({
        text = v9.getMenuText()
    });
    local v14, v15 = v2.createBinding(nil);
    v13.sizeBinding = v14;
    v13.updateSizeBinding = v15;
    v14, v15 = v2.createBinding(nil);
    v13.sizeConstraintBinding = v14;
    v13.updateSizeConstraintBinding = v15;
    v14, v15 = v2.createBinding(nil);
    v13.visibleBinding = v14;
    v13.updateVisibleBinding = v15;
    v14, v15 = v2.createBinding(nil);
    v13.buttonHeightBinding = v14;
    v13.updateButtonHeightBinding = v15;
    v14, v15 = v2.createBinding(nil);
    v13.textSizeBinding = v14;
    v13.updateTextSizeBinding = v15;
    v14, v15 = v2.createBinding(nil);
    v13.textSizeConstraintBinding = v14;
    v13.updateTextSizeConstraintBinding = v15;
    v13.textLabelRef = v2.createRef();
end;
v10.didMount = function(v16) --[[ Line: 47 ]] --[[ Name: didMount ]]
    v16.updateSizeBinding(v16.props.HubBar.Size);
    v16.updateVisibleBinding(v16.props.HubBar.Visible);
    v16:updateViewport();
end;
v10.didUpdate = function(v17, v18) --[[ Line: 53 ]] --[[ Name: didUpdate ]]
    if v17.props.HubBar ~= v18.HubBar then
        v17.updateSizeBinding(v17.props.HubBar.Size);
        v17.updateVisibleBinding(v17.props.HubBar.Visible);
    end;
end;
v10.updateViewport = function(v19) --[[ Line: 60 ]] --[[ Name: updateViewport ]]
    -- upvalues: v12 (copy), v8 (copy), v11 (copy)
    local v20 = v12.textSize(24);
    if v8:IsSmallTouchScreen() then
        v20 = v12.textSize(18);
    elseif v11 then
        v20 = v12.textSize(36);
    end;
    v19.updateTextSizeConstraintBinding(v20);
    local v21 = v8:IsPortrait();
    local v22 = v11 and 120 or v12.LargeButtonHeight;
    if v21 or v8:IsSmallTouchScreen() then
        v22 = v12.ButtonHeight;
        v20 = v21 and v12.textSize(16) or v12.textSize(24);
    end;
    v19.updateTextSizeBinding(v20);
    v19.updateButtonHeightBinding(v22);
    if v19.textLabelRef:getValue() and v19.props.BackBarRef:getValue() then
        local v23 = v19.textLabelRef:getValue().AbsolutePosition.X - v19.props.BackBarRef:getValue().AbsolutePosition.X;
        v19.updateSizeConstraintBinding(Vector2.new(v19.props.BackBarRef:getValue().AbsoluteSize.X - v23, 1e999));
    end;
end;
v10.render = function(v24) --[[ Line: 88 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_ExternalEventConnection_0 (copy), v12 (copy), v9 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    return v2.createElement("Frame", {
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        AnchorPoint = Vector2.new(0, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        LayoutOrder = v24.props.LayoutOrder, 
        Visible = v2.joinBindings({
            v24.state.text, 
            v24.visibleBinding
        }):map(function(v25) --[[ Line: 98 ]]
            -- upvalues: v24 (copy)
            return v24.props.backEnabled and v25[1] ~= nil and v25[2];
        end), 
        Size = v2.joinBindings({
            v24.sizeBinding, 
            v24.buttonHeightBinding
        }):map(function(v26) --[[ Line: 101 ]]
            local v27 = v26[1];
            local v28 = v26[2];
            if v27 and v28 then
                return UDim2.new(UDim.new(v27.X.Scale * 0.5, v27.X.Offset * 0.5), UDim.new(0, v28 + 6));
            else
                return UDim2.new();
            end;
        end), 
        [v2.Ref] = v24.props.BackBarRef
    }, {
        SizeConnection = v2.createElement(l_ExternalEventConnection_0, {
            event = v24.props.HubBar:GetPropertyChangedSignal("Size"), 
            callback = function() --[[ Line: 116 ]] --[[ Name: callback ]]
                -- upvalues: v24 (copy)
                v24.updateSizeBinding(v24.props.HubBar.Size);
            end
        }), 
        VisibleConnection = v2.createElement(l_ExternalEventConnection_0, {
            event = v24.props.HubBar:GetPropertyChangedSignal("Visible"), 
            callback = function() --[[ Line: 122 ]] --[[ Name: callback ]]
                -- upvalues: v24 (copy)
                v24.updateVisibleBinding(v24.props.HubBar.Visible);
            end
        }), 
        ViewportSizeChangedConnection = v2.createElement(l_ExternalEventConnection_0, {
            event = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"), 
            callback = function() --[[ Line: 128 ]] --[[ Name: callback ]]
                -- upvalues: v24 (copy)
                v24:updateViewport();
            end
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 6), 
            PaddingTop = UDim.new(0, 10)
        }), 
        ImageButton = v2.createElement("ImageButton", {
            Image = "", 
            BorderSizePixel = 0, 
            BackgroundColor3 = v12.color("DefaultButton"), 
            BackgroundTransparency = v12.transparency("DefaultButton", 1), 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = v24.buttonHeightBinding:map(function(v29) --[[ Line: 142 ]]
                if v29 then
                    return UDim2.new(0, 0, 0, v29);
                else
                    return UDim2.new();
                end;
            end), 
            AutomaticSize = Enum.AutomaticSize.X, 
            ScaleType = Enum.ScaleType.Stretch, 
            SliceCenter = Rect.new(8, 6, 46, 44), 
            [v2.Event.MouseEnter] = function(v30) --[[ Line: 152 ]]
                -- upvalues: v12 (ref)
                v30.BackgroundColor3 = v12.color("DefaultButtonHover");
                v30.BackgroundTransparency = v12.transparency("DefaultButtonHover");
            end, 
            [v2.Event.MouseLeave] = function(v31) --[[ Line: 156 ]]
                -- upvalues: v12 (ref)
                v31.BackgroundColor3 = v12.color("DefaultButton");
                v31.BackgroundTransparency = v12.transparency("DefaultButton");
            end, 
            [v2.Event.Activated] = function(_) --[[ Line: 160 ]]
                -- upvalues: v9 (ref)
                v9.initiateBackButtonTeleport(Enum.AdTeleportMethod.InGameMenuBackButton);
            end
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = v12.DefaultCornerRadius
            }), 
            UIStroke = v2.createElement("UIStroke", {
                Color = v12.color("DefaultButtonStroke"), 
                Transparency = v12.transparency("DefaultButtonStroke"), 
                Thickness = v12.DefaultStokeThickness
            }), 
            Frame = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, 4, 0, 0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                UIPadding = v2.createElement("UIPadding", {
                    PaddingRight = UDim.new(0, 12)
                }), 
                Container = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                ImageLabel = v2.createElement(l_ImageSetLabel_0, {
                    Image = l_Images_0["icons/actions/cycleLeft"], 
                    Size = UDim2.new(1, 0, 0.75, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, {
                    UIAspectRatioConstraint = v2.createElement("UIAspectRatioConstraint", {})
                }), 
                TextLabel = v2.createElement("TextLabel", {
                    Text = v24.state.text, 
                    Size = UDim2.new(0, 0, 1, 0), 
                    AutomaticSize = Enum.AutomaticSize.X, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextColor3 = Color3.fromRGB(255, 255, 255), 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    Font = v12.font(Enum.Font.SourceSansBold, "Bold"), 
                    TextSize = v24.textSizeBinding, 
                    TextScaled = true, 
                    TextWrapped = true, 
                    LayoutOrder = 2, 
                    [v2.Ref] = v24.textLabelRef
                }, {
                    UITextSizeConstraint = v2.createElement("UITextSizeConstraint", {
                        MaxTextSize = v24.textSizeConstraintBinding
                    }), 
                    UISizeConstraint = v2.createElement("UISizeConstraint", {
                        MaxSize = v24.sizeConstraintBinding
                    })
                })
            })
        })
    });
end;
return v10;