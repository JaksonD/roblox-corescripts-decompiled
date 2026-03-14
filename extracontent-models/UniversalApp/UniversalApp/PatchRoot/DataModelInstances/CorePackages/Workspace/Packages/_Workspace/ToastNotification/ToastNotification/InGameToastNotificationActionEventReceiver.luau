local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Players_0 = game:GetService("Players");
local l_HttpService_0 = game:GetService("HttpService");
local v4 = require(l_Parent_1.React);
local l_dependencyArray_0 = require(l_Parent_1.RoactUtils).Hooks.dependencyArray;
local v6 = require(script.Parent.utils.LifecycleEvents);
local l_NotificationTypeEnum_0 = require(l_Parent_0.type).NotificationTypeEnum;
local l_useProperty_0 = require(l_Parent_1.GuiObjectUtils).useProperty;
return function() --[[ Line: 19 ]] --[[ Name: InGameToastNotificationActionEventReceiver ]]
    -- upvalues: l_useProperty_0 (copy), l_Players_0 (copy), v4 (copy), v6 (copy), l_NotificationTypeEnum_0 (copy), l_HttpService_0 (copy), l_dependencyArray_0 (copy)
    local v9 = l_useProperty_0(l_Players_0, "LocalPlayer");
    v4.useEffect(function() --[[ Line: 22 ]]
        -- upvalues: v6 (ref), l_NotificationTypeEnum_0 (ref), l_HttpService_0 (ref), v9 (copy), l_Players_0 (ref)
        local v13 = v6:RegisterCallback(v6.ToastEvents.UserAction, l_NotificationTypeEnum_0.FriendRequestReceived, function(v10) --[[ Line: 26 ]]
            -- upvalues: l_HttpService_0 (ref), v9 (ref), l_Players_0 (ref)
            if v10 and v10.userActionType == "click" and v10.notificationData and v10.visualItem then
                local l_senderUserId_0 = l_HttpService_0:JSONDecode(v10.visualItem.actionEventParams).senderUserId;
                if l_senderUserId_0 and v9 then
                    local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId((tonumber(l_senderUserId_0)));
                    if v10.visualItem.eventName == "AcceptFriend" then
                        v9:RequestFriendship(l_l_Players_0_PlayerByUserId_0);
                        return;
                    elseif v10.visualItem.eventName == "IgnoreFriend" then
                        v9:RevokeFriendship(l_l_Players_0_PlayerByUserId_0);
                    end;
                end;
            end;
        end);
        return function() --[[ Line: 46 ]]
            -- upvalues: v13 (copy)
            v13();
        end;
    end, l_dependencyArray_0(v9));
end;