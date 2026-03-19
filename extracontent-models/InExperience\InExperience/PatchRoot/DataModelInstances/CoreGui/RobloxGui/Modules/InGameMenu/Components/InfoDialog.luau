local l_TextService_0 = game:GetService("TextService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v3 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v3.Roact;
local l_UIBlox_0 = v3.UIBlox;
local l_t_0 = v3.t;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Parent_0 = script.Parent.Parent;
local v11 = require(l_Parent_0.Resources.Assets);
local v12 = require(script.Parent.ThemedTextLabel);
local v13 = require(script.Parent.Divider);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v15 = l_Roact_0.PureComponent:extend("InfoDialog");
v15.validateProps = l_t_0.strictInterface({
    bodyText = l_t_0.string, 
    dismissText = l_t_0.string, 
    titleText = l_t_0.string, 
    iconImage = l_t_0.union(l_t_0.string, l_t_0.table), 
    onDismiss = l_t_0.callback, 
    visible = l_t_0.boolean, 
    buttonRef = l_t_0.optional(l_t_0.table)
});
v15.render = function(v16) --[[ Line: 41 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_TextService_0 (copy), l_Roact_0 (copy), l_ImageSetLabel_0 (copy), v11 (copy), v12 (copy), v13 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local l_props_0 = v16.props;
    return l_withStyle_0(function(v18) --[[ Line: 44 ]]
        -- upvalues: l_props_0 (copy), l_TextService_0 (ref), l_Roact_0 (ref), l_ImageSetLabel_0 (ref), v11 (ref), v16 (copy), v12 (ref), v13 (ref), l_Button_0 (ref), l_ButtonType_0 (ref)
        local l_Font_0 = v18.Font.Body.Font;
        local v20 = v18.Font.Body.RelativeSize * v18.Font.BaseSize;
        local l_bodyText_0 = l_props_0.bodyText;
        local v22 = math.max(l_TextService_0:GetTextSize(l_bodyText_0, v20, l_Font_0, Vector2.new(264, 1e999)).Y, v20 * 2) + 48;
        return l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            ZIndex = 8, 
            Visible = l_props_0.visible
        }, {
            Overlay = l_Roact_0.createElement("TextButton", {
                AutoButtonColor = false, 
                BackgroundColor3 = v18.Theme.Overlay.Color, 
                BackgroundTransparency = v18.Theme.Overlay.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = ""
            }), 
            DialogMainFrame = l_Roact_0.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = v11.Images.RoundedRect.Image, 
                ImageColor3 = v18.Theme.BackgroundUIDefault.Color, 
                ImageTransparency = v18.Theme.BackgroundUIDefault.Transparency, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                ScaleType = v11.Images.RoundedRect.ScaleType, 
                Size = UDim2.new(0, 312, 0, v22 + 49 + 36 + 36 + 24 + 10), 
                SliceCenter = v11.Images.RoundedRect.SliceCenter
            }, {
                Padding = l_Roact_0.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 10), 
                    PaddingBottom = UDim.new(0, 24), 
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24)
                }), 
                Layout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Icon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(0, 36, 0, 36), 
                    BackgroundTransparency = 1, 
                    Image = v16.props.iconImage, 
                    LayoutOrder = 1
                }), 
                Title = l_Roact_0.createElement(v12, {
                    fontKey = "Header1", 
                    themeKey = "TextEmphasis", 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, 48), 
                    Text = l_props_0.titleText
                }), 
                Divider = l_Roact_0.createElement(v13, {
                    LayoutOrder = 3
                }), 
                BodyTextContainer = l_Roact_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 4, 
                    Size = UDim2.new(1, 0, 0, v22)
                }, {
                    BodyText = l_Roact_0.createElement(v12, {
                        Size = UDim2.new(1, 0, 1, 0), 
                        Text = l_props_0.bodyText, 
                        TextWrapped = true
                    })
                }), 
                ConfirmButton = l_Roact_0.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    layoutOrder = 5, 
                    size = UDim2.new(1, 0, 0, 36), 
                    onActivated = l_props_0.onDismiss, 
                    text = l_props_0.dismissText, 
                    [l_Roact_0.Ref] = v16.props.buttonRef
                })
            })
        });
    end);
end;
v15.bindActions = function(v23) --[[ Line: 139 ]] --[[ Name: bindActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:BindCoreAction("InGameMenuModalDismiss", function(_, v25, _) --[[ Line: 140 ]] --[[ Name: dismissFunc ]]
        -- upvalues: v23 (copy)
        if v25 == Enum.UserInputState.Begin then
            v23.props.onDismiss();
        end;
    end, false, Enum.KeyCode.Escape);
end;
v15.unbindActions = function(_) --[[ Line: 149 ]] --[[ Name: unbindActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("InGameMenuModalDismiss");
end;
v15.didMount = function(v28) --[[ Line: 153 ]] --[[ Name: didMount ]]
    if v28.props.visible then
        v28:bindActions();
    end;
end;
v15.didUpdate = function(v29) --[[ Line: 159 ]] --[[ Name: didUpdate ]]
    if v29.props.visible then
        v29:bindActions();
        return;
    else
        v29:unbindActions();
        return;
    end;
end;
v15.willUnmount = function(v30) --[[ Line: 167 ]] --[[ Name: willUnmount ]]
    v30:unbindActions();
end;
return v15;