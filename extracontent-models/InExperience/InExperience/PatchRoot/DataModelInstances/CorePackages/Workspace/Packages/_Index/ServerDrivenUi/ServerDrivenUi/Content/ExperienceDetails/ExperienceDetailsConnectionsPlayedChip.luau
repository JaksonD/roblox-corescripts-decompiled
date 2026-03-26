local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local l_Players_0 = game:GetService("Players");
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.Localization);
local v5 = require(l_Parent_0.SignalsReact);
local l_Game_0 = require(l_Parent_0.DataHydration).Game;
local l_SduiChip_0 = require(l_Parent_0.SduiSharedContent).SduiChip;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_gameConnectionsPlayedChipClicked_0 = require(l_Parent_0.DiscoveryAnalytics).Events.gameConnectionsPlayedChipClicked;
local l_AvatarGroupType_0 = v3.Enums.AvatarGroupType;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v14 = require(l_Parent_0.SharedFlags);
local l_FFlagSduiServerCompat_0 = v14.FFlagSduiServerCompat;
local l_FFlagConnectionsToFriendsRename_0 = v14.FFlagConnectionsToFriendsRename;
return v2.memo(function(v17) --[[ Line: 39 ]] --[[ Name: ExperienceDetailsConnectionsPlayedChip ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), l_useDispatch_0 (copy), v5 (copy), l_Game_0 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v2 (copy), l_Players_0 (copy), l_gameConnectionsPlayedChipClicked_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_SduiChip_0 (copy), l_AvatarGroupType_0 (copy)
    local v18 = nil;
    v18 = if l_FFlagSduiServerCompat_0 then v17.layoutOrder else v17.LayoutOrder;
    local l_universeId_0 = v17.universeId;
    local v20 = l_useDispatch_0();
    local v21 = v5.useSignalState(l_Game_0.getConnectionsPlayedStore(false).getConnectionsPlayed(l_universeId_0).data);
    local v22 = v5.useSignalState(l_Game_0.getGameInfoStore(false).getAndFetchGameInfo(l_universeId_0).data);
    local v23 = if v21 then v21.userIds else {};
    local v24 = if v21 then v21.totalCount else 0;
    local v25 = l_useLocalization_0({
        connectionsPlayed = {
            l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Label.FriendsPlayed" or "Feature.Friends.Label.ConnectionsPlayed"; 
            numberOfConnections = v24
        }, 
        connectionsRecentlyPlayed = {
            l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Label.FriendsRecentlyPlayed" or "Feature.Friends.Label.ConnectionsRecentlyPlayed"; 
            numberOfConnections = v24
        }, 
        connectionRecentlyPlayed = {
            l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Label.FriendRecentlyPlayed" or "Feature.Friends.Label.ConnectionRecentlyPlayed"
        }
    });
    local v28 = v2.useCallback(function() --[[ Line: 78 ]]
        -- upvalues: v22 (copy), l_Players_0 (ref), l_gameConnectionsPlayedChipClicked_0 (ref), l_universeId_0 (copy), v24 (copy), v20 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v23 (copy), v25 (copy)
        local v26 = v22 and v22.rootPlaceId;
        if v26 then
            local v27 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId;
            l_gameConnectionsPlayedChipClicked_0({
                uid = tostring(v27), 
                universeId = l_universeId_0, 
                placeId = tostring(v26), 
                totalConnections = v24
            }, "ExperienceDetailsConnectionsPlayedChip");
        end;
        v20(l_NavigateDown_0({
            name = l_AppPage_0.SocialProofVerticalUserListSheet, 
            extraProps = {
                userIds = v23, 
                title = if v24 == 1 then v25.connectionRecentlyPlayed else v25.connectionsRecentlyPlayed
            }
        }));
    end, {
        v20, 
        l_universeId_0, 
        v22, 
        v24, 
        v25, 
        l_Players_0.LocalPlayer
    });
    if v24 == 0 then
        return nil;
    else
        local l_connectionsPlayed_0 = v25.connectionsPlayed;
        local v30 = {};
        for v31 = 1, math.min(2, #v23) do
            table.insert(v30, v23[v31]);
        end;
        return v2.createElement(l_SduiChip_0, {
            text = l_connectionsPlayed_0, 
            leading = {
                type = "AvatarGroup", 
                props = {
                    avatars = v30, 
                    type = l_AvatarGroupType_0.Stacked, 
                    max = 2
                }
            }, 
            onActivated = v28, 
            LayoutOrder = if not l_FFlagSduiServerCompat_0 then v18 else nil, 
            layoutOrder = if l_FFlagSduiServerCompat_0 then v18 else nil
        });
    end;
end);