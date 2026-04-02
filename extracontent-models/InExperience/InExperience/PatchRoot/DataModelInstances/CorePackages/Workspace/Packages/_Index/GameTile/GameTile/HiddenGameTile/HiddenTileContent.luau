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
local l_Button_0 = v3.Button;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_InputSize_0 = v3.Enums.InputSize;
local l_Text_0 = v3.Text;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_View_0 = v3.View;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_mutedError_0 = v5.mutedError;
local l_default_0 = v6.default;
local l_useFocusGuiObject_0 = v8.useFocusGuiObject;
local l_RoactNetworking_0 = v9.RoactNetworking;
local l_useDispatch_0 = v10.Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = v11.useRoactService;
local l_SetNetworkingErrorToast_0 = v12.Thunks.SetNetworkingErrorToast;
local l_PostSendUserSignal_0 = v14.PostSendUserSignal;
local l_UserSignalTypes_0 = v14.UserSignalTypes;
local v31 = require(l_script_FirstAncestor_0.NotInterestedUserSignalTelemetryEventConfigs);
local l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 = v13.FFlagExplicitFeedbackAddNetworkingErrorToast;
local v33 = game:DefineFastFlag("UpdateHiddenGameTileText", false);
local l_FFlagLuaAppEnableSponsoredReportAd_0 = v13.FFlagLuaAppEnableSponsoredReportAd;
local l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 = v13.FFlagLuaAppExplicitFeedbackSmallGeneralFixes;
local l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 = v13.FFlagLuaAppSupportSponsoredExplicitFeedback;
return v7.memo(function(v37) --[[ Line: 53 ]] --[[ Name: HiddenTileContent ]]
    -- upvalues: l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 (copy), l_useDispatch_0 (copy), v7 (copy), l_useTokens_0 (copy), l_useFocusGuiObject_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useLocalization_0 (copy), v33 (copy), l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 (copy), l_default_0 (copy), v31 (copy), l_SetNetworkingErrorToast_0 (copy), l_GuiService_0 (copy), l_PostSendUserSignal_0 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (copy), l_UserSignalTypes_0 (copy), l_mutedError_0 (copy), l_View_0 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_InputSize_0 (copy), l_ButtonVariant_0 (copy)
    local v38 = if l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 then l_useDispatch_0() else nil;
    local v39 = v7.useRef(nil);
    local v40 = l_useTokens_0();
    local v41 = l_useFocusGuiObject_0();
    local v42 = l_useRoactService_0(l_RoactNetworking_0);
    local v43 = l_useLocalization_0({
        undoLabel = "Feature.GameDetails.Action.Undo", 
        hiddenTileMessage = v33 and "Feature.GameDetails.Message.SuggestLessOften" or "Feature.GameDetails.Message.SuggestLessExperiences"
    });
    local v47 = v7.useCallback(function() --[[ Line: 67 ]]
        -- upvalues: l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 (ref), v37 (copy), l_default_0 (ref), v31 (ref), v38 (copy), l_SetNetworkingErrorToast_0 (ref), l_GuiService_0 (ref), v39 (copy), v41 (copy), l_PostSendUserSignal_0 (ref), v42 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), l_UserSignalTypes_0 (ref), l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 (ref), l_mutedError_0 (ref)
        if l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 and not v37.appPage then
            l_default_0:logRobloxTelemetryCounter(v31.NotInterestedMissingAppPage, 1);
            v38(l_SetNetworkingErrorToast_0());
            return;
        else
            v37.setGameHidden(v37.universeId, false);
            if l_GuiService_0.SelectedCoreObject == v39.current then
                task.delay(0, function() --[[ Line: 80 ]]
                    -- upvalues: v37 (ref), v41 (ref)
                    if v37.parentRef then
                        v41(v37.parentRef.current);
                    end;
                end);
            end;
            if not l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 and not v37.appPage then
                l_default_0:logRobloxTelemetryCounter(v31.NotInterestedMissingAppPage, 1);
                return;
            else
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 95 ]]
                    -- upvalues: l_PostSendUserSignal_0 (ref), v42 (ref), v37 (ref), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), l_UserSignalTypes_0 (ref), l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 (ref), v38 (ref), l_SetNetworkingErrorToast_0 (ref), l_default_0 (ref), v31 (ref)
                    l_PostSendUserSignal_0(v42, {
                        boolValue = false
                    }, {
                        id = v37.universeId, 
                        assetType = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 and v37.isSponsored then l_UserSignalTypes_0.AssetType.SponsoredGame else l_UserSignalTypes_0.AssetType.Game, 
                        signalOrigin = {
                            productSurface = v37.appPage, 
                            topicId = v37.collectionId or "", 
                            subIds = {
                                v37.collectionId or ""
                            }
                        }
                    }, l_UserSignalTypes_0.SignalValueType.Bool, l_UserSignalTypes_0.SignalType.NotInterested):catch(function(v44) --[[ Line: 109 ]]
                        -- upvalues: v37 (ref), l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 (ref), v38 (ref), l_SetNetworkingErrorToast_0 (ref), l_default_0 (ref), v31 (ref)
                        v37.setGameHidden(v37.universeId, true);
                        if l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 then
                            v38(l_SetNetworkingErrorToast_0(v44));
                        end;
                        l_default_0:logRobloxTelemetryCounter(v31.NotInterestedUserSignalFailed, 1);
                    end);
                end);
                if not l_status_0 then
                    v37.setGameHidden(v37.universeId, true);
                    l_mutedError_0(l_result_0);
                end;
                return;
            end;
        end;
    end, {
        v42, 
        v41, 
        v37.setGameHidden, 
        v37.universeId, 
        v37.collectionId, 
        v37.appPage, 
        v37.parentRef, 
        if l_FFlagExplicitFeedbackAddNetworkingErrorToast_0 then v38 else nil, 
        if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v37.isSponsored else nil
    });
    return v7.createElement(l_View_0, {
        tag = l_FFlagLuaAppEnableSponsoredReportAd_0 and "size-full gap-small col align-x-center align-y-center bg-surface-100 radius-medium padding-medium" or "size-full gap-small col align-x-center align-y-center bg-surface-100 radius-medium"
    }, {
        Message = v7.createElement(l_Text_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            fontStyle = v40.Typography.BodySmall, 
            LayoutOrder = 1, 
            Size = UDim2.fromScale(1, 0), 
            Text = v43.hiddenTileMessage, 
            textStyle = v40.Color.Content.Default, 
            TextWrapped = true
        }), 
        UndoButton = v7.createElement(l_Button_0, {
            LayoutOrder = 2, 
            onActivated = v47, 
            size = l_InputSize_0.XSmall, 
            text = v43.undoLabel, 
            variant = if l_FFlagLuaAppExplicitFeedbackSmallGeneralFixes_0 then l_ButtonVariant_0.Standard else l_ButtonVariant_0.Utility, 
            ref = v39
        })
    });
end);