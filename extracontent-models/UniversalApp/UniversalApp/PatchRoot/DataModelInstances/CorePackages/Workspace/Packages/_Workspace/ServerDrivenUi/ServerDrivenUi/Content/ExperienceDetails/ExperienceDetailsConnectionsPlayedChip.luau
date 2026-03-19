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
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
return v2.memo(function(v15) --[[ Line: 37 ]] --[[ Name: ExperienceDetailsConnectionsPlayedChip ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), l_useDispatch_0 (copy), v5 (copy), l_Game_0 (copy), l_useLocalization_0 (copy), v2 (copy), l_Players_0 (copy), l_gameConnectionsPlayedChipClicked_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_SduiChip_0 (copy), l_AvatarGroupType_0 (copy)
    local v16 = nil;
    v16 = if l_FFlagSduiServerCompat_0 then v15.layoutOrder else v15.LayoutOrder;
    local l_universeId_0 = v15.universeId;
    local v18 = l_useDispatch_0();
    local v19 = v5.useSignalState(l_Game_0.getConnectionsPlayedStore(false).getConnectionsPlayed(l_universeId_0).data);
    local v20 = v5.useSignalState(l_Game_0.getGameInfoStore(false).getAndFetchGameInfo(l_universeId_0).data);
    local v21 = if v19 then v19.userIds else {};
    local v22 = if v19 then v19.totalCount else 0;
    local v23 = l_useLocalization_0({
        connectionsPlayed = {
            "Feature.Friends.Label.ConnectionsPlayed"; 
            numberOfConnections = v22
        }, 
        connectionsRecentlyPlayed = {
            "Feature.Friends.Label.ConnectionsRecentlyPlayed"; 
            numberOfConnections = v22
        }, 
        connectionRecentlyPlayed = {
            "Feature.Friends.Label.ConnectionRecentlyPlayed"
        }
    });
    local v26 = v2.useCallback(function() --[[ Line: 70 ]]
        -- upvalues: v20 (copy), l_Players_0 (ref), l_gameConnectionsPlayedChipClicked_0 (ref), l_universeId_0 (copy), v22 (copy), v18 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v21 (copy), v23 (copy)
        local v24 = v20 and v20.rootPlaceId;
        if v24 then
            local v25 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId;
            l_gameConnectionsPlayedChipClicked_0({
                uid = tostring(v25), 
                universeId = l_universeId_0, 
                placeId = tostring(v24), 
                totalConnections = v22
            }, "ExperienceDetailsConnectionsPlayedChip");
        end;
        v18(l_NavigateDown_0({
            name = l_AppPage_0.SocialProofVerticalUserListSheet, 
            extraProps = {
                userIds = v21, 
                title = if v22 == 1 then v23.connectionRecentlyPlayed else v23.connectionsRecentlyPlayed
            }
        }));
    end, {
        v18, 
        l_universeId_0, 
        v20, 
        v22, 
        v23, 
        l_Players_0.LocalPlayer
    });
    if v22 == 0 then
        return nil;
    else
        local l_connectionsPlayed_0 = v23.connectionsPlayed;
        local v28 = {};
        for v29 = 1, math.min(2, #v21) do
            table.insert(v28, v21[v29]);
        end;
        return v2.createElement(l_SduiChip_0, {
            text = l_connectionsPlayed_0, 
            leading = {
                type = "AvatarGroup", 
                props = {
                    avatars = v28, 
                    type = l_AvatarGroupType_0.Stacked, 
                    max = 2
                }
            }, 
            onActivated = v26, 
            LayoutOrder = if not l_FFlagSduiServerCompat_0 then v16 else nil, 
            layoutOrder = if l_FFlagSduiServerCompat_0 then v16 else nil
        });
    end;
end);