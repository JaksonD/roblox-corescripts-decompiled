local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Players_0 = game:GetService("Players");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.SignalsReact);
local l_Game_0 = require(l_Parent_0.DataHydration).Game;
local v7 = require(l_Parent_0.RoactUtils);
local v8 = require(l_Parent_0.Localization);
local l_SduiChip_0 = require(l_Parent_0.SduiSharedContent).SduiChip;
local v10 = require(l_Parent_0.ToastRodux);
local l_ToastType_0 = v10.Enums.ToastType;
local l_SetCurrentToastMessage_0 = v10.Actions.SetCurrentToastMessage;
local v13 = require(l_Parent_0.UniversalAppPolicy);
local l_gameFollow_0 = require(l_Parent_0.DiscoveryAnalytics).Events.gameFollow;
local l_useDispatch_0 = v7.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v8.Hooks.useLocalization;
local l_useAppPolicy_0 = v13.useAppPolicy;
local v18 = require(l_script_FirstAncestor_0.Content.ExperienceDetails.Hooks.useOptimisticUpdateStatus);
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
return v3.memo(function(v20) --[[ Line: 41 ]] --[[ Name: ExperienceDetailsNotifyChip ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), l_useDispatch_0 (copy), v5 (copy), l_Game_0 (copy), l_useLocalization_0 (copy), v3 (copy), l_Players_0 (copy), l_gameFollow_0 (copy), l_SetCurrentToastMessage_0 (copy), l_ToastType_0 (copy), v18 (copy), l_useAppPolicy_0 (copy), l_SduiChip_0 (copy), v4 (copy)
    local v21 = nil;
    v21 = if l_FFlagSduiServerCompat_0 then v20.layoutOrder else v20.LayoutOrder;
    local l_universeId_0 = v20.universeId;
    local v23 = l_useDispatch_0();
    local v24 = v5.useSignalState(l_Game_0.getFollowingsStore(false).getAndFetchFollowing(l_universeId_0).data);
    local v25 = v24 and v24.isFollowing or false;
    local v26 = v5.useSignalState(l_Game_0.getGameInfoStore(false).getAndFetchGameInfo(l_universeId_0).data);
    local v27 = v26 and v26.name or "";
    local v28 = l_useLocalization_0({
        notifications = "Feature.GameFollows.LabelNotifications", 
        notificationsTurnedOn = {
            "Feature.GameFollows.TooltipTurnedOnNotifications"; 
            experienceName = v27
        }, 
        notificationsTurnedOff = {
            "Feature.GameFollows.TooltipTurnedOffNotifications"; 
            experienceName = v27
        }
    });
    local v29 = v26 and v26.rootPlaceId or nil;
    local v32 = v3.useCallback(function() --[[ Line: 67 ]]
        -- upvalues: v25 (copy), v29 (copy), l_Players_0 (ref), l_gameFollow_0 (ref), l_Game_0 (ref), l_universeId_0 (copy)
        local v30 = not v25;
        if v29 then
            local v31 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId;
            l_gameFollow_0({
                uid = tostring(v31), 
                placeId = v29, 
                state = v30 and "on" or "off", 
                ctx = "ExperienceDetailsNotifyChip"
            }, "ExperienceDetailsNotifyChip");
        end;
        return l_Game_0.getFollowingsStore(false).updateFollowing(l_universeId_0, v30);
    end, {
        l_universeId_0, 
        v29, 
        v25
    });
    local v35 = v3.useCallback(function(v33) --[[ Line: 83 ]]
        -- upvalues: v23 (copy), l_SetCurrentToastMessage_0 (ref), l_ToastType_0 (ref), v28 (copy)
        if not v33 then
            return;
        elseif v33.type == "error" then
            local v34 = "Feature.GameFollows.TooltipFollowLimitReached";
            if v33.errorType == "LimitReached" then
                v34 = "Feature.GameFollows.TooltipNotificationsLimitReached";
            elseif v33.errorType == "NetworkError" then
                v34 = "Feature.Toast.NetworkingError.SomethingIsWrong";
            end;
            v23(l_SetCurrentToastMessage_0({
                toastType = if v33.errorType == "LimitReached" then l_ToastType_0.GameFollowError else l_ToastType_0.NetworkingError, 
                toastMessage = v34
            }));
            return;
        else
            if v33.type == "success" then
                if v33.isFollowing then
                    v23(l_SetCurrentToastMessage_0({
                        toastType = l_ToastType_0.NotificationsTurnedOn, 
                        toastMessage = v28.notificationsTurnedOn, 
                        isLocalized = true
                    }));
                    return;
                else
                    v23(l_SetCurrentToastMessage_0({
                        toastType = l_ToastType_0.NotificationsTurnedOff, 
                        toastMessage = v28.notificationsTurnedOff, 
                        isLocalized = true
                    }));
                end;
            end;
            return;
        end;
    end, {
        v23, 
        v27, 
        v28
    });
    local v36 = v18(v32, v35);
    if not l_useAppPolicy_0(function(v37) --[[ Line: 121 ]]
        return v37.getNotificationsCanReceiveExperience();
    end) then
        return nil;
    else
        return v3.createElement(l_SduiChip_0, {
            text = v28.notifications, 
            leadingIconName = v4.Enums.IconName.Bell, 
            leadingIconVariant = if v25 then v4.Enums.IconVariant.Filled else nil, 
            onActivated = v36, 
            LayoutOrder = if not l_FFlagSduiServerCompat_0 then v21 else nil, 
            layoutOrder = if l_FFlagSduiServerCompat_0 then v21 else nil
        });
    end;
end);