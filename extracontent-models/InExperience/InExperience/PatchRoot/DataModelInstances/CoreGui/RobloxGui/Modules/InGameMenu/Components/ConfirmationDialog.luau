local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_TextService_0 = game:GetService("TextService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local v6 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v6.Roact;
local l_t_0 = v6.t;
local l_UIBlox_0 = v6.UIBlox;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Parent_0 = script.Parent.Parent;
local v14 = require(l_Parent_0.Resources.Constants);
local v15 = require(l_Parent_0.Resources.Assets);
local v16 = require(script.Parent.ThemedTextLabel);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v18 = require(script.Parent.Connection.FocusHandler);
local v19 = l_Roact_0.PureComponent:extend("ConfirmationDialog");
v19.validateProps = l_t_0.strictInterface({
    bodyText = l_t_0.string, 
    cancelText = l_t_0.string, 
    confirmText = l_t_0.string, 
    titleText = l_t_0.string, 
    bindReturnToConfirm = l_t_0.boolean, 
    onCancel = l_t_0.callback, 
    onConfirm = l_t_0.callback, 
    blurBackground = l_t_0.boolean, 
    visible = l_t_0.boolean, 
    inputType = l_t_0.optional(l_t_0.string)
});
v19.defaultProps = {
    bodyText = "This is some body text. It will wrap when needed.", 
    cancelText = "Cancel", 
    confirmText = "Confirm", 
    titleText = "Dialog Title", 
    blurBackground = false
};
v19.init = function(v20) --[[ Line: 59 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy)
    v20.state = {
        isRooted = false
    };
    v20.onAncestryChanged = function(v21) --[[ Line: 64 ]]
        -- upvalues: v20 (copy)
        if v21:IsDescendantOf(game) then
            v20:setState({
                isRooted = true
            });
        end;
    end;
    v20.confirmButtonRef = l_Roact_0.createRef();
    v20.buttonContainerRef = l_Roact_0.createRef();
end;
v19.render = function(v22) --[[ Line: 75 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_TextService_0 (copy), l_Roact_0 (copy), l_CoreGui_0 (copy), v14 (copy), l_ImageSetLabel_0 (copy), v15 (copy), v16 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v18 (copy), l_GuiService_0 (copy)
    local l_props_0 = v22.props;
    return l_withStyle_0(function(v24) --[[ Line: 78 ]]
        -- upvalues: l_props_0 (copy), l_TextService_0 (ref), l_Roact_0 (ref), l_CoreGui_0 (ref), v14 (ref), l_ImageSetLabel_0 (ref), v15 (ref), v16 (ref), v22 (copy), l_Button_0 (ref), l_ButtonType_0 (ref), v18 (ref), l_GuiService_0 (ref)
        local l_Font_0 = v24.Font.Body.Font;
        local v26 = v24.Font.Body.RelativeSize * v24.Font.BaseSize;
        local l_bodyText_0 = l_props_0.bodyText;
        local v28 = math.max(l_TextService_0:GetTextSize(l_bodyText_0, v26, l_Font_0, Vector2.new(295, 1e999)).Y, v26 * 2) + 20 + 20;
        return l_Roact_0.createElement(l_Roact_0.Portal, {
            target = l_CoreGui_0
        }, {
            InGameMenuConfirmationDialog = l_Roact_0.createElement("ScreenGui", {
                DisplayOrder = v14.DisplayOrder.ConfirmationDialog, 
                IgnoreGuiInset = true, 
                OnTopOfCoreBlur = l_props_0.blurBackground, 
                Enabled = l_props_0.visible, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            }, {
                Overlay = l_Roact_0.createElement("TextButton", {
                    AutoButtonColor = false, 
                    BackgroundColor3 = v24.Theme.Overlay.Color, 
                    BackgroundTransparency = v24.Theme.Overlay.Transparency, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = ""
                }), 
                DialogMainFrame = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = v15.Images.RoundedRect.Image, 
                    ImageColor3 = v24.Theme.BackgroundUIDefault.Color, 
                    ImageTransparency = v24.Theme.BackgroundUIDefault.Transparency, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    ScaleType = v15.Images.RoundedRect.ScaleType, 
                    Size = UDim2.new(0, 335, 0, v28 + 49 + 36 + 20), 
                    SliceCenter = v15.Images.RoundedRect.SliceCenter
                }, {
                    Padding = l_Roact_0.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 20), 
                        PaddingLeft = UDim.new(0, 20), 
                        PaddingRight = UDim.new(0, 20)
                    }), 
                    Layout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Title = l_Roact_0.createElement(v16, {
                        fontKey = "Header1", 
                        themeKey = "TextEmphasis", 
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 0, 48), 
                        Text = l_props_0.titleText
                    }), 
                    Divider = l_Roact_0.createElement("Frame", {
                        BackgroundColor3 = v24.Theme.Divider.Color, 
                        BackgroundTransparency = v24.Theme.Divider.Transparency, 
                        BorderSizePixel = 0, 
                        LayoutOrder = 3, 
                        Size = UDim2.new(0.8, 0, 0, 1)
                    }), 
                    BodyTextContainer = l_Roact_0.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 4, 
                        Size = UDim2.new(1, 0, 0, v28)
                    }, {
                        BodyText = l_Roact_0.createElement(v16, {
                            Size = UDim2.new(1, 0, 1, 0), 
                            Text = l_props_0.bodyText, 
                            TextWrapped = true
                        })
                    }), 
                    ButtonContainer = l_Roact_0.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 5, 
                        Size = UDim2.new(1, 0, 0, 36), 
                        [l_Roact_0.Ref] = v22.buttonContainerRef, 
                        [l_Roact_0.Event.AncestryChanged] = v22.onAncestryChanged
                    }, {
                        Layout = l_Roact_0.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            Padding = UDim.new(0, 10), 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            VerticalAlignment = Enum.VerticalAlignment.Center
                        }), 
                        CancelButton = l_Roact_0.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.Secondary, 
                            layoutOrder = 1, 
                            size = UDim2.new(0.5, -5, 1, 0), 
                            text = l_props_0.cancelText, 
                            onActivated = l_props_0.onCancel
                        }), 
                        ConfirmButton = l_Roact_0.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            layoutOrder = 2, 
                            size = UDim2.new(0.5, -5, 1, 0), 
                            text = l_props_0.confirmText, 
                            onActivated = l_props_0.onConfirm, 
                            [l_Roact_0.Ref] = v22.confirmButtonRef
                        })
                    })
                })
            }), 
            FocusHandler = l_Roact_0.createElement(v18, {
                isFocused = v22.state.isRooted and v22.props.visible and v22.props.inputType == v14.InputType.Gamepad, 
                didFocus = function() --[[ Line: 198 ]] --[[ Name: didFocus ]]
                    -- upvalues: l_GuiService_0 (ref), v22 (ref)
                    l_GuiService_0:RemoveSelectionGroup("InGameMenuModalButtonsSelectionParent");
                    l_GuiService_0:AddSelectionParent("InGameMenuModalButtonsSelectionParent", v22.buttonContainerRef:getValue());
                    l_GuiService_0.SelectedCoreObject = v22.confirmButtonRef:getValue();
                end
            })
        });
    end);
end;
v19.updateBlur = function(v29) --[[ Line: 209 ]] --[[ Name: updateBlur ]]
    -- upvalues: l_RunService_0 (copy)
    local v30 = v29.props.blurBackground and v29.props.visible;
    l_RunService_0:SetRobloxGuiFocused(v30);
end;
v19.bindActions = function(v31) --[[ Line: 215 ]] --[[ Name: bindActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    local function v35(_, v33, _) --[[ Line: 216 ]] --[[ Name: confirmFunc ]]
        -- upvalues: v31 (copy)
        if v33 == Enum.UserInputState.Begin then
            v31.props.onConfirm();
        end;
    end;
    if v31.props.bindReturnToConfirm then
        l_ContextActionService_0:BindCoreAction("InGameMenuModalConfirm", v35, false, Enum.KeyCode.Return);
    end;
    l_ContextActionService_0:BindCoreAction("InGameMenuModalCancel", function(_, v37, _) --[[ Line: 226 ]] --[[ Name: cancelFunc ]]
        -- upvalues: v31 (copy)
        if v37 == Enum.UserInputState.Begin then
            v31.props.onCancel();
        end;
    end, false, Enum.KeyCode.Escape);
end;
v19.unbindActions = function(_) --[[ Line: 235 ]] --[[ Name: unbindActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("InGameMenuModalConfirm");
    l_ContextActionService_0:UnbindCoreAction("InGameMenuModalCancel");
end;
v19.didMount = function(v40) --[[ Line: 240 ]] --[[ Name: didMount ]]
    v40:updateBlur();
    if v40.props.visible then
        v40:bindActions();
    end;
end;
v19.didUpdate = function(v41) --[[ Line: 248 ]] --[[ Name: didUpdate ]]
    v41:updateBlur();
    if v41.props.visible then
        v41:bindActions();
        return;
    else
        v41:unbindActions();
        return;
    end;
end;
v19.willUnmount = function(v42) --[[ Line: 258 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_RunService_0 (copy)
    if v42.props.blurBackground then
        l_RunService_0:SetRobloxGuiFocused(false);
    end;
    v42:unbindActions();
end;
return v19;