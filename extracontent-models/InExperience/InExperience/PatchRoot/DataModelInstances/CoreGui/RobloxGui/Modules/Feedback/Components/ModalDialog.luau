local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.Resources.Assets);
local v7 = require(l_Parent_0.Components.PortedComponents.Divider);
local l_ImageSetButton_0 = v3.Core.ImageSet.ImageSetButton;
local l_withStyle_0 = v3.Core.Style.withStyle;
local l_IconButton_0 = v3.App.Button.IconButton;
local l_HeaderBar_0 = v3.App.Bar.HeaderBar;
local l_IconSize_0 = v3.App.ImageSet.Enum.IconSize;
local l_Images_0 = v3.App.ImageSet.Images;
local l_makeBackButton_0 = require(l_CorePackages_0.Workspace.Packages.AppHeaderBar).makeBackButton;
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v16 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableFeedbackReportDialogAdjustments)() and 60 or 48;
local v17 = v2.Component:extend("ModalDialog");
v17.validateProps = v4.strictInterface({
    visible = v4.boolean, 
    screenSize = v4.Vector2, 
    titleText = v4.optional(v4.string), 
    showCloseButton = v4.optional(v4.boolean), 
    headerBar = v4.optional(v4.table), 
    contents = v4.optional(v4.table), 
    actionButtons = v4.optional(v4.table), 
    onDismiss = v4.optional(v4.callback), 
    onBackButtonActivated = v4.optional(v4.callback), 
    maxHeight = v4.optional(v4.number), 
    maxWidth = v4.optional(v4.number)
});
v17.init = function(v18) --[[ Line: 50 ]] --[[ Name: init ]]
    v18.onOverlayActivated = function() --[[ Line: 51 ]]
        -- upvalues: v18 (copy)
        v18.props.onDismiss();
    end;
end;
v17.renderHeaderBarLeft = function(v19) --[[ Line: 56 ]] --[[ Name: renderHeaderBarLeft ]]
    -- upvalues: v2 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy), l_makeBackButton_0 (copy)
    local l_props_0 = v19.props;
    if l_props_0.showCloseButton then
        return function() --[[ Line: 60 ]]
            -- upvalues: v2 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), l_props_0 (copy)
            return v2.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/navigation/close"], 
                onActivated = l_props_0.onDismiss
            });
        end;
    elseif l_props_0.onBackButtonActivated ~= nil then
        return l_makeBackButton_0(l_props_0.onBackButtonActivated);
    else
        return function() --[[ Line: 72 ]]
            return nil;
        end;
    end;
end;
v17.renderHeaderBarRight = function(_) --[[ Line: 78 ]] --[[ Name: renderHeaderBarRight ]]
    return function() --[[ Line: 80 ]]
        return nil;
    end;
end;
v17.render = function(v22) --[[ Line: 85 ]] --[[ Name: render ]]
    -- upvalues: v16 (copy), l_withStyle_0 (copy), v2 (copy), l_ImageSetButton_0 (copy), v6 (copy), l_HeaderBar_0 (copy), v7 (copy)
    local l_props_1 = v22.props;
    local v24 = math.min(l_props_1.screenSize.Y, 645);
    if l_props_1.maxHeight then
        v24 = math.min(v24, l_props_1.maxHeight);
    end;
    local v25 = math.min(l_props_1.screenSize.X, 540);
    if l_props_1.maxWidth then
        v25 = math.min(v25, l_props_1.maxWidth);
    end;
    local v26 = Vector2.new(v25, v24);
    local v27 = nil;
    local v28 = nil;
    if l_props_1.screenSize.X < 540 then
        v27 = Vector2.new(0.5, 1);
        v28 = UDim2.fromScale(0.5, 1);
    else
        v27 = Vector2.new(0.5, 0.5);
        v28 = UDim2.fromScale(0.5, 0.5);
    end;
    local v29 = math.min(600, v26.Y - 49 - v16);
    if not l_props_1.actionButtons then
        v29 = v29 + v16;
    end;
    return l_withStyle_0(function(v30) --[[ Line: 121 ]]
        -- upvalues: v2 (ref), l_props_1 (copy), v22 (copy), l_ImageSetButton_0 (ref), v27 (ref), v6 (ref), v28 (ref), v26 (copy), l_HeaderBar_0 (ref), v7 (ref), v29 (ref), v16 (ref)
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Visible = l_props_1.visible
        }, {
            Overlay = v2.createElement("TextButton", {
                AutoButtonColor = false, 
                BackgroundColor3 = v30.Theme.Overlay.Color, 
                BackgroundTransparency = v30.Theme.Overlay.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.fromScale(1, 1), 
                Text = "", 
                [v2.Event.Activated] = v22.onOverlayActivated
            }), 
            Dialog = v2.createElement(l_ImageSetButton_0, {
                Active = true, 
                AnchorPoint = v27, 
                BackgroundTransparency = 1, 
                Image = v6.Images.RoundedRect.Image, 
                ImageColor3 = v30.Theme.BackgroundUIDefault.Color, 
                ImageTransparency = v30.Theme.BackgroundUIDefault.Transparency, 
                Position = v28, 
                ScaleType = v6.Images.RoundedRect.ScaleType, 
                Size = UDim2.fromOffset(v26.X, v26.Y), 
                SliceCenter = v6.Images.RoundedRect.SliceCenter
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                HeaderBar = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 48)
                }, {
                    Bar = l_props_1.headerBar or v2.createElement(l_HeaderBar_0, {
                        backgroundTransparency = 1, 
                        barHeight = 48, 
                        renderLeft = v22:renderHeaderBarLeft(), 
                        renderRight = v22:renderHeaderBarRight(), 
                        title = l_props_1.titleText
                    }) or nil
                }), 
                Divider = v2.createElement(v7, {
                    LayoutOrder = 2
                }), 
                Content = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 3, 
                    Size = UDim2.new(1, 0, 0, v29), 
                    ZIndex = 10
                }, {
                    Contents = l_props_1.contents
                }), 
                ActionBar = l_props_1.actionButtons and v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 4, 
                    Size = UDim2.new(1, 0, 0, v16)
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 8), 
                        PaddingBottom = UDim.new(0, 2), 
                        PaddingLeft = UDim.new(0, 24), 
                        PaddingRight = UDim.new(0, 24)
                    }), 
                    ActionButtons = l_props_1.actionButtons
                }) or nil
            })
        });
    end);
end;
v17.bindActions = function(v31) --[[ Line: 195 ]] --[[ Name: bindActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:BindCoreAction("ModalDialogDismiss", function(v32) --[[ Line: 196 ]] --[[ Name: dismissFunc ]]
        -- upvalues: v31 (copy)
        if v32 == Enum.UserInputState.Begin then
            v31.props.onDismiss();
        end;
    end, false, Enum.KeyCode.Escape);
end;
v17.unbindActions = function(_) --[[ Line: 204 ]] --[[ Name: unbindActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("ModalDialogDismiss");
end;
v17.didMount = function(v34) --[[ Line: 208 ]] --[[ Name: didMount ]]
    if v34.props.visible then
        v34:bindActions();
    end;
end;
v17.didUpdate = function(v35) --[[ Line: 214 ]] --[[ Name: didUpdate ]]
    if v35.props.visible then
        v35:bindActions();
        return;
    else
        v35:unbindActions();
        return;
    end;
end;
v17.willUnmount = function(v36) --[[ Line: 222 ]] --[[ Name: willUnmount ]]
    v36:unbindActions();
end;
return v17;