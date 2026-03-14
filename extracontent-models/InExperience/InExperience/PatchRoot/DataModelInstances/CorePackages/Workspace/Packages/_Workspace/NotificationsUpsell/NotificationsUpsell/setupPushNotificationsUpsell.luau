local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.NotificationModalsManager);
local l_default_0 = require(l_Parent_0.PermissionsProtocol).PermissionsProtocol.default;
local l_default_1 = require(l_Parent_0.LoggingProtocol).default;
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_sendEventDeferred_0 = require(l_Parent_0.NotificationsCommon).sendEventDeferred;
local v8 = require(script.Parent.Components.PushNotificationsUpsellModal);
local v9 = require(script.Parent.NotificationsUpsellConstants);
local v10 = require(script.Parent.Analytics.ModalEventConstants);
local v11 = require(script.Parent.Analytics.RobloxTelemetryConfigs.PushUpsellEventName);
local v12 = require(script.Parent.Util.PushNotificationsUpsellUtils);
local v13 = require(l_Parent_0.Promise);
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
local v15 = require(script.Parent.Flags.FIntPushUpsellCooldownPeriod);
local v16 = require(script.Parent.Flags.FIntPushUpsellMaxPromptCount);
local v17 = require(script.Parent.Flags.FIntPushUpsellChatCooldownPeriod);
local v18 = require(script.Parent.Flags.FIntPushUpsellChatMaxPromptCount);
local l_GetFFlagEnablePushNotificationsUpsellModal_0 = require(l_Parent_0.SharedFlags).GetFFlagEnablePushNotificationsUpsellModal;
local l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppPushUpsellDeprecateOldEvents;
local v21 = game:DefineFastFlag("CacheShouldShowPushUpsellHideResponse", false);
local v22 = game:DefineFastInt("ShouldShowPushUpsellHideResponseCacheExpirationTime", 6);
local v23 = false;
local v24 = 0;
local function v33(v25) --[[ Line: 40 ]] --[[ Name: shouldShowUpsellHome ]]
    -- upvalues: v21 (copy), v24 (ref), v22 (copy), v23 (ref), v13 (copy), v12 (copy), l_AppStorageService_0 (copy), v9 (copy), v16 (copy), v15 (copy), l_default_0 (copy)
    if v21 and (os.time() - v24) / 3600 < v22 and v23 then
        return v13.resolve(false);
    else
        local v26 = v12.getPushUpsellPromptedCount(l_AppStorageService_0, v9.LocalStorageKeys.PromptShownCount);
        local v27 = if v25 then v12.getPushEduUpsellResponseTimestamp(l_AppStorageService_0) else v12.getPushSysUpsellPromptTimestamp(l_AppStorageService_0);
        local v28 = false;
        if v26 >= 0 and v27 >= 0 then
            local v29 = (os.time() - v27) / 86400;
            local v30 = false;
            if v26 < v16 then
                v30 = true;
                if v15 > v29 then
                    v30 = v27 == 0;
                end;
            end;
            v28 = v30;
        end;
        if v28 then
            return l_default_0:shouldShowUpsell({
                l_default_0.Permissions.POST_NOTIFICATIONS
            }):andThen(function(v31) --[[ Line: 70 ]]
                -- upvalues: l_default_0 (ref), v13 (ref), v21 (ref), v23 (ref), v24 (ref)
                if v31.upsellStatus and v31.upsellStatus == l_default_0.UpsellStatus.SHOW then
                    return v13.resolve(true);
                else
                    if v21 then
                        v23 = true;
                        v24 = os.time();
                    end;
                    return v13.resolve(false);
                end;
            end, function(_) --[[ Line: 82 ]]
                -- upvalues: v13 (ref)
                return v13.resolve(false);
            end);
        else
            return v13.resolve(false);
        end;
    end;
end;
local function _() --[[ Line: 95 ]] --[[ Name: userHasRespondedToPushUpsellChat ]]
    -- upvalues: v12 (copy), l_AppStorageService_0 (copy), v9 (copy), v18 (copy)
    local v34 = v12.getPushUpsellPromptedCount(l_AppStorageService_0, v9.LocalStorageKeys.ChatPromptShownCount);
    local v35 = true;
    if v34 >= 0 then
        v35 = v18 <= v34;
    end;
    return v35;
end;
local function _() --[[ Line: 103 ]] --[[ Name: userHasRespondedToUpsellPromptLessThanCooldownPeriod ]]
    -- upvalues: v12 (copy), l_AppStorageService_0 (copy), v17 (copy)
    local v37 = v12.getPushSysUpsellPromptTimestamp(l_AppStorageService_0);
    local v38 = false;
    if v37 >= 0 then
        v38 = (os.time() - v37) / 86400 < v17;
    end;
    return v38;
end;
local function v42() --[[ Line: 109 ]] --[[ Name: shouldShowRationale ]]
    -- upvalues: l_default_0 (copy), v13 (copy)
    return l_default_0:shouldShowRationale({
        l_default_0.Permissions.POST_NOTIFICATIONS
    }):andThen(function(v40) --[[ Line: 113 ]]
        -- upvalues: v13 (ref), l_default_0 (ref)
        return v13.resolve(v40.upsellStatus == l_default_0.UpsellStatus.SHOW);
    end):catch(function(_) --[[ Line: 116 ]]
        -- upvalues: v13 (ref)
        return v13.resolve(false);
    end);
end;
local function v48(_) --[[ Line: 121 ]] --[[ Name: shouldShowUpsellChat ]]
    -- upvalues: v12 (copy), l_AppStorageService_0 (copy), v9 (copy), v18 (copy), v17 (copy), v13 (copy), v42 (copy)
    local v44 = v12.getPushUpsellPromptedCount(l_AppStorageService_0, v9.LocalStorageKeys.ChatPromptShownCount);
    local v45 = true;
    if v44 >= 0 then
        v45 = v18 <= v44;
    end;
    if not v45 then
        v44 = v12.getPushSysUpsellPromptTimestamp(l_AppStorageService_0);
        v45 = false;
        if v44 >= 0 then
            v45 = (os.time() - v44) / 86400 < v17;
        end;
        if not v45 then
            return v42():andThen(function(v46) --[[ Line: 127 ]]
                -- upvalues: v13 (ref)
                if v46 then
                    return (v13.resolve(true));
                else
                    return (v13.resolve(false));
                end;
            end):catch(function(_) --[[ Line: 130 ]]
                -- upvalues: v13 (ref)
                return v13.resolve(false);
            end);
        end;
    end;
    return v13.resolve(false);
end;
return {
    OpenModal = function(v49, v50, v51) --[[ Line: 152 ]] --[[ Name: openModal ]]
        -- upvalues: l_GetFFlagEnablePushNotificationsUpsellModal_0 (copy), l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0 (copy), l_sendEventDeferred_0 (copy), v10 (copy), l_default_1 (copy), v11 (copy), v3 (copy), v9 (copy), v12 (copy), l_AppStorageService_0 (copy), v8 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_default_0 (copy)
        if not l_GetFFlagEnablePushNotificationsUpsellModal_0() then
            return;
        elseif v50 then
            local function v52() --[[ Line: 158 ]]
                -- upvalues: l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0 (ref), l_sendEventDeferred_0 (ref), v10 (ref), l_default_1 (ref), v11 (ref)
                if not l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0() then
                    l_sendEventDeferred_0(v10.ModalContextPushEduUpsell, v10.OptInPushEventName, {
                        [v10.ActionType] = v10.Closed
                    });
                end;
                l_default_1:logRobloxTelemetryEvent(v11, {}, {
                    [v10.ActionType] = v10.Closed
                }, v10.ModalContextPushEduUpsell);
            end;
            local function v53() --[[ Line: 175 ]]
                -- upvalues: v3 (ref), v49 (copy)
                v3.CloseModal(v49);
            end;
            if not l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0() then
                l_sendEventDeferred_0(v10.ModalContextPushEduUpsell, v10.OptInPushEventName, {
                    [v10.ActionType] = v10.Opened
                });
            end;
            l_default_1:logRobloxTelemetryEvent(v11, {}, {
                [v10.ActionType] = v10.Opened, 
                [v10.EntryPoint] = v51 or ""
            }, v10.ModalContextPushEduUpsell);
            if v49 == v9.ModalKey.PushUpsellHome then
                v12.incrementPushUpsellPromptedCount(l_AppStorageService_0, v9.LocalStorageKeys.PromptShownCount);
            elseif v49 == v9.ModalKey.PushUpsellChat then
                v12.incrementPushUpsellPromptedCount(l_AppStorageService_0, v9.LocalStorageKeys.ChatPromptShownCount);
            end;
            v3.OpenModal(v49, v8, {
                CloseCallback = v52, 
                Props = {
                    CloseModal = v53, 
                    TranslationKeys = v9.TranslationKeys[v49]
                }, 
                DisableBackgroundDismiss = true, 
                DisplayOrder = 2, 
                Localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
            });
            return;
        else
            if not l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0() then
                l_sendEventDeferred_0(v10.ModalContextSysUpsell, v10.OptInPushEventName, {
                    [v10.ActionType] = v10.Opened
                });
            end;
            l_default_1:logRobloxTelemetryEvent(v11, {}, {
                [v10.ActionType] = v10.Opened, 
                [v10.EntryPoint] = v51 or ""
            }, v10.ModalContextSysUpsell);
            l_default_0:requestPermissions({
                l_default_0.Permissions.POST_NOTIFICATIONS
            }):andThen(function(_) --[[ Line: 227 ]]
                -- upvalues: v12 (ref), l_AppStorageService_0 (ref), v9 (ref), l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0 (ref), l_sendEventDeferred_0 (ref), v10 (ref), l_default_1 (ref), v11 (ref)
                v12.setPushSysUpsellPromptTimestamp(l_AppStorageService_0, os.time());
                v12.incrementPushUpsellPromptedCount(l_AppStorageService_0, v9.LocalStorageKeys.PromptShownCount);
                if not l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0() then
                    l_sendEventDeferred_0(v10.ModalContextSysUpsell, v10.OptInPushEventName, {
                        [v10.ActionType] = v10.RequestSuccess
                    });
                end;
                l_default_1:logRobloxTelemetryEvent(v11, {}, {
                    [v10.ActionType] = v10.RequestSuccess
                }, v10.ModalContextSysUpsell);
            end, function(_) --[[ Line: 244 ]]
                -- upvalues: l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0 (ref), l_sendEventDeferred_0 (ref), v10 (ref), l_default_1 (ref), v11 (ref)
                if not l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0() then
                    l_sendEventDeferred_0(v10.ModalContextSysUpsell, v10.OptInPushEventName, {
                        [v10.ActionType] = v10.RequestFailed
                    });
                end;
                l_default_1:logRobloxTelemetryEvent(v11, {}, {
                    [v10.ActionType] = v10.RequestFailed
                }, v10.ModalContextSysUpsell);
            end);
            return;
        end;
    end, 
    CloseModal = function(v56) --[[ Line: 260 ]] --[[ Name: closeModal ]]
        -- upvalues: v3 (copy)
        v3.CloseModal(v56);
    end, 
    ShouldShowUpsell = function(v57, v58) --[[ Line: 135 ]] --[[ Name: shouldShowUpsell ]]
        -- upvalues: l_GetFFlagEnablePushNotificationsUpsellModal_0 (copy), v13 (copy), l_getAppFeaturePolicies_0 (copy), v9 (copy), v33 (copy), v48 (copy)
        if not l_GetFFlagEnablePushNotificationsUpsellModal_0() then
            return v13.resolve(false);
        else
            local v59 = l_getAppFeaturePolicies_0();
            if not v59.getNotificationsCanReceivePush() or not v59.getPushNotificationsUpsell() then
                return v13.resolve(false);
            elseif v57 == v9.ModalKey.PushUpsellHome then
                return v33(v58);
            elseif v57 == v9.ModalKey.PushUpsellChat then
                return v48(v58);
            else
                return;
            end;
        end;
    end
};