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
local v22 = require(l_script_FirstAncestor_0.GameTileTypes);
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
local l_HiddenTileType_0 = v22.HiddenTileType;
local v49 = require(l_script_FirstAncestor_0.NotInterestedUserSignalTelemetryEventConfigs);
local v50 = require(l_script_FirstAncestor_0.sendNotInterestedFeedbackFormAnalytics);
local v51 = require(l_script_FirstAncestor_0.useGameTileOverflowMenuFocusNavigation);
local l_TileOverflowMenuItems_0 = require(l_script_FirstAncestor_0.GameTileConstants).TileOverflowMenuItems;
local l_FFlagFeedbackFormDynamicAbuseReporting_0 = v18.FFlagFeedbackFormDynamicAbuseReporting;
local l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 = v18.FFlagExplicitFeedbackAddNetworkingErrorToast;
local v55 = game:DefineFastFlag("LuaAppMitigatePopoverPressedOutsideBug", false);
local l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 = v18.FFlagLuaAppGameTileOverflowMenuTelemetry;
local l_FFlagLuaAppMakeDisclaimerOptInForFeedbackForm_0 = v18.FFlagLuaAppMakeDisclaimerOptInForFeedbackForm;
local l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 = v18.FFlagLuaAppNotInterestedFeedbackFormTelemetry;
local l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 = v18.FFlagLuaAppFixExplicitFeedbackTelemetry;
local l_FFlagLuaAppEnableWhyThisAdModal_0 = v18.FFlagLuaAppEnableWhyThisAdModal;
local l_FFlagLuaAppEnableSponsoredReportAd_0 = v18.FFlagLuaAppEnableSponsoredReportAd;
local v62 = game:DefineFastFlag("LuaAppAdjustOverflowMenuVisual", false);
local l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 = v18.FFlagLuaAppExplicitFeedbackSmallGeneralFixes;
local l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 = v18.FFlagLuaAppRemoveSponsoredReportHiddenState;
local l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 = v18.FFlagLuaAppSupportSponsoredExplicitFeedback;
local l_FFlagLuaAppUseSnackbarForProvideFeedbackToast_0 = v18.FFlagLuaAppUseSnackbarForProvideFeedbackToast;
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = v18.FFlagLuaAppSduiBadgeDetailsComponents;
local l_FFlagLuaAppFixExplicitFeedbackConsoleTelemetry_0 = v18.FFlagLuaAppFixExplicitFeedbackConsoleTelemetry;
return v11.memo(function(v69) --[[ Line: 102 ]] --[[ Name: GameTileOverflowMenu ]]
    -- upvalues: l_useDispatch_0 (copy), l_useTokens_0 (copy), l_useLastInput_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useLocalization_0 (copy), l_FFlagLuaAppEnableWhyThisAdModal_0 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), v62 (copy), l_getOverflowMenuSignalStore_0 (copy), l_FFlagLuaAppFixExplicitFeedbackConsoleTelemetry_0 (copy), v51 (copy), v11 (copy), l_UserSignalTypes_0 (copy), l_FFlagFeedbackFormDynamicAbuseReporting_0 (copy), l_OpenDynamicAbuseReport_0 (copy), l_AbuseVector_0 (copy), l_CloseCentralOverlay_0 (copy), l_default_0 (copy), v49 (copy), l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 (copy), l_SetNetworkingErrorToast_0 (copy), l_PostSendUserSignal_0 (copy), l_HttpService_0 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (copy), l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 (copy), l_mutedError_0 (copy), l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 (copy), v50 (copy), l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (copy), l_FFlagLuaAppMakeDisclaimerOptInForFeedbackForm_0 (copy), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (copy), l_gameTileOverflowMenuAction_0 (copy), l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 (copy), l_HiddenTileType_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_FFlagLuaAppUseSnackbarForProvideFeedbackToast_0 (copy), l_Enums_0 (copy), l_Images_0 (copy), l_TileOverflowMenuItems_0 (copy), l_flaggedMutedError_0 (copy), l_IconName_0 (copy), l_useSelector_0 (copy), v55 (copy), l_UserInputService_0 (copy), l_OverflowMenu_0 (copy), v12 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy), l_IconSize_0 (copy)
    local v70 = l_useDispatch_0();
    local v71 = l_useTokens_0();
    local v72 = l_useLastInput_0();
    local v73 = l_useRoactService_0(l_RoactNetworking_0);
    local v74 = l_useLocalization_0({
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
    local v75 = v69.collectionId or "";
    local l_menuKey_0 = v69.menuKey;
    local v77 = Vector2.new(1, 0);
    local v78 = UDim2.new(1, if v62 then -v71.Padding.Medium else -v71.Padding.Small, 0, if v62 then v71.Padding.Medium else v71.Padding.Small);
    local v79 = l_getOverflowMenuSignalStore_0();
    local v80 = nil;
    if not l_FFlagLuaAppFixExplicitFeedbackConsoleTelemetry_0 then
        v80 = v51(l_menuKey_0, v69.isSelected, v69.parentRef);
    end;
    local v81 = v11.useMemo(function() --[[ Line: 137 ]]
        -- upvalues: l_UserSignalTypes_0 (ref), v74 (copy)
        return {
            {
                id = l_UserSignalTypes_0.NotInterestedFeedbackItem.TooRepetitive, 
                text = v74.tooRepetitive
            }, 
            {
                id = l_UserSignalTypes_0.NotInterestedFeedbackItem.DontLikeGame, 
                text = v74.dontLikeGame
            }, 
            {
                id = l_UserSignalTypes_0.NotInterestedFeedbackItem.DontLikeImage, 
                text = v74.dontLikeImage
            }, 
            {
                id = l_UserSignalTypes_0.NotInterestedFeedbackItem.InappropriateContent, 
                text = v74.inappropriateContent
            }, 
            {
                id = l_UserSignalTypes_0.NotInterestedFeedbackItem.SomethingElse, 
                text = v74.somethingElse, 
                triggersOtherTextbox = true
            }
        };
    end, {
        v74
    });
    local v91 = v11.useCallback(function(v82, v83) --[[ Line: 164 ]]
        -- upvalues: l_FFlagFeedbackFormDynamicAbuseReporting_0 (ref), v81 (copy), l_UserSignalTypes_0 (ref), v70 (copy), l_OpenDynamicAbuseReport_0 (ref), l_AbuseVector_0 (ref), v69 (copy), l_CloseCentralOverlay_0 (ref), l_default_0 (ref), v49 (ref), l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 (ref), l_SetNetworkingErrorToast_0 (ref), l_PostSendUserSignal_0 (ref), v73 (copy), l_HttpService_0 (ref), v74 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), v75 (copy), l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 (ref), l_mutedError_0 (ref), l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 (ref), v50 (ref), l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (ref)
        local v84 = not l_FFlagFeedbackFormDynamicAbuseReporting_0 and nil;
        local v85 = {};
        for _, v87 in v81 do
            table.insert(v85, {
                id = v87.id, 
                selected = v82[v87.id] or false
            });
            if l_FFlagFeedbackFormDynamicAbuseReporting_0 and v87.id == l_UserSignalTypes_0.NotInterestedFeedbackItem.InappropriateContent and v82[v87.id] then
                v84 = true;
            end;
        end;
        if l_FFlagFeedbackFormDynamicAbuseReporting_0 and v84 then
            v70(l_OpenDynamicAbuseReport_0({
                abuseVector = l_AbuseVector_0.Place, 
                targetId = v69.universeId, 
                onClose = function() --[[ Line: 185 ]] --[[ Name: onClose ]]
                    -- upvalues: v70 (ref), l_CloseCentralOverlay_0 (ref)
                    v70(l_CloseCentralOverlay_0());
                end
            }));
        end;
        if not v69.appPage then
            l_default_0:logRobloxTelemetryCounter(v49.NotInterestedMissingAppPage, 1);
            if l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 then
                v70(l_SetNetworkingErrorToast_0());
            end;
            return;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 202 ]]
                -- upvalues: l_PostSendUserSignal_0 (ref), v73 (ref), l_HttpService_0 (ref), l_UserSignalTypes_0 (ref), l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 (ref), v74 (ref), v83 (copy), v85 (copy), v69 (ref), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), v75 (ref), l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 (ref), v70 (ref), l_SetNetworkingErrorToast_0 (ref), l_default_0 (ref), v49 (ref)
                l_PostSendUserSignal_0(v73, {
                    stringValue = l_HttpService_0:JSONEncode({
                        formId = l_UserSignalTypes_0.NotInterestedFeedbackFormId.NotInterestedFeedback1, 
                        titleId = if l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 then l_UserSignalTypes_0.NotInterestedFeedbackFormTitleId.WhyHideExperience else v74.checkboxListTitle, 
                        textResponse = v83, 
                        items = v85
                    })
                }, {
                    id = v69.universeId, 
                    assetType = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 and v69.isSponsored then l_UserSignalTypes_0.AssetType.SponsoredGame else l_UserSignalTypes_0.AssetType.Game, 
                    signalOrigin = {
                        productSurface = v69.appPage, 
                        topicId = v75, 
                        subIds = {
                            v75
                        }
                    }
                }, l_UserSignalTypes_0.SignalValueType.String, l_UserSignalTypes_0.SignalType.NotInterestedFeedback):catch(function(v88) --[[ Line: 223 ]]
                    -- upvalues: l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 (ref), v70 (ref), l_SetNetworkingErrorToast_0 (ref), l_default_0 (ref), v49 (ref)
                    if l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 then
                        v70(l_SetNetworkingErrorToast_0(v88));
                    end;
                    l_default_0:logRobloxTelemetryCounter(v49.NotInterestedUserSignalFailed, 1);
                end);
            end);
            if not l_status_0 then
                l_mutedError_0(l_result_0);
            end;
            if l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 then
                v50({
                    ctx = if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then nil else v69.appPage, 
                    universeId = v69.universeId, 
                    sortId = v75, 
                    actionType = "NotInterestedFeedbackFormSubmitted"
                }, if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then v69.appPage else nil);
            end;
            return;
        end;
    end, {
        v73, 
        v81, 
        v74, 
        v69.universeId, 
        v69.appPage, 
        v75, 
        if not not l_FFlagFeedbackFormDynamicAbuseReporting_0 or l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 then v70 else nil, 
        if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v69.isSponsored else nil
    });
    local v92 = nil;
    local v93 = nil;
    if l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 then
        v92 = v11.useCallback(function(v94) --[[ Line: 264 ]]
            -- upvalues: v50 (ref), l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (ref), v69 (copy), v75 (copy)
            if v94 then
                return;
            else
                v50({
                    ctx = if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then nil else v69.appPage, 
                    universeId = v69.universeId, 
                    sortId = v75, 
                    actionType = "NotInterestedFeedbackFormClosedWithoutSubmit"
                }, if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then v69.appPage else nil);
                return;
            end;
        end, {
            v69.appPage, 
            v69.universeId, 
            v75
        });
        v93 = v11.useCallback(function() --[[ Line: 278 ]]
            -- upvalues: v50 (ref), l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (ref), v69 (copy), v75 (copy)
            v50({
                ctx = if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then nil else v69.appPage, 
                universeId = v69.universeId, 
                sortId = v75, 
                actionType = "NotInterestedFeedbackFormOpened"
            }, if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then v69.appPage else nil);
        end, {
            v69.appPage, 
            v69.universeId, 
            v75
        });
    end;
    local v95 = v11.useMemo(function() --[[ Line: 288 ]]
        -- upvalues: v74 (copy), v81 (copy), v91 (copy), l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 (ref), v92 (ref), l_FFlagLuaAppMakeDisclaimerOptInForFeedbackForm_0 (ref)
        return {
            dialogTitle = v74.dialogTitle, 
            dialogText = v74.dialogText, 
            checkboxListTitle = v74.checkboxListTitle, 
            checkboxItems = v81, 
            onSubmit = v91, 
            onClose = if l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 then v92 else nil, 
            showTermsOfUseDisclaimer = not l_FFlagLuaAppMakeDisclaimerOptInForFeedbackForm_0 and nil
        };
    end, {
        v74, 
        v81, 
        v91
    });
    local v96 = nil;
    local v97 = nil;
    if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then
        local v98 = nil;
        if l_FFlagLuaAppEnableWhyThisAdModal_0 then
            local v99 = {};
            for v100, _ in v69.availableMenuItems do
                table.insert(v99, v100);
            end;
            v98 = table.concat(v99, ",");
        else
            v98 = "NotInterested";
        end;
        do
            local l_v98_0 = v98;
            v96 = v11.useCallback(function(v103) --[[ Line: 313 ]]
                -- upvalues: v69 (copy), l_v98_0 (ref)
                if v69.onMenuOpenChanged then
                    v69.onMenuOpenChanged(v103, l_v98_0);
                end;
            end, {
                v69.onMenuOpenChanged, 
                l_v98_0
            });
            v97 = v11.useCallback(function(v104) --[[ Line: 319 ]]
                -- upvalues: l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (ref), v69 (copy), v75 (copy), l_v98_0 (ref), l_gameTileOverflowMenuAction_0 (ref)
                local v105 = {
                    ctx = if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then nil else v69.appPage, 
                    universeId = v69.universeId, 
                    sortId = v75, 
                    actionType = "GameTileOverflowMenuItemActivated", 
                    menuItem = v104, 
                    availableMenuItems = l_v98_0
                };
                l_gameTileOverflowMenuAction_0(v105, if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then v69.appPage else nil);
            end, {
                v69.appPage, 
                v69.universeId, 
                v75, 
                l_v98_0
            });
            if l_FFlagLuaAppFixExplicitFeedbackConsoleTelemetry_0 then
                v80 = v51(l_menuKey_0, v69.isSelected, v69.parentRef, v96);
            end;
        end;
    end;
    local v109 = v11.useCallback(function() --[[ Line: 342 ]]
        -- upvalues: l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 (ref), v69 (copy), l_default_0 (ref), v49 (ref), v70 (copy), l_SetNetworkingErrorToast_0 (ref), l_FFlagLuaAppEnableSponsoredReportAd_0 (ref), l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 (ref), l_HiddenTileType_0 (ref), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v95 (copy), l_FFlagLuaAppUseSnackbarForProvideFeedbackToast_0 (ref), l_Enums_0 (ref), l_Images_0 (ref), l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 (ref), v93 (ref), l_PostSendUserSignal_0 (ref), v73 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), l_UserSignalTypes_0 (ref), v75 (copy), l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 (ref), l_mutedError_0 (ref), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (ref), v97 (ref), l_TileOverflowMenuItems_0 (ref)
        if l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 and not v69.appPage then
            l_default_0:logRobloxTelemetryCounter(v49.NotInterestedMissingAppPage, 1);
            v70(l_SetNetworkingErrorToast_0());
            return;
        else
            v69.setGameHidden(v69.universeId, true, if not l_FFlagLuaAppEnableSponsoredReportAd_0 or l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 then nil else l_HiddenTileType_0.NotInterested);
            v70(l_SetCentralOverlay_0(l_CentralOverlayType_0.ProvideFeedbackToast, {
                feedbackFormProps = v95, 
                toastIcon = if l_FFlagLuaAppUseSnackbarForProvideFeedbackToast_0 then l_Enums_0.IconName.CircleMinus else l_Images_0["icons/actions/edit/remove"], 
                onToastActivated = if l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 then v93 else nil
            }));
            if not l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 and not v69.appPage then
                l_default_0:logRobloxTelemetryCounter(v49.NotInterestedMissingAppPage, 1);
                return;
            else
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 375 ]]
                    -- upvalues: l_PostSendUserSignal_0 (ref), v73 (ref), v69 (ref), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), l_UserSignalTypes_0 (ref), v75 (ref), l_FFlagLuaAppEnableSponsoredReportAd_0 (ref), l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 (ref), l_HiddenTileType_0 (ref), l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 (ref), v70 (ref), l_SetNetworkingErrorToast_0 (ref), l_default_0 (ref), v49 (ref)
                    l_PostSendUserSignal_0(v73, {
                        boolValue = true
                    }, {
                        id = v69.universeId, 
                        assetType = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 and v69.isSponsored then l_UserSignalTypes_0.AssetType.SponsoredGame else l_UserSignalTypes_0.AssetType.Game, 
                        signalOrigin = {
                            productSurface = v69.appPage, 
                            topicId = v75, 
                            subIds = {
                                v75
                            }
                        }
                    }, l_UserSignalTypes_0.SignalValueType.Bool, l_UserSignalTypes_0.SignalType.NotInterested):catch(function(v106) --[[ Line: 389 ]]
                        -- upvalues: v69 (ref), l_FFlagLuaAppEnableSponsoredReportAd_0 (ref), l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 (ref), l_HiddenTileType_0 (ref), l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 (ref), v70 (ref), l_SetNetworkingErrorToast_0 (ref), l_default_0 (ref), v49 (ref)
                        v69.setGameHidden(v69.universeId, false, if not l_FFlagLuaAppEnableSponsoredReportAd_0 or l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 then nil else l_HiddenTileType_0.NotInterested);
                        if l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 then
                            v70(l_SetNetworkingErrorToast_0(v106));
                        end;
                        l_default_0:logRobloxTelemetryCounter(v49.NotInterestedUserSignalFailed, 1);
                    end);
                end);
                if not l_status_1 then
                    v69.setGameHidden(v69.universeId, false, if not l_FFlagLuaAppEnableSponsoredReportAd_0 or l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 then nil else l_HiddenTileType_0.NotInterested);
                    l_mutedError_0(l_result_1);
                end;
                if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then
                    v97(l_TileOverflowMenuItems_0.NotInterested);
                end;
                return;
            end;
        end;
    end, {
        v73, 
        v69.setGameHidden, 
        v70, 
        v95, 
        v69.universeId, 
        v75, 
        v69.appPage, 
        if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then v97 else nil, 
        if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v69.isSponsored else nil
    });
    local v110 = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v11.useCallback(function() --[[ Line: 439 ]]
        -- upvalues: v70 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v69 (copy), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (ref), v97 (ref), l_TileOverflowMenuItems_0 (ref)
        v70(l_SetCentralOverlay_0(l_CentralOverlayType_0.WhyThisAdModal, {
            universeId = v69.universeId, 
            payerName = v69.payerName, 
            sponsoredUserCohort = v69.sponsoredUserCohort
        }));
        if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then
            v97(l_TileOverflowMenuItems_0.WhyThisAd);
        end;
    end, {
        v70, 
        v69.universeId, 
        v69.payerName, 
        v69.sponsoredUserCohort, 
        if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then v97 else nil
    }) else nil;
    local v111 = if l_FFlagLuaAppEnableSponsoredReportAd_0 then v11.useCallback(function() --[[ Line: 462 ]]
        -- upvalues: v69 (copy), l_flaggedMutedError_0 (ref), v70 (copy), l_OpenDynamicAbuseReport_0 (ref), l_AbuseVector_0 (ref), l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 (ref), l_HiddenTileType_0 (ref), l_CloseCentralOverlay_0 (ref), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (ref), v97 (ref), l_TileOverflowMenuItems_0 (ref)
        if not v69.adId then
            l_flaggedMutedError_0("ReportSponsoredAdError", "Report ad clicked without valid target ad id");
            return;
        else
            v70(l_OpenDynamicAbuseReport_0({
                abuseVector = l_AbuseVector_0.AdV2, 
                targetId = v69.adId, 
                onSubmit = not l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 and function() --[[ Line: 472 ]]
                    -- upvalues: v69 (ref), l_HiddenTileType_0 (ref)
                    v69.setGameHidden(v69.universeId, true, l_HiddenTileType_0.Reported);
                end or nil, 
                onClose = function() --[[ Line: 476 ]] --[[ Name: onClose ]]
                    -- upvalues: v70 (ref), l_CloseCentralOverlay_0 (ref)
                    v70(l_CloseCentralOverlay_0());
                end
            }));
            if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then
                v97(l_TileOverflowMenuItems_0.ReportAd);
            end;
            return;
        end;
    end, {
        v70, 
        v69.adId, 
        if l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 then nil else v69.universeId, 
        if l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 then nil else v69.setGameHidden, 
        if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then v97 else nil
    }) else nil;
    local v113 = v11.useMemo(function() --[[ Line: 496 ]]
        -- upvalues: l_FFlagLuaAppEnableWhyThisAdModal_0 (ref), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), v69 (copy), l_TileOverflowMenuItems_0 (ref), v74 (copy), v109 (copy), v110 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (ref), l_IconName_0 (ref), v111 (copy)
        if l_FFlagLuaAppEnableWhyThisAdModal_0 then
            local v112 = {};
            if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 and v69.availableMenuItems[l_TileOverflowMenuItems_0.NotInterested] then
                table.insert(v112, {
                    icon = "icons/actions/block", 
                    id = l_TileOverflowMenuItems_0.NotInterested, 
                    text = v74.notInterested, 
                    onActivated = v109
                });
            end;
            if v69.availableMenuItems[l_TileOverflowMenuItems_0.WhyThisAd] then
                table.insert(v112, {
                    icon = "icons/actions/info", 
                    id = l_TileOverflowMenuItems_0.WhyThisAd, 
                    text = v74.whyThisAd, 
                    onActivated = v110
                });
            end;
            if l_FFlagLuaAppEnableSponsoredReportAd_0 and v69.availableMenuItems[l_TileOverflowMenuItems_0.ReportAd] then
                table.insert(v112, {
                    icon = l_IconName_0.Flag, 
                    id = l_TileOverflowMenuItems_0.ReportAd, 
                    text = v74.reportAd, 
                    onActivated = v111
                });
            end;
            if not l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 and v69.availableMenuItems[l_TileOverflowMenuItems_0.NotInterested] then
                table.insert(v112, {
                    icon = "icons/actions/block", 
                    id = l_TileOverflowMenuItems_0.NotInterested, 
                    text = v74.notInterested, 
                    onActivated = v109
                });
            end;
            return v112;
        else
            return {
                {
                    icon = "icons/actions/block", 
                    id = l_TileOverflowMenuItems_0.NotInterested, 
                    text = v74.notInterested, 
                    onActivated = v109
                }
            };
        end;
    end, {
        v109, 
        v74, 
        if l_FFlagLuaAppEnableWhyThisAdModal_0 then v110 else nil, 
        if l_FFlagLuaAppEnableWhyThisAdModal_0 then v69.isSponsored else nil, 
        v69.availableMenuItems
    });
    local v115 = l_useSelector_0(function(v114) --[[ Line: 563 ]]
        return v114.Navigation.currentRoute.key or "";
    end);
    local v116 = v11.useRef(v115);
    v11.useEffect(function() --[[ Line: 568 ]]
        -- upvalues: v115 (copy), v116 (copy), v79 (copy), l_menuKey_0 (copy)
        if v115 ~= v116.current then
            v79.closeMenu(l_menuKey_0);
        end;
    end, {
        v115, 
        l_menuKey_0
    });
    if v55 then
        v11.useEffect(function() --[[ Line: 575 ]]
            -- upvalues: v69 (copy), l_UserInputService_0 (ref), v79 (copy), l_menuKey_0 (copy)
            local v117 = nil;
            if v69.menuOpen then
                v117 = l_UserInputService_0.InputBegan:Connect(function(v118, _) --[[ Line: 579 ]]
                    -- upvalues: v69 (ref), v79 (ref), l_menuKey_0 (ref)
                    if v118.UserInputType == Enum.UserInputType.MouseButton1 and not v69.isHovered then
                        v79.closeMenu(l_menuKey_0);
                    end;
                end);
            end;
            return function() --[[ Line: 588 ]]
                -- upvalues: v117 (ref)
                if v117 then
                    v117:Disconnect();
                end;
            end;
        end, {
            v69.menuOpen, 
            v69.isHovered, 
            l_menuKey_0
        });
    end;
    return v11.createElement(l_OverflowMenu_0, {
        anchorPoint = v77, 
        anchorPosition = v78, 
        menuItems = v113, 
        hasOverflowButton = v72 == v12.Input.Pointer, 
        shouldShowAnchor = v69.isHovered, 
        buttonIconBackgroundStyle = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v71.Color.OverMedia.OverMedia_0 else nil, 
        menuKey = l_menuKey_0, 
        setFocusRef = v80, 
        onMenuOpenChanged = if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then v96 else nil, 
        buttonIconSize = if v62 then l_IconSize_0.Small else nil
    });
end);