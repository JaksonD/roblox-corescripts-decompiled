local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v6 = require(l_CorePackages_0.Workspace.Packages.VoiceChat);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_Button_0 = v7.App.Button.Button;
local l_ButtonType_0 = v7.App.Button.Enum.ButtonType;
local l_Checkbox_0 = v7.App.InputButton.Checkbox;
local _ = v7.App.ImageSet.Images;
local v12 = require(script.Parent.Parent.Parent.InGameMenu.Resources.Assets);
local v13 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_GetFFlagSupportGamepadNavInVoiceModals_0 = v6.Flags.GetFFlagSupportGamepadNavInVoiceModals;
local l_GetFFlagDisablePVUpsellDataConsent_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagDisablePVUpsellDataConsent;
local v16 = v13:FormatByKey("Feature.SettingsHub.Action.TurnOn");
local v17 = v13:FormatByKey("Feature.SettingsHub.Action.NotNow");
local v18 = v13:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.SelectingTurnOn");
local v19 = v5.wrap(v4.strictInterface({
    titleText = v4.optional(v4.string), 
    bodyText = v4.optional(v4.string), 
    handlePrimaryActivated = v4.optional(v4.callback), 
    handleSecondaryActivated = v4.optional(v4.callback), 
    Analytics = v4.optional(v4.table), 
    showCheckbox = v4.optional(v4.boolean), 
    promptStyle = v4.optional(v4.table), 
    showPrompt = v4.optional(v4.boolean)
}));
local function v36(v20, v21) --[[ Line: 62 ]] --[[ Name: VoiceChatConsentModal ]]
    -- upvalues: v19 (copy), v3 (copy), l_TextService_0 (copy), v18 (copy), l_GetFFlagSupportGamepadNavInVoiceModals_0 (copy), v2 (copy), v7 (copy), v12 (copy), l_GetFFlagDisablePVUpsellDataConsent_0 (copy), l_Checkbox_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v17 (copy), v16 (copy)
    assert(v19(v20));
    local v22, v23 = v3.useState(false);
    local l_Font_0 = v20.promptStyle.Font.Header1.Font;
    local v25 = v20.promptStyle.Font.Header1.RelativeSize * v20.promptStyle.Font.BaseSize;
    local v26 = 20 + l_TextService_0:GetTextSize(v20.titleText, v25, l_Font_0, Vector2.new(325, 1e999)).Y;
    local l_Font_1 = v20.promptStyle.Font.Body.Font;
    local v28 = v20.promptStyle.Font.Body.RelativeSize * v20.promptStyle.Font.BaseSize;
    local v29 = 20 + l_TextService_0:GetTextSize(v20.bodyText, v28, l_Font_1, Vector2.new(325, 1e999)).Y;
    local l_Font_2 = v20.promptStyle.Font.CaptionHeader.Font;
    local v31 = v20.promptStyle.Font.CaptionHeader.RelativeSize * v20.promptStyle.Font.BaseSize;
    local v32 = 20 + l_TextService_0:GetTextSize(v18, v31, l_Font_2, Vector2.new(325, 1e999)).Y;
    local v33 = if l_GetFFlagSupportGamepadNavInVoiceModals_0() then Enum.SelectionBehavior.Stop else nil;
    local v34 = l_GetFFlagSupportGamepadNavInVoiceModals_0() and true or nil;
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
        DialogMainFrame = v2.createElement(v7.Core.ImageSet.ImageSetLabel, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Image = v12.Images.RoundedRect.Image, 
            ImageColor3 = v20.promptStyle.Theme.BackgroundUIDefault.Color, 
            ImageTransparency = v20.promptStyle.Theme.BackgroundUIDefault.Transparency, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            ScaleType = v12.Images.RoundedRect.ScaleType, 
            Size = UDim2.new(0, 365, 0, v26 + 1 + v29 + 14 + 36 + if not l_GetFFlagDisablePVUpsellDataConsent_0() then 60 + v32 else 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            SliceCenter = v12.Images.RoundedRect.SliceCenter, 
            SelectionBehaviorDown = v33, 
            SelectionBehaviorLeft = v33, 
            SelectionBehaviorRight = v33, 
            SelectionBehaviorUp = v33, 
            SelectionGroup = v34, 
            ref = if l_GetFFlagSupportGamepadNavInVoiceModals_0() then v21 else nil
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 10), 
                PaddingBottom = UDim.new(0, 20), 
                PaddingLeft = UDim.new(0, 20), 
                PaddingRight = UDim.new(0, 20)
            }), 
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            TitleTextContainer = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, v26), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                TitleText = v2.createElement(v7.App.Text.StyledTextLabel, {
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
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 1)
            }), 
            DividerSpaceContainer = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 0, 7)
            }), 
            BodyTextContainer = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 4, 
                Size = UDim2.new(1, 0, 0, v29)
            }, {
                BodyText = v2.createElement(v7.App.Text.StyledTextLabel, {
                    fontStyle = v20.promptStyle.Font.Body, 
                    colorStyle = v20.promptStyle.Theme.TextDefault, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    size = UDim2.new(1, 0, 1, 0), 
                    text = v20.bodyText, 
                    lineHeight = 1.2
                })
            }), 
            InfoTextContainer = if not l_GetFFlagDisablePVUpsellDataConsent_0() then v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 5, 
                Size = UDim2.new(1, 0, 0, v32 + 20)
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 15)
                }), 
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left
                }), 
                Checkbox = v20.showCheckbox and v2.createElement(l_Checkbox_0, {
                    text = "", 
                    isSelected = v22, 
                    isDisabled = false, 
                    onActivated = function(v35) --[[ Line: 217 ]] --[[ Name: onActivated ]]
                        -- upvalues: v23 (copy)
                        v23(v35);
                    end, 
                    layoutOrder = 1
                }), 
                TextContainer = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(v20.showCheckbox and 0.95 or 1, 0, 0, v32)
                }, {
                    Padding = v20.showCheckbox and v2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 10)
                    }), 
                    InfoText = v2.createElement(v7.App.Text.StyledTextLabel, {
                        fontStyle = v20.promptStyle.Font.CaptionHeader, 
                        colorStyle = v20.promptStyle.Theme.TextDefault, 
                        textXAlignment = Enum.TextXAlignment.Left, 
                        textYAlignment = Enum.TextYAlignment.Top, 
                        size = UDim2.new(1, 0, 1, 0), 
                        text = v18, 
                        lineHeight = 1.15
                    })
                })
            }) else nil, 
            SpaceContainer = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 6, 
                Size = UDim2.new(1, 0, 0, 10)
            }), 
            ButtonContainer = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 7, 
                Size = UDim2.new(1, 0, 0, 36), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, 12), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                SecondaryButton = v2.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.Secondary, 
                    layoutOrder = 1, 
                    size = UDim2.new(0.5, -5, 0, 36), 
                    text = v17, 
                    onActivated = v20.handleSecondaryActivated, 
                    Selectable = v34
                }), 
                ConfirmButton = v2.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    layoutOrder = 2, 
                    size = UDim2.new(0.5, -5, 0, 36), 
                    text = v16, 
                    isDisabled = v20.showCheckbox and not v22, 
                    onActivated = v20.handlePrimaryActivated, 
                    Selectable = v34
                })
            })
        })
    });
end;
if l_GetFFlagSupportGamepadNavInVoiceModals_0() then
    return (v3.forwardRef(v36));
else
    return v36;
end;