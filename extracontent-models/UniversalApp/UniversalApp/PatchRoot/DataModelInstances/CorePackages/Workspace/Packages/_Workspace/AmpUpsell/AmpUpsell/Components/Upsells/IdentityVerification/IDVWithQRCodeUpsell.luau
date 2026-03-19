local l_script_FirstAncestor_0 = script:FindFirstAncestor("AmpUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = require(l_script_FirstAncestor_0.Analytics.AnalyticsService);
local v6 = require(l_script_FirstAncestor_0.Analytics.sendButtonClickEvent);
local v7 = require(l_script_FirstAncestor_0.Common.AppScreens);
local l_PartialPageModal_0 = v2.App.Dialog.Modal.PartialPageModal;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_LinkButton_0 = v2.App.Button.LinkButton;
local v11 = require(script.Parent.DirectionsTile);
local l_StyledTextLabel_0 = v2.App.Text.StyledTextLabel;
local v13 = require(l_Parent_0.QRCodeDisplay);
local l_DisplayQRCode_0 = v13.DisplayQRCode;
local l_ECLevels_0 = v13.ECLevels;
local l_LoadingSpinner_0 = v2.App.Loading.LoadingSpinner;
local v17 = require(script.Parent.ProgressChecklist);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_idvWithQRCodeUpsellStrings_0 = require(l_script_FirstAncestor_0.Common.LocalizationStrings).idvWithQRCodeUpsellStrings;
return function(v20) --[[ Line: 39 ]] --[[ Name: IDVWithQRCodeUpsell ]]
    -- upvalues: l_useLocalization_0 (copy), l_idvWithQRCodeUpsellStrings_0 (copy), l_useStyle_0 (copy), v5 (copy), l_useSelector_0 (copy), v3 (copy), l_PartialPageModal_0 (copy), v6 (copy), v7 (copy), l_StyledTextLabel_0 (copy), v11 (copy), v17 (copy), l_DisplayQRCode_0 (copy), l_ECLevels_0 (copy), l_LoadingSpinner_0 (copy), l_LinkButton_0 (copy)
    local l_featureName_0 = v20.featureName;
    local l_qrCodeLink_0 = v20.qrCodeLink;
    local v23 = l_useLocalization_0(l_idvWithQRCodeUpsellStrings_0);
    local v24 = l_useStyle_0();
    local l_onClose_0 = v20.onClose;
    local l_openPrivacyPolicyLink_0 = v20.openPrivacyPolicyLink;
    local l_Font_0 = v24.Font.Body.Font;
    local l_BaseSize_0 = v24.Font.BaseSize;
    local l_Transparency_0 = v24.Theme.TextEmphasis.Transparency;
    local v30 = l_BaseSize_0 * v24.Font.CaptionBody.RelativeSize;
    local v31 = if v20.analyticsService then v20.analyticsService else v5.EventStream;
    local v32 = UDim2.fromOffset(153, 153);
    local l_latestStepCompleted_0 = v20.latestStepCompleted;
    local v34 = l_latestStepCompleted_0 > 0;
    local v36 = l_useSelector_0(function(v35) --[[ Line: 54 ]]
        return v35.ScreenSize;
    end);
    return v3.createElement(l_PartialPageModal_0, {
        title = v23.title, 
        screenSize = v36, 
        onCloseClicked = function() --[[ Line: 61 ]] --[[ Name: onCloseClicked ]]
            -- upvalues: v6 (ref), v31 (copy), v7 (ref), l_featureName_0 (copy), l_onClose_0 (copy)
            v6(v31, v7.IDVWithQRCodeUpsell, l_featureName_0, "CloseModal");
            l_onClose_0();
        end, 
        bottomPadding = 0
    }, {
        QRCodeViewFrame = v3.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1
        }, {
            UIPadding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 24), 
                PaddingBottom = UDim.new(0, 24)
            }), 
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 24)
            }), 
            HeaderText = v3.createElement(l_StyledTextLabel_0, {
                text = if v34 then v23.verifyInBrowser else v23.ageVerifyPrompt, 
                fontStyle = v24.Font.Header2, 
                colorStyle = v24.Theme.TextEmphasis, 
                size = UDim2.new(1, 0, 0, 0), 
                lineHeight = 1, 
                textTruncate = Enum.TextTruncate.AtEnd, 
                textXAlignment = Enum.TextXAlignment.Center, 
                textYAlignment = Enum.TextYAlignment.Center, 
                automaticSize = Enum.AutomaticSize.XY, 
                layoutOrder = 0
            }), 
            DirectionsFrame = if not v34 then v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 144), 
                BackgroundColor3 = v24.Theme.BackgroundContrast.Color, 
                BackgroundTransparency = 0, 
                LayoutOrder = 1
            }, {
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 8)
                }), 
                UIPadding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 12), 
                    PaddingBottom = UDim.new(0, 12), 
                    PaddingLeft = UDim.new(0, 12), 
                    PaddingRight = UDim.new(0, 12)
                }), 
                UIListLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 24)
                }), 
                IDDirection = v3.createElement(v11, {
                    imagePath = "icons/menu/document", 
                    headerText = v23.idDirectionsHeader, 
                    descriptionText = v23.idDirectionsBody, 
                    frameHeight = 48, 
                    layoutOrder = 1
                }), 
                PhoneDirection = v3.createElement(v11, {
                    imagePath = "icons/menu/mobile", 
                    headerText = v23.phoneDirectionsHeader, 
                    descriptionText = v23.phoneDirectionsBody, 
                    frameHeight = 48, 
                    layoutOrder = 2
                })
            }) else nil, 
            Checklist = if v34 then v3.createElement(v17, {
                entryHeight = 18, 
                layoutOrder = 1, 
                latestStepCompleted = l_latestStepCompleted_0
            }) else nil, 
            BeginText = if not v34 then v3.createElement(l_StyledTextLabel_0, {
                text = v23.beginText, 
                fontStyle = v24.Font.Header1, 
                colorStyle = v24.Theme.TextEmphasis, 
                size = UDim2.new(1, 0, 0, 0), 
                lineHeight = 1, 
                textTruncate = Enum.TextTruncate.AtEnd, 
                textXAlignment = Enum.TextXAlignment.Center, 
                textYAlignment = Enum.TextYAlignment.Center, 
                automaticSize = Enum.AutomaticSize.XY, 
                layoutOrder = 2
            }) else nil, 
            QRCodeWrapper = v3.createElement("Frame", {
                Size = v32, 
                BackgroundColor3 = Color3.fromHex("#FFFFFF"), 
                BackgroundTransparency = 0, 
                LayoutOrder = 3
            }, {
                QrCode = if l_qrCodeLink_0 ~= nil then v3.createElement(l_DisplayQRCode_0, {
                    ecLevel = l_ECLevels_0.EC_LEVEL_1, 
                    sideLength = 150, 
                    backgroundTransparency = 1, 
                    toEncode = l_qrCodeLink_0
                }) else v3.createElement(l_LoadingSpinner_0, {
                    size = UDim2.fromOffset(42, 42)
                }), 
                UIListLayout = v3.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 8)
                }), 
                UIPadding = v3.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 4), 
                    PaddingLeft = UDim.new(0, 4), 
                    PaddingRight = UDim.new(0, 4), 
                    PaddingTop = UDim.new(0, 4)
                })
            }), 
            DisclaimerFrame = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 100), 
                BackgroundTransparency = 1, 
                LayoutOrder = 4
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }), 
                Disclaimer = if not v34 then v3.createElement("TextLabel", {
                    Text = v23.disclaimer, 
                    Font = l_Font_0, 
                    TextSize = v30, 
                    TextColor3 = v24.Theme.TextDefault.Color, 
                    TextTransparency = l_Transparency_0, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextWrapped = true, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Size = UDim2.new(1, 0, 0, 24), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }) else nil, 
                PrivacyPolicy = if not v34 then v3.createElement(l_LinkButton_0, {
                    text = v23.privacyLinkText, 
                    layoutOrder = 2, 
                    fontStyle = "CaptionBody", 
                    underlineAlwaysEnabled = true, 
                    onActivated = function() --[[ Line: 223 ]] --[[ Name: onActivated ]]
                        -- upvalues: v6 (ref), v31 (copy), v7 (ref), l_featureName_0 (copy), l_openPrivacyPolicyLink_0 (copy)
                        v6(v31, v7.IDVWithQRCodeUpsell, l_featureName_0, "OpenPrivacyPolicy");
                        l_openPrivacyPolicyLink_0();
                    end
                }) else nil, 
                HavingTroubleInfoText = if v34 then v3.createElement(l_StyledTextLabel_0, {
                    text = v23.havingTroubleInfoText, 
                    size = UDim2.new(1, 0, 0.5, 0), 
                    fontStyle = v24.Font.CaptionBody, 
                    colorStyle = v24.Theme.TextEmphasis, 
                    lineHeight = 1, 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    layoutOrder = 1
                }) else nil, 
                DontCloseWindowDisclaimer = if v34 then v3.createElement(l_StyledTextLabel_0, {
                    text = v23.dontCloseWindowDisclaimer, 
                    fontStyle = v24.Font.CaptionBody, 
                    size = UDim2.new(1, 0, 0.5, 0), 
                    colorStyle = v24.Theme.TextEmphasis, 
                    lineHeight = 1, 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    layoutOrder = 2
                }) else nil
            })
        })
    });
end;