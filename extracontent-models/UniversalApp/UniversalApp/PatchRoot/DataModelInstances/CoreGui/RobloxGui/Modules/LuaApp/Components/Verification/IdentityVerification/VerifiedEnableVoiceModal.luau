local l_CorePackages_0 = game:GetService("CorePackages");
local l_IXPService_0 = game:GetService("IXPService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppPermissions_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppPermissions;
local v9 = require(l_CorePackages_0.Packages.Cryo);
local v10 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v10.Style.withStyle;
local v12 = require(l_Modules_0.LuaApp.withLocalization);
local l_PartialPageModal_0 = v10.App.Dialog.Modal.PartialPageModal;
local v14 = require(l_Modules_0.LuaApp.Http.Url);
local v15 = require(l_Modules_0.LuaApp.Components.Verification.IdentityVerification.IdentityVerificationModalContent);
local v16 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v17 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v18 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local l_Images_0 = v10.App.ImageSet.Images;
local v20 = require(l_Modules_0.LuaApp.AppPage);
local l_ButtonType_0 = v10.App.Button.Enum.ButtonType;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_PostUserOptIn_0 = require(l_CorePackages_0.Workspace.Packages.VoiceChat).PostUserOptIn;
local v24 = require(l_Modules_0.LuaApp.Analytics.Events.VoiceUpsellAnalytics);
local v25 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringVoiceUpsellLayer();
local v26 = v4.PureComponent:extend("EnableVoiceModal");
local v27 = require(l_Modules_0.LuaApp.Http.Requests.PostAgeVerificationOptOutCheckbox);
local v28 = require(l_Modules_0.LuaApp.Flags.GetFFlagVoiceUpsellConsentCheckbox);
v26.init = function(v29) --[[ Line: 47 ]] --[[ Name: init ]]
    -- upvalues: v28 (copy), l_PostUserOptIn_0 (copy), l_Logging_0 (copy), v27 (copy)
    v29.isMounted = false;
    v29.state = {
        dontShowModalAgain = false
    };
    if v28() then
        v29.state.consentGiven = not v29.props.RequireExplicitVoiceConsent;
    end;
    v29.enableVoice = function() --[[ Line: 58 ]]
        -- upvalues: v29 (copy), l_PostUserOptIn_0 (ref), l_Logging_0 (ref)
        v29.props.voiceUpsellAnalytics.enableVoiceChatUpsell();
        l_PostUserOptIn_0(v29.props.networking, true, true):andThen(function(v30) --[[ Line: 61 ]]
            -- upvalues: v29 (ref), l_Logging_0 (ref)
            if v30 then
                v29.props.launchGame();
                v29.props.closeOverlay();
                v29.props.setShowVoiceOptIn({
                    voiceEnabled = true, 
                    showVoiceOptInOverlay = false
                });
                return;
            else
                v29.props.setNetworkingErrorToast();
                l_Logging_0.warn("Error getting UserOptIn. " .. tostring(v30));
                return;
            end;
        end):catch(function() --[[ Line: 71 ]]
            -- upvalues: v29 (ref), l_Logging_0 (ref)
            v29.props.setNetworkingErrorToast();
            l_Logging_0.warn("Exception posting PostUserOptIn");
        end);
    end;
    v29.joinAnyways = function() --[[ Line: 77 ]]
        -- upvalues: v29 (copy), v28 (ref)
        v29.props.voiceUpsellAnalytics.joinWithoutVoiceChat(v29.state.dontShowModalAgain == true);
        if v29.state.dontShowModalAgain or v28() then
            v29.props.setShowVoiceOptIn({
                voiceEnabled = false, 
                showVoiceOptInOverlay = false
            });
        end;
        v29.props.launchGame();
        v29.props.closeOverlay();
    end;
    v29.onOverlayOptOutCheckBoxActivated = function(v31) --[[ Line: 86 ]]
        -- upvalues: v29 (copy), v27 (ref), l_Logging_0 (ref)
        if v29.isMounted then
            v27(v29.props.networking, not v31):catch(function(v32) --[[ Line: 89 ]]
                -- upvalues: l_Logging_0 (ref)
                l_Logging_0.warn("Error posting ShowOverlay for AgeVerificationOptOutCheckbox. " .. tostring(v32));
            end);
            v29:setState({
                dontShowModalAgain = v31
            });
        end;
    end;
    v29.consentActivated = function() --[[ Line: 102 ]]
        -- upvalues: v29 (copy)
        if v29.isMounted then
            v29:setState({
                consentGiven = not v29.state.consentGiven
            });
        end;
    end;
    v29.closeEnableVoiceModal = function() --[[ Line: 110 ]]
        -- upvalues: v28 (ref), v29 (copy)
        if v28() then
            v29.props.setShowVoiceOptIn({
                showVoiceOptInOverlay = false
            });
        end;
        v29.props.voiceUpsellAnalytics.closeEnableVoiceChatModal();
        v29.props.closeOverlay();
    end;
end;
v26.didMount = function(v33) --[[ Line: 119 ]] --[[ Name: didMount ]]
    -- upvalues: v28 (copy), l_Logging_0 (copy), v25 (copy), l_IXPService_0 (copy)
    v33.isMounted = true;
    if v28() and v33.props.postUserSeenModal then
        v33.props.postUserSeenModal():andThen(function() --[[ Line: 125 ]]
            -- upvalues: l_Logging_0 (ref)
            l_Logging_0.warn("UserSeenModal request succeeded");
        end):catch(function(_) --[[ Line: 128 ]]
            -- upvalues: l_Logging_0 (ref)
            l_Logging_0.warn("UserSeenModal request failed");
        end);
    end;
    if v25 ~= "" then
        l_IXPService_0:LogUserLayerExposure(v25);
    end;
    v33.props.voiceUpsellAnalytics.showEnableVoiceChatModal();
end;
v26.willUnmount = function(v35) --[[ Line: 140 ]] --[[ Name: willUnmount ]]
    v35.isMounted = false;
end;
v26.render = function(v36) --[[ Line: 144 ]] --[[ Name: render ]]
    -- upvalues: v12 (copy), v9 (copy), l_withStyle_0 (copy), v4 (copy), v15 (copy), v28 (copy), l_Images_0 (copy), l_ButtonType_0 (copy), l_PartialPageModal_0 (copy)
    local l_showNewContent_0 = v36.props.showNewContent;
    return v12(v9.Dictionary.join({
        EnableVoiceChat = "Verification.Identity.Label.EnableVoiceChat", 
        LearnMoreAboutVoiceRecording = "Verification.Identity.Label.LearnMoreAboutVoiceRecording", 
        SkipVoiceChat = "Verification.Identity.Action.SkipVoiceChat", 
        UsesVoiceChat = "Verification.Identity.Label.UsesVoiceChat", 
        DontShowAgain = "Verification.Identity.Label.DontShowAgain", 
        ConsentText = "Verification.Identity.Label.VoiceCollectionConsent", 
        EnableVoiceContent1 = "Verification.Identity.Label.EnableVoiceChat1", 
        EnableVoiceContent2 = "Verification.Identity.Label.EnableVoiceChat2", 
        ClickToConsent = "Verification.Identity.Label.VoiceCollectionConsent2", 
        LetsChat = "Verification.Identity.Heading.LetsChat", 
        VoiceFAQ = "InGame.CommonUI.Label.FAQWebviewTitle"
    }, if l_showNewContent_0 then {
        EnableVoiceChat = "Verification.Identity.Label.EnableMicrophone", 
        SkipVoiceChat = "Verification.Identity.Label.JoinWithoutMicrophone", 
        EnableVoiceContent1 = "Verification.Identity.Label.EnableChatWithVoice", 
        LetsChat = "Verification.Identity.Heading.YourNewWayToChat"
    } else {}, {
        LetsChat = "Verification.Identity.Heading.V2LetsChat", 
        ClickToConsent = "Verification.Identity.Label.V2ClickToConsent", 
        EnableVoiceChat = "Verification.Identity.Label.V2EnableVoiceChat", 
        EnableVoiceContent1 = "Verification.Identity.Label.V2EnableVoiceChat1", 
        SkipVoiceChat = "Verification.Identity.Label.V2JoinWithout"
    }))(function(v38) --[[ Line: 175 ]]
        -- upvalues: l_withStyle_0 (ref), v36 (copy), v4 (ref), v15 (ref), v9 (ref), v28 (ref), l_Images_0 (ref), l_ButtonType_0 (ref), l_showNewContent_0 (copy), l_PartialPageModal_0 (ref)
        return l_withStyle_0(function(v39) --[[ Line: 176 ]]
            -- upvalues: v36 (ref), v4 (ref), v15 (ref), v9 (ref), v38 (copy), v28 (ref), l_Images_0 (ref), l_ButtonType_0 (ref), l_showNewContent_0 (ref), l_PartialPageModal_0 (ref)
            local l_Theme_0 = v39.Theme;
            local l_CaptionHeader_0 = v39.Font.CaptionHeader;
            local v42 = l_CaptionHeader_0.RelativeSize * v39.Font.BaseSize;
            local v43 = not v36.props.RequireExplicitVoiceConsent;
            local v44 = v4.createElement(v15, v9.Dictionary.join({
                MainText = {
                    v38.UsesVoiceChat
                }, 
                LocalizedOptOutText = v38.DontShowAgain, 
                centerCheckbox = true, 
                onActivated = v36.onOverlayOptOutCheckBoxActivated, 
                checkboxSelected = v36.state.dontShowModalAgain
            }, if v28() then {
                MainText = {
                    {
                        content = v38.EnableVoiceContent1, 
                        image = l_Images_0["icons/graphic/voicechat_large"]
                    }, 
                    "", 
                    {
                        content = v38.EnableVoiceContent2, 
                        image = l_Images_0["icons/graphic/hearts_large"]
                    }
                }, 
                LocalizedOptOutText = false, 
                centerCheckbox = false, 
                showConsentCheckbox = true, 
                consentText = if v43 then v38.ClickToConsent else v38.ConsentText, 
                consentActivated = v36.consentActivated, 
                consentSelected = v36.state.consentGiven, 
                hideConsent = v43
            } else {}));
            local v45 = {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        onActivated = v36.joinAnyways, 
                        text = v38.SkipVoiceChat
                    }
                }, 
                {
                    buttonType = if l_showNewContent_0 then l_ButtonType_0.Secondary else l_ButtonType_0.PrimarySystem, 
                    props = {
                        isDisabled = if v28() then not v36.state.consentGiven else nil, 
                        onActivated = v36.enableVoice, 
                        text = v38.EnableVoiceChat
                    }
                }
            };
            return v4.createElement(l_PartialPageModal_0, {
                title = if v28() then v38.LetsChat else v38.EnableVoiceChat, 
                screenSize = v36.props.screenSize, 
                onCloseClicked = v36.closeEnableVoiceModal, 
                buttonStackProps = v45 and {
                    buttonHeight = 48, 
                    buttons = v45
                }, 
                footerContent = function() --[[ Line: 248 ]] --[[ Name: footerContent ]]
                    -- upvalues: v4 (ref), l_Theme_0 (copy), v38 (ref), v39 (copy), l_CaptionHeader_0 (copy), v42 (copy), v36 (ref)
                    return v4.createFragment({
                        Divider = v4.createElement("Frame", {
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Position = UDim2.new(0.5, 0, 0, 16), 
                            BorderSizePixel = 0, 
                            BackgroundColor3 = l_Theme_0.Divider.Color, 
                            BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                            LayoutOrder = 2, 
                            Size = UDim2.new(1, 0, 0, 1)
                        }), 
                        FooterText = v4.createElement("TextButton", {
                            Text = v38.LearnMoreAboutVoiceRecording or "Learn More about Voice Recording", 
                            AutomaticSize = Enum.AutomaticSize.X, 
                            Position = UDim2.new(0.5, 0, 0.5, 24), 
                            TextColor3 = v39.Theme.TextEmphasis.Color, 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            BackgroundTransparency = 1, 
                            Font = l_CaptionHeader_0.Font, 
                            TextSize = v42, 
                            BorderSizePixel = 0, 
                            RichText = true, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            Size = UDim2.new(0, 0, 0, 20), 
                            [v4.Event.Activated] = function() --[[ Line: 272 ]]
                                -- upvalues: v36 (ref), v38 (ref)
                                v36.props.openVoiceFAQ(v38.VoiceFAQ or "Voice FAQ");
                                v36.props.voiceUpsellAnalytics.learnMoreAboutVoiceRecordingUpsell();
                            end
                        })
                    });
                end
            }, {
                OuterFrame = v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    ListLayout = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        Padding = UDim.new(0, 24), 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    }), 
                    Padding = v4.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 24), 
                        PaddingBottom = UDim.new(0, 24)
                    }), 
                    ContentFrame = v4.createElement("Frame", {
                        LayoutOrder = 2, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1
                    }, {
                        Content = v44
                    })
                })
            });
        end);
    end);
end;
v26 = l_RoactAppPolicy_0.connect(function(v46, _) --[[ Line: 309 ]]
    return {
        showNewContent = v46.getGameInfoShowChatFeatures()
    };
end)(v26);
v26 = l_RoactServices_0.connect({
    networking = v6, 
    permissions = l_AppPermissions_0, 
    voiceUpsellAnalytics = v24
})(v26);
return v5.connect(function(v48, _) --[[ Line: 321 ]]
    return {
        formFactor = v48.FormFactor, 
        screenSize = v48.ScreenSize
    };
end, function(v50) --[[ Line: 326 ]]
    -- upvalues: v17 (copy), v18 (copy), v16 (copy), v20 (copy), v14 (copy)
    return {
        closeOverlay = function() --[[ Line: 328 ]] --[[ Name: closeOverlay ]]
            -- upvalues: v50 (copy), v17 (ref)
            v50(v17());
        end, 
        setNetworkingErrorToast = function(_) --[[ Line: 331 ]] --[[ Name: setNetworkingErrorToast ]]
            -- upvalues: v50 (copy), v18 (ref)
            v50(v18({
                HttpError = Enum.HttpError.OK
            }));
        end, 
        openVoiceFAQ = function(v52) --[[ Line: 334 ]] --[[ Name: openVoiceFAQ ]]
            -- upvalues: v50 (copy), v16 (ref), v20 (ref), v14 (ref)
            return v50(v16({
                name = v20.GenericWebPage, 
                detail = string.format("%sinfo/voice-faq", v14.BASE_URL), 
                extraProps = {
                    title = v52
                }
            }));
        end
    };
end)(v26);