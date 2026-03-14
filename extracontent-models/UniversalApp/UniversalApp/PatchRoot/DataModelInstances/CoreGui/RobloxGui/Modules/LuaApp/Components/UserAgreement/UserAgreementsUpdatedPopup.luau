local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v6 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v7 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local v8 = require(l_Modules_0.LuaApp.Analytics.RobloxTelemetryConfigs.ToCPopupOccurance);
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local v10 = require(l_CorePackages_0.Packages.t);
local v11 = require(l_CorePackages_0.Packages.Cryo);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v13 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v14 = require(l_Modules_0.LuaApp.Thunks.CloseUserAgreementsUpdatedPopup);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_withStyle_0 = v9.Core.Style.withStyle;
local v17 = require(l_Modules_0.LuaApp.withLocalization);
local v18 = require(l_Modules_0.LuaApp.Http.Requests.AgreeUpdatedUserAgreements);
local v19 = require(l_Modules_0.LuaApp.Http.Requests.PromotionalEmailsPreference);
local v20 = require(l_CorePackages_0.Packages.FitFrame);
local v21 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local l_Checkbox_0 = v9.App.InputButton.Checkbox;
local l_Button_0 = v9.App.Button.Button;
local l_ButtonType_0 = v9.App.Button.Enum.ButtonType;
local l_UserAgreementsList_0 = require(l_CorePackages_0.Workspace.Packages.UserAgreements).UserAgreementsList;
local v26 = game:DefineFastFlag("UserAgreementsDefaultSelection", false);
game:DefineFastFlag("UserAgreementsPopupCloseFix", false);
local v27 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppPromotionalEmailsCheckboxEnabled);
local v28 = Rect.new(8, 8, 9, 9);
local v29 = v2.PureComponent:extend("UserAgreementsUpdatedPopup");
v29.validateProps = v10.strictInterface({
    agreements = v10.array(v10.strictInterface({
        id = v10.string, 
        agreementType = v10.string, 
        clientType = v10.string, 
        displayUrl = v10.string, 
        regulationType = v10.string
    })), 
    formFactor = v10.string, 
    screenSize = v10.Vector2, 
    networking = v10.callback, 
    closePopup = v10.callback, 
    defaultChildRef = v10.optional(v10.any), 
    focusController = v10.optional(v10.any), 
    containerWidth = v10.optional(v10.integer), 
    closeCentralOverlayThunk = v10.optional(v10.callback), 
    checkboxEnabled = v10.optional(v10.boolean), 
    optInByDefault = v10.optional(v10.boolean), 
    defaultFocusRef = if v26 then v10.callback else nil, 
    containerRef = if v26 then v10.callback else nil
});
v29.init = function(v30) --[[ Line: 100 ]] --[[ Name: init ]]
    -- upvalues: v27 (copy), v18 (copy), v19 (copy)
    if v27() then
        v30.state = {
            promoEmailsDisplayed = v30.props.checkboxEnabled, 
            promoEmailsChecked = v30.props.optInByDefault
        };
        v30.SetPromoEmailsCheckbox = function(v31) --[[ Line: 106 ]]
            -- upvalues: v30 (copy)
            v30:setState({
                promoEmailsChecked = v31
            });
        end;
        v30.SetPromoEmailsCheckboxByTextButton = function() --[[ Line: 111 ]]
            -- upvalues: v30 (copy)
            v30:setState({
                promoEmailsChecked = not v30.state.promoEmailsChecked
            });
        end;
    end;
    v30.agreeAndClosePopup = function() --[[ Line: 117 ]]
        -- upvalues: v30 (copy), v18 (ref), v27 (ref), v19 (ref)
        local l_networking_0 = v30.props.networking;
        local l_agreements_0 = v30.props.agreements;
        local l_closePopup_0 = v30.props.closePopup;
        v18(l_networking_0, l_agreements_0, function(_) --[[ Line: 121 ]]

        end);
        if v27() then
            local l_promoEmailsChecked_0 = v30.state.promoEmailsChecked;
            v19(l_networking_0, l_promoEmailsChecked_0);
        end;
        l_closePopup_0();
    end;
end;
v29.getLayoutInfo = function(_, v38, v39) --[[ Line: 132 ]] --[[ Name: getLayoutInfo ]]
    -- upvalues: v21 (copy), v28 (copy)
    if v38 then
        return v21, {
            Size = UDim2.new(0, 540, 0, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Image = "LuaApp/buttons/buttonFill", 
            ImageColor3 = v39.BackgroundUIDefault.Color, 
            BorderSizePixel = 0, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v28, 
            AutomaticSize = Enum.AutomaticSize.Y
        };
    else
        return "Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v39.BackgroundUIDefault.Color
        };
    end;
end;
v29.renderWithProviders = function(v40, v41, v42) --[[ Line: 159 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_FormFactor_0 (copy), v27 (copy), v7 (copy), v8 (copy), v2 (copy), v26 (copy), v20 (copy), l_UserAgreementsList_0 (copy), l_Checkbox_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local l_Font_0 = v42.Font;
    local l_Theme_0 = v42.Theme;
    local l_screenSize_0 = v40.props.screenSize;
    local l_formFactor_0 = v40.props.formFactor;
    local l_agreements_1 = v40.props.agreements;
    local v48 = l_formFactor_0 == l_FormFactor_0.WIDE;
    local v49, v50 = v40:getLayoutInfo(v48, l_Theme_0);
    local l_title_0 = v41.title;
    local l_message_0 = v41.message;
    local l_agreeButton_0 = v41.agreeButton;
    local v54 = if v27() then v41.checkbox else nil;
    v7.default:logRobloxTelemetryEvent(v8);
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_screenSize_0.Y), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        [v2.Ref] = if v26 then v40.props.containerRef else nil
    }, {
        Layout = v2.createElement(v49, v50, {
            ListLayout = v48 and v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Padding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v48 and 0 or 60), 
                PaddingBottom = UDim.new(0, v48 and 24 or 48)
            }), 
            Content = v2.createElement(v20.FitFrameVertical, {
                width = UDim.new(1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                Title = v2.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 48), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }, {
                    TitleText = v2.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, 28), 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1, 
                        Text = l_title_0, 
                        Font = l_Font_0.Header1.Font, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextWrapped = true
                    }), 
                    Divider = v2.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 1), 
                        AnchorPoint = Vector2.new(0, 0), 
                        BackgroundColor3 = l_Theme_0.Divider.Color, 
                        BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                        BorderSizePixel = 0
                    })
                }), 
                Message = v2.createElement("Frame", {
                    LayoutOrder = 2, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, v48 and 24 or 48), 
                        PaddingRight = UDim.new(0, 24), 
                        PaddingBottom = UDim.new(0, v48 and 12 or 48), 
                        PaddingLeft = UDim.new(0, 24)
                    }), 
                    MessageText = v2.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Text = l_message_0, 
                        Font = l_Font_0.Body.Font, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color, 
                        TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextWrapped = true
                    })
                }), 
                SecondDivider = v2.createElement("Frame", {
                    LayoutOrder = 3, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 0), 
                        PaddingRight = UDim.new(0, 24), 
                        PaddingBottom = UDim.new(0, 0), 
                        PaddingLeft = UDim.new(0, 24)
                    }), 
                    Divider = v2.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 1), 
                        AnchorPoint = Vector2.new(0, 0), 
                        BackgroundColor3 = l_Theme_0.Divider.Color, 
                        BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                        BorderSizePixel = 0
                    })
                }), 
                AgreementsList = v2.createElement(l_UserAgreementsList_0, {
                    LayoutOrder = 4, 
                    agreements = l_agreements_1, 
                    margin = v20.Rect.quad(0, 24, 24, 24)
                }), 
                PromotionalEmailsContainer = if v27() and v40.state.promoEmailsDisplayed then v2.createElement("Frame", {
                    LayoutOrder = 5, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 0), 
                        PaddingRight = UDim.new(0, 24), 
                        PaddingBottom = UDim.new(0, 48), 
                        PaddingLeft = UDim.new(0, 24)
                    }), 
                    CheckBox = v2.createElement(l_Checkbox_0, {
                        text = "", 
                        isSelected = v40.state.promoEmailsChecked, 
                        onActivated = v40.SetPromoEmailsCheckbox
                    }), 
                    MessageButton = v2.createElement("TextButton", {
                        Size = UDim2.new(1, -34, 1, 0), 
                        Position = UDim2.new(0, 34, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Text = v54, 
                        Font = l_Font_0.Body.Font, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color, 
                        TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        [v2.Event.Activated] = v40.SetPromoEmailsCheckboxByTextButton
                    })
                }) else nil
            }), 
            AgreeButton = v2.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.PrimarySystem, 
                size = UDim2.new(1, -48, 0, 48), 
                position = UDim2.new(0.5, 0, 1, -10), 
                anchorPoint = Vector2.new(0.5, 1), 
                layoutOrder = 2, 
                text = l_agreeButton_0, 
                fontStyle = l_Font_0.SubHeader1, 
                onActivated = v40.agreeAndClosePopup, 
                [v2.Ref] = if v26 then v40.props.defaultFocusRef else nil
            })
        })
    });
end;
v29.render = function(v55) --[[ Line: 335 ]] --[[ Name: render ]]
    -- upvalues: v17 (copy), v27 (copy), l_withStyle_0 (copy)
    return v17({
        title = "CommonUI.UserAgreements.Popup.Title", 
        message = "CommonUI.UserAgreements.Popup.Message", 
        agreeButton = "CommonUI.UserAgreements.Popup.Agree", 
        checkbox = v27() and "CommonUI.UserAgreements.Popup.PromotionalEmailsCheckbox" or nil
    })(function(v56) --[[ Line: 343 ]]
        -- upvalues: l_withStyle_0 (ref), v55 (copy)
        return l_withStyle_0(function(v57) --[[ Line: 344 ]]
            -- upvalues: v55 (ref), v56 (copy)
            return v55:renderWithProviders(v56, v57);
        end);
    end);
end;
v29 = v3.connect(function(v58) --[[ Line: 350 ]]
    return {
        screenSize = v58.ScreenSize, 
        formFactor = v58.FormFactor
    };
end, function(v59) --[[ Line: 355 ]]
    -- upvalues: v14 (copy), v13 (copy)
    return {
        closePopup = function() --[[ Line: 357 ]] --[[ Name: closePopup ]]
            -- upvalues: v59 (copy), v14 (ref), v13 (ref)
            if game:GetFastFlag("UserAgreementsPopupCloseFix") then
                v59(v14());
                return;
            else
                v59(v13());
                return;
            end;
        end
    };
end)(v29);
if v27() then
    v29 = l_RoactAppPolicy_0.connect(function(v60, _) --[[ Line: 368 ]]
        return {
            checkboxEnabled = v60.getPromotionalEmailsCheckboxEnabled(), 
            optInByDefault = v60.getPromotionalEmailsOptInByDefault()
        };
    end)(v29);
end;
v29 = l_RoactServices_0.connect({
    networking = v5
})(v29);
if v26 then
    return function(v62) --[[ Line: 381 ]]
        -- upvalues: v6 (copy), v2 (copy), v29 (ref), v11 (copy)
        local v63, v64 = v6.useDefaultFocusBehavior();
        return v2.createElement(v29, v11.Dictionary.join(v62, {
            defaultFocusRef = v63, 
            containerRef = v64
        }));
    end;
else
    return v29;
end;