local l_IXPService_0 = game:GetService("IXPService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.RoactAppExperiment);
local v6 = require(l_Parent_0.Localization);
local v7 = require(l_Parent_0.UIBlox);
local v8 = require(l_Parent_0.SharedFlags);
local l_Toast_0 = v7.App.Dialog.Toast;
local v10 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v11 = require(l_script_FirstAncestor_0.Components.ProfileQRCodeTopBar);
local v12 = require(l_script_FirstAncestor_0.Components.QRCodeFriendRequestNotification);
local v13 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v14 = require(l_script_FirstAncestor_0.Networking.useAcceptFriendUrl);
local v15 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local v16 = require(l_script_FirstAncestor_0.Networking.useGetUsersInfoUrl);
local l_useLocalization_0 = v6.Hooks.useLocalization;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v19 = require(l_Parent_0.FriendsNetworking);
local l_Images_0 = v7.App.ImageSet.Images;
local v21 = require(l_script_FirstAncestor_0.Common.SignalREvents);
local v22 = require(l_script_FirstAncestor_0.Flags.getFStringProfileQRCodeFriendRequestAlertsExperimentKey);
local v23 = require(l_script_FirstAncestor_0.Flags.getFStringProfileQRCodeFriendRequestAlertsLayer);
local l_FFlagConnectionsToFriendsRename_0 = v8.FFlagConnectionsToFriendsRename;
local v25 = l_Images_0["icons/actions/friends/friendAdd"];
return (v5.connectUserLayer({
    v23()
}, function(v26, _) --[[ Line: 193 ]]
    -- upvalues: v23 (copy), v22 (copy)
    return {
        profileQRCodeFriendRequestAlertsEnabled = (v26[v23()] or {})[v22()]
    };
end, false)(function(v28) --[[ Line: 51 ]]
    -- upvalues: l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v13 (copy), v15 (copy), v4 (copy), l_IXPService_0 (copy), v23 (copy), v3 (copy), l_useLocalUserId_0 (copy), v16 (copy), v14 (copy), v21 (copy), v19 (copy), v11 (copy), l_Toast_0 (copy), v25 (copy), v12 (copy), v10 (copy)
    local v29 = l_useLocalization_0({
        friendAdded = if l_FFlagConnectionsToFriendsRename_0 then v13.FriendAdded else v13.ConnectionAdded
    });
    local v30 = v15();
    local l_profileQRCodeFriendRequestAlertsEnabled_0 = v28.profileQRCodeFriendRequestAlertsEnabled;
    local l_robloxEventReceiver_0 = v28.robloxEventReceiver;
    local v33, v34 = v4.useState(false);
    local v37, v38 = v4.useReducer(function(v35, v36) --[[ Line: 60 ]]
        -- upvalues: l_IXPService_0 (ref), v23 (ref), v3 (ref)
        if v36.type == "addItemToQueue" then
            l_IXPService_0:LogUserLayerExposure(v23());
            return v3.List.join(v35, {
                v36.newUserId
            });
        elseif v36.type == "removeItemFromQueue" then
            return v3.List.removeIndex(v35, 1);
        else
            return v35;
        end;
    end, {});
    local v39 = l_useLocalUserId_0();
    local v40 = v16();
    local v41 = v14();
    local function v45(v42) --[[ Line: 77 ]] --[[ Name: friendshipNotificationReceived ]]
        -- upvalues: v21 (ref), v19 (ref), v39 (copy), v40 (copy), v38 (copy)
        if v42.Type == v21.FriendshipRequested and v42.EventArgs.SourceType == v19.Enums.FriendshipOriginSourceType.QrCode.rawValue() then
            local v43 = tostring(v42.EventArgs.UserId1);
            if v43 == v39 then
                v43 = tostring(v42.EventArgs.UserId2);
            end;
            do
                local l_v43_0 = v43;
                v40(l_v43_0):andThen(function() --[[ Line: 91 ]]
                    -- upvalues: v38 (ref), l_v43_0 (ref)
                    v38({
                        type = "addItemToQueue", 
                        newUserId = l_v43_0
                    });
                end);
            end;
        end;
    end;
    v4.useEffect(function() --[[ Line: 97 ]]
        -- upvalues: l_robloxEventReceiver_0 (copy), v21 (ref), v45 (copy)
        l_robloxEventReceiver_0:observeEvent(v21.FriendshipNotifications, function(v46) --[[ Line: 98 ]]
            -- upvalues: v45 (ref)
            v45(v46);
        end);
    end, {
        l_robloxEventReceiver_0
    });
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 56), 
        BackgroundTransparency = 1, 
        ZIndex = 3, 
        LayoutOrder = 1
    }, {
        TopBarWrapper = v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            ZIndex = 3
        }, {
            Layout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            TopBar = v4.createElement(v11, {
                appStorageService = v28.appStorageService, 
                layoutOrder = 1, 
                onClose = v28.onClose, 
                openQrCodeScanner = v28.openQrCodeScanner
            })
        }), 
        FriendAcceptToastFrame = if l_profileQRCodeFriendRequestAlertsEnabled_0 and v33 then v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            ZIndex = 100
        }, {
            FriendAcceptToast = v4.createElement(l_Toast_0, {
                toastContent = {
                    toastTitle = v29.friendAdded, 
                    iconImage = v25, 
                    onDismissed = function() --[[ Line: 138 ]] --[[ Name: onDismissed ]]
                        -- upvalues: v34 (copy)
                        v34(false);
                    end
                }, 
                duration = 3, 
                show = true
            })
        }) else nil, 
        FriendsInviteFrame = if not (l_profileQRCodeFriendRequestAlertsEnabled_0 and #v37 > 0) or v33 then nil else v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 0, 24), 
            Size = UDim2.new(1, 0, 1, 0), 
            ZIndex = 100
        }, {
            Padding = v4.createElement("UIPadding", {
                PaddingRight = UDim.new(0, 28), 
                PaddingLeft = UDim.new(0, 28)
            }), 
            Layout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            FriendsInvite = v4.createElement(v12, {
                notificationQueueSize = #v37, 
                onAccept = function(v47) --[[ Line: 169 ]] --[[ Name: onAccept ]]
                    -- upvalues: v41 (copy), v39 (copy), v38 (copy), v34 (copy), v30 (copy), v10 (ref), v37 (copy)
                    v41(v39, v47):andThen(function() --[[ Line: 170 ]]
                        -- upvalues: v38 (ref), v34 (ref)
                        v38({
                            type = "removeItemFromQueue", 
                            newUserId = "0"
                        });
                        v34(true);
                    end);
                    v30.fireEvent(v10.QRPageFriendRequestBannerAccepted, {
                        qrCodeBannerQueueSize = #v37
                    });
                end, 
                onClose = function() --[[ Line: 178 ]] --[[ Name: onClose ]]
                    -- upvalues: v38 (copy), v30 (copy), v10 (ref), v37 (copy)
                    v38({
                        type = "removeItemFromQueue", 
                        newUserId = "0"
                    });
                    v30.fireEvent(v10.QRPageFriendRequestBannerDismissed, {
                        qrCodeBannerQueueSize = #v37
                    });
                end, 
                userId = tostring(v37[1])
            })
        })
    });
end));