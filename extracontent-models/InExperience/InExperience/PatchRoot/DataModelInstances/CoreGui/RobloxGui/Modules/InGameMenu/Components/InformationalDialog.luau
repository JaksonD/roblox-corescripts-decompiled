local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_TextService_0 = game:GetService("TextService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local v6 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v6.Roact;
local l_UIBlox_0 = v6.UIBlox;
local l_t_0 = v6.t;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Parent_0 = script.Parent.Parent;
local l_Flags_0 = l_Parent_0.Flags;
local v15 = require(l_Flags_0.GetFFlagIGMGamepadSelectionHistory);
local v16 = require(l_Parent_0.Resources.Constants);
local v17 = require(l_Parent_0.Resources.Assets);
local v18 = require(script.Parent.ThemedTextLabel);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v20 = require(script.Parent.Connection.FocusHandler);
local v21 = l_Roact_0.PureComponent:extend("InformationalDialog");
v21.validateProps = l_t_0.strictInterface({
    bodyText = l_t_0.string, 
    confirmText = l_t_0.string, 
    titleText = l_t_0.string, 
    subBodyText = l_t_0.optional(l_t_0.string), 
    iconImage = l_t_0.optional(l_t_0.union(l_t_0.table, l_t_0.string)), 
    iconSize = l_t_0.number, 
    onContinueFunc = l_t_0.optional(l_t_0.callback), 
    bindReturnToConfirm = l_t_0.boolean, 
    blurBackground = l_t_0.boolean, 
    visible = l_t_0.boolean, 
    inputType = l_t_0.optional(l_t_0.string)
});
v21.defaultProps = {
    subBodyText = nil, 
    blurBackground = false, 
    iconImage = nil, 
    iconSize = 64
};
v21.init = function(v22) --[[ Line: 66 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy)
    v22.state = {
        isRooted = false, 
        show = true
    };
    v22.onAncestryChanged = function(v23) --[[ Line: 72 ]]
        -- upvalues: v22 (copy)
        if v23:IsDescendantOf(game) then
            v22:setState({
                isRooted = true
            });
        end;
    end;
    v22.confirmButtonRef = l_Roact_0.createRef();
    v22.buttonContainerRef = l_Roact_0.createRef();
end;
v21.render = function(v24) --[[ Line: 83 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_TextService_0 (copy), v15 (copy), l_Roact_0 (copy), l_CoreGui_0 (copy), l_ImageSetLabel_0 (copy), v17 (copy), v18 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_RunService_0 (copy), v20 (copy), v16 (copy), l_GuiService_0 (copy)
    local l_props_0 = v24.props;
    return l_withStyle_0(function(v26) --[[ Line: 86 ]]
        -- upvalues: l_props_0 (copy), l_TextService_0 (ref), v15 (ref), v24 (copy), l_Roact_0 (ref), l_CoreGui_0 (ref), l_ImageSetLabel_0 (ref), v17 (ref), v18 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), l_RunService_0 (ref), v20 (ref), v16 (ref), l_GuiService_0 (ref)
        local l_Font_0 = v26.Font.Body.Font;
        local v28 = v26.Font.Body.RelativeSize * v26.Font.BaseSize;
        local l_bodyText_0 = l_props_0.bodyText;
        local l_Y_0 = l_TextService_0:GetTextSize(l_bodyText_0, v28, l_Font_0, Vector2.new(295, 1e999)).Y;
        local l_Y_1 = l_TextService_0:GetTextSize(l_props_0.subBodyText, v28, l_Font_0, Vector2.new(295, 1e999)).Y;
        local v32 = math.max(l_Y_0, v28 * 2) + 20;
        local v33 = math.max(l_Y_1, v28 * 2) + 20;
        local v34 = nil;
        if v15() then
            v34 = not v24.props.visible;
        end;
        return l_Roact_0.createElement(l_Roact_0.Portal, {
            target = l_CoreGui_0
        }, {
            InGameMenuInformationalDialog = l_Roact_0.createElement("ScreenGui", {
                DisplayOrder = 8, 
                IgnoreGuiInset = true, 
                OnTopOfCoreBlur = l_props_0.blurBackground, 
                Enabled = l_props_0.visible and v24.state.show, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            }, {
                Overlay = l_Roact_0.createElement("TextButton", {
                    AutoButtonColor = false, 
                    BackgroundColor3 = v26.Theme.Overlay.Color, 
                    BackgroundTransparency = v26.Theme.Overlay.Transparency, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = ""
                }), 
                DialogMainFrame = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = v17.Images.RoundedRect.Image, 
                    ImageColor3 = v26.Theme.BackgroundUIDefault.Color, 
                    ImageTransparency = v26.Theme.BackgroundUIDefault.Transparency, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    ScaleType = v17.Images.RoundedRect.ScaleType, 
                    Size = UDim2.new(0, 335, 0, v32 + 49 + v33 + 36 + 70 + l_props_0.iconSize), 
                    SliceCenter = v17.Images.RoundedRect.SliceCenter
                }, {
                    Padding = l_Roact_0.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 20), 
                        PaddingBottom = UDim.new(0, 20), 
                        PaddingLeft = UDim.new(0, 20), 
                        PaddingRight = UDim.new(0, 20)
                    }), 
                    Layout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Icon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                        Position = UDim2.fromScale(0.5, 0.5), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Image = l_props_0.iconImage, 
                        Size = UDim2.new(0, l_props_0.iconSize, 0, l_props_0.iconSize), 
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0
                    }), 
                    Title = l_Roact_0.createElement(v18, {
                        fontKey = "Header1", 
                        themeKey = "TextEmphasis", 
                        LayoutOrder = 2, 
                        Size = UDim2.new(1, 0, 0, 48), 
                        Text = l_props_0.titleText
                    }), 
                    Divider = l_Roact_0.createElement("Frame", {
                        BackgroundColor3 = v26.Theme.Divider.Color, 
                        BackgroundTransparency = v26.Theme.Divider.Transparency, 
                        BorderSizePixel = 0, 
                        LayoutOrder = 3, 
                        Size = UDim2.new(0.8, 0, 0, 1)
                    }), 
                    SpaceContainer = l_Roact_0.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 4, 
                        Size = UDim2.new(1, 0, 0, 10)
                    }), 
                    BodyTextContainer = l_Roact_0.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 5, 
                        Size = UDim2.new(1, 0, 0, v32)
                    }, {
                        BodyText = l_Roact_0.createElement(v18, {
                            Size = UDim2.new(1, 0, 1, 0), 
                            Text = l_props_0.bodyText, 
                            TextWrapped = true
                        })
                    }), 
                    SubBodyTextContainer = l_Roact_0.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 6, 
                        Size = UDim2.new(1, 0, 0, v33)
                    }, {
                        BodyText = l_Roact_0.createElement(v18, {
                            Size = UDim2.new(1, 0, 1, 0), 
                            Text = l_props_0.subBodyText, 
                            TextWrapped = true
                        })
                    }), 
                    SpaceContainer2 = l_Roact_0.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 7, 
                        Size = UDim2.new(1, 0, 0, 10)
                    }), 
                    ButtonContainer = l_Roact_0.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 8, 
                        Size = UDim2.new(1, 0, 0, 36), 
                        [l_Roact_0.Ref] = v24.buttonContainerRef, 
                        [l_Roact_0.Event.AncestryChanged] = v24.onAncestryChanged
                    }, {
                        Layout = l_Roact_0.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            Padding = UDim.new(0, 20), 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            VerticalAlignment = Enum.VerticalAlignment.Center
                        }), 
                        ConfirmButton = l_Roact_0.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            layoutOrder = 1, 
                            size = UDim2.new(1, -5, 1, 0), 
                            text = l_props_0.confirmText, 
                            onActivated = function() --[[ Line: 237 ]] --[[ Name: onActivated ]]
                                -- upvalues: v24 (ref), l_RunService_0 (ref)
                                v24:setState({
                                    show = false
                                });
                                if v24.props.onContinueFunc then
                                    v24.props.onContinueFunc();
                                end;
                                l_RunService_0:SetRobloxGuiFocused(false);
                            end, 
                            [l_Roact_0.Ref] = v24.confirmButtonRef
                        })
                    })
                })
            }), 
            FocusHandler = l_Roact_0.createElement(v20, {
                isFocused = v24.state.isRooted and v24.props.visible and v24.props.inputType == v16.InputType.Gamepad, 
                shouldForgetPreviousSelection = v34, 
                didFocus = function() --[[ Line: 256 ]] --[[ Name: didFocus ]]
                    -- upvalues: l_GuiService_0 (ref), v24 (ref)
                    l_GuiService_0:RemoveSelectionGroup("InGameMenuModalButtonsSelectionParent");
                    l_GuiService_0:AddSelectionParent("InGameMenuModalButtonsSelectionParent", v24.buttonContainerRef:getValue());
                    l_GuiService_0.SelectedCoreObject = v24.confirmButtonRef:getValue();
                end
            })
        });
    end);
end;
v21.updateBlur = function(v35) --[[ Line: 267 ]] --[[ Name: updateBlur ]]
    -- upvalues: l_RunService_0 (copy)
    local v36 = v35.props.blurBackground and v35.props.visible;
    l_RunService_0:SetRobloxGuiFocused(v36);
end;
v21.bindActions = function(v37) --[[ Line: 272 ]] --[[ Name: bindActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    local function v41(_, v39, _) --[[ Line: 273 ]] --[[ Name: confirmFunc ]]
        -- upvalues: v37 (copy)
        if v39 == Enum.UserInputState.Begin then
            v37.props.onConfirm();
        end;
    end;
    if v37.props.bindReturnToConfirm then
        l_ContextActionService_0:BindCoreAction("InGameMenuModalConfirm", v41, false, Enum.KeyCode.Return);
    end;
end;
v21.unbindActions = function(_) --[[ Line: 284 ]] --[[ Name: unbindActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("InGameMenuModalConfirm");
end;
v21.didMount = function(v43) --[[ Line: 288 ]] --[[ Name: didMount ]]
    v43:updateBlur();
    if v43.props.visible then
        v43:bindActions();
    end;
end;
v21.didUpdate = function(v44) --[[ Line: 296 ]] --[[ Name: didUpdate ]]
    v44:updateBlur();
    if v44.props.visible then
        v44:bindActions();
        return;
    else
        v44:unbindActions();
        return;
    end;
end;
v21.willUnmount = function(v45) --[[ Line: 306 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_RunService_0 (copy)
    if v45.props.blurBackground then
        l_RunService_0:SetRobloxGuiFocused(false);
    end;
    v45:unbindActions();
end;
return v21;