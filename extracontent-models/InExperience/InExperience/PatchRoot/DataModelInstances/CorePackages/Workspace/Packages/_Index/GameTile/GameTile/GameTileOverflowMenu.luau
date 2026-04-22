local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.AppBlox);
local v5 = require(l_Parent_0.CentralOverlay);
local v6 = require(l_Parent_0.Foundation);
local v7 = require(l_Parent_0.GenericAbuseReporting);
local v8 = require(l_Parent_0.Localization);
local v9 = require(l_Parent_0.Loggers);
local v10 = require(l_Parent_0.LoggingProtocol);
local v11 = require(l_Parent_0.React);
local v12 = require(l_Parent_0.Responsive);
local v13 = require(l_Parent_0.RoactServiceTags);
local v14 = require(l_Parent_0.RoactUtils);
local v15 = require(l_Parent_0.RobloxAppEnums);
local v16 = require(l_Parent_0.RobloxAppHooks);
local v17 = require(l_Parent_0.RobloxAppToastsRodux);
local v18 = require(l_Parent_0.SharedFlags);
local v19 = require(l_Parent_0.UIBlox);
local v20 = require(l_Parent_0.UserSignals);
local v21 = require(l_Parent_0.DiscoveryAnalytics);
local l_Selectors_0 = require(l_Parent_0.NavigationRodux).Selectors;
local l_getOverflowMenuSignalStore_0 = v4.getOverflowMenuSignalStore;
local l_OverflowMenu_0 = v4.OverflowMenu;
local l_CloseCentralOverlay_0 = v5.Thunks.CloseCentralOverlay;
local l_SetCentralOverlay_0 = v5.Actions.SetCentralOverlay;
local l_useTokens_0 = v6.Hooks.useTokens;
local l_Enums_0 = v6.Enums;
local l_IconName_0 = v6.Enums.IconName;
local l_IconSize_0 = v6.Enums.IconSize;
local l_AbuseVector_0 = v7.Enums.AbuseVector;
local l_OpenDynamicAbuseReport_0 = v7.Thunks.OpenDynamicAbuseReport;
local l_useLocalization_0 = v8.Hooks.useLocalization;
local l_mutedError_0 = v9.mutedError;
local l_flaggedMutedError_0 = v9.flaggedMutedError;
local l_default_0 = v10.default;
local l_useLastInput_0 = v12.useLastInput;
local l_RoactNetworking_0 = v13.RoactNetworking;
local l_useDispatch_0 = v14.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v14.Hooks.RoactRodux.useSelector;
local l_CentralOverlayType_0 = v15.CentralOverlayType;
local l_useRoactService_0 = v16.useRoactService;
local l_SetNetworkingErrorToast_0 = v17.Thunks.SetNetworkingErrorToast;
local l_Images_0 = v19.App.ImageSet.Images;
local l_PostSendUserSignal_0 = v20.PostSendUserSignal;
local l_UserSignalTypes_0 = v20.UserSignalTypes;
local l_gameTileOverflowMenuAction_0 = v21.Events.gameTileOverflowMenuAction;
local v48 = require(l_script_FirstAncestor_0.NotInterestedUserSignalTelemetryEventConfigs);
local v49 = require(l_script_FirstAncestor_0.sendNotInterestedFeedbackFormAnalytics);
local v50 = require(l_script_FirstAncestor_0.useGameTileOverflowMenuFocusNavigation);
local l_TileOverflowMenuItems_0 = require(l_script_FirstAncestor_0.GameTileConstants).TileOverflowMenuItems;
local l_FFlagUseNavigationSelectors_0 = v18.FFlagUseNavigationSelectors;
local v53 = game:DefineFastFlag("LuaAppMitigatePopoverPressedOutsideBug", false);
local l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 = v18.FFlagLuaAppGameTileOverflowMenuTelemetry;
local l_FFlagLuaAppMakeDisclaimerOptInForFeedbackForm_0 = v18.FFlagLuaAppMakeDisclaimerOptInForFeedbackForm;
local l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 = v18.FFlagLuaAppNotInterestedFeedbackFormTelemetry;
local l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 = v18.FFlagLuaAppFixExplicitFeedbackTelemetry;
local l_FFlagLuaAppEnableWhyThisAdModal_0 = v18.FFlagLuaAppEnableWhyThisAdModal;
local l_FFlagLuaAppEnableSponsoredReportAd_0 = v18.FFlagLuaAppEnableSponsoredReportAd;
local v60 = game:DefineFastFlag("LuaAppAdjustOverflowMenuVisual", false);
local l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 = v18.FFlagLuaAppSupportSponsoredExplicitFeedback;
local l_FFlagLuaAppUseSnackbarForProvideFeedbackToast_0 = v18.FFlagLuaAppUseSnackbarForProvideFeedbackToast;
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = v18.FFlagLuaAppSduiBadgeDetailsComponents;
local l_FFlagLuaAppFixExplicitFeedbackConsoleTelemetry_0 = v18.FFlagLuaAppFixExplicitFeedbackConsoleTelemetry;
return v11.memo(function(v65) --[[ Line: 93 ]] --[[ Name: GameTileOverflowMenu ]]
    -- upvalues: l_useDispatch_0 (copy), l_useTokens_0 (copy), l_useLastInput_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useLocalization_0 (copy), l_FFlagLuaAppEnableWhyThisAdModal_0 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), v60 (copy), l_getOverflowMenuSignalStore_0 (copy), l_FFlagLuaAppFixExplicitFeedbackConsoleTelemetry_0 (copy), v50 (copy), v11 (copy), l_UserSignalTypes_0 (copy), l_OpenDynamicAbuseReport_0 (copy), l_AbuseVector_0 (copy), l_CloseCentralOverlay_0 (copy), l_default_0 (copy), v48 (copy), l_SetNetworkingErrorToast_0 (copy), l_PostSendUserSignal_0 (copy), l_HttpService_0 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (copy), l_mutedError_0 (copy), l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 (copy), v49 (copy), l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (copy), l_FFlagLuaAppMakeDisclaimerOptInForFeedbackForm_0 (copy), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (copy), l_gameTileOverflowMenuAction_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_FFlagLuaAppUseSnackbarForProvideFeedbackToast_0 (copy), l_Enums_0 (copy), l_Images_0 (copy), l_TileOverflowMenuItems_0 (copy), l_flaggedMutedError_0 (copy), l_IconName_0 (copy), l_useSelector_0 (copy), l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), v53 (copy), l_UserInputService_0 (copy), l_OverflowMenu_0 (copy), v12 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy), l_IconSize_0 (copy)
    local v66 = l_useDispatch_0();
    local v67 = l_useTokens_0();
    local v68 = l_useLastInput_0();
    local v69 = l_useRoactService_0(l_RoactNetworking_0);
    local v70 = l_useLocalization_0({
        notInterested = "Feature.GameDetails.Action.NotInterested", 
        whyThisAd = l_FFlagLuaAppEnableWhyThisAdModal_0 and "Feature.GameDetails.Action.WhyThisAd" or nil, 
        reportAd = l_FFlagLuaAppEnableSponsoredReportAd_0 and "Feature.GameDetails.Action.ReportAd" or nil, 
        dialogTitle = "Feature.GameDetails.Label.ProvideFeedbackTitle", 
        dialogText = "Feature.GameDetails.Message.HelpImproveExperience", 
        checkboxListTitle = "Feature.GameDetails.Message.HidingExperienceQuestion", 
        tooRepetitive = "Feature.GameDetails.Label.TooRepetitive", 
        dontLikeGame = "Feature.GameDetails.Label.DontLikeGame", 
        dontLikeImage = "Feature.GameDetails.Label.DontLikeImage", 
        inappropriateContent = "Feature.GameDetails.Label.InappropriateContent", 
        somethingElse = "Feature.GameDetails.Label.SomethingElse"
    });
    local v71 = v65.collectionId or "";
    local l_menuKey_0 = v65.menuKey;
    local v73 = Vector2.new(1, 0);
    local v74 = UDim2.new(1, if v60 then -v67.Padding.Medium else -v67.Padding.Small, 0, if v60 then v67.Padding.Medium else v67.Padding.Small);
    local v75 = l_getOverflowMenuSignalStore_0();
    local v76 = nil;
    if not l_FFlagLuaAppFixExplicitFeedbackConsoleTelemetry_0 then
        v76 = v50(l_menuKey_0, v65.isSelected, v65.parentRef);
    end;
    local v77 = v11.useMemo(function() --[[ Line: 128 ]]
        -- upvalues: l_UserSignalTypes_0 (ref), v70 (copy)
        return {
            {
                id = l_UserSignalTypes_0.NotInterestedFeedbackItem.TooRepetitive, 
                text = v70.tooRepetitive
            }, 
            {
                id = l_UserSignalTypes_0.NotInterestedFeedbackItem.DontLikeGame, 
                text = v70.dontLikeGame
            }, 
            {
                id = l_UserSignalTypes_0.NotInterestedFeedbackItem.DontLikeImage, 
                text = v70.dontLikeImage
            }, 
            {
                id = l_UserSignalTypes_0.NotInterestedFeedbackItem.InappropriateContent, 
                text = v70.inappropriateContent
            }, 
            {
                id = l_UserSignalTypes_0.NotInterestedFeedbackItem.SomethingElse, 
                text = v70.somethingElse, 
                triggersOtherTextbox = true
            }
        };
    end, {
        v70
    });
    local v87 = v11.useCallback(function(v78, v79) --[[ Line: 155 ]]
        -- upvalues: v77 (copy), l_UserSignalTypes_0 (ref), v66 (copy), l_OpenDynamicAbuseReport_0 (ref), l_AbuseVector_0 (ref), v65 (copy), l_CloseCentralOverlay_0 (ref), l_default_0 (ref), v48 (ref), l_SetNetworkingErrorToast_0 (ref), l_PostSendUserSignal_0 (ref), v69 (copy), l_HttpService_0 (ref), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), v71 (copy), l_mutedError_0 (ref), l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 (ref), v49 (ref), l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (ref)
        local v80 = false;
        local v81 = {};
        for _, v83 in v77 do
            table.insert(v81, {
                id = v83.id, 
                selected = v78[v83.id] or false
            });
            if v83.id == l_UserSignalTypes_0.NotInterestedFeedbackItem.InappropriateContent and v78[v83.id] then
                v80 = true;
            end;
        end;
        if v80 then
            v66(l_OpenDynamicAbuseReport_0({
                abuseVector = l_AbuseVector_0.Place, 
                targetId = v65.universeId, 
                onClose = function() --[[ Line: 174 ]] --[[ Name: onClose ]]
                    -- upvalues: v66 (ref), l_CloseCentralOverlay_0 (ref)
                    v66(l_CloseCentralOverlay_0());
                end
            }));
        end;
        if not v65.appPage then
            l_default_0:logRobloxTelemetryCounter(v48.NotInterestedMissingAppPage, 1);
            v66(l_SetNetworkingErrorToast_0());
            return;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 189 ]]
                -- upvalues: l_PostSendUserSignal_0 (ref), v69 (ref), l_HttpService_0 (ref), l_UserSignalTypes_0 (ref), v79 (copy), v81 (copy), v65 (ref), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), v71 (ref), v66 (ref), l_SetNetworkingErrorToast_0 (ref), l_default_0 (ref), v48 (ref)
                l_PostSendUserSignal_0(v69, {
                    stringValue = l_HttpService_0:JSONEncode({
                        formId = l_UserSignalTypes_0.NotInterestedFeedbackFormId.NotInterestedFeedback1, 
                        titleId = l_UserSignalTypes_0.NotInterestedFeedbackFormTitleId.WhyHideExperience, 
                        textResponse = v79, 
                        items = v81
                    })
                }, {
                    id = v65.universeId, 
                    assetType = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 and v65.isSponsored then l_UserSignalTypes_0.AssetType.SponsoredGame else l_UserSignalTypes_0.AssetType.Game, 
                    signalOrigin = {
                        productSurface = v65.appPage, 
                        topicId = v71, 
                        subIds = {
                            v71
                        }
                    }
                }, l_UserSignalTypes_0.SignalValueType.String, l_UserSignalTypes_0.SignalType.NotInterestedFeedback):catch(function(v84) --[[ Line: 208 ]]
                    -- upvalues: v66 (ref), l_SetNetworkingErrorToast_0 (ref), l_default_0 (ref), v48 (ref)
                    v66(l_SetNetworkingErrorToast_0(v84));
                    l_default_0:logRobloxTelemetryCounter(v48.NotInterestedUserSignalFailed, 1);
                end);
            end);
            if not l_status_0 then
                l_mutedError_0(l_result_0);
            end;
            if l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 then
                v49({
                    ctx = if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then nil else v65.appPage, 
                    universeId = v65.universeId, 
                    sortId = v71, 
                    actionType = "NotInterestedFeedbackFormSubmitted"
                }, if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then v65.appPage else nil);
            end;
            return;
        end;
    end, {
        v69, 
        v77, 
        v70, 
        v65.universeId, 
        v65.appPage, 
        v71, 
        v66, 
        if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v65.isSponsored else nil
    });
    local v88 = nil;
    local v89 = nil;
    if l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 then
        v88 = v11.useCallback(function(v90) --[[ Line: 245 ]]
            -- upvalues: v49 (ref), l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (ref), v65 (copy), v71 (copy)
            if v90 then
                return;
            else
                v49({
                    ctx = if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then nil else v65.appPage, 
                    universeId = v65.universeId, 
                    sortId = v71, 
                    actionType = "NotInterestedFeedbackFormClosedWithoutSubmit"
                }, if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then v65.appPage else nil);
                return;
            end;
        end, {
            v65.appPage, 
            v65.universeId, 
            v71
        });
        v89 = v11.useCallback(function() --[[ Line: 259 ]]
            -- upvalues: v49 (ref), l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (ref), v65 (copy), v71 (copy)
            v49({
                ctx = if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then nil else v65.appPage, 
                universeId = v65.universeId, 
                sortId = v71, 
                actionType = "NotInterestedFeedbackFormOpened"
            }, if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then v65.appPage else nil);
        end, {
            v65.appPage, 
            v65.universeId, 
            v71
        });
    end;
    local v91 = v11.useMemo(function() --[[ Line: 269 ]]
        -- upvalues: v70 (copy), v77 (copy), v87 (copy), l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 (ref), v88 (ref), l_FFlagLuaAppMakeDisclaimerOptInForFeedbackForm_0 (ref)
        return {
            dialogTitle = v70.dialogTitle, 
            dialogText = v70.dialogText, 
            checkboxListTitle = v70.checkboxListTitle, 
            checkboxItems = v77, 
            onSubmit = v87, 
            onClose = if l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 then v88 else nil, 
            showTermsOfUseDisclaimer = not l_FFlagLuaAppMakeDisclaimerOptInForFeedbackForm_0 and nil
        };
    end, {
        v70, 
        v77, 
        v87
    });
    local v92 = nil;
    local v93 = nil;
    if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then
        local v94 = nil;
        if l_FFlagLuaAppEnableWhyThisAdModal_0 then
            local v95 = {};
            for v96, _ in v65.availableMenuItems do
                table.insert(v95, v96);
            end;
            v94 = table.concat(v95, ",");
        else
            v94 = "NotInterested";
        end;
        do
            local l_v94_0 = v94;
            v92 = v11.useCallback(function(v99) --[[ Line: 294 ]]
                -- upvalues: v65 (copy), l_v94_0 (ref)
                if v65.onMenuOpenChanged then
                    v65.onMenuOpenChanged(v99, l_v94_0);
                end;
            end, {
                v65.onMenuOpenChanged, 
                l_v94_0
            });
            v93 = v11.useCallback(function(v100) --[[ Line: 300 ]]
                -- upvalues: l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (ref), v65 (copy), v71 (copy), l_v94_0 (ref), l_gameTileOverflowMenuAction_0 (ref)
                local v101 = {
                    ctx = if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then nil else v65.appPage, 
                    universeId = v65.universeId, 
                    sortId = v71, 
                    actionType = "GameTileOverflowMenuItemActivated", 
                    menuItem = v100, 
                    availableMenuItems = l_v94_0
                };
                l_gameTileOverflowMenuAction_0(v101, if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then v65.appPage else nil);
            end, {
                v65.appPage, 
                v65.universeId, 
                v71, 
                l_v94_0
            });
            if l_FFlagLuaAppFixExplicitFeedbackConsoleTelemetry_0 then
                v76 = v50(l_menuKey_0, v65.isSelected, v65.parentRef, v92);
            end;
        end;
    end;
    local v105 = v11.useCallback(function() --[[ Line: 323 ]]
        -- upvalues: v65 (copy), l_default_0 (ref), v48 (ref), v66 (copy), l_SetNetworkingErrorToast_0 (ref), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v91 (copy), l_FFlagLuaAppUseSnackbarForProvideFeedbackToast_0 (ref), l_Enums_0 (ref), l_Images_0 (ref), l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 (ref), v89 (ref), l_PostSendUserSignal_0 (ref), v69 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), l_UserSignalTypes_0 (ref), v71 (copy), l_mutedError_0 (ref), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (ref), v93 (ref), l_TileOverflowMenuItems_0 (ref)
        if not v65.appPage then
            l_default_0:logRobloxTelemetryCounter(v48.NotInterestedMissingAppPage, 1);
            v66(l_SetNetworkingErrorToast_0());
            return;
        else
            v65.setGameHidden(v65.universeId, true);
            v66(l_SetCentralOverlay_0(l_CentralOverlayType_0.ProvideFeedbackToast, {
                feedbackFormProps = v91, 
                toastIcon = if l_FFlagLuaAppUseSnackbarForProvideFeedbackToast_0 then l_Enums_0.IconName.CircleMinus else l_Images_0["icons/actions/edit/remove"], 
                onToastActivated = if l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 then v89 else nil
            }));
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 342 ]]
                -- upvalues: l_PostSendUserSignal_0 (ref), v69 (ref), v65 (ref), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), l_UserSignalTypes_0 (ref), v71 (ref), v66 (ref), l_SetNetworkingErrorToast_0 (ref), l_default_0 (ref), v48 (ref)
                l_PostSendUserSignal_0(v69, {
                    boolValue = true
                }, {
                    id = v65.universeId, 
                    assetType = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 and v65.isSponsored then l_UserSignalTypes_0.AssetType.SponsoredGame else l_UserSignalTypes_0.AssetType.Game, 
                    signalOrigin = {
                        productSurface = v65.appPage, 
                        topicId = v71, 
                        subIds = {
                            v71
                        }
                    }
                }, l_UserSignalTypes_0.SignalValueType.Bool, l_UserSignalTypes_0.SignalType.NotInterested):catch(function(v102) --[[ Line: 356 ]]
                    -- upvalues: v65 (ref), v66 (ref), l_SetNetworkingErrorToast_0 (ref), l_default_0 (ref), v48 (ref)
                    v65.setGameHidden(v65.universeId, false);
                    v66(l_SetNetworkingErrorToast_0(v102));
                    l_default_0:logRobloxTelemetryCounter(v48.NotInterestedUserSignalFailed, 1);
                end);
            end);
            if not l_status_1 then
                v65.setGameHidden(v65.universeId, false);
                l_mutedError_0(l_result_1);
            end;
            if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then
                v93(l_TileOverflowMenuItems_0.NotInterested);
            end;
            return;
        end;
    end, {
        v69, 
        v65.setGameHidden, 
        v66, 
        v91, 
        v65.universeId, 
        v71, 
        v65.appPage, 
        if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then v93 else nil, 
        if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v65.isSponsored else nil
    });
    local v106 = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v11.useCallback(function() --[[ Line: 391 ]]
        -- upvalues: v66 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v65 (copy), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (ref), v93 (ref), l_TileOverflowMenuItems_0 (ref)
        v66(l_SetCentralOverlay_0(l_CentralOverlayType_0.WhyThisAdModal, {
            universeId = v65.universeId, 
            payerName = v65.payerName, 
            sponsoredUserCohort = v65.sponsoredUserCohort
        }));
        if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then
            v93(l_TileOverflowMenuItems_0.WhyThisAd);
        end;
    end, {
        v66, 
        v65.universeId, 
        v65.payerName, 
        v65.sponsoredUserCohort, 
        if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then v93 else nil
    }) else nil;
    local v107 = if l_FFlagLuaAppEnableSponsoredReportAd_0 then v11.useCallback(function() --[[ Line: 414 ]]
        -- upvalues: v65 (copy), l_flaggedMutedError_0 (ref), v66 (copy), l_OpenDynamicAbuseReport_0 (ref), l_AbuseVector_0 (ref), l_CloseCentralOverlay_0 (ref), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (ref), v93 (ref), l_TileOverflowMenuItems_0 (ref)
        if not v65.adId then
            l_flaggedMutedError_0("ReportSponsoredAdError", "Report ad clicked without valid target ad id");
            return;
        else
            v66(l_OpenDynamicAbuseReport_0({
                abuseVector = l_AbuseVector_0.AdV2, 
                targetId = v65.adId, 
                onClose = function() --[[ Line: 423 ]] --[[ Name: onClose ]]
                    -- upvalues: v66 (ref), l_CloseCentralOverlay_0 (ref)
                    v66(l_CloseCentralOverlay_0());
                end
            }));
            if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then
                v93(l_TileOverflowMenuItems_0.ReportAd);
            end;
            return;
        end;
    end, {
        v66, 
        v65.adId, 
        if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then v93 else nil
    }) else nil;
    local v109 = v11.useMemo(function() --[[ Line: 441 ]]
        -- upvalues: l_FFlagLuaAppEnableWhyThisAdModal_0 (ref), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), v65 (copy), l_TileOverflowMenuItems_0 (ref), v70 (copy), v105 (copy), v106 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (ref), l_IconName_0 (ref), v107 (copy)
        if l_FFlagLuaAppEnableWhyThisAdModal_0 then
            local v108 = {};
            if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 and v65.availableMenuItems[l_TileOverflowMenuItems_0.NotInterested] then
                table.insert(v108, {
                    icon = "icons/actions/block", 
                    id = l_TileOverflowMenuItems_0.NotInterested, 
                    text = v70.notInterested, 
                    onActivated = v105
                });
            end;
            if v65.availableMenuItems[l_TileOverflowMenuItems_0.WhyThisAd] then
                table.insert(v108, {
                    icon = "icons/actions/info", 
                    id = l_TileOverflowMenuItems_0.WhyThisAd, 
                    text = v70.whyThisAd, 
                    onActivated = v106
                });
            end;
            if l_FFlagLuaAppEnableSponsoredReportAd_0 and v65.availableMenuItems[l_TileOverflowMenuItems_0.ReportAd] then
                table.insert(v108, {
                    icon = l_IconName_0.Flag, 
                    id = l_TileOverflowMenuItems_0.ReportAd, 
                    text = v70.reportAd, 
                    onActivated = v107
                });
            end;
            if not l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 and v65.availableMenuItems[l_TileOverflowMenuItems_0.NotInterested] then
                table.insert(v108, {
                    icon = "icons/actions/block", 
                    id = l_TileOverflowMenuItems_0.NotInterested, 
                    text = v70.notInterested, 
                    onActivated = v105
                });
            end;
            return v108;
        else
            return {
                {
                    icon = "icons/actions/block", 
                    id = l_TileOverflowMenuItems_0.NotInterested, 
                    text = v70.notInterested, 
                    onActivated = v105
                }
            };
        end;
    end, {
        v105, 
        v70, 
        if l_FFlagLuaAppEnableWhyThisAdModal_0 then v106 else nil, 
        if l_FFlagLuaAppEnableWhyThisAdModal_0 then v65.isSponsored else nil, 
        v65.availableMenuItems
    });
    local v111 = l_useSelector_0(function(v110) --[[ Line: 508 ]]
        -- upvalues: l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref)
        if l_FFlagUseNavigationSelectors_0 then
            return l_Selectors_0.selectCurrentRoactNavigationRoute(v110).key or "";
        else
            return v110.Navigation.currentRoute.key or "";
        end;
    end);
    local v112 = v11.useRef(v111);
    v11.useEffect(function() --[[ Line: 516 ]]
        -- upvalues: v111 (copy), v112 (copy), v75 (copy), l_menuKey_0 (copy)
        if v111 ~= v112.current then
            v75.closeMenu(l_menuKey_0);
        end;
    end, {
        v111, 
        l_menuKey_0
    });
    if v53 then
        v11.useEffect(function() --[[ Line: 523 ]]
            -- upvalues: v65 (copy), l_UserInputService_0 (ref), v75 (copy), l_menuKey_0 (copy)
            local v113 = nil;
            if v65.menuOpen then
                v113 = l_UserInputService_0.InputBegan:Connect(function(v114, _) --[[ Line: 527 ]]
                    -- upvalues: v65 (ref), v75 (ref), l_menuKey_0 (ref)
                    if v114.UserInputType == Enum.UserInputType.MouseButton1 and not v65.isHovered then
                        v75.closeMenu(l_menuKey_0);
                    end;
                end);
            end;
            return function() --[[ Line: 536 ]]
                -- upvalues: v113 (ref)
                if v113 then
                    v113:Disconnect();
                end;
            end;
        end, {
            v65.menuOpen, 
            v65.isHovered, 
            l_menuKey_0
        });
    end;
    return v11.createElement(l_OverflowMenu_0, {
        anchorPoint = v73, 
        anchorPosition = v74, 
        menuItems = v109, 
        hasOverflowButton = v68 == v12.Input.Pointer, 
        shouldShowAnchor = v65.isHovered, 
        buttonIconBackgroundStyle = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v67.Color.OverMedia.OverMedia_0 else nil, 
        menuKey = l_menuKey_0, 
        setFocusRef = v76, 
        onMenuOpenChanged = if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then v92 else nil, 
        buttonIconSize = if v60 then l_IconSize_0.Small else nil
    });
end);