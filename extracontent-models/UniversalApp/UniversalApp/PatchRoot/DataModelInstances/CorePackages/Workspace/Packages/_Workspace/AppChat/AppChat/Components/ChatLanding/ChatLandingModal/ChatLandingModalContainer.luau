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
local l_useSocialUpsellOverlayController_0 = v28.Hooks.useSocialUpsellOverlayController;
local l_AccessResponseEnum_0 = require(l_Parent_0.AmpUpsell).AmpEnums.AccessResponseEnum;
local v36 = require(l_Parent_0.AppChatNetworking);
local l_ChatLandingModalVariant_0 = v36.Constants.ChatLandingModalVariant;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v41 = require(l_script_FirstAncestor_0.Conversations.Thunks.refreshAllUnfilteredThreadsDetails);
local v42 = require(l_script_FirstAncestor_0.Components.UnfilteredThreadsAMPFeatureName);
local v43 = require(l_script_FirstAncestor_0.Conversations.Thunks.OpenTcLearnMoreLink);
local v44 = require(l_script_FirstAncestor_0.Models.ModalConfiguration);
local v45 = require(l_script_FirstAncestor_0.Utils.createBannerConfigFromModalConfiguration);
local v46 = require(l_script_FirstAncestor_0.Components.FaeBanner.AppChatFAEBanner);
local v47 = require(l_script_FirstAncestor_0.Flags.FIntAppChatModalSeenImpressionDelayMs);
local v48 = require(l_script_FirstAncestor_0.Flags.FFlagDebugAppChatFae);
local l_FStringCanAccessTrustedContactsAmpFeature_0 = require(l_Parent_0.SharedFlags).FStringCanAccessTrustedContactsAmpFeature;
local l_FStringCanAccessTrustedContactsAmpNameSpace_0 = require(l_Parent_0.SharedFlags).FStringCanAccessTrustedContactsAmpNameSpace;
local l_FFlagEnableSocialUpsellUIFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableSocialUpsellUIFixes;
local l_FFlagEnableAEGIS2CommsFAEUpsell_0 = require(l_Parent_0.SharedFlags).FFlagEnableAEGIS2CommsFAEUpsell;
local v53 = require(l_script_FirstAncestor_0.Flags.FFlagDebugAEGIS1AppChatBanner);
local l_FFlagEnableAEGIS2AppChatBanner_0 = require(l_Parent_0.SharedFlags).FFlagEnableAEGIS2AppChatBanner;
local v55 = require(l_Parent_0.SocialExperiments);
local l_FFlagTestDeviceForFAEUpsell_0 = require(l_Parent_0.SocialExperiments).FFlagTestDeviceForFAEUpsell;
local l_deviceMeetsRequirementsForFAE_0 = v55.deviceMeetsRequirementsForFAE;
local l_startFacialAgeEstimation_0 = v28.Thunks.startFacialAgeEstimation;
local l_GetAgeVerifiedChangedSignal_0 = v28.Signals.GetAgeVerifiedChangedSignal;
local v60 = require(script.Parent.ChatLandingModal);
local v61 = {
    fully_eligible_ftux = true, 
    party_only_ftux = true, 
    phone_verify = true, 
    [l_ChatLandingModalVariant_0.AgeAssuranceUpsell] = true
};
local v62 = {
    fully_eligible_ftux = "ChatLandingUnfilteredThreadsFtux", 
    phone_verify = "ChatLandingPvUpsell"
};
return l_memo_0(function(_) --[[ Line: 86 ]] --[[ Name: ChatLandingModalContainer ]]
    -- upvalues: l_useDispatch_0 (copy), v9 (copy), l_useContext_0 (copy), v6 (copy), l_useNavigation_0 (copy), l_useState_0 (copy), v15 (copy), l_useSelector_0 (copy), v44 (copy), v7 (copy), v5 (copy), l_ChatLandingModalVariant_0 (copy), l_FFlagEnableAEGIS2CommsFAEUpsell_0 (copy), v62 (copy), v61 (copy), l_FFlagEnableAEGIS1AppChatBanner_0 (copy), l_FFlagEnableAEGIS2AppChatBanner_0 (copy), v26 (copy), v24 (copy), l_useEffectOnMount_0 (copy), l_useEffect_0 (copy), v23 (copy), l_useCallback_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v42 (copy), l_NavigateBack_0 (copy), l_AccessResponseEnum_0 (copy), v41 (copy), l_HttpService_0 (copy), l_FStringCanAccessTrustedContactsAmpFeature_0 (copy), l_FStringCanAccessTrustedContactsAmpNameSpace_0 (copy), v25 (copy), v48 (copy), v53 (copy), v43 (copy), v36 (copy), v4 (copy), v18 (copy), v29 (copy), l_useSocialUpsellOverlayController_0 (copy), l_startFacialAgeEstimation_0 (copy), v28 (copy), l_UpsellEntrySurfaceType_0 (copy), l_UpsellComponent_0 (copy), l_useRef_0 (copy), v21 (copy), v22 (copy), v47 (copy), l_FFlagTestDeviceForFAEUpsell_0 (copy), l_deviceMeetsRequirementsForFAE_0 (copy), l_FFlagEnableSocialUpsellUIFixes_0 (copy), l_UpsellBanner_0 (copy), v45 (copy), v46 (copy), v60 (copy), l_Enum_0 (copy), l_GetAgeVerifiedChangedSignal_0 (copy)
    local v64 = l_useDispatch_0();
    local v65 = v9();
    local v66 = l_useContext_0(v6);
    local v67 = l_useNavigation_0();
    local v68, v69 = l_useState_0({});
    local v70 = v15();
    local v73 = l_useSelector_0(function(v71) --[[ Line: 95 ]]
        -- upvalues: v44 (ref), v7 (ref)
        local l_default_0 = v44.default;
        return v7(v71, "ChatAppReducer.Modals.chatLandingModal") or l_default_0;
    end);
    local v74 = v5.useMemo(function() --[[ Line: 100 ]]
        -- upvalues: l_ChatLandingModalVariant_0 (ref), l_FFlagEnableAEGIS2CommsFAEUpsell_0 (ref), v70 (copy)
        return {
            [l_ChatLandingModalVariant_0.ChatLandingAgeVerifiedCommsTimedModal] = l_FFlagEnableAEGIS2CommsFAEUpsell_0 or not v70
        };
    end, {
        v70
    });
    local l_modal_variant_0 = v73.modal_variant;
    local v76 = v7(v73, "modal_layout.id");
    local v77 = v7(v73, "modal_layout.seen_record_action");
    local v78 = v7(v73, "modal_layout.dismissed_record_action");
    local v79 = v7(v73, "modal_layout.buttons");
    local v80 = v79 and v79[1];
    local v81 = v62[l_modal_variant_0];
    local v82 = (not not v61[l_modal_variant_0] or l_FFlagEnableAEGIS1AppChatBanner_0 and v74[l_modal_variant_0] or l_FFlagEnableAEGIS2AppChatBanner_0 and l_modal_variant_0 == l_ChatLandingModalVariant_0.ChatLandingAgeVerifiedCommsUpsellModal) and not v68[l_modal_variant_0];
    local v83 = v26(v24.Context);
    l_useEffectOnMount_0(function() --[[ Line: 124 ]]
        -- upvalues: v65 (copy), v81 (copy), v82 (copy)
        if v65 and v81 and v82 then
            v65.fireAnalyticsEvent((("%*Rendered"):format(v81)));
        end;
    end);
    l_useEffect_0(function() --[[ Line: 129 ]]
        -- upvalues: v82 (copy), l_modal_variant_0 (copy), l_ChatLandingModalVariant_0 (ref), v83 (copy), v23 (ref)
        if v82 and l_modal_variant_0 == l_ChatLandingModalVariant_0.AgeAssuranceUpsell then
            v83.emit(v23.Events.FaeModalShown, {});
        end;
        if v82 then
            v83.emit(v23.Events.ModalRendered, {
                modalVariant = l_modal_variant_0
            });
        end;
    end, {
        l_modal_variant_0, 
        v82
    });
    local v86 = l_useCallback_0(function() --[[ Line: 140 ]]
        -- upvalues: v65 (copy), v81 (copy), v64 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v42 (ref), l_NavigateBack_0 (ref), l_AccessResponseEnum_0 (ref), v41 (ref), v70 (copy)
        if v65 and v81 then
            v65.fireAnalyticsEvent((("%*ContinueClicked"):format(v81)));
        end;
        v64(l_NavigateDown_0({
            name = l_AppPage_0.AmpWizardContainer, 
            extraProps = {
                featureName = v42, 
                completionCallback = function(v84, _) --[[ Line: 148 ]] --[[ Name: completionCallback ]]
                    -- upvalues: v64 (ref), l_NavigateBack_0 (ref), l_AccessResponseEnum_0 (ref), v65 (ref), v81 (ref), v41 (ref), v70 (ref)
                    v64(l_NavigateBack_0(true));
                    if v84 == l_AccessResponseEnum_0.Granted then
                        if v65 and v81 then
                            v65.fireAnalyticsEvent((("%*Succeeded"):format(v81)));
                        end;
                        v64(v41(nil, v70));
                        return;
                    else
                        if v65 and v81 then
                            v65.fireAnalyticsEvent((("%*Failed"):format(v81)));
                        end;
                        return;
                    end;
                end
            }
        }));
    end, {
        v64, 
        v65, 
        v81
    });
    local v90 = l_useCallback_0(function() --[[ Line: 166 ]]
        -- upvalues: l_HttpService_0 (ref), v83 (copy), v23 (ref), v64 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_FStringCanAccessTrustedContactsAmpFeature_0 (ref), l_FStringCanAccessTrustedContactsAmpNameSpace_0 (ref), l_NavigateBack_0 (ref), l_AccessResponseEnum_0 (ref), l_modal_variant_0 (copy), v25 (ref), v41 (ref), v70 (copy), v48 (ref), v53 (ref)
        local v87 = l_HttpService_0:GenerateGUID(false);
        v83.emit(v23.Events.TelemetryFaeButtonClick, {
            state = v87, 
            btn = v23.Constants.ConfirmFaeBtn
        });
        v64(l_NavigateDown_0({
            name = l_AppPage_0.AmpWizardContainer, 
            extraProps = {
                featureName = l_FStringCanAccessTrustedContactsAmpFeature_0, 
                entryPointEventCtx = v23.Constants.EventStreamCtx, 
                metadata = {
                    sessionId = v87
                }, 
                nameSpace = l_FStringCanAccessTrustedContactsAmpNameSpace_0, 
                completionCallback = function(v88, _) --[[ Line: 181 ]] --[[ Name: completionCallback ]]
                    -- upvalues: v64 (ref), l_NavigateBack_0 (ref), l_AccessResponseEnum_0 (ref), v83 (ref), v23 (ref), l_modal_variant_0 (ref), v25 (ref), v41 (ref), v70 (ref), v48 (ref), v53 (ref)
                    v64(l_NavigateBack_0(true));
                    if v88 == l_AccessResponseEnum_0.Granted then
                        v83.emit(v23.Events.ModalActionResult, {
                            modalVariant = l_modal_variant_0, 
                            action = v25.Enums.ModalActions.PrimaryCta, 
                            actionResult = v25.Enums.ModalActionResults.Success
                        });
                        v64(v41(nil, v70));
                    else
                        v83.emit(v23.Events.ModalActionResult, {
                            modalVariant = l_modal_variant_0, 
                            action = v25.Enums.ModalActions.PrimaryCta, 
                            actionResult = v25.Enums.ModalActionResults.Failure
                        });
                    end;
                    if v48 or v53 then
                        v64({
                            type = "DEBUG_DismissChatLandingModal"
                        });
                    end;
                end
            }
        }));
    end, {
        v64, 
        v70, 
        v83, 
        l_modal_variant_0
    });
    local v92 = l_useCallback_0(function() --[[ Line: 215 ]]
        -- upvalues: v65 (copy), v81 (copy), v67 (copy), v66 (copy)
        if v65 and v81 then
            v65.fireAnalyticsEvent((("%*LearnMoreClicked"):format(v81)));
        end;
        local v91 = if v67 then v67.navigate else nil;
        v66.navigateToUnfilteredThreadsLearnMore(v91);
    end, {
        v66, 
        v65, 
        v67, 
        v81
    });
    local v93 = l_useCallback_0(function() --[[ Line: 229 ]]
        -- upvalues: v64 (copy), v43 (ref)
        v64(v43());
    end, {
        v64
    });
    local v95 = l_useCallback_0(function() --[[ Line: 233 ]]
        -- upvalues: v65 (copy), v81 (copy), l_modal_variant_0 (copy), l_ChatLandingModalVariant_0 (ref), v83 (copy), v23 (ref), l_HttpService_0 (ref), v25 (ref), v64 (copy), v36 (ref), v78 (copy), v76 (copy), v48 (ref), v53 (ref), v69 (copy), v4 (ref), v68 (copy)
        if v65 and v81 then
            v65.fireAnalyticsEvent((("%*Dismissed"):format(v81)));
        end;
        if l_modal_variant_0 == l_ChatLandingModalVariant_0.AgeAssuranceUpsell then
            v83.emit(v23.Events.TelemetryFaeButtonClick, {
                state = l_HttpService_0:GenerateGUID(false), 
                btn = v23.Constants.CancelFaeBtn
            });
        end;
        v83.emit(v23.Events.ModalAction, {
            modalVariant = l_modal_variant_0, 
            action = v25.Enums.ModalActions.Dismiss
        });
        v64(v36.rodux.RecordModalSequenceResponse.API(v78, "chat_landing_modal", v76)):catch(function(v94) --[[ Line: 253 ]]
            warn("Error in ChatLandingModalContainer -> RecordModalSequenceResponse dismissed: " .. tostring(v94), v94);
        end);
        if v48 and l_modal_variant_0 == l_ChatLandingModalVariant_0.AgeAssuranceUpsell or v53 and l_modal_variant_0 == l_ChatLandingModalVariant_0.ChatLandingAgeVerifiedCommsTimedModal then
            v64({
                type = "DEBUG_DismissChatLandingModal"
            });
            return;
        else
            v69(v4.Dictionary.join(v68, {
                [l_modal_variant_0] = true
            }));
            return;
        end;
    end, {
        v68, 
        v69, 
        v64, 
        v65, 
        v81, 
        v78, 
        l_modal_variant_0, 
        v76, 
        v83
    });
    local v96 = nil;
    local v97 = nil;
    local v98 = nil;
    local v99 = nil;
    if l_FFlagEnableAEGIS1AppChatBanner_0 then
        v96 = v18();
        v99 = v29.Hooks.useTokens();
        local v100 = l_useSocialUpsellOverlayController_0(v70);
        v97 = v5.useCallback(function(_) --[[ Line: 296 ]]
            -- upvalues: l_modal_variant_0 (copy), l_ChatLandingModalVariant_0 (ref), v64 (copy), l_startFacialAgeEstimation_0 (ref), v28 (ref), l_UpsellEntrySurfaceType_0 (ref), l_FFlagEnableAEGIS2CommsFAEUpsell_0 (ref), v70 (copy)
            if l_modal_variant_0 == l_ChatLandingModalVariant_0.ChatLandingAgeVerifiedCommsTimedModal then
                v64(l_startFacialAgeEstimation_0(v28.Enums.SocialUpsellType.FacialAgeEstimation .. l_UpsellEntrySurfaceType_0.PartyTab, nil, nil, l_UpsellEntrySurfaceType_0.PartyTab, if l_FFlagEnableAEGIS2CommsFAEUpsell_0 then v70 else nil));
            end;
        end, {
            v64, 
            l_modal_variant_0, 
            v70
        });
        v98 = v5.useCallback(function(v102) --[[ Line: 309 ]]
            -- upvalues: l_modal_variant_0 (copy), l_ChatLandingModalVariant_0 (ref), v100 (copy), v28 (ref), l_UpsellEntrySurfaceType_0 (ref), l_UpsellComponent_0 (ref)
            if l_modal_variant_0 == l_ChatLandingModalVariant_0.ChatLandingAgeVerifiedCommsTimedModal then
                v100.openSocialOverlay(v28.Enums.SocialUpsellType.FacialAgeEstimation, {
                    upsellEntrySurface = l_UpsellEntrySurfaceType_0.PartyTab, 
                    upsellEntryComponent = l_UpsellComponent_0.Banner, 
                    impressionId = v102
                });
            end;
        end, {
            l_modal_variant_0, 
            v100.openSocialOverlay
        });
    end;
    local v103 = ({
        [l_ChatLandingModalVariant_0.AgeAssuranceUpsell] = v93
    })[l_modal_variant_0];
    local v104 = l_useCallback_0(function(...) --[[ Line: 325 ]]
        -- upvalues: v83 (copy), v23 (ref), l_modal_variant_0 (copy), v25 (ref), v103 (copy)
        v83.emit(v23.Events.ModalAction, {
            modalVariant = l_modal_variant_0, 
            action = v25.Enums.ModalActions.InlineCta
        });
        v103(...);
    end, {
        v103, 
        v83, 
        l_modal_variant_0
    });
    local v105 = v73 and v73.modal_layout and v73.modal_layout.body and v73.modal_layout.body.additional_content or {};
    local v108 = v5.useMemo(function() --[[ Line: 338 ]]
        -- upvalues: v4 (ref), v105 (copy), v36 (ref), v104 (copy)
        return v4.List.map(v105, function(v106) --[[ Line: 339 ]]
            -- upvalues: v36 (ref), v104 (ref)
            local v107 = {
                type = v106.type, 
                text = v106.text
            };
            if v106.type == v36.Constants.ModalContentType.Link then
                v107.onActivated = v104;
            end;
            return v107;
        end);
    end, {
        v105, 
        v103, 
        v104
    });
    local v109 = ({
        phone_verify = v86, 
        fully_eligible_ftux = v92, 
        [l_ChatLandingModalVariant_0.AgeAssuranceUpsell] = v90
    })[l_modal_variant_0];
    local v110 = l_useCallback_0(function(...) --[[ Line: 357 ]]
        -- upvalues: v83 (copy), v23 (ref), l_modal_variant_0 (copy), v25 (ref), v109 (copy)
        v83.emit(v23.Events.ModalAction, {
            modalVariant = l_modal_variant_0, 
            action = v25.Enums.ModalActions.PrimaryCta
        });
        v109(...);
    end, {
        v109, 
        v83, 
        l_modal_variant_0
    });
    local v111 = l_useRef_0(nil);
    local v112 = v21(v111, {
        v111.current, 
        v82
    });
    v22({
        modalSequence = "chat_landing_modal", 
        modalId = v76, 
        actionToRecord = v77, 
        delayMs = v47, 
        canRecordAction = v112 and v82
    });
    local v113 = if v48 then v5.useCallback(function() --[[ Line: 376 ]]
        -- upvalues: v64 (copy)
        v64({
            type = "DEBUG_ShowAppChatFaeUpsell"
        });
    end, {
        v64
    }) else function() --[[ Line: 381 ]]

    end;
    local v114 = if v53 then v5.useCallback(function() --[[ Line: 384 ]]
        -- upvalues: v64 (copy)
        v64({
            type = "DEBUG_ShowChatLandingAgeVerifiedTimedModal"
        });
    end, {
        v64
    }) else nil;
    if l_FFlagTestDeviceForFAEUpsell_0 and not l_deviceMeetsRequirementsForFAE_0() then
        return nil;
    elseif v82 then
        if l_FFlagEnableAEGIS1AppChatBanner_0 and v74[l_modal_variant_0] then
            return v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                ContentPadding = v5.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 1), 
                    PaddingBottom = UDim.new(0, if l_FFlagEnableSocialUpsellUIFixes_0 then v99.Size.Size_400 else v99.Size.Size_700), 
                    PaddingLeft = UDim.new(0, v96.left), 
                    PaddingRight = UDim.new(0, v96.right)
                }), 
                UpsellBanner = v5.createElement(l_UpsellBanner_0, {
                    config = v45(v73), 
                    onPrimaryAction = v97, 
                    onSecondaryAction = v98, 
                    onDismiss = v95, 
                    upsellEntrySurface = l_UpsellEntrySurfaceType_0.PartyTab, 
                    upsellEntryComponent = l_UpsellComponent_0.Banner
                })
            });
        elseif l_FFlagEnableAEGIS2AppChatBanner_0 and l_modal_variant_0 == l_ChatLandingModalVariant_0.ChatLandingAgeVerifiedCommsUpsellModal then
            return v5.createElement(v46, {
                modalConfiguration = v73, 
                onDismiss = v95
            });
        else
            return v5.createElement(v60, {
                titleLabelText = v7(v73, "modal_layout.label.text"), 
                titleText = v7(v73, "modal_layout.header.text"), 
                bodyText = v7(v73, "modal_layout.body.text"), 
                additionalContent = v108, 
                actionText = v80 and v80.text, 
                buttonType = if l_modal_variant_0 == "fully_eligible_ftux" then l_Enum_0.ButtonType.Secondary else l_Enum_0.ButtonType.PrimarySystem, 
                onActivated = v110, 
                onDismissed = v95, 
                hideActionButton = not v80 or not v109, 
                ref = v111
            });
        end;
    else
        if l_modal_variant_0 ~= "none" and l_modal_variant_0 ~= nil and not v61[l_modal_variant_0] and (not l_FFlagEnableAEGIS1AppChatBanner_0 or not v74[l_modal_variant_0]) then
            warn("Unsupported ChatLandingModal variant: " .. l_modal_variant_0);
        end;
        if v53 then
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
                    [v5.Event.Activated] = v114
                }), 
                Btn2 = v5.createElement("TextButton", {
                    Text = "DEBUG Fire Age Verified event", 
                    Size = UDim2.new(0, 200, 0, 50), 
                    [v5.Event.Activated] = function() --[[ Line: 476 ]]
                        -- upvalues: l_GetAgeVerifiedChangedSignal_0 (ref)
                        l_GetAgeVerifiedChangedSignal_0():fire();
                    end
                })
            });
        elseif v48 then
            return v5.createElement("TextButton", {
                Text = "DEBUG Show FAE Upsell", 
                Size = UDim2.new(0, 200, 0, 50), 
                [v5.Event.Activated] = v113
            });
        else
            return nil;
        end;
    end;
end);