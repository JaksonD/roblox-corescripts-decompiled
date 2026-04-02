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
local v47 = require(l_script_FirstAncestor_0.NotInterestedUserSignalTelemetryEventConfigs);
local v48 = require(l_script_FirstAncestor_0.sendNotInterestedFeedbackFormAnalytics);
local v49 = require(l_script_FirstAncestor_0.useGameTileOverflowMenuFocusNavigation);
local l_TileOverflowMenuItems_0 = require(l_script_FirstAncestor_0.GameTileConstants).TileOverflowMenuItems;
local l_FFlagFeedbackFormDynamicAbuseReporting_0 = v18.FFlagFeedbackFormDynamicAbuseReporting;
local l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 = v18.FFlagExplicitFeedbackAddNetworkingErrorToast;
local v53 = game:DefineFastFlag("LuaAppMitigatePopoverPressedOutsideBug", false);
local l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 = v18.FFlagLuaAppGameTileOverflowMenuTelemetry;
local l_FFlagLuaAppMakeDisclaimerOptInForFeedbackForm_0 = v18.FFlagLuaAppMakeDisclaimerOptInForFeedbackForm;
local l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 = v18.FFlagLuaAppNotInterestedFeedbackFormTelemetry;
local l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 = v18.FFlagLuaAppFixExplicitFeedbackTelemetry;
local l_FFlagLuaAppEnableWhyThisAdModal_0 = v18.FFlagLuaAppEnableWhyThisAdModal;
local l_FFlagLuaAppEnableSponsoredReportAd_0 = v18.FFlagLuaAppEnableSponsoredReportAd;
local v60 = game:DefineFastFlag("LuaAppAdjustOverflowMenuVisual", false);
local l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 = v18.FFlagLuaAppExplicitFeedbackSmallGeneralFixes;
local l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 = v18.FFlagLuaAppSupportSponsoredExplicitFeedback;
local l_FFlagLuaAppUseSnackbarForProvideFeedbackToast_0 = v18.FFlagLuaAppUseSnackbarForProvideFeedbackToast;
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = v18.FFlagLuaAppSduiBadgeDetailsComponents;
local l_FFlagLuaAppFixExplicitFeedbackConsoleTelemetry_0 = v18.FFlagLuaAppFixExplicitFeedbackConsoleTelemetry;
return v11.memo(function(v66) --[[ Line: 94 ]] --[[ Name: GameTileOverflowMenu ]]
    -- upvalues: l_useDispatch_0 (copy), l_useTokens_0 (copy), l_useLastInput_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useLocalization_0 (copy), l_FFlagLuaAppEnableWhyThisAdModal_0 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), v60 (copy), l_getOverflowMenuSignalStore_0 (copy), l_FFlagLuaAppFixExplicitFeedbackConsoleTelemetry_0 (copy), v49 (copy), v11 (copy), l_UserSignalTypes_0 (copy), l_FFlagFeedbackFormDynamicAbuseReporting_0 (copy), l_OpenDynamicAbuseReport_0 (copy), l_AbuseVector_0 (copy), l_CloseCentralOverlay_0 (copy), l_default_0 (copy), v47 (copy), l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 (copy), l_SetNetworkingErrorToast_0 (copy), l_PostSendUserSignal_0 (copy), l_HttpService_0 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (copy), l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 (copy), l_mutedError_0 (copy), l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 (copy), v48 (copy), l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (copy), l_FFlagLuaAppMakeDisclaimerOptInForFeedbackForm_0 (copy), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (copy), l_gameTileOverflowMenuAction_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_FFlagLuaAppUseSnackbarForProvideFeedbackToast_0 (copy), l_Enums_0 (copy), l_Images_0 (copy), l_TileOverflowMenuItems_0 (copy), l_flaggedMutedError_0 (copy), l_IconName_0 (copy), l_useSelector_0 (copy), v53 (copy), l_UserInputService_0 (copy), l_OverflowMenu_0 (copy), v12 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy), l_IconSize_0 (copy)
    local v67 = l_useDispatch_0();
    local v68 = l_useTokens_0();
    local v69 = l_useLastInput_0();
    local v70 = l_useRoactService_0(l_RoactNetworking_0);
    local v71 = l_useLocalization_0({
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
    local v72 = v66.collectionId or "";
    local l_menuKey_0 = v66.menuKey;
    local v74 = Vector2.new(1, 0);
    local v75 = UDim2.new(1, if v60 then -v68.Padding.Medium else -v68.Padding.Small, 0, if v60 then v68.Padding.Medium else v68.Padding.Small);
    local v76 = l_getOverflowMenuSignalStore_0();
    local v77 = nil;
    if not l_FFlagLuaAppFixExplicitFeedbackConsoleTelemetry_0 then
        v77 = v49(l_menuKey_0, v66.isSelected, v66.parentRef);
    end;
    local v78 = v11.useMemo(function() --[[ Line: 129 ]]
        -- upvalues: l_UserSignalTypes_0 (ref), v71 (copy)
        return {
            {
                id = l_UserSignalTypes_0.NotInterestedFeedbackItem.TooRepetitive, 
                text = v71.tooRepetitive
            }, 
            {
                id = l_UserSignalTypes_0.NotInterestedFeedbackItem.DontLikeGame, 
                text = v71.dontLikeGame
            }, 
            {
                id = l_UserSignalTypes_0.NotInterestedFeedbackItem.DontLikeImage, 
                text = v71.dontLikeImage
            }, 
            {
                id = l_UserSignalTypes_0.NotInterestedFeedbackItem.InappropriateContent, 
                text = v71.inappropriateContent
            }, 
            {
                id = l_UserSignalTypes_0.NotInterestedFeedbackItem.SomethingElse, 
                text = v71.somethingElse, 
                triggersOtherTextbox = true
            }
        };
    end, {
        v71
    });
    local v88 = v11.useCallback(function(v79, v80) --[[ Line: 156 ]]
        -- upvalues: l_FFlagFeedbackFormDynamicAbuseReporting_0 (ref), v78 (copy), l_UserSignalTypes_0 (ref), v67 (copy), l_OpenDynamicAbuseReport_0 (ref), l_AbuseVector_0 (ref), v66 (copy), l_CloseCentralOverlay_0 (ref), l_default_0 (ref), v47 (ref), l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 (ref), l_SetNetworkingErrorToast_0 (ref), l_PostSendUserSignal_0 (ref), v70 (copy), l_HttpService_0 (ref), v71 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), v72 (copy), l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 (ref), l_mutedError_0 (ref), l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 (ref), v48 (ref), l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (ref)
        local v81 = not l_FFlagFeedbackFormDynamicAbuseReporting_0 and nil;
        local v82 = {};
        for _, v84 in v78 do
            table.insert(v82, {
                id = v84.id, 
                selected = v79[v84.id] or false
            });
            if l_FFlagFeedbackFormDynamicAbuseReporting_0 and v84.id == l_UserSignalTypes_0.NotInterestedFeedbackItem.InappropriateContent and v79[v84.id] then
                v81 = true;
            end;
        end;
        if l_FFlagFeedbackFormDynamicAbuseReporting_0 and v81 then
            v67(l_OpenDynamicAbuseReport_0({
                abuseVector = l_AbuseVector_0.Place, 
                targetId = v66.universeId, 
                onClose = function() --[[ Line: 177 ]] --[[ Name: onClose ]]
                    -- upvalues: v67 (ref), l_CloseCentralOverlay_0 (ref)
                    v67(l_CloseCentralOverlay_0());
                end
            }));
        end;
        if not v66.appPage then
            l_default_0:logRobloxTelemetryCounter(v47.NotInterestedMissingAppPage, 1);
            if l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 then
                v67(l_SetNetworkingErrorToast_0());
            end;
            return;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 194 ]]
                -- upvalues: l_PostSendUserSignal_0 (ref), v70 (ref), l_HttpService_0 (ref), l_UserSignalTypes_0 (ref), l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 (ref), v71 (ref), v80 (copy), v82 (copy), v66 (ref), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), v72 (ref), l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 (ref), v67 (ref), l_SetNetworkingErrorToast_0 (ref), l_default_0 (ref), v47 (ref)
                l_PostSendUserSignal_0(v70, {
                    stringValue = l_HttpService_0:JSONEncode({
                        formId = l_UserSignalTypes_0.NotInterestedFeedbackFormId.NotInterestedFeedback1, 
                        titleId = if l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 then l_UserSignalTypes_0.NotInterestedFeedbackFormTitleId.WhyHideExperience else v71.checkboxListTitle, 
                        textResponse = v80, 
                        items = v82
                    })
                }, {
                    id = v66.universeId, 
                    assetType = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 and v66.isSponsored then l_UserSignalTypes_0.AssetType.SponsoredGame else l_UserSignalTypes_0.AssetType.Game, 
                    signalOrigin = {
                        productSurface = v66.appPage, 
                        topicId = v72, 
                        subIds = {
                            v72
                        }
                    }
                }, l_UserSignalTypes_0.SignalValueType.String, l_UserSignalTypes_0.SignalType.NotInterestedFeedback):catch(function(v85) --[[ Line: 215 ]]
                    -- upvalues: l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 (ref), v67 (ref), l_SetNetworkingErrorToast_0 (ref), l_default_0 (ref), v47 (ref)
                    if l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 then
                        v67(l_SetNetworkingErrorToast_0(v85));
                    end;
                    l_default_0:logRobloxTelemetryCounter(v47.NotInterestedUserSignalFailed, 1);
                end);
            end);
            if not l_status_0 then
                l_mutedError_0(l_result_0);
            end;
            if l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 then
                v48({
                    ctx = if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then nil else v66.appPage, 
                    universeId = v66.universeId, 
                    sortId = v72, 
                    actionType = "NotInterestedFeedbackFormSubmitted"
                }, if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then v66.appPage else nil);
            end;
            return;
        end;
    end, {
        v70, 
        v78, 
        v71, 
        v66.universeId, 
        v66.appPage, 
        v72, 
        if not not l_FFlagFeedbackFormDynamicAbuseReporting_0 or l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 then v67 else nil, 
        if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v66.isSponsored else nil
    });
    local v89 = nil;
    local v90 = nil;
    if l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 then
        v89 = v11.useCallback(function(v91) --[[ Line: 256 ]]
            -- upvalues: v48 (ref), l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (ref), v66 (copy), v72 (copy)
            if v91 then
                return;
            else
                v48({
                    ctx = if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then nil else v66.appPage, 
                    universeId = v66.universeId, 
                    sortId = v72, 
                    actionType = "NotInterestedFeedbackFormClosedWithoutSubmit"
                }, if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then v66.appPage else nil);
                return;
            end;
        end, {
            v66.appPage, 
            v66.universeId, 
            v72
        });
        v90 = v11.useCallback(function() --[[ Line: 270 ]]
            -- upvalues: v48 (ref), l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (ref), v66 (copy), v72 (copy)
            v48({
                ctx = if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then nil else v66.appPage, 
                universeId = v66.universeId, 
                sortId = v72, 
                actionType = "NotInterestedFeedbackFormOpened"
            }, if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then v66.appPage else nil);
        end, {
            v66.appPage, 
            v66.universeId, 
            v72
        });
    end;
    local v92 = v11.useMemo(function() --[[ Line: 280 ]]
        -- upvalues: v71 (copy), v78 (copy), v88 (copy), l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 (ref), v89 (ref), l_FFlagLuaAppMakeDisclaimerOptInForFeedbackForm_0 (ref)
        return {
            dialogTitle = v71.dialogTitle, 
            dialogText = v71.dialogText, 
            checkboxListTitle = v71.checkboxListTitle, 
            checkboxItems = v78, 
            onSubmit = v88, 
            onClose = if l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 then v89 else nil, 
            showTermsOfUseDisclaimer = not l_FFlagLuaAppMakeDisclaimerOptInForFeedbackForm_0 and nil
        };
    end, {
        v71, 
        v78, 
        v88
    });
    local v93 = nil;
    local v94 = nil;
    if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then
        local v95 = nil;
        if l_FFlagLuaAppEnableWhyThisAdModal_0 then
            local v96 = {};
            for v97, _ in v66.availableMenuItems do
                table.insert(v96, v97);
            end;
            v95 = table.concat(v96, ",");
        else
            v95 = "NotInterested";
        end;
        do
            local l_v95_0 = v95;
            v93 = v11.useCallback(function(v100) --[[ Line: 305 ]]
                -- upvalues: v66 (copy), l_v95_0 (ref)
                if v66.onMenuOpenChanged then
                    v66.onMenuOpenChanged(v100, l_v95_0);
                end;
            end, {
                v66.onMenuOpenChanged, 
                l_v95_0
            });
            v94 = v11.useCallback(function(v101) --[[ Line: 311 ]]
                -- upvalues: l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (ref), v66 (copy), v72 (copy), l_v95_0 (ref), l_gameTileOverflowMenuAction_0 (ref)
                local v102 = {
                    ctx = if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then nil else v66.appPage, 
                    universeId = v66.universeId, 
                    sortId = v72, 
                    actionType = "GameTileOverflowMenuItemActivated", 
                    menuItem = v101, 
                    availableMenuItems = l_v95_0
                };
                l_gameTileOverflowMenuAction_0(v102, if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then v66.appPage else nil);
            end, {
                v66.appPage, 
                v66.universeId, 
                v72, 
                l_v95_0
            });
            if l_FFlagLuaAppFixExplicitFeedbackConsoleTelemetry_0 then
                v77 = v49(l_menuKey_0, v66.isSelected, v66.parentRef, v93);
            end;
        end;
    end;
    local v106 = v11.useCallback(function() --[[ Line: 334 ]]
        -- upvalues: l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 (ref), v66 (copy), l_default_0 (ref), v47 (ref), v67 (copy), l_SetNetworkingErrorToast_0 (ref), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v92 (copy), l_FFlagLuaAppUseSnackbarForProvideFeedbackToast_0 (ref), l_Enums_0 (ref), l_Images_0 (ref), l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 (ref), v90 (ref), l_PostSendUserSignal_0 (ref), v70 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), l_UserSignalTypes_0 (ref), v72 (copy), l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 (ref), l_mutedError_0 (ref), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (ref), v94 (ref), l_TileOverflowMenuItems_0 (ref)
        if l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 and not v66.appPage then
            l_default_0:logRobloxTelemetryCounter(v47.NotInterestedMissingAppPage, 1);
            v67(l_SetNetworkingErrorToast_0());
            return;
        else
            v66.setGameHidden(v66.universeId, true);
            v67(l_SetCentralOverlay_0(l_CentralOverlayType_0.ProvideFeedbackToast, {
                feedbackFormProps = v92, 
                toastIcon = if l_FFlagLuaAppUseSnackbarForProvideFeedbackToast_0 then l_Enums_0.IconName.CircleMinus else l_Images_0["icons/actions/edit/remove"], 
                onToastActivated = if l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 then v90 else nil
            }));
            if not l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 and not v66.appPage then
                l_default_0:logRobloxTelemetryCounter(v47.NotInterestedMissingAppPage, 1);
                return;
            else
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 361 ]]
                    -- upvalues: l_PostSendUserSignal_0 (ref), v70 (ref), v66 (ref), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), l_UserSignalTypes_0 (ref), v72 (ref), l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 (ref), v67 (ref), l_SetNetworkingErrorToast_0 (ref), l_default_0 (ref), v47 (ref)
                    l_PostSendUserSignal_0(v70, {
                        boolValue = true
                    }, {
                        id = v66.universeId, 
                        assetType = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 and v66.isSponsored then l_UserSignalTypes_0.AssetType.SponsoredGame else l_UserSignalTypes_0.AssetType.Game, 
                        signalOrigin = {
                            productSurface = v66.appPage, 
                            topicId = v72, 
                            subIds = {
                                v72
                            }
                        }
                    }, l_UserSignalTypes_0.SignalValueType.Bool, l_UserSignalTypes_0.SignalType.NotInterested):catch(function(v103) --[[ Line: 375 ]]
                        -- upvalues: v66 (ref), l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 (ref), v67 (ref), l_SetNetworkingErrorToast_0 (ref), l_default_0 (ref), v47 (ref)
                        v66.setGameHidden(v66.universeId, false);
                        if l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 then
                            v67(l_SetNetworkingErrorToast_0(v103));
                        end;
                        l_default_0:logRobloxTelemetryCounter(v47.NotInterestedUserSignalFailed, 1);
                    end);
                end);
                if not l_status_1 then
                    v66.setGameHidden(v66.universeId, false);
                    l_mutedError_0(l_result_1);
                end;
                if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then
                    v94(l_TileOverflowMenuItems_0.NotInterested);
                end;
                return;
            end;
        end;
    end, {
        v70, 
        v66.setGameHidden, 
        v67, 
        v92, 
        v66.universeId, 
        v72, 
        v66.appPage, 
        if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then v94 else nil, 
        if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v66.isSponsored else nil
    });
    local v107 = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v11.useCallback(function() --[[ Line: 412 ]]
        -- upvalues: v67 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v66 (copy), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (ref), v94 (ref), l_TileOverflowMenuItems_0 (ref)
        v67(l_SetCentralOverlay_0(l_CentralOverlayType_0.WhyThisAdModal, {
            universeId = v66.universeId, 
            payerName = v66.payerName, 
            sponsoredUserCohort = v66.sponsoredUserCohort
        }));
        if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then
            v94(l_TileOverflowMenuItems_0.WhyThisAd);
        end;
    end, {
        v67, 
        v66.universeId, 
        v66.payerName, 
        v66.sponsoredUserCohort, 
        if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then v94 else nil
    }) else nil;
    local v108 = if l_FFlagLuaAppEnableSponsoredReportAd_0 then v11.useCallback(function() --[[ Line: 435 ]]
        -- upvalues: v66 (copy), l_flaggedMutedError_0 (ref), v67 (copy), l_OpenDynamicAbuseReport_0 (ref), l_AbuseVector_0 (ref), l_CloseCentralOverlay_0 (ref), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (ref), v94 (ref), l_TileOverflowMenuItems_0 (ref)
        if not v66.adId then
            l_flaggedMutedError_0("ReportSponsoredAdError", "Report ad clicked without valid target ad id");
            return;
        else
            v67(l_OpenDynamicAbuseReport_0({
                abuseVector = l_AbuseVector_0.AdV2, 
                targetId = v66.adId, 
                onClose = function() --[[ Line: 444 ]] --[[ Name: onClose ]]
                    -- upvalues: v67 (ref), l_CloseCentralOverlay_0 (ref)
                    v67(l_CloseCentralOverlay_0());
                end
            }));
            if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then
                v94(l_TileOverflowMenuItems_0.ReportAd);
            end;
            return;
        end;
    end, {
        v67, 
        v66.adId, 
        if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then v94 else nil
    }) else nil;
    local v110 = v11.useMemo(function() --[[ Line: 462 ]]
        -- upvalues: l_FFlagLuaAppEnableWhyThisAdModal_0 (ref), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), v66 (copy), l_TileOverflowMenuItems_0 (ref), v71 (copy), v106 (copy), v107 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (ref), l_IconName_0 (ref), v108 (copy)
        if l_FFlagLuaAppEnableWhyThisAdModal_0 then
            local v109 = {};
            if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 and v66.availableMenuItems[l_TileOverflowMenuItems_0.NotInterested] then
                table.insert(v109, {
                    icon = "icons/actions/block", 
                    id = l_TileOverflowMenuItems_0.NotInterested, 
                    text = v71.notInterested, 
                    onActivated = v106
                });
            end;
            if v66.availableMenuItems[l_TileOverflowMenuItems_0.WhyThisAd] then
                table.insert(v109, {
                    icon = "icons/actions/info", 
                    id = l_TileOverflowMenuItems_0.WhyThisAd, 
                    text = v71.whyThisAd, 
                    onActivated = v107
                });
            end;
            if l_FFlagLuaAppEnableSponsoredReportAd_0 and v66.availableMenuItems[l_TileOverflowMenuItems_0.ReportAd] then
                table.insert(v109, {
                    icon = l_IconName_0.Flag, 
                    id = l_TileOverflowMenuItems_0.ReportAd, 
                    text = v71.reportAd, 
                    onActivated = v108
                });
            end;
            if not l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 and v66.availableMenuItems[l_TileOverflowMenuItems_0.NotInterested] then
                table.insert(v109, {
                    icon = "icons/actions/block", 
                    id = l_TileOverflowMenuItems_0.NotInterested, 
                    text = v71.notInterested, 
                    onActivated = v106
                });
            end;
            return v109;
        else
            return {
                {
                    icon = "icons/actions/block", 
                    id = l_TileOverflowMenuItems_0.NotInterested, 
                    text = v71.notInterested, 
                    onActivated = v106
                }
            };
        end;
    end, {
        v106, 
        v71, 
        if l_FFlagLuaAppEnableWhyThisAdModal_0 then v107 else nil, 
        if l_FFlagLuaAppEnableWhyThisAdModal_0 then v66.isSponsored else nil, 
        v66.availableMenuItems
    });
    local v112 = l_useSelector_0(function(v111) --[[ Line: 529 ]]
        return v111.Navigation.currentRoute.key or "";
    end);
    local v113 = v11.useRef(v112);
    v11.useEffect(function() --[[ Line: 534 ]]
        -- upvalues: v112 (copy), v113 (copy), v76 (copy), l_menuKey_0 (copy)
        if v112 ~= v113.current then
            v76.closeMenu(l_menuKey_0);
        end;
    end, {
        v112, 
        l_menuKey_0
    });
    if v53 then
        v11.useEffect(function() --[[ Line: 541 ]]
            -- upvalues: v66 (copy), l_UserInputService_0 (ref), v76 (copy), l_menuKey_0 (copy)
            local v114 = nil;
            if v66.menuOpen then
                v114 = l_UserInputService_0.InputBegan:Connect(function(v115, _) --[[ Line: 545 ]]
                    -- upvalues: v66 (ref), v76 (ref), l_menuKey_0 (ref)
                    if v115.UserInputType == Enum.UserInputType.MouseButton1 and not v66.isHovered then
                        v76.closeMenu(l_menuKey_0);
                    end;
                end);
            end;
            return function() --[[ Line: 554 ]]
                -- upvalues: v114 (ref)
                if v114 then
                    v114:Disconnect();
                end;
            end;
        end, {
            v66.menuOpen, 
            v66.isHovered, 
            l_menuKey_0
        });
    end;
    return v11.createElement(l_OverflowMenu_0, {
        anchorPoint = v74, 
        anchorPosition = v75, 
        menuItems = v110, 
        hasOverflowButton = v69 == v12.Input.Pointer, 
        shouldShowAnchor = v66.isHovered, 
        buttonIconBackgroundStyle = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v68.Color.OverMedia.OverMedia_0 else nil, 
        menuKey = l_menuKey_0, 
        setFocusRef = v77, 
        onMenuOpenChanged = if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then v93 else nil, 
        buttonIconSize = if v60 then l_IconSize_0.Small else nil
    });
end);