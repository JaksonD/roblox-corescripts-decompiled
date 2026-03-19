local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerTriggeredModals");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RobloxAppEnums);
local v4 = require(l_Parent_0.CentralOverlay);
local v5 = require(l_Parent_0.DeepLink);
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v8 = require(l_Parent_0.RoactServiceTags);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v10 = require(l_Parent_0.RoactNavigation);
local v11 = require(l_Parent_0.SharedFlags);
local v12 = require(l_Parent_0.NotificationsUpsell);
local l_CentralOverlayType_0 = v3.CentralOverlayType;
local l_SetCentralOverlay_0 = v4.Actions.SetCentralOverlay;
local v15 = require(l_script_FirstAncestor_0.SignalStores.useModalSignalStore);
local v16 = require(l_script_FirstAncestor_0.Logger);
local v17 = require(l_script_FirstAncestor_0.EntryPoint);
local v18 = require(l_script_FirstAncestor_0.fetchModalMetadata);
local v19 = require(l_script_FirstAncestor_0.useHandleCustomModalCallback);
local l_FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals_0 = v11.FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals;
local l_FFlagEnableDeepLinkHistoryWithModalAPI_0 = v11.FFlagEnableDeepLinkHistoryWithModalAPI;
local v22 = game:DefineFastInt("ServerTriggeredModalTrafficPercent", 0);
local v23 = game:DefineFastFlag("LuaAppAvoidPushUpsellConflicts", false);
local v46 = v10.withNavigationFocus(function(v24) --[[ Line: 36 ]] --[[ Name: CheckForSduiModal ]]
    -- upvalues: l_useRoactService_0 (copy), v8 (copy), l_useDispatch_0 (copy), v15 (copy), l_useSignalState_0 (copy), v17 (copy), l_FFlagEnableDeepLinkHistoryWithModalAPI_0 (copy), v5 (copy), v23 (copy), v2 (copy), l_FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals_0 (copy), v19 (copy), v12 (copy), v16 (copy), v22 (copy), v18 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy)
    local v25 = l_useRoactService_0(v8.RoactNetworking);
    local v26 = l_useDispatch_0();
    local v27 = v15();
    local v28 = l_useSignalState_0(v27.getMetadataGetter(v17.HomepageLaunch));
    local v29 = l_useSignalState_0(v27.getHasShownGetter(v17.HomepageLaunch));
    local v30 = nil;
    local v31 = nil;
    if l_FFlagEnableDeepLinkHistoryWithModalAPI_0 then
        v30 = v5.DeepLinkLuaReceiverStatusStore(false);
        v31 = l_useSignalState_0(v30.getDeepLinkLuaPostAuthReceiverStatus);
    end;
    local v32 = nil;
    local v33 = nil;
    if v23 then
        local v34, v35 = v2.useState(false);
        v32 = v34;
        v33 = v35;
    end;
    local v36 = nil;
    local v37 = nil;
    if v23 then
        local v38, v39 = v2.useState(false);
        v36 = v38;
        v37 = v39;
    end;
    local l_isFocused_0 = v24.isFocused;
    local v41 = if l_FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals_0 then v19(v17.HomepageLaunch, v25) else nil;
    if v23 then
        v2.useEffect(function() --[[ Line: 67 ]]
            -- upvalues: v37 (ref), v12 (ref), v33 (ref), v16 (ref)
            v37(true);
            v12.setupPushNotificationsUpsell.ShouldShowUpsell(v12.NotificationsUpsellConstants.ModalKey.PushUpsellHome, false):andThen(function(v42) --[[ Line: 71 ]]
                -- upvalues: v33 (ref)
                if v42 then
                    v33(true);
                    return;
                else
                    return;
                end;
            end):catch(function(v43) --[[ Line: 77 ]]
                -- upvalues: v16 (ref)
                v16:error((("Failed to evaluate push upsell: %*"):format(v43)));
            end):finally(function() --[[ Line: 80 ]]
                -- upvalues: v37 (ref)
                v37(false);
            end);
        end, {});
    end;
    v2.useEffect(function() --[[ Line: 86 ]]
        -- upvalues: v22 (ref), l_FFlagEnableDeepLinkHistoryWithModalAPI_0 (ref), v31 (ref), v5 (ref), v18 (ref), v25 (copy), v17 (ref), v16 (ref)
        if v22 <= math.random(0, 99) then
            return;
        elseif l_FFlagEnableDeepLinkHistoryWithModalAPI_0 and v31 ~= v5.DeepLinkLuaPostAuthReceiverStatus.Ready then
            return;
        else
            local v45 = v18(v25, v17.HomepageLaunch):catch(function(v44) --[[ Line: 97 ]]
                -- upvalues: v16 (ref)
                v16:error((("Failed to fetch modal metadata for home page launch: %*"):format(v44)));
            end);
            return function() --[[ Line: 101 ]]
                -- upvalues: v45 (copy)
                v45:cancel();
            end;
        end;
    end, {
        v25, 
        if l_FFlagEnableDeepLinkHistoryWithModalAPI_0 then v31 else nil
    });
    v2.useEffect(function() --[[ Line: 107 ]]
        -- upvalues: v29 (copy), v28 (copy), l_isFocused_0 (copy), v23 (ref), v36 (ref), v32 (ref), v27 (copy), v17 (ref), l_FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals_0 (ref), v41 (copy), v26 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref)
        if v29 then
            return;
        elseif not v28 then
            return;
        elseif not l_isFocused_0 then
            return;
        elseif v23 and (v36 or v32) then
            return;
        else
            v27.setHasShown(v17.HomepageLaunch, true);
            if l_FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals_0 then
                if v28.isCustomHandler then
                    v41(v28);
                    return;
                else
                    v26(l_SetCentralOverlay_0(l_CentralOverlayType_0.SduiModal, {
                        sduiComponentConfig = v28.sduiConfig, 
                        modalId = v28.modalId, 
                        modalType = v28.modalType
                    }));
                    return;
                end;
            else
                v26(l_SetCentralOverlay_0(l_CentralOverlayType_0.SduiModal, {
                    sduiComponentConfig = v28.sduiConfig, 
                    modalId = v28.modalId, 
                    modalType = v28.modalType
                }));
                return;
            end;
        end;
    end, {
        v29, 
        v28, 
        l_isFocused_0, 
        v26, 
        if l_FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals_0 then v41 else nil, 
        if l_FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals_0 then v27 else nil, 
        if v23 then v36 else nil, 
        if v23 then v32 else nil
    });
    return nil;
end);
return v2.memo(v46);