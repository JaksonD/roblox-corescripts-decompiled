local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_0.Analytics.AnalyticsEvents);
local v4 = require(l_Parent_0.Analytics.EventConstants);
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local l_RoactRodux_0 = v1.RoactRodux;
local l_useLocalization_0 = v1.Localization.Hooks.useLocalization;
local l_FormFactor_0 = require(l_Parent_1.FormFactor).Enums.FormFactor;
local l_FitFrame_0 = v1.FitFrame;
local l_useDesignTokens_0 = v1.Style.useDesignTokens;
local l_CloseCentralOverlay_0 = v1.CentralOverlay.Thunks.CloseCentralOverlay;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_useState_0 = l_React_0.useState;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_Checkbox_0 = l_UIBlox_0.App.InputButton.Checkbox;
local l_IconButton_0 = l_UIBlox_0.App.Button.IconButton;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_UserAgreementsList_0 = v1.UserAgreements.UserAgreementsList;
local v23 = require(l_Parent_0.KISAComplianceUtils);
local v24 = Rect.new(8, 8, 9, 9);
return (l_RoactRodux_0.connect(function(v25) --[[ Line: 439 ]]
    return {
        screenSize = v25.ScreenSize, 
        formFactor = v25.FormFactor
    };
end, function(v26) --[[ Line: 444 ]]
    -- upvalues: l_CloseCentralOverlay_0 (copy)
    return {
        closeCentralOverlay = function() --[[ Line: 446 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v26 (copy), l_CloseCentralOverlay_0 (ref)
            return v26(l_CloseCentralOverlay_0());
        end
    };
end)(function(v27) --[[ Line: 54 ]]
    -- upvalues: l_useStyle_0 (copy), l_FormFactor_0 (copy), l_useDesignTokens_0 (copy), l_useLocalization_0 (copy), l_useState_0 (copy), v23 (copy), l_ImageSetLabel_0 (copy), v24 (copy), v4 (copy), v3 (copy), l_React_0 (copy), l_IconButton_0 (copy), l_Images_0 (copy), l_StyledTextLabel_0 (copy), l_Checkbox_0 (copy), l_UserAgreementsList_0 (copy), l_FitFrame_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    v27.isUnderAgeFlow = v27.isUnderAgeFlow or false;
    local l_screenSize_0 = v27.screenSize;
    local v29 = l_useStyle_0();
    local l_Theme_0 = v29.Theme;
    local l_Font_0 = v29.Font;
    local v32 = tostring(v27.formFactor) == tostring(l_FormFactor_0.WIDE);
    local v33 = l_useDesignTokens_0();
    local l_AuthCompliance_0 = v33.LuaApps.AuthCompliance;
    local v35 = l_useLocalization_0({
        title = "Authentication.OneTimePasscode.Label.ConsentNeeded", 
        message = "CommonUI.UserAgreements.Popup.KISAMessage", 
        agreeButton = "CommonUI.UserAgreements.Popup.Agree2", 
        checkbox = "CommonUI.UserAgreements.Popup.CheckboxMessage", 
        errorMessage = "CommonUI.UserAgreements.Popup.FailAndRetryMessage", 
        underAgeFlowTitle = "Authentication.OneTimePasscode.Label.ParentConsentNeeded", 
        underAgeFlowMessage = "Authentication.OneTimePasscode.Description.ReviewAndConsentToTerms"
    });
    local v36, v37 = l_useState_0({});
    local v38, v39 = l_useState_0({});
    if v27.agreements ~= v38 then
        v39(v27.agreements);
        local v40 = {};
        for _, v42 in pairs(v27.agreements) do
            v40[v42.id] = false;
        end;
        v37(v40);
    end;
    local v43, v44, v45 = v23.getCheckBoxStatusVariables(v36, v27.agreements);
    local v46 = not v43;
    local v49, v50 = (function(v47, v48) --[[ Line: 96 ]]
        -- upvalues: l_ImageSetLabel_0 (ref), v24 (ref)
        if v47 then
            return l_ImageSetLabel_0, {
                Size = UDim2.new(0, 540, 0, 0), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundColor3 = v48.BackgroundUIDefault.Color, 
                Image = "LuaApp/buttons/buttonFill", 
                ImageColor3 = v48.BackgroundUIDefault.Color, 
                BorderSizePixel = 0, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v24, 
                AutomaticSize = Enum.AutomaticSize.Y
            };
        else
            return "Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BorderSizePixel = 0, 
                BackgroundColor3 = v48.BackgroundUIDefault.Color
            };
        end;
    end)(v32, l_Theme_0);
    local function v56(v51) --[[ Line: 125 ]]
        -- upvalues: v4 (ref), v3 (ref), v36 (copy), v37 (copy)
        local v52 = if v51 then v4.btn.agreeAllCheckboxes else v4.btn.disagreeAllCheckboxes;
        v3.sendButtonClickEvent(v4.ctx.kisaAgreements, v4.origin.signup, v52);
        local v53 = {};
        for v54, _ in pairs(v36) do
            v53[v54] = v51;
        end;
        v37(v53);
    end;
    local function v61(v57, v58, v59) --[[ Line: 139 ]]
        -- upvalues: v4 (ref), v3 (ref), v37 (copy)
        local v60 = if v59 then v4.btn.checked else v4.btn.unchecked;
        v3.sendFormInteractionEvent(v4.ctx.kisaCheckbox, v58, v60);
        v37(v57);
    end;
    local function _(v62) --[[ Line: 145 ]]
        -- upvalues: v27 (copy)
        v27.onAgreeFunction(v62);
        v27.closeCentralOverlay();
    end;
    return l_React_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_screenSize_0.Y), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        Layout = l_React_0.createElement(v49, v50, {
            ListLayout = v32 and l_React_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Padding = l_React_0.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_AuthCompliance_0.paddingTop), 
                PaddingBottom = UDim.new(0, l_AuthCompliance_0.paddingBottom)
            }), 
            Content = l_React_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_screenSize_0.Y - 150), 
                LayoutOrder = 1, 
                BackgroundTransparency = 1
            }, {
                Layout = l_React_0.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Title = l_React_0.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }, {
                    AreaAboveFirstDivider = l_React_0.createElement("Frame", {
                        LayoutOrder = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1
                    }, {
                        ListLayout = l_React_0.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        Padding = l_React_0.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, l_AuthCompliance_0.paddingLeft)
                        }), 
                        CrossXButton = l_React_0.createElement(l_IconButton_0, {
                            layoutOrder = 1, 
                            anchorPoint = Vector2.new(0.5, 0.5), 
                            size = UDim2.new(0, tonumber(l_AuthCompliance_0.xButtonSize), 0, (tonumber(l_AuthCompliance_0.xButtonSize))), 
                            position = UDim2.new(0, 0, 0, 0), 
                            icon = l_Images_0["icons/navigation/close"], 
                            onActivated = function() --[[ Line: 212 ]] --[[ Name: onActivated ]]
                                -- upvalues: v27 (copy)
                                if v27.onAbandonFunction then
                                    v27.onAbandonFunction();
                                end;
                                v27.closeCentralOverlay();
                            end
                        }), 
                        TitleText = l_React_0.createElement(l_StyledTextLabel_0, {
                            layoutOrder = 2, 
                            size = UDim2.new(0.75, 0, 0, l_AuthCompliance_0.xButtonSize), 
                            text = if v27.isUnderAgeFlow then v35.underAgeFlowTitle else v35.title, 
                            fontStyle = l_Font_0.Header1, 
                            colorStyle = l_Theme_0.TextEmphasis, 
                            textXAlignment = Enum.TextXAlignment.Center, 
                            textYAlignment = Enum.TextYAlignment.Center, 
                            textTruncate = Enum.TextTruncate.AtEnd
                        })
                    }), 
                    FirstDivider = l_React_0.createElement("Frame", {
                        LayoutOrder = 2, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1
                    }, {
                        Padding = l_React_0.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, l_AuthCompliance_0.dividerPaddingTop), 
                            PaddingRight = UDim.new(0, l_AuthCompliance_0.paddingRight), 
                            PaddingLeft = UDim.new(0, l_AuthCompliance_0.paddingLeft)
                        }), 
                        Divider = l_React_0.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, 1), 
                            AnchorPoint = Vector2.new(0, 0), 
                            BackgroundColor3 = v33.Semantic.Color.Ui.Default.Color3, 
                            BorderSizePixel = 0
                        })
                    })
                }), 
                Message = l_React_0.createElement("Frame", {
                    LayoutOrder = 2, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, {
                    Padding = l_React_0.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, if v32 then l_AuthCompliance_0.messagePaddingTopWideViewExtended else l_AuthCompliance_0.messagePaddingTopExtended), 
                        PaddingRight = UDim.new(0, l_AuthCompliance_0.paddingRight), 
                        PaddingBottom = UDim.new(0, if v32 then l_AuthCompliance_0.messagePaddingBottomWideView else l_AuthCompliance_0.messagePaddingBottomReduced), 
                        PaddingLeft = UDim.new(0, l_AuthCompliance_0.paddingLeft)
                    }), 
                    MessageText = l_React_0.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Text = if v27.isUnderAgeFlow then v35.underAgeFlowMessage else v35.message, 
                        TextSize = l_AuthCompliance_0.messageSize, 
                        TextColor3 = v33.Semantic.Color.Text.Emphasis.Color3, 
                        TextTransparency = v29.Theme.TextDefault.Transparency, 
                        Font = v29.Font.Body.Font, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        TextWrapped = true, 
                        Size = UDim2.new(1, 0, 0, 0)
                    })
                }), 
                AgreementsContainer = l_React_0.createElement("Frame", {
                    LayoutOrder = 3, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, {
                    Padding = l_React_0.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 0), 
                        PaddingRight = UDim.new(0, l_AuthCompliance_0.paddingRight), 
                        PaddingBottom = UDim.new(0, l_AuthCompliance_0.checkboxPaddingBottom), 
                        PaddingLeft = UDim.new(0, l_AuthCompliance_0.paddingLeft)
                    }), 
                    CheckBox = l_React_0.createElement(l_Checkbox_0, {
                        text = "", 
                        isSelected = v45, 
                        onActivated = function() --[[ Line: 314 ]] --[[ Name: onActivated ]]
                            -- upvalues: v56 (copy), v45 (copy)
                            v56(not v45);
                        end
                    }), 
                    MessageButton = l_React_0.createElement("TextButton", {
                        Size = UDim2.new(1, -((tonumber(l_AuthCompliance_0.checkboxSize) or 0) + (tonumber(l_AuthCompliance_0.checkboxPadding) or 0)), 1, 0), 
                        Position = UDim2.new(0, (tonumber(l_AuthCompliance_0.checkboxSize) or 0) + (tonumber(l_AuthCompliance_0.checkboxPadding) or 0), 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Text = v35.checkbox, 
                        Font = l_Font_0.Body.Font, 
                        TextSize = l_AuthCompliance_0.messageSize, 
                        TextColor3 = l_Theme_0.TextMuted.Color, 
                        TextTransparency = l_Theme_0.TextMuted.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        [l_React_0.Event.Activated] = nil
                    })
                }), 
                SecondDivider = l_React_0.createElement("Frame", {
                    LayoutOrder = 4, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, {
                    Padding = l_React_0.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 0), 
                        PaddingRight = UDim.new(0, l_AuthCompliance_0.paddingRight), 
                        PaddingBottom = UDim.new(0, 0), 
                        PaddingLeft = UDim.new(0, l_AuthCompliance_0.paddingLeft)
                    }), 
                    Divider = l_React_0.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 1), 
                        AnchorPoint = Vector2.new(0, 0), 
                        BackgroundColor3 = v33.Semantic.Color.Ui.Default.Color3, 
                        BorderSizePixel = 0
                    })
                }), 
                AgreementsList = l_React_0.createElement(l_UserAgreementsList_0, {
                    LayoutOrder = 5, 
                    agreements = v27.agreements, 
                    checkBoxStates = v36, 
                    setCheckBoxStates = v61, 
                    separateRequiredOptional = v44, 
                    margin = l_FitFrame_0.Rect.quad(l_AuthCompliance_0.paddingTop, l_AuthCompliance_0.paddingRight, l_AuthCompliance_0.listPaddingBottom, l_AuthCompliance_0.paddingLeft), 
                    verticalSpaceOffset = 300, 
                    isAgreeAllChecked = v45, 
                    useScrollableFrame = true
                })
            }), 
            AgreeZone = l_React_0.createElement("Frame", {
                LayoutOrder = 2, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, 0, 1, -l_AuthCompliance_0.agreeButtonPaddingBottom), 
                AnchorPoint = Vector2.new(0.5, 1)
            }, {
                Padding = l_React_0.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 0), 
                    PaddingRight = UDim.new(0, l_AuthCompliance_0.paddingRight), 
                    PaddingBottom = UDim.new(0, l_AuthCompliance_0.agreeButtonPaddingBottom), 
                    PaddingLeft = UDim.new(0, l_AuthCompliance_0.paddingLeft)
                }); 
                l_React_0.createElement(l_FitFrame_0.FitFrameVertical, {
                    width = UDim.new(1, 0), 
                    BackgroundTransparency = 1
                }, {
                    ErrorLabel = nil, 
                    AgreeButton = l_React_0.createElement(l_Button_0, {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        size = UDim2.new(1, 0, 0, l_AuthCompliance_0.agreeButtonHeight), 
                        anchorPoint = Vector2.new(0, 0), 
                        isDisabled = v46, 
                        layoutOrder = 2, 
                        text = v35.agreeButton, 
                        fontStyle = l_Font_0.SubHeader1, 
                        onActivated = function() --[[ Line: 429 ]] --[[ Name: onActivated ]]
                            -- upvalues: v36 (copy), v27 (copy)
                            local l_v36_0 = v36;
                            v27.onAgreeFunction(l_v36_0);
                            v27.closeCentralOverlay();
                        end
                    })
                })
            })
        })
    });
end));