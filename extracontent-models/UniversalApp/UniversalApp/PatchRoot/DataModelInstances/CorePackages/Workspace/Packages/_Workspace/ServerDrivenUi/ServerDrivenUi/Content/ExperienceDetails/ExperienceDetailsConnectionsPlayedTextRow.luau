local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local l_Players_0 = game:GetService("Players");
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.Localization);
local v5 = require(l_Parent_0.DataHydration);
local v6 = require(l_Parent_0.SignalsReact);
local v7 = require(l_Parent_0.RoactUtils);
local l_gameConnectionsPlayedChipClicked_0 = require(l_Parent_0.DiscoveryAnalytics).Events.gameConnectionsPlayedChipClicked;
local l_SduiTextAccessoryRow_0 = require(l_Parent_0.SduiSharedContent).SduiTextAccessoryRow;
local l_AvatarGroupType_0 = v3.Enums.AvatarGroupType;
local l_InputSize_0 = v3.Enums.InputSize;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_Game_0 = v5.Game;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_useDispatch_0 = v7.Hooks.RoactRodux.useDispatch;
local l_useDeviceType_0 = require(l_Parent_0.RobloxAppHooks).useDeviceType;
local l_DeviceType_0 = require(l_Parent_0.RobloxAppEnums).DeviceType;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v20 = require(l_Parent_0.SharedFlags);
local l_FFlagConnectionsToFriendsRename_0 = v20.FFlagConnectionsToFriendsRename;
local l_FFlagSduiServerCompat_0 = v20.FFlagSduiServerCompat;
return v2.memo(function(v23) --[[ Line: 51 ]] --[[ Name: ExperienceDetailsConnectionsPlayedTextRow ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), l_useTokens_0 (copy), l_useDispatch_0 (copy), l_useDeviceType_0 (copy), l_DeviceType_0 (copy), l_Game_0 (copy), v6 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v2 (copy), l_Players_0 (copy), l_gameConnectionsPlayedChipClicked_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_AvatarGroupType_0 (copy), l_InputSize_0 (copy), l_SduiTextAccessoryRow_0 (copy)
    local v24 = nil;
    v24 = if l_FFlagSduiServerCompat_0 then v23.layoutOrder else v23.LayoutOrder;
    local l_universeId_0 = v23.universeId;
    local l_name_0 = v23.name;
    local v27 = l_useTokens_0();
    local v28 = l_useDispatch_0();
    local v29 = l_useDeviceType_0() == l_DeviceType_0.Phone;
    local v30 = l_Game_0.getConnectionsPlayedStore(false);
    local v31 = v6.useSignalState(v30.getConnectionsPlayed(l_universeId_0).data);
    local v32 = v6.useSignalState(l_Game_0.getGameInfoStore(false).getAndFetchGameInfo(l_universeId_0).data);
    local v33 = if v31 then v31.userIds else {};
    local v34 = if v31 then v31.totalCount else #v33;
    local v35 = l_useLocalization_0({
        connectionsRecentlyPlayed = {
            l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Label.FriendsRecentlyPlayed" or "Feature.Friends.Label.ConnectionsRecentlyPlayed"; 
            numberOfConnections = v34
        }, 
        connectionRecentlyPlayed = {
            l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Label.FriendRecentlyPlayed" or "Feature.Friends.Label.ConnectionRecentlyPlayed"
        }, 
        playedByUserAndOthersPlural = {
            l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Label.PlayedByUserAndOthers.FriendsRename" or "Feature.Friends.Label.PlayedByUserAndOthers"; 
            name = l_name_0 or "", 
            numOfOthers = v34 - 1
        }, 
        playedByUserAndOneOther = {
            l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Label.PlayedByUserAndOneOther.FriendsRename" or "Feature.Friends.Label.PlayedByUserAndOneOther"; 
            name = l_name_0 or ""
        }, 
        playedByUser = {
            "Feature.Friends.Label.PlayedByUser"; 
            name = l_name_0 or ""
        }
    });
    local v36 = nil;
    v36 = if l_name_0 and l_name_0 ~= "" then if v34 == 1 then v35.playedByUser else if v34 == 2 then v35.playedByUserAndOneOther else v35.playedByUserAndOthersPlural else if v34 == 1 then v35.connectionRecentlyPlayed else v35.connectionsRecentlyPlayed;
    local v37 = v32 and v32.rootPlaceId;
    local v39 = v2.useCallback(function() --[[ Line: 130 ]]
        -- upvalues: v37 (copy), l_Players_0 (ref), l_gameConnectionsPlayedChipClicked_0 (ref), l_universeId_0 (copy), v34 (copy), v28 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v33 (copy), v35 (copy)
        if v37 then
            local v38 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId;
            l_gameConnectionsPlayedChipClicked_0({
                uid = tostring(v38), 
                universeId = l_universeId_0, 
                placeId = tostring(v37), 
                totalConnections = v34
            }, "ExperienceDetailsConnectionsPlayedChip");
        end;
        v28(l_NavigateDown_0({
            name = l_AppPage_0.SocialProofVerticalUserListSheet, 
            extraProps = {
                userIds = v33, 
                title = if v34 == 1 then v35.connectionRecentlyPlayed else v35.connectionsRecentlyPlayed
            }
        }));
    end, {
        v28, 
        l_universeId_0, 
        v37, 
        v33, 
        v34, 
        v35, 
        l_Players_0.LocalPlayer
    });
    local v40 = v2.useMemo(function() --[[ Line: 154 ]]
        -- upvalues: v33 (copy)
        return {
            table.unpack(v33, 1, (math.min(2, #v33)))
        };
    end, {
        v33
    });
    local v41 = if v29 then v27.Semantic.Color.Background.Contrast else v27.Semantic.Color.Background.Default;
    local v42 = v2.useMemo(function() --[[ Line: 162 ]]
        -- upvalues: v40 (copy), l_AvatarGroupType_0 (ref), l_InputSize_0 (ref), v41 (copy)
        return {
            type = "AvatarGroup", 
            avatars = v40, 
            groupType = l_AvatarGroupType_0.Stacked, 
            max = 2, 
            size = l_InputSize_0.XSmall, 
            backplateStyle = v41
        };
    end, {
        v40, 
        v41
    });
    local v43 = v2.useMemo(function() --[[ Line: 173 ]]
        -- upvalues: v27 (copy)
        return {
            FontSize = v27.FontSize.FontSize_300
        };
    end, {
        v27
    });
    if v34 == 0 then
        return nil;
    else
        return v2.createElement(l_SduiTextAccessoryRow_0, {
            text = v36, 
            leading = v42, 
            gap = v27.Gap.Small, 
            fontStyle = v43, 
            onActivated = v39, 
            LayoutOrder = if not l_FFlagSduiServerCompat_0 then v24 else nil, 
            layoutOrder = if l_FFlagSduiServerCompat_0 then v24 else nil, 
            testId = "--experience-details-connections-played-text-row"
        });
    end;
end);