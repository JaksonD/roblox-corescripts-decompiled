local l_CoreGui_0 = game:GetService("CoreGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v6 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v7 = require(l_RobloxGui_0.Modules.FriendingUtility);
local l_SendNotificationInfo_0 = l_RobloxGui_0:WaitForChild("SendNotificationInfo");
local v9 = require(l_RobloxGui_0.Modules.Flags.FFlagRemoveHardCodedFriendLimitPrompt);
return function(v10, v11) --[[ Line: 18 ]] --[[ Name: RequestFriendship ]]
    -- upvalues: v9 (copy), l_RbxAnalyticsService_0 (copy), l_Players_0 (copy), l_LocalPlayer_0 (copy), v7 (copy), l_SendNotificationInfo_0 (copy), v6 (copy)
    return function() --[[ Line: 19 ]]
        -- upvalues: v9 (ref), l_RbxAnalyticsService_0 (ref), v10 (copy), l_Players_0 (ref), l_LocalPlayer_0 (ref), v7 (ref), v11 (copy), l_SendNotificationInfo_0 (ref), v6 (ref)
        coroutine.wrap(function() --[[ Line: 20 ]]
            -- upvalues: v9 (ref), l_RbxAnalyticsService_0 (ref), v10 (ref), l_Players_0 (ref), l_LocalPlayer_0 (ref), v7 (ref), v11 (ref), l_SendNotificationInfo_0 (ref), v6 (ref)
            if v9 then
                l_RbxAnalyticsService_0:ReportCounter("PlayerDropDown-RequestFriendship");
                l_RbxAnalyticsService_0:TrackEvent("Game", "RequestFriendship", "PlayerDropDown");
                if v10.Parent == l_Players_0 then
                    l_LocalPlayer_0:RequestFriendship(v10);
                    return;
                end;
            else
                local l_v7_FriendCountAsync_0 = v7:GetFriendCountAsync(v10.UserId);
                local l_v7_FriendCountAsync_1 = v7:GetFriendCountAsync(l_LocalPlayer_0.UserId);
                if not l_v7_FriendCountAsync_1 or not l_v7_FriendCountAsync_0 then
                    return;
                elseif l_v7_FriendCountAsync_1 < 200 and l_v7_FriendCountAsync_0 < 200 then
                    l_RbxAnalyticsService_0:ReportCounter("PlayerDropDown-RequestFriendship");
                    l_RbxAnalyticsService_0:TrackEvent("Game", "RequestFriendship", "PlayerDropDown");
                    if v10.Parent == l_Players_0 then
                        l_LocalPlayer_0:RequestFriendship(v10);
                        return;
                    end;
                elseif l_v7_FriendCountAsync_1 >= 200 then
                    local v14 = v11 and "Cannot accept friend request" or "Cannot send friend request";
                    l_SendNotificationInfo_0:Fire({
                        Title = v14, 
                        Text = "You are at the max friends limit.", 
                        Duration = 5
                    });
                    return;
                elseif l_v7_FriendCountAsync_0 >= 200 then
                    local v15 = v11 and "Cannot accept friend request" or "Cannot send friend request";
                    local v16 = v6:FormatByKey("InGame.PlayerDropDown.OtherPlayerFriendLimit", {
                        RBX_NAME = v10.Name
                    });
                    l_SendNotificationInfo_0:Fire({
                        Title = v15, 
                        Text = v16, 
                        Duration = 5
                    });
                end;
            end;
        end)();
    end;
end;