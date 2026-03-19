local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.React);
local v6 = require(l_script_FirstAncestor_0.LuaAppNavigationContext);
local v7 = require(l_script_FirstAncestor_0.Utils.getDeepValue2);
local l_memo_0 = v5.memo;
local v9 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local l_useCallback_0 = v5.useCallback;
local l_useContext_0 = v5.useContext;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v5.useEffect;
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local v15 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v18 = require(l_script_FirstAncestor_0.Contexts.ChatPagePadding.useChatPagePadding);
local l_useState_0 = v5.useState;
local l_useRef_0 = v5.useRef;
local v21 = require(l_script_FirstAncestor_0.Hooks.useIsGuiInChatVisible);
local v22 = require(l_script_FirstAncestor_0.Hooks.useRecordModalSeenWithDelay);
local v23 = require(script.Parent.ChatLandingModalTelemetry);
local v24 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatLandingTelemetryLayer);
local v25 = require(l_script_FirstAncestor_0.Components.ModalTelemetry);
local v26 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
local l_Enum_0 = require(l_Parent_0.UIBlox).App.Button.Enum;
local v28 = require(l_Parent_0.SocialUpsell);
local v29 = require(l_Parent_0.Foundation);
local l_UpsellBanner_0 = v28.UpsellBanner;
local l_UpsellEntrySurfaceType_0 = v28.Analytics.Enum.UpsellEntrySurfaceType;
local l_UpsellComponent_0 = v28.Analytics.Enum.UpsellComponent;
local l_FFlagEnableAEGIS1AppChatBanner_0 = v28.Flags.FFlagEnableAEGIS1AppChatBanner;
local l_FFlagAddMinorFixesToUpsellAnalytics_0 = v28.Flags.FFlagAddMinorFixesToUpsellAnalytics;
local l_useSocialUpsellOverlayController_0 = v28.Hooks.useSocialUpsellOverlayController;
local l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0 = v28.Constants.DEFAULT_FAE_ENTRY_POINT_EVENT_CTX;
local l_AccessResponseEnum_0 = require(l_Parent_0.AmpUpsell).AmpEnums.AccessResponseEnum;
local v38 = require(l_Parent_0.AppChatNetworking);
local l_ChatLandingModalVariant_0 = v38.Constants.ChatLandingModalVariant;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v43 = require(l_script_FirstAncestor_0.Conversations.Thunks.refreshAllUnfilteredThreadsDetails);
local v44 = require(l_script_FirstAncestor_0.Components.UnfilteredThreadsAMPFeatureName);
local v45 = require(l_script_FirstAncestor_0.Conversations.Thunks.OpenTcLearnMoreLink);
local v46 = require(l_script_FirstAncestor_0.Models.ModalConfiguration);
local v47 = require(l_script_FirstAncestor_0.Utils.createBannerConfigFromModalConfiguration);
local v48 = require(l_script_FirstAncestor_0.Components.FaeBanner.AppChatFAEBanner);
local v49 = require(l_script_FirstAncestor_0.Flags.FIntAppChatModalSeenImpressionDelayMs);
local v50 = require(l_script_FirstAncestor_0.Flags.FFlagDebugAppChatFae);
local l_FStringCanAccessTrustedContactsAmpFeature_0 = require(l_Parent_0.SharedFlags).FStringCanAccessTrustedContactsAmpFeature;
local l_FStringCanAccessTrustedContactsAmpNameSpace_0 = require(l_Parent_0.SharedFlags).FStringCanAccessTrustedContactsAmpNameSpace;
local l_FFlagEnableSocialUpsellUIFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableSocialUpsellUIFixes;
local l_FFlagEnableAEGIS2CommsFAEUpsell_0 = require(l_Parent_0.SharedFlags).FFlagEnableAEGIS2CommsFAEUpsell;
local v55 = require(l_script_FirstAncestor_0.Flags.FFlagDebugAEGIS1AppChatBanner);
local l_FFlagEnableAEGIS2AppChatBanner_0 = require(l_Parent_0.SharedFlags).FFlagEnableAEGIS2AppChatBanner;
local v57 = require(l_Parent_0.SocialExperiments);
local l_FFlagTestDeviceForFAEUpsell_0 = require(l_Parent_0.SocialExperiments).FFlagTestDeviceForFAEUpsell;
local l_deviceMeetsRequirementsForFAE_0 = v57.deviceMeetsRequirementsForFAE;
local l_startFacialAgeEstimation_0 = v28.Thunks.startFacialAgeEstimation;
local l_GetAgeVerifiedChangedSignal_0 = v28.Signals.GetAgeVerifiedChangedSignal;
local v62 = require(script.Parent.ChatLandingModal);
local v63 = {
    fully_eligible_ftux = true, 
    party_only_ftux = true, 
    phone_verify = true, 
    [l_ChatLandingModalVariant_0.AgeAssuranceUpsell] = true
};
local v64 = {
    fully_eligible_ftux = "ChatLandingUnfilteredThreadsFtux", 
    phone_verify = "ChatLandingPvUpsell"
};
return l_memo_0(function(_) --[[ Line: 89 ]] --[[ Name: ChatLandingModalContainer ]]
    -- upvalues: l_useDispatch_0 (copy), v9 (copy), l_useContext_0 (copy), v6 (copy), l_useNavigation_0 (copy), l_useState_0 (copy), v15 (copy), l_useSelector_0 (copy), v46 (copy), v7 (copy), v5 (copy), l_ChatLandingModalVariant_0 (copy), l_FFlagEnableAEGIS2CommsFAEUpsell_0 (copy), v64 (copy), v63 (copy), l_FFlagEnableAEGIS1AppChatBanner_0 (copy), l_FFlagEnableAEGIS2AppChatBanner_0 (copy), v26 (copy), v24 (copy), l_useEffectOnMount_0 (copy), l_useEffect_0 (copy), v23 (copy), l_useCallback_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v44 (copy), l_NavigateBack_0 (copy), l_AccessResponseEnum_0 (copy), v43 (copy), l_HttpService_0 (copy), l_FStringCanAccessTrustedContactsAmpFeature_0 (copy), l_FStringCanAccessTrustedContactsAmpNameSpace_0 (copy), v25 (copy), v50 (copy), v55 (copy), v45 (copy), v38 (copy), v4 (copy), v18 (copy), v29 (copy), l_useSocialUpsellOverlayController_0 (copy), l_startFacialAgeEstimation_0 (copy), l_FFlagAddMinorFixesToUpsellAnalytics_0 (copy), v28 (copy), l_UpsellEntrySurfaceType_0 (copy), l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0 (copy), l_UpsellComponent_0 (copy), l_useRef_0 (copy), v21 (copy), v22 (copy), v49 (copy), l_FFlagTestDeviceForFAEUpsell_0 (copy), l_deviceMeetsRequirementsForFAE_0 (copy), l_FFlagEnableSocialUpsellUIFixes_0 (copy), l_UpsellBanner_0 (copy), v47 (copy), v48 (copy), v62 (copy), l_Enum_0 (copy), l_GetAgeVerifiedChangedSignal_0 (copy)
    local v66 = l_useDispatch_0();
    local v67 = v9();
    local v68 = l_useContext_0(v6);
    local v69 = l_useNavigation_0();
    local v70, v71 = l_useState_0({});
    local v72 = v15();
    local v75 = l_useSelector_0(function(v73) --[[ Line: 98 ]]
        -- upvalues: v46 (ref), v7 (ref)
        local l_default_0 = v46.default;
        return v7(v73, "ChatAppReducer.Modals.chatLandingModal") or l_default_0;
    end);
    local v76 = v5.useMemo(function() --[[ Line: 103 ]]
        -- upvalues: l_ChatLandingModalVariant_0 (ref), l_FFlagEnableAEGIS2CommsFAEUpsell_0 (ref), v72 (copy)
        return {
            [l_ChatLandingModalVariant_0.ChatLandingAgeVerifiedCommsTimedModal] = l_FFlagEnableAEGIS2CommsFAEUpsell_0 or not v72
        };
    end, {
        v72
    });
    local l_modal_variant_0 = v75.modal_variant;
    local v78 = v7(v75, "modal_layout.id");
    local v79 = v7(v75, "modal_layout.seen_record_action");
    local v80 = v7(v75, "modal_layout.dismissed_record_action");
    local v81 = v7(v75, "modal_layout.buttons");
    local v82 = v81 and v81[1];
    local v83 = v64[l_modal_variant_0];
    local v84 = (not not v63[l_modal_variant_0] or l_FFlagEnableAEGIS1AppChatBanner_0 and v76[l_modal_variant_0] or l_FFlagEnableAEGIS2AppChatBanner_0 and l_modal_variant_0 == l_ChatLandingModalVariant_0.ChatLandingAgeVerifiedCommsUpsellModal) and not v70[l_modal_variant_0];
    local v85 = v26(v24.Context);
    l_useEffectOnMount_0(function() --[[ Line: 127 ]]
        -- upvalues: v67 (copy), v83 (copy), v84 (copy)
        if v67 and v83 and v84 then
            v67.fireAnalyticsEvent((("%*Rendered"):format(v83)));
        end;
    end);
    l_useEffect_0(function() --[[ Line: 132 ]]
        -- upvalues: v84 (copy), l_modal_variant_0 (copy), l_ChatLandingModalVariant_0 (ref), v85 (copy), v23 (ref)
        if v84 and l_modal_variant_0 == l_ChatLandingModalVariant_0.AgeAssuranceUpsell then
            v85.emit(v23.Events.FaeModalShown, {});
        end;
        if v84 then
            v85.emit(v23.Events.ModalRendered, {
                modalVariant = l_modal_variant_0
            });
        end;
    end, {
        l_modal_variant_0, 
        v84
    });
    local v88 = l_useCallback_0(function() --[[ Line: 143 ]]
        -- upvalues: v67 (copy), v83 (copy), v66 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v44 (ref), l_NavigateBack_0 (ref), l_AccessResponseEnum_0 (ref), v43 (ref), v72 (copy)
        if v67 and v83 then
            v67.fireAnalyticsEvent((("%*ContinueClicked"):format(v83)));
        end;
        v66(l_NavigateDown_0({
            name = l_AppPage_0.AmpWizardContainer, 
            extraProps = {
                featureName = v44, 
                completionCallback = function(v86, _) --[[ Line: 151 ]] --[[ Name: completionCallback ]]
                    -- upvalues: v66 (ref), l_NavigateBack_0 (ref), l_AccessResponseEnum_0 (ref), v67 (ref), v83 (ref), v43 (ref), v72 (ref)
                    v66(l_NavigateBack_0(true));
                    if v86 == l_AccessResponseEnum_0.Granted then
                        if v67 and v83 then
                            v67.fireAnalyticsEvent((("%*Succeeded"):format(v83)));
                        end;
                        v66(v43(nil, v72));
                        return;
                    else
                        if v67 and v83 then
                            v67.fireAnalyticsEvent((("%*Failed"):format(v83)));
                        end;
                        return;
                    end;
                end
            }
        }));
    end, {
        v66, 
        v67, 
        v83
    });
    local v92 = l_useCallback_0(function() --[[ Line: 169 ]]
        -- upvalues: l_HttpService_0 (ref), v85 (copy), v23 (ref), v66 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_FStringCanAccessTrustedContactsAmpFeature_0 (ref), l_FStringCanAccessTrustedContactsAmpNameSpace_0 (ref), l_NavigateBack_0 (ref), l_AccessResponseEnum_0 (ref), l_modal_variant_0 (copy), v25 (ref), v43 (ref), v72 (copy), v50 (ref), v55 (ref)
        local v89 = l_HttpService_0:GenerateGUID(false);
        v85.emit(v23.Events.TelemetryFaeButtonClick, {
            state = v89, 
            btn = v23.Constants.ConfirmFaeBtn
        });
        v66(l_NavigateDown_0({
            name = l_AppPage_0.AmpWizardContainer, 
            extraProps = {
                featureName = l_FStringCanAccessTrustedContactsAmpFeature_0, 
                entryPointEventCtx = v23.Constants.EventStreamCtx, 
                metadata = {
                    sessionId = v89
                }, 
                nameSpace = l_FStringCanAccessTrustedContactsAmpNameSpace_0, 
                completionCallback = function(v90, _) --[[ Line: 184 ]] --[[ Name: completionCallback ]]
                    -- upvalues: v66 (ref), l_NavigateBack_0 (ref), l_AccessResponseEnum_0 (ref), v85 (ref), v23 (ref), l_modal_variant_0 (ref), v25 (ref), v43 (ref), v72 (ref), v50 (ref), v55 (ref)
                    v66(l_NavigateBack_0(true));
                    if v90 == l_AccessResponseEnum_0.Granted then
                        v85.emit(v23.Events.ModalActionResult, {
                            modalVariant = l_modal_variant_0, 
                            action = v25.Enums.ModalActions.PrimaryCta, 
                            actionResult = v25.Enums.ModalActionResults.Success
                        });
                        v66(v43(nil, v72));
                    else
                        v85.emit(v23.Events.ModalActionResult, {
                            modalVariant = l_modal_variant_0, 
                            action = v25.Enums.ModalActions.PrimaryCta, 
                            actionResult = v25.Enums.ModalActionResults.Failure
                        });
                    end;
                    if v50 or v55 then
                        v66({
                            type = "DEBUG_DismissChatLandingModal"
                        });
                    end;
                end
            }
        }));
    end, {
        v66, 
        v72, 
        v85, 
        l_modal_variant_0
    });
    local v94 = l_useCallback_0(function() --[[ Line: 218 ]]
        -- upvalues: v67 (copy), v83 (copy), v69 (copy), v68 (copy)
        if v67 and v83 then
            v67.fireAnalyticsEvent((("%*LearnMoreClicked"):format(v83)));
        end;
        local v93 = if v69 then v69.navigate else nil;
        v68.navigateToUnfilteredThreadsLearnMore(v93);
    end, {
        v68, 
        v67, 
        v69, 
        v83
    });
    local v95 = l_useCallback_0(function() --[[ Line: 232 ]]
        -- upvalues: v66 (copy), v45 (ref)
        v66(v45());
    end, {
        v66
    });
    local v97 = l_useCallback_0(function() --[[ Line: 236 ]]
        -- upvalues: v67 (copy), v83 (copy), l_modal_variant_0 (copy), l_ChatLandingModalVariant_0 (ref), v85 (copy), v23 (ref), l_HttpService_0 (ref), v25 (ref), v66 (copy), v38 (ref), v80 (copy), v78 (copy), v50 (ref), v55 (ref), v71 (copy), v4 (ref), v70 (copy)
        if v67 and v83 then
            v67.fireAnalyticsEvent((("%*Dismissed"):format(v83)));
        end;
        if l_modal_variant_0 == l_ChatLandingModalVariant_0.AgeAssuranceUpsell then
            v85.emit(v23.Events.TelemetryFaeButtonClick, {
                state = l_HttpService_0:GenerateGUID(false), 
                btn = v23.Constants.CancelFaeBtn
            });
        end;
        v85.emit(v23.Events.ModalAction, {
            modalVariant = l_modal_variant_0, 
            action = v25.Enums.ModalActions.Dismiss
        });
        v66(v38.rodux.RecordModalSequenceResponse.API(v80, "chat_landing_modal", v78)):catch(function(v96) --[[ Line: 256 ]]
            warn("Error in ChatLandingModalContainer -> RecordModalSequenceResponse dismissed: " .. tostring(v96), v96);
        end);
        if v50 and l_modal_variant_0 == l_ChatLandingModalVariant_0.AgeAssuranceUpsell or v55 and l_modal_variant_0 == l_ChatLandingModalVariant_0.ChatLandingAgeVerifiedCommsTimedModal then
            v66({
                type = "DEBUG_DismissChatLandingModal"
            });
            return;
        else
            v71(v4.Dictionary.join(v70, {
                [l_modal_variant_0] = true
            }));
            return;
        end;
    end, {
        v70, 
        v71, 
        v66, 
        v67, 
        v83, 
        v80, 
        l_modal_variant_0, 
        v78, 
        v85
    });
    local v98 = nil;
    local v99 = nil;
    local v100 = nil;
    local v101 = nil;
    if l_FFlagEnableAEGIS1AppChatBanner_0 then
        v98 = v18();
        v101 = v29.Hooks.useTokens();
        local v102 = l_useSocialUpsellOverlayController_0(v72);
        v99 = v5.useCallback(function(_) --[[ Line: 299 ]]
            -- upvalues: l_modal_variant_0 (copy), l_ChatLandingModalVariant_0 (ref), v66 (copy), l_startFacialAgeEstimation_0 (ref), l_FFlagAddMinorFixesToUpsellAnalytics_0 (ref), v28 (ref), l_UpsellEntrySurfaceType_0 (ref), l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0 (ref), l_FFlagEnableAEGIS2CommsFAEUpsell_0 (ref), v72 (copy)
            if l_modal_variant_0 == l_ChatLandingModalVariant_0.ChatLandingAgeVerifiedCommsTimedModal then
                v66(l_startFacialAgeEstimation_0(if l_FFlagAddMinorFixesToUpsellAnalytics_0 then v28.Enums.SocialUpsellType.FacialAgeEstimation .. l_UpsellEntrySurfaceType_0.PartyTab else l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0 .. l_UpsellEntrySurfaceType_0.PartyTabBanner, nil, nil, if l_FFlagAddMinorFixesToUpsellAnalytics_0 then l_UpsellEntrySurfaceType_0.PartyTab else l_UpsellEntrySurfaceType_0.PartyTabBanner, if l_FFlagEnableAEGIS2CommsFAEUpsell_0 then v72 else nil));
            end;
        end, {
            v66, 
            l_modal_variant_0, 
            v72
        });
        v100 = v5.useCallback(function(v104) --[[ Line: 316 ]]
            -- upvalues: l_modal_variant_0 (copy), l_ChatLandingModalVariant_0 (ref), v102 (copy), v28 (ref), l_FFlagAddMinorFixesToUpsellAnalytics_0 (ref), l_UpsellEntrySurfaceType_0 (ref), l_UpsellComponent_0 (ref)
            if l_modal_variant_0 == l_ChatLandingModalVariant_0.ChatLandingAgeVerifiedCommsTimedModal then
                v102.openSocialOverlay(v28.Enums.SocialUpsellType.FacialAgeEstimation, {
                    upsellEntrySurface = if l_FFlagAddMinorFixesToUpsellAnalytics_0 then l_UpsellEntrySurfaceType_0.PartyTab else l_UpsellEntrySurfaceType_0.PartyTabBanner, 
                    upsellEntryComponent = if l_FFlagAddMinorFixesToUpsellAnalytics_0 then l_UpsellComponent_0.Banner else nil, 
                    impressionId = v104
                });
            end;
        end, {
            l_modal_variant_0, 
            v102.openSocialOverlay
        });
    end;
    local v105 = ({
        [l_ChatLandingModalVariant_0.AgeAssuranceUpsell] = v95
    })[l_modal_variant_0];
    local v106 = l_useCallback_0(function(...) --[[ Line: 336 ]]
        -- upvalues: v85 (copy), v23 (ref), l_modal_variant_0 (copy), v25 (ref), v105 (copy)
        v85.emit(v23.Events.ModalAction, {
            modalVariant = l_modal_variant_0, 
            action = v25.Enums.ModalActions.InlineCta
        });
        v105(...);
    end, {
        v105, 
        v85, 
        l_modal_variant_0
    });
    local v107 = v75 and v75.modal_layout and v75.modal_layout.body and v75.modal_layout.body.additional_content or {};
    local v110 = v5.useMemo(function() --[[ Line: 349 ]]
        -- upvalues: v4 (ref), v107 (copy), v38 (ref), v106 (copy)
        return v4.List.map(v107, function(v108) --[[ Line: 350 ]]
            -- upvalues: v38 (ref), v106 (ref)
            local v109 = {
                type = v108.type, 
                text = v108.text
            };
            if v108.type == v38.Constants.ModalContentType.Link then
                v109.onActivated = v106;
            end;
            return v109;
        end);
    end, {
        v107, 
        v105, 
        v106
    });
    local v111 = ({
        phone_verify = v88, 
        fully_eligible_ftux = v94, 
        [l_ChatLandingModalVariant_0.AgeAssuranceUpsell] = v92
    })[l_modal_variant_0];
    local v112 = l_useCallback_0(function(...) --[[ Line: 368 ]]
        -- upvalues: v85 (copy), v23 (ref), l_modal_variant_0 (copy), v25 (ref), v111 (copy)
        v85.emit(v23.Events.ModalAction, {
            modalVariant = l_modal_variant_0, 
            action = v25.Enums.ModalActions.PrimaryCta
        });
        v111(...);
    end, {
        v111, 
        v85, 
        l_modal_variant_0
    });
    local v113 = l_useRef_0(nil);
    local v114 = v21(v113, {
        v113.current, 
        v84
    });
    v22({
        modalSequence = "chat_landing_modal", 
        modalId = v78, 
        actionToRecord = v79, 
        delayMs = v49, 
        canRecordAction = v114 and v84
    });
    local v115 = if v50 then v5.useCallback(function() --[[ Line: 387 ]]
        -- upvalues: v66 (copy)
        v66({
            type = "DEBUG_ShowAppChatFaeUpsell"
        });
    end, {
        v66
    }) else function() --[[ Line: 392 ]]

    end;
    local v116 = if v55 then v5.useCallback(function() --[[ Line: 395 ]]
        -- upvalues: v66 (copy)
        v66({
            type = "DEBUG_ShowChatLandingAgeVerifiedTimedModal"
        });
    end, {
        v66
    }) else nil;
    if l_FFlagTestDeviceForFAEUpsell_0 and not l_deviceMeetsRequirementsForFAE_0() then
        return nil;
    elseif v84 then
        if l_FFlagEnableAEGIS1AppChatBanner_0 and v76[l_modal_variant_0] then
            return v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                ContentPadding = v5.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 1), 
                    PaddingBottom = UDim.new(0, if l_FFlagEnableSocialUpsellUIFixes_0 then v101.Size.Size_400 else v101.Size.Size_700), 
                    PaddingLeft = UDim.new(0, v98.left), 
                    PaddingRight = UDim.new(0, v98.right)
                }), 
                UpsellBanner = v5.createElement(l_UpsellBanner_0, {
                    config = v47(v75), 
                    onPrimaryAction = v99, 
                    onSecondaryAction = v100, 
                    onDismiss = v97, 
                    upsellEntrySurface = if l_FFlagAddMinorFixesToUpsellAnalytics_0 then l_UpsellEntrySurfaceType_0.PartyTab else l_UpsellEntrySurfaceType_0.PartyTabBanner, 
                    upsellEntryComponent = if l_FFlagAddMinorFixesToUpsellAnalytics_0 then l_UpsellComponent_0.Banner else nil
                })
            });
        elseif l_FFlagEnableAEGIS2AppChatBanner_0 and l_modal_variant_0 == l_ChatLandingModalVariant_0.ChatLandingAgeVerifiedCommsUpsellModal then
            return v5.createElement(v48, {
                modalConfiguration = v75, 
                onDismiss = v97
            });
        else
            return v5.createElement(v62, {
                titleLabelText = v7(v75, "modal_layout.label.text"), 
                titleText = v7(v75, "modal_layout.header.text"), 
                bodyText = v7(v75, "modal_layout.body.text"), 
                additionalContent = v110, 
                actionText = v82 and v82.text, 
                buttonType = if l_modal_variant_0 == "fully_eligible_ftux" then l_Enum_0.ButtonType.Secondary else l_Enum_0.ButtonType.PrimarySystem, 
                onActivated = v112, 
                onDismissed = v97, 
                hideActionButton = not v82 or not v111, 
                ref = v113
            });
        end;
    else
        if l_modal_variant_0 ~= "none" and l_modal_variant_0 ~= nil and not v63[l_modal_variant_0] and (not l_FFlagEnableAEGIS1AppChatBanner_0 or not v76[l_modal_variant_0]) then
            warn("Unsupported ChatLandingModal variant: " .. l_modal_variant_0);
        end;
        if v55 then
            return v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 200)
            }, {
                Layout = v5.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.Name, 
                    Padding = UDim.new(0, 10)
                }), 
                Btn1 = v5.createElement("TextButton", {
                    Text = "DEBUG Show Chat Landing Age Verfication Timed Modal", 
                    Size = UDim2.new(0, 200, 0, 50), 
                    [v5.Event.Activated] = v116
                }), 
                Btn2 = v5.createElement("TextButton", {
                    Text = "DEBUG Fire Age Verified event", 
                    Size = UDim2.new(0, 200, 0, 50), 
                    [v5.Event.Activated] = function() --[[ Line: 491 ]]
                        -- upvalues: l_GetAgeVerifiedChangedSignal_0 (ref)
                        l_GetAgeVerifiedChangedSignal_0():fire();
                    end
                })
            });
        elseif v50 then
            return v5.createElement("TextButton", {
                Text = "DEBUG Show FAE Upsell", 
                Size = UDim2.new(0, 200, 0, 50), 
                [v5.Event.Activated] = v115
            });
        else
            return nil;
        end;
    end;
end);