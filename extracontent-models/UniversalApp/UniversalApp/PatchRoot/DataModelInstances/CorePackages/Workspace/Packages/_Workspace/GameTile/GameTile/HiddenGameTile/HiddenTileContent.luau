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
local v32 = game:DefineFastFlag("UpdateHiddenGameTileText", false);
local l_FFlagLuaAppEnableSponsoredReportAd_0 = v13.FFlagLuaAppEnableSponsoredReportAd;
local l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 = v13.FFlagLuaAppSupportSponsoredExplicitFeedback;
return v7.memo(function(v35) --[[ Line: 51 ]] --[[ Name: HiddenTileContent ]]
    -- upvalues: l_useDispatch_0 (copy), v7 (copy), l_useTokens_0 (copy), l_useFocusGuiObject_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useLocalization_0 (copy), v32 (copy), l_default_0 (copy), v31 (copy), l_SetNetworkingErrorToast_0 (copy), l_GuiService_0 (copy), l_PostSendUserSignal_0 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (copy), l_UserSignalTypes_0 (copy), l_mutedError_0 (copy), l_View_0 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_InputSize_0 (copy), l_ButtonVariant_0 (copy)
    local v36 = l_useDispatch_0();
    local v37 = v7.useRef(nil);
    local v38 = l_useTokens_0();
    local v39 = l_useFocusGuiObject_0();
    local v40 = l_useRoactService_0(l_RoactNetworking_0);
    local v41 = l_useLocalization_0({
        undoLabel = "Feature.GameDetails.Action.Undo", 
        hiddenTileMessage = v32 and "Feature.GameDetails.Message.SuggestLessOften" or "Feature.GameDetails.Message.SuggestLessExperiences"
    });
    local v45 = v7.useCallback(function() --[[ Line: 65 ]]
        -- upvalues: v35 (copy), l_default_0 (ref), v31 (ref), v36 (copy), l_SetNetworkingErrorToast_0 (ref), l_GuiService_0 (ref), v37 (copy), v39 (copy), l_PostSendUserSignal_0 (ref), v40 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), l_UserSignalTypes_0 (ref), l_mutedError_0 (ref)
        if not v35.appPage then
            l_default_0:logRobloxTelemetryCounter(v31.NotInterestedMissingAppPage, 1);
            v36(l_SetNetworkingErrorToast_0());
            return;
        else
            v35.setGameHidden(v35.universeId, false);
            if l_GuiService_0.SelectedCoreObject == v37.current then
                task.delay(0, function() --[[ Line: 78 ]]
                    -- upvalues: v35 (ref), v39 (ref)
                    if v35.parentRef then
                        v39(v35.parentRef.current);
                    end;
                end);
            end;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 85 ]]
                -- upvalues: l_PostSendUserSignal_0 (ref), v40 (ref), v35 (ref), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), l_UserSignalTypes_0 (ref), v36 (ref), l_SetNetworkingErrorToast_0 (ref), l_default_0 (ref), v31 (ref)
                l_PostSendUserSignal_0(v40, {
                    boolValue = false
                }, {
                    id = v35.universeId, 
                    assetType = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 and v35.isSponsored then l_UserSignalTypes_0.AssetType.SponsoredGame else l_UserSignalTypes_0.AssetType.Game, 
                    signalOrigin = {
                        productSurface = v35.appPage, 
                        topicId = v35.collectionId or "", 
                        subIds = {
                            v35.collectionId or ""
                        }
                    }
                }, l_UserSignalTypes_0.SignalValueType.Bool, l_UserSignalTypes_0.SignalType.NotInterested):catch(function(v42) --[[ Line: 99 ]]
                    -- upvalues: v35 (ref), v36 (ref), l_SetNetworkingErrorToast_0 (ref), l_default_0 (ref), v31 (ref)
                    v35.setGameHidden(v35.universeId, true);
                    v36(l_SetNetworkingErrorToast_0(v42));
                    l_default_0:logRobloxTelemetryCounter(v31.NotInterestedUserSignalFailed, 1);
                end);
            end);
            if not l_status_0 then
                v35.setGameHidden(v35.universeId, true);
                l_mutedError_0(l_result_0);
            end;
            return;
        end;
    end, {
        v40, 
        v39, 
        v35.setGameHidden, 
        v35.universeId, 
        v35.collectionId, 
        v35.appPage, 
        v35.parentRef, 
        v36, 
        if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v35.isSponsored else nil
    });
    return v7.createElement(l_View_0, {
        tag = l_FFlagLuaAppEnableSponsoredReportAd_0 and "size-full gap-small col align-x-center align-y-center bg-surface-100 radius-medium padding-medium" or "size-full gap-small col align-x-center align-y-center bg-surface-100 radius-medium"
    }, {
        Message = v7.createElement(l_Text_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            fontStyle = v38.Typography.BodySmall, 
            LayoutOrder = 1, 
            Size = UDim2.fromScale(1, 0), 
            Text = v41.hiddenTileMessage, 
            textStyle = v38.Color.Content.Default, 
            TextWrapped = true
        }), 
        UndoButton = v7.createElement(l_Button_0, {
            LayoutOrder = 2, 
            onActivated = v45, 
            size = l_InputSize_0.XSmall, 
            text = v41.undoLabel, 
            variant = l_ButtonVariant_0.Standard, 
            ref = v37
        })
    });
end);