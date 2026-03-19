local l_IXPService_0 = game:GetService("IXPService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useNavigationFocus_0 = require(l_Parent_0.Navigation).useNavigationFocus;
local v6 = require(l_Parent_0.RoactNavigation);
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local v11 = require(l_Parent_0.NotificationsUpsell);
local v12 = require(l_script_FirstAncestor_0.Hooks.useChatIsVisible);
local v13 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local l_PushUpsellEventConfig_0 = v11.PushUpsellEventConfig;
local l_ModalEventConstants_0 = v11.ModalEventConstants;
local l_setupPushNotificationsUpsell_0 = v11.setupPushNotificationsUpsell;
local l_NotificationsUpsellConstants_0 = v11.NotificationsUpsellConstants;
local l_GetFStringPushUpsellChatVariantName_0 = require(l_Parent_0.SharedFlags).GetFStringPushUpsellChatVariantName;
return function() --[[ Line: 27 ]] --[[ Name: CheckAndOpenChatPushUpsell ]]
    -- upvalues: l_useNavigationFocus_0 (copy), l_useNavigation_0 (copy), v12 (copy), v13 (copy), v3 (copy), l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), l_GetFStringPushUpsellChatVariantName_0 (copy), v6 (copy), l_setupPushNotificationsUpsell_0 (copy), l_NotificationsUpsellConstants_0 (copy), l_IXPService_0 (copy), l_default_0 (copy), l_PushUpsellEventConfig_0 (copy), l_ModalEventConstants_0 (copy), l_AppPage_0 (copy)
    local v19 = l_useNavigationFocus_0();
    local v20 = l_useNavigation_0();
    local v21 = v12();
    local v22 = v13();
    local v23, v24 = v3.useState(false);
    local v26 = l_useUserExperiment_0({
        l_AppUserLayers_0.SocialAppChat
    }, function(v25) --[[ Line: 36 ]]
        -- upvalues: l_AppUserLayers_0 (ref), l_GetFStringPushUpsellChatVariantName_0 (ref)
        return {
            pushUpsellChatVariant = (v25[l_AppUserLayers_0.SocialAppChat] or {})[l_GetFStringPushUpsellChatVariantName_0()] or -1
        };
    end);
    v3.useEffect(function() --[[ Line: 45 ]]
        -- upvalues: v20 (copy), v6 (ref), v24 (copy)
        local v28 = v20.addListener(v6.Events.WillBlur, function(v27) --[[ Line: 46 ]]
            -- upvalues: v24 (ref)
            if v27.action.routeName == "ChatConversation" then
                v24(true);
            end;
        end);
        return function() --[[ Line: 53 ]]
            -- upvalues: v28 (copy)
            v28.remove();
        end;
    end, {});
    local function _() --[[ Line: 58 ]] --[[ Name: showUpsellOnChatLanding ]]
        -- upvalues: l_setupPushNotificationsUpsell_0 (ref), l_NotificationsUpsellConstants_0 (ref), l_IXPService_0 (ref), l_AppUserLayers_0 (ref), l_default_0 (ref), l_PushUpsellEventConfig_0 (ref), l_ModalEventConstants_0 (ref), l_AppPage_0 (ref)
        l_setupPushNotificationsUpsell_0.ShouldShowUpsell(l_NotificationsUpsellConstants_0.ModalKey.PushUpsellChat):andThen(function(v29) --[[ Line: 59 ]]
            -- upvalues: l_IXPService_0 (ref), l_AppUserLayers_0 (ref), l_default_0 (ref), l_PushUpsellEventConfig_0 (ref), l_ModalEventConstants_0 (ref), l_AppPage_0 (ref), l_setupPushNotificationsUpsell_0 (ref), l_NotificationsUpsellConstants_0 (ref)
            if not v29 then
                return;
            else
                l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.SocialAppChat);
                l_default_0:logRobloxTelemetryEvent(l_PushUpsellEventConfig_0, {}, {
                    [l_ModalEventConstants_0.ActionType] = l_ModalEventConstants_0.ShouldRequest, 
                    [l_ModalEventConstants_0.EntryPoint] = l_AppPage_0.Chat
                }, l_ModalEventConstants_0.ModalContextPushEduUpsell);
                l_setupPushNotificationsUpsell_0.OpenModal(l_NotificationsUpsellConstants_0.ModalKey.PushUpsellChat, true, l_AppPage_0.Chat);
                return;
            end;
        end);
    end;
    local function _() --[[ Line: 73 ]] --[[ Name: showUpsellWhenReturnFromConversation ]]
        -- upvalues: v23 (copy), v24 (copy), l_setupPushNotificationsUpsell_0 (ref), l_NotificationsUpsellConstants_0 (ref), l_IXPService_0 (ref), l_AppUserLayers_0 (ref), l_default_0 (ref), l_PushUpsellEventConfig_0 (ref), l_ModalEventConstants_0 (ref)
        if not v23 then
            return;
        else
            v24(false);
            l_setupPushNotificationsUpsell_0.ShouldShowUpsell(l_NotificationsUpsellConstants_0.ModalKey.PushUpsellChat):andThen(function(v31) --[[ Line: 79 ]]
                -- upvalues: l_IXPService_0 (ref), l_AppUserLayers_0 (ref), l_default_0 (ref), l_PushUpsellEventConfig_0 (ref), l_ModalEventConstants_0 (ref), l_setupPushNotificationsUpsell_0 (ref), l_NotificationsUpsellConstants_0 (ref)
                if not v31 then
                    return;
                else
                    l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.SocialAppChat);
                    l_default_0:logRobloxTelemetryEvent(l_PushUpsellEventConfig_0, {}, {
                        [l_ModalEventConstants_0.ActionType] = l_ModalEventConstants_0.ShouldRequest, 
                        [l_ModalEventConstants_0.EntryPoint] = "ChatConversation"
                    }, l_ModalEventConstants_0.ModalContextPushEduUpsell);
                    l_setupPushNotificationsUpsell_0.OpenModal(l_NotificationsUpsellConstants_0.ModalKey.PushUpsellChat, true, "ChatConversation");
                    return;
                end;
            end);
            return;
        end;
    end;
    v3.useEffect(function() --[[ Line: 93 ]]
        -- upvalues: v21 (copy), v19 (copy), v22 (copy), v26 (copy), l_setupPushNotificationsUpsell_0 (ref), l_NotificationsUpsellConstants_0 (ref), l_IXPService_0 (ref), l_AppUserLayers_0 (ref), l_default_0 (ref), l_PushUpsellEventConfig_0 (ref), l_ModalEventConstants_0 (ref), l_AppPage_0 (ref), v23 (copy), v24 (copy)
        if not v21 or not v19 or v22 or v26.pushUpsellChatVariant == nil or v26.pushUpsellChatVariant < 0 then
            return;
        elseif v26.pushUpsellChatVariant == 1 then
            l_setupPushNotificationsUpsell_0.ShouldShowUpsell(l_NotificationsUpsellConstants_0.ModalKey.PushUpsellChat):andThen(function(v33) --[[ Line: 59 ]]
                -- upvalues: l_IXPService_0 (ref), l_AppUserLayers_0 (ref), l_default_0 (ref), l_PushUpsellEventConfig_0 (ref), l_ModalEventConstants_0 (ref), l_AppPage_0 (ref), l_setupPushNotificationsUpsell_0 (ref), l_NotificationsUpsellConstants_0 (ref)
                if not v33 then
                    return;
                else
                    l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.SocialAppChat);
                    l_default_0:logRobloxTelemetryEvent(l_PushUpsellEventConfig_0, {}, {
                        [l_ModalEventConstants_0.ActionType] = l_ModalEventConstants_0.ShouldRequest, 
                        [l_ModalEventConstants_0.EntryPoint] = l_AppPage_0.Chat
                    }, l_ModalEventConstants_0.ModalContextPushEduUpsell);
                    l_setupPushNotificationsUpsell_0.OpenModal(l_NotificationsUpsellConstants_0.ModalKey.PushUpsellChat, true, l_AppPage_0.Chat);
                    return;
                end;
            end);
            return;
        else
            if v26.pushUpsellChatVariant == 2 then
                if not v23 then
                    return;
                else
                    v24(false);
                    l_setupPushNotificationsUpsell_0.ShouldShowUpsell(l_NotificationsUpsellConstants_0.ModalKey.PushUpsellChat):andThen(function(v34) --[[ Line: 79 ]]
                        -- upvalues: l_IXPService_0 (ref), l_AppUserLayers_0 (ref), l_default_0 (ref), l_PushUpsellEventConfig_0 (ref), l_ModalEventConstants_0 (ref), l_setupPushNotificationsUpsell_0 (ref), l_NotificationsUpsellConstants_0 (ref)
                        if not v34 then
                            return;
                        else
                            l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.SocialAppChat);
                            l_default_0:logRobloxTelemetryEvent(l_PushUpsellEventConfig_0, {}, {
                                [l_ModalEventConstants_0.ActionType] = l_ModalEventConstants_0.ShouldRequest, 
                                [l_ModalEventConstants_0.EntryPoint] = "ChatConversation"
                            }, l_ModalEventConstants_0.ModalContextPushEduUpsell);
                            l_setupPushNotificationsUpsell_0.OpenModal(l_NotificationsUpsellConstants_0.ModalKey.PushUpsellChat, true, "ChatConversation");
                            return;
                        end;
                    end);
                end;
            end;
            return;
        end;
    end, {
        v21, 
        v19
    });
end;