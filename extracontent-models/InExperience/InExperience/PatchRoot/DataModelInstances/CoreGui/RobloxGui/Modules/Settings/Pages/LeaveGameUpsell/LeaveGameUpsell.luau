local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v7 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v8 = require(l_CorePackages_0.Packages.Roact);
local v9 = require(l_CorePackages_0.Packages.React);
local v10 = require(l_CorePackages_0.Packages.UIBlox);
local l_StyledTextLabel_0 = v10.App.Text.StyledTextLabel;
local l_Button_0 = v10.App.Button.Button;
local l_ButtonStack_0 = v10.App.Button.ButtonStack;
local l_ButtonType_0 = v10.App.Button.Enum.ButtonType;
local l_useStyle_0 = v10.Core.Style.useStyle;
local l_PhoneLegalDisclaimer_0 = require(l_CorePackages_0.Workspace.Packages.PhoneUpsell).PhoneLegalDisclaimer;
local l_InExperienceProviderContainer_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceContainer).InExperienceProviderContainer;
local l_PostPhoneUpsellDisplayed_0 = require(l_CorePackages_0.Workspace.Packages.PhoneUpsell).Http.Requests.PostPhoneUpsellDisplayed;
local l_PhoneUpsellController_0 = require(l_CorePackages_0.Workspace.Packages.PhoneUpsell).PhoneUpsellController;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.PhoneUpsell).Constants;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_useInputType_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useInputType;
local l_InputTypeConstants_0 = require(l_CorePackages_0.Workspace.Packages.InputType).InputTypeConstants;
local l_useEventConnection_0 = require(l_CorePackages_0.Packages.ReactUtils).useEventConnection;
local l_getPlatformTarget_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).getPlatformTarget;
local l_EventStreamConstants_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).EventStreamConstants;
local v30 = require(l_RobloxGui_0.Modules.Settings.leaveGame);
local l_GetFFlagDisablePVUpsellDataConsent_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagDisablePVUpsellDataConsent;
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local l_GetFFlagAddMorePhoneUpsellEvents_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAddMorePhoneUpsellEvents;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local l_Constants_1 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v35 = {
    Incomplete = "Incomplete", 
    Completed = "Completed", 
    CompletedAndClosed = "CompletedAndClosed"
};
local v36 = nil;
v36 = (function() --[[ Line: 63 ]] --[[ Name: Initialize ]]
    -- upvalues: l_RobloxGui_0 (copy), l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy), l_Constants_1 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v7 (copy), l_useAppPolicy_0 (copy), v9 (copy), l_StyledTextLabel_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_GetFFlagAddMorePhoneUpsellEvents_0 (copy), l_getPlatformTarget_0 (copy), l_EventStreamConstants_0 (copy), l_PhoneUpsellController_0 (copy), l_default_0 (copy), l_GetFFlagDisablePVUpsellDataConsent_0 (copy), l_PhoneLegalDisclaimer_0 (copy), l_Constants_0 (copy), v35 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useInputType_0 (copy), l_InputTypeConstants_0 (copy), l_GuiService_0 (copy), l_ContextActionService_0 (copy), l_PostPhoneUpsellDisplayed_0 (copy), l_useEventConnection_0 (copy), l_ButtonStack_0 (copy), v30 (copy), l_InExperienceProviderContainer_0 (copy), v8 (copy)
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    l_NewPage_0.playsessionid = "";
    if l_game_EngineFeature_0 then
        l_NewPage_0.playsessionid = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    l_NewPage_0.DontLeaveFunc = function(v38) --[[ Line: 72 ]]
        -- upvalues: l_NewPage_0 (copy), l_RbxAnalyticsService_0 (ref), l_Constants_1 (ref)
        if l_NewPage_0.HubRef then
            l_NewPage_0.HubRef:PopMenu(v38, true);
        end;
        l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_1.AnalyticsTargetName, l_Constants_1.AnalyticsInGameMenuName, l_Constants_1.AnalyticsLeaveGameName, {
            confirmed = l_Constants_1.AnalyticsCancelledName, 
            universeid = tostring(game.GameId), 
            source = l_Constants_1.AnalyticsLeaveGameSource, 
            playsessionid = l_NewPage_0.playsessionid
        });
    end;
    l_NewPage_0.DontLeaveFromHotkey = function(_, v40, v41) --[[ Line: 89 ]]
        -- upvalues: l_NewPage_0 (copy)
        if v40 == Enum.UserInputState.Begin then
            local v42 = true;
            if v41.UserInputType ~= Enum.UserInputType.Gamepad1 then
                v42 = true;
                if v41.UserInputType ~= Enum.UserInputType.Gamepad2 then
                    v42 = true;
                    if v41.UserInputType ~= Enum.UserInputType.Gamepad3 then
                        v42 = v41.UserInputType == Enum.UserInputType.Gamepad4;
                    end;
                end;
            end;
            l_NewPage_0.DontLeaveFunc(v42);
        end;
    end;
    l_NewPage_0.DontLeaveFromButton = function(v43) --[[ Line: 99 ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0.DontLeaveFunc(v43);
    end;
    l_NewPage_0.TabHeader = nil;
    l_NewPage_0.Page.Name = "LeaveGameUpsellPage";
    l_NewPage_0.ShouldShowBottomBar = false;
    l_NewPage_0.ShouldShowHubBar = false;
    l_NewPage_0.DisableTopPadding = true;
    l_NewPage_0.UpsellComponent = function(v44) --[[ Line: 112 ]]
        -- upvalues: l_NewPage_0 (copy), l_useStyle_0 (ref), l_useLocalization_0 (ref), v7 (ref), l_useAppPolicy_0 (ref), v9 (ref), l_StyledTextLabel_0 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), l_GetFFlagAddMorePhoneUpsellEvents_0 (ref), l_RbxAnalyticsService_0 (ref), l_getPlatformTarget_0 (ref), l_EventStreamConstants_0 (ref), l_PhoneUpsellController_0 (ref), l_default_0 (ref), l_GetFFlagDisablePVUpsellDataConsent_0 (ref), l_PhoneLegalDisclaimer_0 (ref), l_Constants_0 (ref)
        local l_upsellType_0 = l_NewPage_0.upsellType;
        local v46 = l_useStyle_0();
        local v47 = l_useLocalization_0({
            headerKey = l_upsellType_0 == v7.PHONE_UPSELL_VALUE_PROP.VoiceChat and "Feature.VerificationUpsell.Heading.UnlockVoiceChat" or "Feature.VerificationUpsell.Heading.DontLoseAccess", 
            bodyKey = l_upsellType_0 == v7.PHONE_UPSELL_VALUE_PROP.VoiceChat and "Feature.VerificationUpsell.Description.UnlockVoiceChatBody" or "Feature.VerificationUpsell.Description.RecoverAccountEasily", 
            voiceConsent = "Feature.VerificationUpsell.Description.VoiceLegalConsent2", 
            voiceDisclaimer = "Feature.VerificationUpsell.Description.VoiceLegalDisclaimer2", 
            button = "Feature.VerificationUpsell.Action.AddPhoneNumber", 
            termsOfUse = "Feature.VerificationUpsell.Action.SMSTerms", 
            privacyPolicy = "Feature.VerificationUpsell.Action.Privacy"
        });
        v47.voiceDisclaimer = v47.voiceDisclaimer:gsub("{buttonText}", v47.button);
        local v50 = l_useAppPolicy_0(function(v48) --[[ Line: 129 ]]
            -- upvalues: l_upsellType_0 (copy), v7 (ref)
            local v49 = false;
            if l_upsellType_0 == v7.PHONE_UPSELL_VALUE_PROP.VoiceChat then
                v49 = v48.RequireExplicitVoiceConsent();
            end;
            return v49;
        end);
        local v51, v52 = v9.useState(false);
        return v9.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v44.LayoutOrder
        }, {
            ListLayout = v9.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 12)
            }), 
            Header = v9.createElement(l_StyledTextLabel_0, {
                text = v47.headerKey, 
                fontStyle = v46.Font.Header2, 
                colorStyle = v46.Theme.TextEmphasis, 
                layoutOrder = 1
            }), 
            Body = v9.createElement(l_StyledTextLabel_0, {
                text = v47.bodyKey, 
                textWrapped = true, 
                size = UDim2.new(1, 0, 0, 0), 
                automaticSize = Enum.AutomaticSize.Y, 
                fontStyle = v46.Font.Body, 
                lineHeight = 1.1, 
                colorStyle = v46.Theme.TextDefault, 
                layoutOrder = 2
            }), 
            Button = v9.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.Secondary, 
                size = UDim2.new(1, 0, 0, v46.Tokens.Global.Size_600), 
                layoutOrder = 3, 
                text = v47.button, 
                onActivated = function() --[[ Line: 167 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_NewPage_0 (ref), l_GetFFlagAddMorePhoneUpsellEvents_0 (ref), l_RbxAnalyticsService_0 (ref), l_getPlatformTarget_0 (ref), v44 (copy), l_EventStreamConstants_0 (ref), l_PhoneUpsellController_0 (ref), l_default_0 (ref), l_upsellType_0 (copy), v7 (ref)
                    l_NewPage_0.HubRef:SetVisibility(false, true);
                    if l_GetFFlagAddMorePhoneUpsellEvents_0() then
                        l_RbxAnalyticsService_0:SendEventDeferred(l_getPlatformTarget_0(), "verificationUpsell", "modalAction", {
                            origin = v44.origin, 
                            btn = l_EventStreamConstants_0.Button.Continue, 
                            section = v44.section
                        });
                    end;
                    l_PhoneUpsellController_0.openPhoneUpsell({
                        origin = v44.origin, 
                        eventContext = "verificationUpsell", 
                        onSuccessBeforeToast = function() --[[ Line: 179 ]] --[[ Name: onSuccessBeforeToast ]]
                            -- upvalues: l_default_0 (ref), v44 (ref), l_NewPage_0 (ref)
                            l_default_0:DisablePhoneVerificationUpsell();
                            v44.onUpsellComplete();
                            l_NewPage_0.HubRef:SetVisibility(true, false);
                            l_NewPage_0.HubRef:SwitchToPage(l_NewPage_0.HubRef.LeaveGameUpsellPage, true);
                        end, 
                        onSuccess = function() --[[ Line: 185 ]] --[[ Name: onSuccess ]]
                            -- upvalues: l_upsellType_0 (ref), v7 (ref), l_default_0 (ref), v44 (ref)
                            if l_upsellType_0 == v7.PHONE_UPSELL_VALUE_PROP.VoiceChat then
                                l_default_0:EnableVoice();
                                v44.setVoiceEnabled(true);
                            end;
                        end
                    });
                end, 
                isDisabled = v50 and not v51
            }), 
            PhoneLegalDisclaimer = if not l_GetFFlagDisablePVUpsellDataConsent_0() then v9.createElement(l_PhoneLegalDisclaimer_0, {
                legalText = if v50 then v47.voiceConsent else v47.voiceDisclaimer, 
                termsOfUse = v47.termsOfUse, 
                privacyPolicy = v47.privacyPolicy, 
                showLegalText = l_upsellType_0 == v7.PHONE_UPSELL_VALUE_PROP.VoiceChat, 
                showLegalButtons = true, 
                showLegalTextCheckbox = v50, 
                legalTextChecked = v51, 
                setLegalTextChecked = function() --[[ Line: 206 ]] --[[ Name: setLegalTextChecked ]]
                    -- upvalues: v52 (copy), v51 (copy)
                    v52(not v51);
                end, 
                onTermsOfUseClick = function() --[[ Line: 209 ]] --[[ Name: onTermsOfUseClick ]]
                    -- upvalues: l_GetFFlagAddMorePhoneUpsellEvents_0 (ref), l_RbxAnalyticsService_0 (ref), l_getPlatformTarget_0 (ref), v44 (copy), l_Constants_0 (ref)
                    if l_GetFFlagAddMorePhoneUpsellEvents_0() then
                        l_RbxAnalyticsService_0:SendEventDeferred(l_getPlatformTarget_0(), "verificationUpsell", "modalAction", {
                            origin = v44.origin, 
                            field = "termsOfService", 
                            section = v44.section
                        });
                    end;
                    v44.showWebpage(l_Constants_0.TERMS_OF_SERVICE_URL);
                end, 
                onPrivacyPolicyClick = function() --[[ Line: 220 ]] --[[ Name: onPrivacyPolicyClick ]]
                    -- upvalues: l_GetFFlagAddMorePhoneUpsellEvents_0 (ref), l_RbxAnalyticsService_0 (ref), l_getPlatformTarget_0 (ref), v44 (copy), l_Constants_0 (ref)
                    if l_GetFFlagAddMorePhoneUpsellEvents_0() then
                        l_RbxAnalyticsService_0:SendEventDeferred(l_getPlatformTarget_0(), "verificationUpsell", "modalAction", {
                            origin = v44.origin, 
                            field = "privacyPolicy", 
                            section = v44.section
                        });
                    end;
                    v44.showWebpage(l_Constants_0.PRIVACY_POLICY_URL);
                end, 
                LayoutOrder = 4
            }) else nil
        });
    end;
    l_NewPage_0.LeaveGameComponent = function(v53) --[[ Line: 237 ]]
        -- upvalues: l_useStyle_0 (ref), l_useLocalization_0 (ref), v9 (ref), v35 (ref), l_NewPage_0 (copy), v7 (ref), l_GetFFlagAddMorePhoneUpsellEvents_0 (ref), l_useRoactService_0 (ref), l_RoactNetworking_0 (ref), l_useInputType_0 (ref), l_InputTypeConstants_0 (ref), l_GuiService_0 (ref), l_ContextActionService_0 (ref), l_PostPhoneUpsellDisplayed_0 (ref), l_RbxAnalyticsService_0 (ref), l_getPlatformTarget_0 (ref), l_EventStreamConstants_0 (ref), l_useEventConnection_0 (ref), l_RobloxGui_0 (ref), l_ButtonStack_0 (ref), l_ButtonType_0 (ref), l_default_0 (ref), v30 (ref)
        local v54 = l_useStyle_0();
        local v55 = l_useLocalization_0({
            confirmLeave = "Feature.VerificationUpsell.Action.ConfirmLeave", 
            dontLeave = "Feature.VerificationUpsell.Action.DontLeave", 
            returnWithVoice = "Feature.VerificationUpsell.Action.ReturnWithVoice"
        });
        local v56, v57 = v9.useState(v35.Incomplete);
        local v58 = v56 == v35.Incomplete;
        local l_upsellType_1 = l_NewPage_0.upsellType;
        local v60 = l_upsellType_1 == v7.PHONE_UPSELL_VALUE_PROP.VoiceChat and "exitConfirmationScreenVoice" or "exitConfirmationScreenSecurity";
        local v61 = if l_GetFFlagAddMorePhoneUpsellEvents_0() then v56 == v35.Incomplete and "entry" or "verifyPhoneSuccess" else nil;
        local v62 = v9.useRef(nil);
        local v63, v64 = v9.useState(false);
        local v65 = l_useRoactService_0(l_RoactNetworking_0);
        local v66 = l_useInputType_0();
        local function v68() --[[ Line: 260 ]]
            -- upvalues: v66 (copy), l_InputTypeConstants_0 (ref), l_GuiService_0 (ref), v62 (copy), l_ContextActionService_0 (ref), l_NewPage_0 (ref), l_PostPhoneUpsellDisplayed_0 (ref), v65 (copy), v7 (ref), l_GetFFlagAddMorePhoneUpsellEvents_0 (ref), l_RbxAnalyticsService_0 (ref), l_getPlatformTarget_0 (ref), v53 (copy), l_EventStreamConstants_0 (ref)
            if v66 ~= l_InputTypeConstants_0.Touch then
                l_GuiService_0.SelectedCoreObject = v62.current;
            end;
            l_ContextActionService_0:BindCoreAction("LeaveGameCancelAction", l_NewPage_0.DontLeaveFromHotkey, false, Enum.KeyCode.ButtonB);
            if not l_NewPage_0.postSent then
                l_PostPhoneUpsellDisplayed_0(v65, v7.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, os.time(), true, true):catch(function(_) --[[ Line: 279 ]]

                end);
                if l_GetFFlagAddMorePhoneUpsellEvents_0() then
                    l_RbxAnalyticsService_0:SendEventDeferred(l_getPlatformTarget_0(), "verificationUpsell", "modalAction", {
                        origin = v53.origin, 
                        aType = l_EventStreamConstants_0.ActionType.Shown, 
                        section = v53.section
                    });
                end;
                l_NewPage_0.postSent = true;
            end;
        end;
        local function v69() --[[ Line: 294 ]]
            -- upvalues: l_ContextActionService_0 (ref), v56 (copy), v35 (ref), v57 (copy)
            l_ContextActionService_0:UnbindCoreAction("LeaveGameCancelAction");
            if v56 == v35.Completed then
                v57(v35.CompletedAndClosed);
            end;
        end;
        l_useEventConnection_0(l_NewPage_0.Displayed.Event, v68);
        l_useEventConnection_0(l_NewPage_0.Hidden.Event, v69);
        local v70 = (not (l_RobloxGui_0.AbsoluteSize.Y >= 500) or l_RobloxGui_0.AbsoluteSize.X < 500) and 0 or 200;
        return v9.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            Position = UDim2.new(0, 0, 0, v70), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, {
            ListLayout = v9.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            LeaveGame = v9.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 1
            }, {
                ListLayout = v9.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, v54.Tokens.Global.Space_300), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                LeaveGameButtons = v9.createElement(l_ButtonStack_0, {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            isDefaultChild = true, 
                            props = {
                                layoutOrder = 1, 
                                text = v55.confirmLeave, 
                                onActivated = function() --[[ Line: 338 ]] --[[ Name: onActivated ]]
                                    -- upvalues: v63 (copy), v56 (copy), v35 (ref), l_upsellType_1 (copy), v7 (ref), l_default_0 (ref), v64 (copy), l_GetFFlagAddMorePhoneUpsellEvents_0 (ref), l_RbxAnalyticsService_0 (ref), l_getPlatformTarget_0 (ref), v60 (copy), v61 (copy), v30 (ref)
                                    if not v63 and (v56 == v35.Completed or v56 == v35.CompletedAndClosed) and l_upsellType_1 == v7.PHONE_UPSELL_VALUE_PROP.VoiceChat then
                                        l_default_0:EnableVoice();
                                        v64(true);
                                    end;
                                    if l_GetFFlagAddMorePhoneUpsellEvents_0() then
                                        l_RbxAnalyticsService_0:SendEventDeferred(l_getPlatformTarget_0(), "verificationUpsell", "formInteraction", {
                                            origin = v60, 
                                            btn = "confirmLeave", 
                                            section = v61
                                        });
                                    end;
                                    v30(false);
                                end, 
                                buttonRef = v62
                            }
                        }, 
                        {
                            buttonType = l_ButtonType_0.Secondary, 
                            props = {
                                layoutOrder = 2, 
                                text = if v56 == v35.Completed and l_upsellType_1 == v7.PHONE_UPSELL_VALUE_PROP.VoiceChat then v55.returnWithVoice else v55.dontLeave, 
                                onActivated = function() --[[ Line: 369 ]] --[[ Name: onActivated ]]
                                    -- upvalues: l_GetFFlagAddMorePhoneUpsellEvents_0 (ref), v56 (copy), v35 (ref), l_upsellType_1 (copy), v7 (ref), l_RbxAnalyticsService_0 (ref), l_getPlatformTarget_0 (ref), v60 (copy), v61 (copy), l_EventStreamConstants_0 (ref), l_NewPage_0 (ref)
                                    if l_GetFFlagAddMorePhoneUpsellEvents_0() then
                                        if v56 == v35.Completed and l_upsellType_1 == v7.PHONE_UPSELL_VALUE_PROP.VoiceChat then
                                            l_RbxAnalyticsService_0:SendEventDeferred(l_getPlatformTarget_0(), "verificationUpsell", "formInteraction", {
                                                origin = v60, 
                                                btn = "returnWithVoice", 
                                                section = v61
                                            });
                                        elseif v56 == v35.Incomplete then
                                            l_RbxAnalyticsService_0:SendEventDeferred(l_getPlatformTarget_0(), "verificationUpsell", "modalAction", {
                                                origin = v60, 
                                                aType = l_EventStreamConstants_0.ActionType.Dismiss, 
                                                section = v61
                                            });
                                        end;
                                    end;
                                    l_NewPage_0.DontLeaveFromButton();
                                end
                            }
                        }
                    }, 
                    buttonHeight = v54.Tokens.Global.Size_600, 
                    disableGamepadRefs = true, 
                    isRoactGamepadEnabled = false
                })
            }), 
            TopSpacer = v9.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, v54.Tokens.Global.Space_300)
            }), 
            UpsellComponents = if v58 then v9.createElement(v9.Fragment, {}, {
                Divider = v9.createElement("Frame", {
                    LayoutOrder = 3, 
                    BackgroundColor3 = v54.Tokens.Semantic.Color.Common.Divider.Color3, 
                    BackgroundTransparency = v54.Tokens.Semantic.Color.Common.Divider.Transparency, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 1)
                }), 
                BottomSpacer = v9.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 4, 
                    Size = UDim2.new(1, 0, 0, v54.Tokens.Global.Space_300)
                }), 
                Upsell = v9.createElement(l_NewPage_0.UpsellComponent, {
                    origin = v60, 
                    section = v61, 
                    LayoutOrder = 5, 
                    showWebpage = v53.showWebpage, 
                    onUpsellComplete = function() --[[ Line: 428 ]] --[[ Name: onUpsellComplete ]]
                        -- upvalues: v57 (copy), v35 (ref)
                        v57(v35.Completed);
                    end, 
                    setVoiceEnabled = v64
                })
            }) else nil
        });
    end;
    local v71 = v9.createElement(l_InExperienceProviderContainer_0, {}, v9.createElement(l_NewPage_0.LeaveGameComponent, {
        showWebpage = function() --[[ Line: 441 ]] --[[ Name: showWebpage ]]

        end
    }, {}));
    l_NewPage_0.handle = v8.mount(v71, l_NewPage_0.Page, "LeaveGameUpsell");
    l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, 0);
    l_NewPage_0.Page.AutomaticSize = Enum.AutomaticSize.Y;
    return l_NewPage_0;
end)();
v36.SetUpsellProp = function(v72, v73) --[[ Line: 455 ]] --[[ Name: SetUpsellProp ]]
    -- upvalues: v7 (copy), v8 (copy), v9 (copy), l_InExperienceProviderContainer_0 (copy)
    if v73 == v7.PHONE_UPSELL_VALUE_PROP.None then
        return;
    else
        v72.upsellType = v73;
        v72.handle = v8.update(v72.handle, v9.createElement(l_InExperienceProviderContainer_0, {}, v9.createElement(v72.LeaveGameComponent, {
            showWebpage = function() --[[ Line: 468 ]] --[[ Name: showWebpage ]]

            end
        }, {})));
        return;
    end;
end;
return v36;