local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v5 = require(l_CorePackages_0.Workspace.Packages.VoiceChat);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_Button_0 = v6.App.Button.Button;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_Images_0 = v6.App.ImageSet.Images;
local v10 = require(script.Parent.Parent.Parent.InGameMenu.Resources.Assets);
local v11 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v12 = require(script.Parent.Parent.Helpers.getMicDeeplinkDirections);
local v13 = require(script.Parent.Parent.Helpers.getPrimingText);
local l_GetFFlagSupportGamepadNavInVoiceModals_0 = v5.Flags.GetFFlagSupportGamepadNavInVoiceModals;
local v15 = v11:FormatByKey("Feature.SettingsHub.Action.OpenSettings");
local v16 = v11:FormatByKey("Feature.SettingsHub.Action.Ok");
local v17 = v11:FormatByKey("Feature.SettingsHub.Action.NotNow");
local v18 = l_Images_0["icons/controls/microphone"];
local v19 = v4.wrap(v3.strictInterface({
    titleText = v3.string, 
    bodyText = v3.string, 
    handlePrimaryActivated = v3.callback, 
    handleSecondaryActivated = v3.callback, 
    Analytics = v3.table, 
    promptStyle = v3.table, 
    showPrompt = v3.boolean, 
    settingsAppAvailable = v3.boolean, 
    UserInputService = v3.table
}));
local function v40(v20, v21) --[[ Line: 65 ]] --[[ Name: DevicePermissionsModal ]]
    -- upvalues: v19 (copy), v12 (copy), v13 (copy), l_TextService_0 (copy), l_GetFFlagSupportGamepadNavInVoiceModals_0 (copy), v2 (copy), v6 (copy), v10 (copy), v18 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v17 (copy), v15 (copy), v16 (copy)
    assert(v19(v20));
    local v22 = v12(v20.settingsAppAvailable, v20.UserInputService);
    local v23 = v13(v20.UserInputService);
    local l_Font_0 = v20.promptStyle.Font.Header1.Font;
    local v25 = v20.promptStyle.Font.Header1.RelativeSize * v20.promptStyle.Font.BaseSize;
    local v26 = 20 + l_TextService_0:GetTextSize(v20.titleText, v25, l_Font_0, Vector2.new(325, 1e999)).Y;
    local l_Font_1 = v20.promptStyle.Font.Body.Font;
    local v28 = v20.promptStyle.Font.Body.RelativeSize * v20.promptStyle.Font.BaseSize;
    local v29 = 20 + l_TextService_0:GetTextSize(v20.bodyText, v28, l_Font_1, Vector2.new(325, 1e999)).Y;
    local v30 = 0;
    if v23 then
        local l_Font_2 = v20.promptStyle.Font.CaptionHeader.Font;
        local v32 = v20.promptStyle.Font.CaptionHeader.RelativeSize * v20.promptStyle.Font.BaseSize;
        v30 = 10 + l_TextService_0:GetTextSize(v23, v32, l_Font_2, Vector2.new(325, 1e999)).Y;
    end;
    local v33 = 0;
    if v22 then
        local l_Font_3 = v20.promptStyle.Font.Body.Font;
        local v35 = v20.promptStyle.Font.Body.RelativeSize * v20.promptStyle.Font.BaseSize;
        local l_Y_0 = l_TextService_0:GetTextSize(v22, v35, l_Font_3, Vector2.new(325, 1e999)).Y;
        v33 = (v23 and 10 or 20) + l_Y_0;
    end;
    local v37 = 4;
    if v22 then
        v37 = 4.5;
    end;
    if v23 then
        v37 = 5.5;
    end;
    local v38 = if l_GetFFlagSupportGamepadNavInVoiceModals_0() then Enum.SelectionBehavior.Stop else nil;
    local v39 = l_GetFFlagSupportGamepadNavInVoiceModals_0() and true or nil;
    return v2.createElement("ScreenGui", {
        DisplayOrder = 8, 
        IgnoreGuiInset = true, 
        OnTopOfCoreBlur = true, 
        Enabled = v20.showPrompt, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, {
        Overlay = v2.createElement("TextButton", {
            AutoButtonColor = false, 
            BackgroundColor3 = v20.promptStyle.Theme.Overlay.Color, 
            BackgroundTransparency = v20.promptStyle.Theme.Overlay.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            Text = ""
        }), 
        DialogMainFrame = v2.createElement(v6.Core.ImageSet.ImageSetLabel, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Image = v10.Images.RoundedRect.Image, 
            ImageColor3 = v20.promptStyle.Theme.BackgroundUIDefault.Color, 
            ImageTransparency = v20.promptStyle.Theme.BackgroundUIDefault.Transparency, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            ScaleType = v10.Images.RoundedRect.ScaleType, 
            Size = UDim2.new(0, 365, 0, v26 + 5 + v29 + 36 + v37 * 20 + v33 + 55 + v30), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            SliceCenter = v10.Images.RoundedRect.SliceCenter, 
            SelectionBehaviorDown = v38, 
            SelectionBehaviorLeft = v38, 
            SelectionBehaviorRight = v38, 
            SelectionBehaviorUp = v38, 
            SelectionGroup = v39, 
            ref = if l_GetFFlagSupportGamepadNavInVoiceModals_0() then v21 else nil
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 15), 
                PaddingBottom = UDim.new(0, 20), 
                PaddingLeft = UDim.new(0, 20), 
                PaddingRight = UDim.new(0, 20)
            }), 
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Icon = v2.createElement(v6.Core.ImageSet.ImageSetLabel, {
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = v18, 
                Size = UDim2.new(0, 55, 0, 55), 
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }), 
            TitleTextContainer = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, v26), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 7)
                }), 
                TitleText = v2.createElement(v6.App.Text.StyledTextLabel, {
                    fontStyle = v20.promptStyle.Font.Header1, 
                    colorStyle = v20.promptStyle.Theme.SystemPrimaryDefault, 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    size = UDim2.new(1, 0, 1, 0), 
                    text = v20.titleText
                })
            }), 
            Divider = v2.createElement("Frame", {
                BackgroundColor3 = v20.promptStyle.Theme.Divider.Color, 
                BackgroundTransparency = v20.promptStyle.Theme.Divider.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 0, 1)
            }), 
            DividerSpaceContainer = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 4, 
                Size = UDim2.new(1, 0, 0, 15)
            }), 
            BodyTextContainer = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 5, 
                Size = UDim2.new(1, 0, 0, v29)
            }, {
                BodyText = v2.createElement(v6.App.Text.StyledTextLabel, {
                    fontStyle = v20.promptStyle.Font.Body, 
                    colorStyle = v20.promptStyle.Theme.TextDefault, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    size = UDim2.new(1, 0, 1, 0), 
                    text = v20.bodyText, 
                    lineHeight = 1.2
                })
            }), 
            InfoTextContainer = if v22 then v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 6, 
                Size = UDim2.new(1, 0, 0, v33 + 20)
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v23 and 8 or 15), 
                    PaddingLeft = UDim.new(0, 8)
                }), 
                TextContainer = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, v33)
                }, {
                    InfoText = v2.createElement(v6.App.Text.StyledTextLabel, {
                        fontStyle = v20.promptStyle.Font.Body, 
                        colorStyle = v20.promptStyle.Theme.TextEmphasis, 
                        textXAlignment = Enum.TextXAlignment.Left, 
                        textYAlignment = Enum.TextYAlignment.Top, 
                        size = UDim2.new(1, 0, 1, 0), 
                        text = v22, 
                        lineHeight = 1.25
                    })
                })
            }) else nil, 
            SpaceContainer = if not v23 then v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 7, 
                Size = UDim2.new(1, 0, 0, v22 and 40 or 20)
            }) else nil, 
            PrimingTextContainer = if v23 then v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 8, 
                Size = UDim2.new(1, 0, 0, v30)
            }, {
                PrimingText = v2.createElement(v6.App.Text.StyledTextLabel, {
                    fontStyle = v20.promptStyle.Font.Body, 
                    colorStyle = v20.promptStyle.Theme.TextDefault, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Top, 
                    size = UDim2.new(1, 0, 1, 0), 
                    text = v23, 
                    lineHeight = 1.25
                })
            }) else nil, 
            SpaceContainerTemp = if v23 then v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 9, 
                Size = UDim2.new(1, 0, 0, 30)
            }) else nil, 
            ButtonContainer = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 10, 
                Size = UDim2.new(1, 0, 0, 36)
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, 12), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                SecondaryButton = if v20.settingsAppAvailable then v2.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.Secondary, 
                    layoutOrder = 1, 
                    size = UDim2.new(0.5, -5, 0, 36), 
                    text = v17, 
                    onActivated = v20.handleSecondaryActivated, 
                    Selectable = v39
                }) else nil, 
                ConfirmButton = v2.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    layoutOrder = 2, 
                    size = UDim2.new(v20.settingsAppAvailable and 0.5 or 1, -5, 0, 36), 
                    text = if v20.settingsAppAvailable then v15 else v16, 
                    onActivated = v20.handlePrimaryActivated, 
                    Selectable = v39
                })
            })
        })
    });
end;
if l_GetFFlagSupportGamepadNavInVoiceModals_0() then
    return (v2.forwardRef(v40));
else
    return v40;
end;