local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.Localization);
local v5 = require(l_Parent_0.Loggers);
local v6 = require(l_Parent_0.LoggingProtocol);
local v7 = require(l_Parent_0.React);
local v8 = require(l_Parent_0.ReactFocusNavigation);
local v9 = require(l_Parent_0.RoactServiceTags);
local v10 = require(l_Parent_0.RoactUtils);
local v11 = require(l_Parent_0.RobloxAppHooks);
local v12 = require(l_Parent_0.RobloxAppToastsRodux);
local v13 = require(l_Parent_0.SharedFlags);
local v14 = require(l_Parent_0.UserSignals);
local v15 = require(l_script_FirstAncestor_0.GameTileTypes);
local l_Button_0 = v3.Button;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_InputSize_0 = v3.Enums.InputSize;
local l_Text_0 = v3.Text;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_View_0 = v3.View;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_mutedError_0 = v5.mutedError;
local l_flaggedMutedError_0 = v5.flaggedMutedError;
local l_default_0 = v6.default;
local l_useFocusGuiObject_0 = v8.useFocusGuiObject;
local l_RoactNetworking_0 = v9.RoactNetworking;
local l_useDispatch_0 = v10.Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = v11.useRoactService;
local l_SetNetworkingErrorToast_0 = v12.Thunks.SetNetworkingErrorToast;
local l_PostSendUserSignal_0 = v14.PostSendUserSignal;
local l_UserSignalTypes_0 = v14.UserSignalTypes;
local l_HiddenTileType_0 = v15.HiddenTileType;
local v34 = require(l_script_FirstAncestor_0.NotInterestedUserSignalTelemetryEventConfigs);
local l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 = v13.FFlagExplicitFeedbackAddNetworkingErrorToast;
local v36 = game:DefineFastFlag("UpdateHiddenGameTileText", false);
local l_FFlagLuaAppEnableSponsoredReportAd_0 = v13.FFlagLuaAppEnableSponsoredReportAd;
local l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 = v13.FFlagLuaAppExplicitFeedbackSmallGeneralFixes;
local l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 = v13.FFlagLuaAppRemoveSponsoredReportHiddenState;
local l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 = v13.FFlagLuaAppSupportSponsoredExplicitFeedback;
return v7.memo(function(v41) --[[ Line: 68 ]] --[[ Name: HiddenTileContent ]]
    -- upvalues: l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 (copy), l_useDispatch_0 (copy), v7 (copy), l_useTokens_0 (copy), l_useFocusGuiObject_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useLocalization_0 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 (copy), v36 (copy), l_HiddenTileType_0 (copy), l_flaggedMutedError_0 (copy), l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 (copy), l_default_0 (copy), v34 (copy), l_SetNetworkingErrorToast_0 (copy), l_GuiService_0 (copy), l_PostSendUserSignal_0 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (copy), l_UserSignalTypes_0 (copy), l_mutedError_0 (copy), l_View_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_InputSize_0 (copy), l_ButtonVariant_0 (copy)
    local v42 = if l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 then l_useDispatch_0() else nil;
    local v43 = v7.useRef(nil);
    local v44 = l_useTokens_0();
    local v45 = l_useFocusGuiObject_0();
    local v46 = l_useRoactService_0(l_RoactNetworking_0);
    local v47 = l_useLocalization_0({
        undoLabel = "Feature.GameDetails.Action.Undo", 
        hiddenTileMessage = if not l_FFlagLuaAppEnableSponsoredReportAd_0 or l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 then v36 and "Feature.GameDetails.Message.SuggestLessOften" or "Feature.GameDetails.Message.SuggestLessExperiences" else nil, 
        notInterestedTileMessage = if not l_FFlagLuaAppEnableSponsoredReportAd_0 or l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 then nil else v36 and "Feature.GameDetails.Message.SuggestLessOften" or "Feature.GameDetails.Message.SuggestLessExperiences", 
        reportedTileMessage = if not l_FFlagLuaAppEnableSponsoredReportAd_0 or l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 then nil else "Feature.GameDetails.Message.ReportedTile"
    });
    local v48 = if not l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 and l_FFlagLuaAppEnableSponsoredReportAd_0 then {
        [l_HiddenTileType_0.NotInterested] = {
            displayMessage = v47.notInterestedTileMessage, 
            shouldShowUndoButton = true
        }, 
        [l_HiddenTileType_0.Reported] = {
            displayMessage = v47.reportedTileMessage, 
            shouldShowUndoButton = false
        }
    } else nil;
    local v49 = nil;
    local v50 = nil;
    if l_FFlagLuaAppEnableSponsoredReportAd_0 and not l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 then
        if v48[v41.hiddenTileType] then
            v49 = v48[v41.hiddenTileType].displayMessage;
            v50 = v48[v41.hiddenTileType].shouldShowUndoButton;
        else
            l_flaggedMutedError_0("UnknownHiddenTileType", (("Unknown hidden tile type: %*"):format(v41.hiddenTileType)));
        end;
    end;
    local v54 = v7.useCallback(function() --[[ Line: 119 ]]
        -- upvalues: l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 (ref), v41 (copy), l_default_0 (ref), v34 (ref), v42 (copy), l_SetNetworkingErrorToast_0 (ref), l_FFlagLuaAppEnableSponsoredReportAd_0 (ref), l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 (ref), l_HiddenTileType_0 (ref), l_GuiService_0 (ref), v43 (copy), v45 (copy), l_PostSendUserSignal_0 (ref), v46 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), l_UserSignalTypes_0 (ref), l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 (ref), l_mutedError_0 (ref)
        if l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 and not v41.appPage then
            l_default_0:logRobloxTelemetryCounter(v34.NotInterestedMissingAppPage, 1);
            v42(l_SetNetworkingErrorToast_0());
            return;
        else
            v41.setGameHidden(v41.universeId, false, if not l_FFlagLuaAppEnableSponsoredReportAd_0 or l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 then nil else l_HiddenTileType_0.NotInterested);
            if l_GuiService_0.SelectedCoreObject == v43.current then
                task.delay(0, function() --[[ Line: 138 ]]
                    -- upvalues: v41 (ref), v45 (ref)
                    if v41.parentRef then
                        v45(v41.parentRef.current);
                    end;
                end);
            end;
            if not l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 and not v41.appPage then
                l_default_0:logRobloxTelemetryCounter(v34.NotInterestedMissingAppPage, 1);
                return;
            else
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 153 ]]
                    -- upvalues: l_PostSendUserSignal_0 (ref), v46 (ref), v41 (ref), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), l_UserSignalTypes_0 (ref), l_FFlagLuaAppEnableSponsoredReportAd_0 (ref), l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 (ref), l_HiddenTileType_0 (ref), l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 (ref), v42 (ref), l_SetNetworkingErrorToast_0 (ref), l_default_0 (ref), v34 (ref)
                    l_PostSendUserSignal_0(v46, {
                        boolValue = false
                    }, {
                        id = v41.universeId, 
                        assetType = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 and v41.isSponsored then l_UserSignalTypes_0.AssetType.SponsoredGame else l_UserSignalTypes_0.AssetType.Game, 
                        signalOrigin = {
                            productSurface = v41.appPage, 
                            topicId = v41.collectionId or "", 
                            subIds = {
                                v41.collectionId or ""
                            }
                        }
                    }, l_UserSignalTypes_0.SignalValueType.Bool, l_UserSignalTypes_0.SignalType.NotInterested):catch(function(v51) --[[ Line: 167 ]]
                        -- upvalues: v41 (ref), l_FFlagLuaAppEnableSponsoredReportAd_0 (ref), l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 (ref), l_HiddenTileType_0 (ref), l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 (ref), v42 (ref), l_SetNetworkingErrorToast_0 (ref), l_default_0 (ref), v34 (ref)
                        v41.setGameHidden(v41.universeId, true, if not l_FFlagLuaAppEnableSponsoredReportAd_0 or l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 then nil else l_HiddenTileType_0.NotInterested);
                        if l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 then
                            v42(l_SetNetworkingErrorToast_0(v51));
                        end;
                        l_default_0:logRobloxTelemetryCounter(v34.NotInterestedUserSignalFailed, 1);
                    end);
                end);
                if not l_status_0 then
                    v41.setGameHidden(v41.universeId, true, if not l_FFlagLuaAppEnableSponsoredReportAd_0 or l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 then nil else l_HiddenTileType_0.NotInterested);
                    l_mutedError_0(l_result_0);
                end;
                return;
            end;
        end;
    end, {
        v46, 
        v45, 
        v41.setGameHidden, 
        v41.universeId, 
        v41.collectionId, 
        v41.appPage, 
        v41.parentRef, 
        if l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 then v42 else nil, 
        if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v41.isSponsored else nil
    });
    return v7.createElement(l_View_0, {
        tag = l_FFlagLuaAppEnableSponsoredReportAd_0 and "size-full gap-small col align-x-center align-y-center bg-surface-100 radius-medium padding-medium" or "size-full gap-small col align-x-center align-y-center bg-surface-100 radius-medium"
    }, {
        Message = if not (not l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 and l_FFlagLuaAppEnableSponsoredReportAd_0) or v49 then v7.createElement(l_Text_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            fontStyle = v44.Typography.BodySmall, 
            LayoutOrder = 1, 
            Size = UDim2.fromScale(1, 0), 
            Text = if not l_FFlagLuaAppEnableSponsoredReportAd_0 or l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 then v47.hiddenTileMessage else v49, 
            textStyle = v44.Color.Content.Default, 
            TextWrapped = true
        }) else nil, 
        UndoButton = if not (not l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 and l_FFlagLuaAppEnableSponsoredReportAd_0) or v50 then v7.createElement(l_Button_0, {
            LayoutOrder = 2, 
            onActivated = v54, 
            size = l_InputSize_0.XSmall, 
            text = v47.undoLabel, 
            variant = if l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 then l_ButtonVariant_0.Standard else l_ButtonVariant_0.Utility, 
            ref = v43
        }) else nil
    });
end);