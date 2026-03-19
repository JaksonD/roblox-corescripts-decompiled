local l_IXPService_0 = game:GetService("IXPService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local l_Button_0 = v2.App.Button.Button;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_Images_0 = v2.App.ImageSet.Images;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local v8 = require(l_CorePackages_0.Packages.Roact);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local l_useEffect_0 = require(l_CorePackages_0.Packages.React).useEffect;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Thunks.NavigateDown;
local l_NavigateBack_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Thunks.NavigateBack;
local l_useUserExperiment_0 = require(l_CorePackages_0.Packages.RoactAppExperiment).useUserExperiment;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local l_SetHomePageUpsellCardVariation_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Actions.SetHomePageUpsellCardVariation;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v23 = require(l_Modules_0.LuaApp.Components.GenericTextButton);
local v24 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v25 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v26 = require(l_Modules_0.LuaApp.Thunks.Verification.OpenEmailUpsellModal);
local v27 = require(l_Modules_0.LuaApp.Thunks.Verification.OpenPhoneUpsellModal);
local v28 = require(l_Modules_0.LuaApp.Components.DiscoverabilityModal.useNavigateToDiscoverabilityModal);
local l_EntryPoints_0 = require(l_CorePackages_0.Workspace.Packages.DiscoverabilityModal).Analytics.EntryPoints;
local v30 = require(l_Modules_0.LuaApp.Enum.OptionalContactMethodUpsellTypes);
local v31 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableHomePageEmailUpsellCard);
local v32 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableUpdateAddPhoneDescriptionTextExperiment);
local v33 = require(l_Modules_0.LuaApp.Flags.GetFFlagRemovePhoneUpsellWebview);
local v34 = require(l_Modules_0.LuaApp.Flags.GetFFlagRemoveDiscoverabilityModal);
local v35 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableVoiceTrialUpsellCard);
local v36 = game:DefineFastFlag("FixBannerButtonSize", false);
local l_FFlagHomePhoneVerificationUpsellNewCopy_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagHomePhoneVerificationUpsellNewCopy;
local v38 = l_Images_0["icons/graphic/passcode_large"];
local v39 = l_Images_0["icons/controls/microphone"];
local v40 = if v35() then l_Images_0["icons/controls/headphone"] else nil;
local v41 = if v35() then game:DefineFastString("VoiceChatHelpUrl", "https://en.help.roblox.com/hc/en-us/articles/4405807645972-Voice-Chat") else nil;
local function v42() --[[ Line: 73 ]] --[[ Name: noOpt ]]

end;
return function(v43) --[[ Line: 87 ]] --[[ Name: HomePageUpsellCardWithIcon ]]
    -- upvalues: v30 (copy), v35 (copy), l_useRoactService_0 (copy), v24 (copy), l_useEffect_0 (copy), l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), l_useStyle_0 (copy), v34 (copy), v28 (copy), l_useLocalization_0 (copy), l_useSelector_0 (copy), l_useDispatch_0 (copy), l_SetHomePageUpsellCardVariation_0 (copy), v26 (copy), v27 (copy), v42 (copy), l_NavigateDown_0 (copy), l_NavigateBack_0 (copy), v25 (copy), l_IXPService_0 (copy), l_FFlagHomePhoneVerificationUpsellNewCopy_0 (copy), v32 (copy), v33 (copy), l_EntryPoints_0 (copy), l_AppPage_0 (copy), v38 (copy), v31 (copy), v39 (copy), v40 (copy), v41 (copy), l_FormFactor_0 (copy), l_Text_0 (copy), v8 (copy), l_ImageSetLabel_0 (copy), v23 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v36 (copy)
    local v44 = "phone";
    local v45 = "";
    local v46 = nil;
    local v47 = nil;
    if v43.upsellCardVariation then
        v45 = v43.upsellCardVariation.upsellCardType;
        if v43.upsellCardVariation.titleTextOverride ~= "" and v43.upsellCardVariation.bodyTextOverride ~= "" then
            v46 = v43.upsellCardVariation.titleTextOverride;
            v47 = v43.upsellCardVariation.bodyTextOverride;
        end;
    end;
    if v45 == v30.ContactMethodPhoneNumberEmailHorizontalLayout or v45 == v30.ContactMethodPhoneNumberEmailVerticalLayout then
        v44 = "emailOrPhone";
    elseif v35() and v45 == v30.VoiceWithoutPvTrial then
        v44 = "voiceTrial";
    end;
    local v48 = l_useRoactService_0(v24);
    l_useEffect_0(function() --[[ Line: 114 ]]
        -- upvalues: v48 (copy), v44 (ref)
        v48.reportModalShownWithSection("verificationUpsell", "homepage", v44);
    end, {});
    local v51, v52 = l_useUserExperiment_0({
        l_AppUserLayers_0.PhoneVerificationEntryLayer
    }, function(v49) --[[ Line: 120 ]]
        -- upvalues: l_AppUserLayers_0 (ref)
        local v50 = v49[l_AppUserLayers_0.PhoneVerificationEntryLayer] or {};
        return v50.ShouldUseLuaPhoneVerificationFlow, v50.ShouldUseUpdatedPhoneVerificationText;
    end);
    local v53 = l_useStyle_0();
    local v54 = if v34() then nil else v28();
    local v55 = l_useLocalization_0({
        addButtonText = "Feature.ContactMethodUpsell.Action.AddPhoneNumber", 
        bodyText = "Feature.ContactMethodUpsell.Label.RecoverYourAccount", 
        titleText = "Feature.ContactMethodUpsell.Title.HomePageUpsellCardLockOutTitle", 
        addEmailInstead = "Feature.ContactUpsell.Action.AddEmailInstead", 
        addPhone = "Feature.ContactMethodUpsell.Label.AddPhone", 
        addEmail = "Feature.ContactMethodUpsell.Label.AddEmail", 
        continueButton = v35() and "Feature.ContactMethodUpsell.Action.Continue" or nil, 
        learnMore = v35() and "Feature.ContactMethodUpsell.Action.LearnMore" or nil
    });
    local v57 = l_useSelector_0(function(v56) --[[ Line: 148 ]]
        return v56.FormFactor;
    end);
    local v58 = l_useDispatch_0();
    local function v59() --[[ Line: 154 ]]
        -- upvalues: v58 (copy), l_SetHomePageUpsellCardVariation_0 (ref)
        return v58(l_SetHomePageUpsellCardVariation_0("", "", ""));
    end;
    local function _(v60) --[[ Line: 158 ]]
        -- upvalues: v58 (copy), v26 (ref)
        return v58(v26({
            successCallback = v60, 
            addEmailOver13TextKey = "Feature.ContactMethodUpsell.Label.PleaseAddEmail", 
            addEmailTitleKey = "Feature.AccountSecurityPrompt.Action.AbortDismissForeverAddEmail", 
            isEmailModalCalledFromHomePage = true, 
            eventContext = "verificationUpsell", 
            origin = "homepage", 
            section = "addEmail"
        }));
    end;
    local function _(v62, v63, v64) --[[ Line: 170 ]]
        -- upvalues: v58 (copy), v27 (ref), v42 (ref)
        return v58(v27({
            onSuccess = v62, 
            onCancelled = v42, 
            onAbandoned = v42, 
            eventContext = "verificationUpsell", 
            origin = "homepage", 
            shouldAutofillAndroidPhoneNumberAtLaunch = true, 
            addPhoneDescriptionKey = v63
        }, v64));
    end;
    local function _(v66) --[[ Line: 182 ]]
        -- upvalues: v58 (copy), l_NavigateDown_0 (ref)
        v58(l_NavigateDown_0(v66));
    end;
    local v68 = v35() and function() --[[ Line: 187 ]]
        -- upvalues: v58 (copy), l_NavigateBack_0 (ref)
        v58(l_NavigateBack_0());
    end or nil;
    local l_Theme_0 = v53.Theme;
    local l_Color_0 = l_Theme_0.TextEmphasis.Color;
    local l_Font_0 = v53.Font;
    local l_Font_1 = l_Font_0.Header2.Font;
    local v73 = v53.Font.BaseSize * v53.Font.Header2.RelativeSize;
    local l_Color_1 = l_Theme_0.TextDefault.Color;
    local l_Font_2 = l_Font_0.CaptionBody.Font;
    local v76 = v53.Font.BaseSize * v53.Font.CaptionBody.RelativeSize;
    local l_Top_0 = Enum.VerticalAlignment.Top;
    local l_Horizontal_0 = Enum.FillDirection.Horizontal;
    local v79 = 10;
    local v80 = 1;
    local v81 = 2;
    local function v83() --[[ Line: 206 ]]
        -- upvalues: v48 (copy), v25 (ref), v44 (ref), v59 (copy), v58 (copy), v26 (ref)
        v48.reportButtonClickedWithSectionAndOrigin(v25.Context.HomepageUpsellCard, v25.Button.Email, v44, "homepage");
        local _ = v58(v26({
            successCallback = v59, 
            addEmailOver13TextKey = "Feature.ContactMethodUpsell.Label.PleaseAddEmail", 
            addEmailTitleKey = "Feature.AccountSecurityPrompt.Action.AbortDismissForeverAddEmail", 
            isEmailModalCalledFromHomePage = true, 
            eventContext = "verificationUpsell", 
            origin = "homepage", 
            section = "addEmail"
        }));
    end;
    local v84 = "Feature.VerificationUpsell.Description.VerificationCodeSmsFeesMayApply";
    local function v97() --[[ Line: 218 ]]
        -- upvalues: v48 (copy), v25 (ref), v44 (ref), l_IXPService_0 (ref), l_AppUserLayers_0 (ref), l_FFlagHomePhoneVerificationUpsellNewCopy_0 (ref), v84 (ref), v32 (ref), v52 (copy), v45 (ref), v30 (ref), v33 (ref), v34 (ref), v58 (copy), l_SetHomePageUpsellCardVariation_0 (ref), v54 (copy), v42 (ref), l_EntryPoints_0 (ref), v27 (ref), v51 (copy), l_AppPage_0 (ref), v59 (copy), l_NavigateDown_0 (ref)
        v48.reportButtonClickedWithSectionAndOrigin(v25.Context.HomepageUpsellCard, v25.Button.Phone, v44, "homepage");
        l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.PhoneVerificationEntryLayer);
        if l_FFlagHomePhoneVerificationUpsellNewCopy_0 then
            v84 = "Feature.AccountSettings.Description.AddPhoneNumber";
        elseif v32() and v52 then
            v84 = "Feature.VerificationUpsell.Description.AddPhoneBody";
        end;
        local v85 = nil;
        if v45 == v30.ContactMethodPhoneNumberVoiceOptIn then
            v85 = true;
        end;
        if v33() then
            local function v88() --[[ Line: 239 ]]
                -- upvalues: v34 (ref), v58 (ref), l_SetHomePageUpsellCardVariation_0 (ref), v54 (ref), v42 (ref), l_EntryPoints_0 (ref)
                if v34() then
                    local _ = v58(l_SetHomePageUpsellCardVariation_0("", "", ""));
                    return;
                else
                    local _ = v58(l_SetHomePageUpsellCardVariation_0("", "", ""));
                    v54({
                        isStandaloneDiscoverabilityModal = true, 
                        navigateOnActivated = v42, 
                        entryPoint = l_EntryPoints_0.HomePage
                    });
                    return;
                end;
            end;
            local l_v84_0 = v84;
            local _ = v58(v27({
                onSuccess = v88, 
                onCancelled = v42, 
                onAbandoned = v42, 
                eventContext = "verificationUpsell", 
                origin = "homepage", 
                shouldAutofillAndroidPhoneNumberAtLaunch = true, 
                addPhoneDescriptionKey = l_v84_0
            }, v85));
            return;
        elseif v51 then
            local function v93() --[[ Line: 253 ]]
                -- upvalues: v34 (ref), v58 (ref), l_SetHomePageUpsellCardVariation_0 (ref), v54 (ref), v42 (ref), l_EntryPoints_0 (ref)
                if v34() then
                    local _ = v58(l_SetHomePageUpsellCardVariation_0("", "", ""));
                    return;
                else
                    local _ = v58(l_SetHomePageUpsellCardVariation_0("", "", ""));
                    v54({
                        isStandaloneDiscoverabilityModal = true, 
                        navigateOnActivated = v42, 
                        entryPoint = l_EntryPoints_0.HomePage
                    });
                    return;
                end;
            end;
            local l_v84_1 = v84;
            local _ = v58(v27({
                onSuccess = v93, 
                onCancelled = v42, 
                onAbandoned = v42, 
                eventContext = "verificationUpsell", 
                origin = "homepage", 
                shouldAutofillAndroidPhoneNumberAtLaunch = true, 
                addPhoneDescriptionKey = l_v84_1
            }, v85));
            return;
        else
            local v96 = {
                name = l_AppPage_0.PhoneVerification, 
                extraProps = {
                    onSuccessCallback = v59
                }
            };
            v58(l_NavigateDown_0(v96));
            return;
        end;
    end;
    local v98 = if v35() then v38 else nil;
    local v99 = nil;
    local v100 = if v35 then v42 else nil;
    local v101 = nil;
    local v102 = if v35 then v42 else nil;
    if v35() then
        if v31() and v30.ContactMethodEmail == v45 then
            v98 = v38;
            v99 = v55.addEmail;
            v100 = v83;
        elseif v30.ContactMethodPhoneNumber == v45 then
            v98 = v38;
            v99 = v55.addButtonText;
            v100 = v97;
        elseif v30.ContactMethodPhoneNumberEmailHorizontalLayout == v45 then
            v98 = v38;
            v99 = v55.addPhone;
            v100 = v97;
            v101 = v55.addEmail;
            v102 = v83;
        elseif v30.ContactMethodPhoneNumberEmailVerticalLayout == v45 then
            v98 = v38;
            v99 = v55.addButtonText;
            v100 = v97;
            v101 = v55.addEmailInstead;
            v102 = v83;
        elseif v30.ContactMethodPhoneNumberVoiceOptIn == v45 then
            v98 = v39;
            v99 = v55.addButtonText;
            v100 = v97;
        elseif v30.VoiceWithoutPvTrial == v45 then
            v98 = v40;
            v99 = v55.continueButton;
            v100 = function() --[[ Line: 316 ]]
                -- upvalues: l_AppPage_0 (ref), v45 (ref), v68 (copy), v58 (copy), l_SetHomePageUpsellCardVariation_0 (ref), l_NavigateDown_0 (ref)
                local v104 = {
                    name = l_AppPage_0.VoiceTrialUpsell, 
                    extraProps = {
                        upsellCardType = v45, 
                        onClose = v68, 
                        onCompletion = function() --[[ Line: 322 ]] --[[ Name: onCompletion ]]
                            -- upvalues: v58 (ref), l_SetHomePageUpsellCardVariation_0 (ref)
                            local _ = v58(l_SetHomePageUpsellCardVariation_0("", "", ""));
                        end
                    }
                };
                v58(l_NavigateDown_0(v104));
            end;
            v101 = v55.learnMore;
            v102 = function() --[[ Line: 329 ]]
                -- upvalues: l_AppPage_0 (ref), v41 (ref), v58 (copy), l_NavigateDown_0 (ref)
                local v105 = {
                    name = l_AppPage_0.GenericWebPage, 
                    detail = v41, 
                    extraProps = {}
                };
                v58(l_NavigateDown_0(v105));
            end;
        end;
    end;
    local v106 = UDim2.new(1, 0, 0, 0);
    local v107 = UDim2.new(1, 0, 0, 28);
    local v108 = UDim2.new(0.5, 0, 0, 28);
    local v109 = 12;
    local v110 = 12;
    local l_Vertical_0 = Enum.FillDirection.Vertical;
    local v112 = UDim2.new(1, -25, 0, 0);
    local v113 = if v31() then v55.addEmail else nil;
    if v57 == l_FormFactor_0.WIDE then
        v109 = 12;
        l_Vertical_0 = Enum.FillDirection.Horizontal;
        v108 = UDim2.new(1, 0, 0, 28);
        v110 = 20;
        l_Top_0 = Enum.VerticalAlignment.Center;
        l_Horizontal_0 = Enum.FillDirection.Vertical;
        v79 = 0;
        v80 = 2;
        v81 = 1;
        v55.addEmail = v55.addEmailInstead;
        v55.addPhone = v55.addButtonText;
        v106 = UDim2.new(1, -l_Text_0.GetTextWidth(v55.addButtonText, v53.Font.CaptionHeader.Font, v53.Font.BaseSize * v53.Font.CaptionHeader.RelativeSize) - 30, 0, 0);
        v107 = UDim2.new(0, l_Text_0.GetTextWidth(v55.addButtonText, v53.Font.CaptionHeader.Font, v53.Font.BaseSize * v53.Font.CaptionHeader.RelativeSize) + 15, 0, 28);
    end;
    local v114;
    if not v35() or v45 ~= nil and v45 ~= "" then
        v114 = v8.createElement;
        local v115 = "Frame";
        local v116 = {
            Position = if v43.isCentered then UDim2.new(0.5, 0, 0, 0) else nil, 
            AnchorPoint = if v43.isCentered then Vector2.new(0.5, 0) else nil, 
            Size = UDim2.new(1, 0, 0, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 0, 
            BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
            AutomaticSize = Enum.AutomaticSize.Y
        };
        local v117 = {
            UISizeConstraint = v8.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(800, 1e999)
            }), 
            Layout = v8.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = l_Vertical_0, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, v109)
            }), 
            UICorner = v8.createElement("UICorner", {
                CornerRadius = UDim.new(0, 12)
            }), 
            UIStroke = v8.createElement("UIStroke", {
                Thickness = 1, 
                Color = l_Theme_0.SystemPrimaryDefault.Color, 
                Transparency = 0.7
            }), 
            UIPadding = v8.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 12), 
                PaddingRight = UDim.new(0, v110), 
                PaddingTop = UDim.new(0, 12), 
                PaddingBottom = UDim.new(0, 12)
            }), 
            IconAndTextFrame = v8.createElement("Frame", {
                Size = v106, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                HorizontalLayout = v8.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = l_Top_0
                }), 
                ImageIcon = v8.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(1, 0.5), 
                    Size = UDim2.new(0, 40, 0, 40), 
                    Position = UDim2.new(1, 0, 0.5, 0), 
                    Image = if v35() then v98 else if v30.ContactMethodPhoneNumberVoiceOptIn == v45 then v39 else v38, 
                    ImageColor3 = v53.Theme.SystemPrimaryDefault.Color, 
                    ImageTransparency = v53.Theme.SystemPrimaryDefault.Transparency, 
                    BackgroundTransparency = 1
                }), 
                TextFrame = v8.createElement("Frame", {
                    Size = v112, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2, 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    VerticalLayout = v8.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, 4)
                    }), 
                    UIPadding = v8.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 12)
                    }), 
                    TitleTextLabel = v8.createElement("TextLabel", {
                        Size = v112, 
                        LayoutOrder = 1, 
                        Font = l_Font_1, 
                        BorderSizePixel = 0, 
                        Text = v46 or v55.titleText, 
                        TextColor3 = l_Color_0, 
                        TextSize = v73, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        BackgroundTransparency = 0, 
                        BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }), 
                    BodyTextLabel = v8.createElement("TextLabel", {
                        Size = v112, 
                        LayoutOrder = 2, 
                        Font = l_Font_2, 
                        BorderSizePixel = 0, 
                        Text = v47 or v55.bodyText, 
                        TextColor3 = l_Color_1, 
                        TextSize = v76, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        BackgroundTransparency = 0, 
                        BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    })
                })
            }), 
            FirstVariantFrame = not v35() and v30.ContactMethodPhoneNumberEmailHorizontalLayout == v45 and v8.createElement("Frame", {
                Size = v107, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                OrientationLayout = v8.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = l_Horizontal_0, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 10)
                }), 
                UIPadding = v8.createElement("UIPadding", {
                    PaddingRight = UDim.new(0, v79)
                }), 
                HorizontalCallToActionButton = v8.createElement(v23, {
                    Size = v108, 
                    BackgroundTransparency = 0, 
                    Text = v55.addEmail, 
                    LayoutOrder = v80, 
                    Font = v53.Font.CaptionHeader.Font, 
                    TextSize = v53.Font.BaseSize * v53.Font.CaptionHeader.RelativeSize, 
                    onActivated = v83, 
                    BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                    themeSettings = {
                        Color = l_Theme_0.SystemPrimaryContent.Color, 
                        Transparency = l_Theme_0.SystemPrimaryContent.Transparency, 
                        OnPressTransparency = 0.5, 
                        DisabledTransparency = 0.5, 
                        Text = {
                            Color = l_Theme_0.SystemPrimaryDefault.Color, 
                            Transparency = l_Theme_0.SystemPrimaryDefault.Transparency
                        }, 
                        Border = {
                            Hidden = false, 
                            Transparency = 0, 
                            Color = l_Theme_0.SystemPrimaryDefault.Color
                        }
                    }
                }), 
                SecondHorizontalCallToActionButton = v8.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    size = v108, 
                    text = v55.addPhone, 
                    layoutOrder = v81, 
                    fontStyle = "CaptionHeader", 
                    onActivated = v97
                })
            })
        };
        local v118 = not v35();
        if v118 then
            v118 = if v31() then v30.ContactMethodPhoneNumberEmailHorizontalLayout ~= v45 and v30.ContactMethodEmail ~= v45 else v30.ContactMethodPhoneNumberEmailHorizontalLayout ~= v45;
            if v118 then
                v118 = v8.createElement;
                local v119 = "Frame";
                local v120 = {
                    Size = v107, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2, 
                    AutomaticSize = Enum.AutomaticSize.Y
                };
                local v121 = {
                    VerticalLayout = v8.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, 10)
                    }), 
                    CallToActionButton = v8.createElement(l_Button_0, {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        size = v107, 
                        text = v55.addButtonText, 
                        layoutOrder = 1, 
                        fontStyle = "CaptionHeader", 
                        onActivated = v97
                    })
                };
                local v122 = false;
                if v30.ContactMethodPhoneNumberEmailVerticalLayout == v45 then
                    v122 = v8.createElement(v23, {
                        Size = v107, 
                        BackgroundTransparency = 0, 
                        Text = v55.addEmailInstead, 
                        LayoutOrder = 2, 
                        Font = v53.Font.CaptionHeader.Font, 
                        TextSize = v53.Font.BaseSize * v53.Font.CaptionHeader.RelativeSize, 
                        onActivated = v83, 
                        BackgroundColor3 = l_Theme_0.BackgroundOnHover.Color, 
                        themeSettings = {
                            Color = l_Theme_0.SystemPrimaryContent.Color, 
                            Transparency = l_Theme_0.SystemPrimaryContent.Transparency, 
                            OnPressTransparency = 0.5, 
                            DisabledTransparency = 0.5, 
                            Text = {
                                Color = l_Theme_0.SystemPrimaryDefault.Color, 
                                Transparency = l_Theme_0.SystemPrimaryDefault.Transparency
                            }, 
                            Border = {
                                Hidden = false, 
                                Transparency = 1
                            }
                        }
                    });
                end;
                v121.SecondVerticalCallToActionButton = v122;
                v118 = v118(v119, v120, v121);
            end;
        end;
        v117.SecondVariantFrame = v118;
        v117.EmailVariantFrame = not v35() and v31() and v30.ContactMethodEmail == v45 and v8.createElement("Frame", {
            Size = v107, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            OrientationLayout = v8.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = l_Horizontal_0, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 10)
            }), 
            UIPadding = v8.createElement("UIPadding", {
                PaddingRight = UDim.new(0, v79)
            }), 
            HorizontalCallToActionButton = v8.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.PrimarySystem, 
                size = v107, 
                text = v113, 
                layoutOrder = 1, 
                fontStyle = "CaptionHeader", 
                onActivated = v83
            })
        });
        v117.ButtonsFrame = if v35() then v8.createElement("Frame", {
            Size = v107, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            UIPadding = v8.createElement("UIPadding", {
                PaddingRight = UDim.new(0, v79)
            }), 
            VerticalLayout = v8.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = l_Horizontal_0, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 10)
            }), 
            CallToActionButton = if v99 ~= nil and v99 ~= "" then v8.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.PrimarySystem, 
                size = if v36 and (not (v101 ~= nil) or v101 == "") then v107 else v108, 
                text = v99, 
                layoutOrder = v81, 
                fontStyle = "CaptionHeader", 
                onActivated = v100
            }) else nil, 
            SecondaryButton = if v101 ~= nil and v101 ~= "" then v8.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.Secondary, 
                size = v108, 
                text = v101, 
                layoutOrder = v80, 
                fontStyle = "CaptionHeader", 
                onActivated = v102
            }) else nil
        }) else nil;
        v114 = v114(v115, v116, v117);
    else
        v114 = nil;
    end;
    return v114;
end;