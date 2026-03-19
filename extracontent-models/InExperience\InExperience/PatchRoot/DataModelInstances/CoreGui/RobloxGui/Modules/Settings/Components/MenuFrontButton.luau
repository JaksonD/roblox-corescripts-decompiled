local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_CorePackages_0.Packages.t);
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v8 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v9 = require(l_RobloxGui_0.Modules.Settings.FrontButtonController);
local v10 = v2.PureComponent:extend("MenuFrontButton");
local v11 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local v12 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v13 = game:DefineFastFlag("ShowTeleportHistoryFrontButton", false);
v10.validateProps = v4.strictInterface({
    HubBar = v4.instanceOf("ImageLabel"), 
    frontEnabled = v4.boolean, 
    FrontBarRef = v4.optional(v4.table), 
    LayoutOrder = v4.optional(v4.integer)
});
v10.defaultProps = {
    frontEnabled = v13 and v9.hasReturnUniverse()
};
v10.init = function(v14) --[[ Line: 33 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy), v2 (copy)
    v14:setState({
        text = v9.getMenuText()
    });
    local v15, v16 = v2.createBinding(nil);
    v14.sizeBinding = v15;
    v14.updateSizeBinding = v16;
    v15, v16 = v2.createBinding(nil);
    v14.sizeConstraintBinding = v15;
    v14.updateSizeConstraintBinding = v16;
    v15, v16 = v2.createBinding(nil);
    v14.visibleBinding = v15;
    v14.updateVisibleBinding = v16;
    v15, v16 = v2.createBinding(nil);
    v14.buttonHeightBinding = v15;
    v14.updateButtonHeightBinding = v16;
    v15, v16 = v2.createBinding(nil);
    v14.textSizeBinding = v15;
    v14.updateTextSizeBinding = v16;
    v15, v16 = v2.createBinding(nil);
    v14.textSizeConstraintBinding = v15;
    v14.updateTextSizeConstraintBinding = v16;
    v14.textLabelRef = v2.createRef();
end;
v10.didMount = function(v17) --[[ Line: 45 ]] --[[ Name: didMount ]]
    v17.updateSizeBinding(v17.props.HubBar.Size);
    v17.updateVisibleBinding(v17.props.HubBar.Visible);
    v17:updateViewport();
end;
v10.didUpdate = function(v18, v19) --[[ Line: 50 ]] --[[ Name: didUpdate ]]
    if v18.props.HubBar ~= v19.HubBar then
        v18.updateSizeBinding(v18.props.HubBar.Size);
        v18.updateVisibleBinding(v18.props.HubBar.Visible);
    end;
end;
v10.updateViewport = function(v20) --[[ Line: 56 ]] --[[ Name: updateViewport ]]
    -- upvalues: v12 (copy), v8 (copy), v11 (copy)
    local v21 = v12.textSize(24);
    if v8:IsSmallTouchScreen() then
        v21 = v12.textSize(18);
    elseif v11 then
        v21 = v12.textSize(36);
    end;
    v20.updateTextSizeConstraintBinding(v21);
    local v22 = v8:IsPortrait();
    local v23 = v11 and 120 or v12.LargeButtonHeight;
    if v22 or v8:IsSmallTouchScreen() then
        v23 = v12.ButtonHeight;
        v21 = v22 and v12.textSize(16) or v12.textSize(24);
    end;
    v20.updateTextSizeBinding(v21);
    v20.updateButtonHeightBinding(v23);
    if v20.textLabelRef:getValue() and v20.props.FrontBarRef:getValue() then
        local v24 = v20.textLabelRef:getValue().AbsolutePosition.X - v20.props.FrontBarRef:getValue().AbsolutePosition.X;
        v20.updateSizeConstraintBinding(Vector2.new(v20.props.FrontBarRef:getValue().AbsoluteSize.X - v24, 1e999));
    end;
end;
v10.render = function(v25) --[[ Line: 80 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_ExternalEventConnection_0 (copy), v12 (copy), v9 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    return v2.createElement("Frame", {
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.new(1, 0, 0, 0), 
        LayoutOrder = v25.props.LayoutOrder, 
        Visible = v2.joinBindings({
            v25.state.text, 
            v25.visibleBinding
        }):map(function(v26) --[[ Line: 89 ]]
            -- upvalues: v25 (copy)
            return v25.props.frontEnabled and v26[1] ~= nil and v26[2];
        end), 
        Size = v2.joinBindings({
            v25.sizeBinding, 
            v25.buttonHeightBinding
        }):map(function(v27) --[[ Line: 92 ]]
            local v28 = v27[1];
            local v29 = v27[2];
            if v28 and v29 then
                return UDim2.new(UDim.new(v28.X.Scale * 0.5, v28.X.Offset * 0.5), UDim.new(0, v29 + 6));
            else
                return UDim2.new();
            end;
        end), 
        [v2.Ref] = v25.props.FrontBarRef
    }, {
        SizeConnection = v2.createElement(l_ExternalEventConnection_0, {
            event = v25.props.HubBar:GetPropertyChangedSignal("Size"), 
            callback = function() --[[ Line: 108 ]] --[[ Name: callback ]]
                -- upvalues: v25 (copy)
                v25.updateSizeBinding(v25.props.HubBar.Size);
            end
        }), 
        VisibleConnection = v2.createElement(l_ExternalEventConnection_0, {
            event = v25.props.HubBar:GetPropertyChangedSignal("Visible"), 
            callback = function() --[[ Line: 114 ]] --[[ Name: callback ]]
                -- upvalues: v25 (copy)
                v25.updateVisibleBinding(v25.props.HubBar.Visible);
            end
        }), 
        ViewportSizeChangedConnection = v2.createElement(l_ExternalEventConnection_0, {
            event = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"), 
            callback = function() --[[ Line: 120 ]] --[[ Name: callback ]]
                -- upvalues: v25 (copy)
                v25:updateViewport();
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
            Size = v25.buttonHeightBinding:map(function(v30) --[[ Line: 134 ]]
                if v30 then
                    return UDim2.new(0, 0, 0, v30);
                else
                    return UDim2.new();
                end;
            end), 
            AutomaticSize = Enum.AutomaticSize.X, 
            ScaleType = Enum.ScaleType.Stretch, 
            SliceCenter = Rect.new(8, 6, 46, 44), 
            [v2.Event.MouseEnter] = function(v31) --[[ Line: 144 ]]
                -- upvalues: v12 (ref)
                v31.BackgroundColor3 = v12.color("DefaultButtonHover");
                v31.BackgroundTransparency = v12.transparency("DefaultButtonHover");
            end, 
            [v2.Event.MouseLeave] = function(v32) --[[ Line: 148 ]]
                -- upvalues: v12 (ref)
                v32.BackgroundColor3 = v12.color("DefaultButton");
                v32.BackgroundTransparency = v12.transparency("DefaultButton");
            end, 
            [v2.Event.Activated] = function(_) --[[ Line: 152 ]]
                -- upvalues: v9 (ref)
                v9.initiateFrontButtonTeleport();
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
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                TextLabel = v2.createElement("TextLabel", {
                    Text = v25.state.text, 
                    Size = UDim2.new(0, 0, 1, 0), 
                    AutomaticSize = Enum.AutomaticSize.X, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextColor3 = Color3.fromRGB(255, 255, 255), 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    Font = v12.font(Enum.Font.SourceSansBold, "Bold"), 
                    TextSize = v25.textSizeBinding, 
                    TextScaled = true, 
                    TextWrapped = true, 
                    LayoutOrder = 1, 
                    [v2.Ref] = v25.textLabelRef
                }, {
                    UITextSizeConstraint = v2.createElement("UITextSizeConstraint", {
                        MaxTextSize = v25.textSizeConstraintBinding
                    }), 
                    UISizeConstraint = v2.createElement("UISizeConstraint", {
                        MaxSize = v25.sizeConstraintBinding
                    })
                }), 
                ImageLabel = v2.createElement(l_ImageSetLabel_0, {
                    Image = l_Images_0["icons/actions/cycleRight"], 
                    Size = UDim2.new(1, 0, 0.75, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }, {
                    UIAspectRatioConstraint = v2.createElement("UIAspectRatioConstraint", {})
                })
            })
        })
    });
end;
return v10;