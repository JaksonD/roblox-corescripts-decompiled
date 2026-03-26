local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Players_0 = game:GetService("Players");
local l_HttpService_0 = game:GetService("HttpService");
local v4 = require(l_Parent_1.React);
local l_dependencyArray_0 = require(l_Parent_1.RoactUtils).Hooks.dependencyArray;
local v6 = require(script.Parent.utils.LifecycleEvents);
local l_NotificationTypeEnum_0 = require(l_Parent_0.type).NotificationTypeEnum;
local v8 = require(l_Parent_1.GuiObjectUtils);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_1.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_useProperty_0 = v8.useProperty;
return function() --[[ Line: 21 ]] --[[ Name: InGameToastNotificationActionEventReceiver ]]
    -- upvalues: l_useProperty_0 (copy), l_Players_0 (copy), v4 (copy), v6 (copy), l_NotificationTypeEnum_0 (copy), l_HttpService_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    local v11 = l_useProperty_0(l_Players_0, "LocalPlayer");
    v4.useEffect(function() --[[ Line: 24 ]]
        -- upvalues: v6 (ref), l_NotificationTypeEnum_0 (ref), l_HttpService_0 (ref), v11 (copy), l_Players_0 (ref)
        local v15 = v6:RegisterCallback(v6.ToastEvents.UserAction, l_NotificationTypeEnum_0.FriendRequestReceived, function(v12) --[[ Line: 28 ]]
            -- upvalues: l_HttpService_0 (ref), v11 (ref), l_Players_0 (ref)
            if v12 and v12.userActionType == "click" and v12.notificationData and v12.visualItem then
                local l_senderUserId_0 = l_HttpService_0:JSONDecode(v12.visualItem.actionEventParams).senderUserId;
                if l_senderUserId_0 and v11 then
                    local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId((tonumber(l_senderUserId_0)));
                    if v12.visualItem.eventName == "AcceptFriend" then
                        v11:RequestFriendship(l_l_Players_0_PlayerByUserId_0);
                        return;
                    elseif v12.visualItem.eventName == "IgnoreFriend" then
                        v11:RevokeFriendship(l_l_Players_0_PlayerByUserId_0);
                    end;
                end;
            end;
        end);
        return function() --[[ Line: 48 ]]
            -- upvalues: v15 (copy)
            v15();
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v11
    } else l_dependencyArray_0(v11));
end;