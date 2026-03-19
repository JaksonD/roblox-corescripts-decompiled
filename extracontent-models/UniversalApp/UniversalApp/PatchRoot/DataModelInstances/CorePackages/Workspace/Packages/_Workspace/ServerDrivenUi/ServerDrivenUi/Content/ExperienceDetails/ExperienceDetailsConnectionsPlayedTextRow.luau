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
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
return v2.memo(function(v21) --[[ Line: 49 ]] --[[ Name: ExperienceDetailsConnectionsPlayedTextRow ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), l_useTokens_0 (copy), l_useDispatch_0 (copy), l_useDeviceType_0 (copy), l_DeviceType_0 (copy), l_Game_0 (copy), v6 (copy), l_useLocalization_0 (copy), v2 (copy), l_Players_0 (copy), l_gameConnectionsPlayedChipClicked_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_AvatarGroupType_0 (copy), l_InputSize_0 (copy), l_SduiTextAccessoryRow_0 (copy)
    local v22 = nil;
    v22 = if l_FFlagSduiServerCompat_0 then v21.layoutOrder else v21.LayoutOrder;
    local l_universeId_0 = v21.universeId;
    local l_name_0 = v21.name;
    local v25 = l_useTokens_0();
    local v26 = l_useDispatch_0();
    local v27 = l_useDeviceType_0() == l_DeviceType_0.Phone;
    local v28 = l_Game_0.getConnectionsPlayedStore(false);
    local v29 = v6.useSignalState(v28.getConnectionsPlayed(l_universeId_0).data);
    local v30 = v6.useSignalState(l_Game_0.getGameInfoStore(false).getAndFetchGameInfo(l_universeId_0).data);
    local v31 = if v29 then v29.userIds else {};
    local v32 = if v29 then v29.totalCount else #v31;
    local v33 = l_useLocalization_0({
        connectionsRecentlyPlayed = {
            "Feature.Friends.Label.ConnectionsRecentlyPlayed"; 
            numberOfConnections = v32
        }, 
        connectionRecentlyPlayed = {
            "Feature.Friends.Label.ConnectionRecentlyPlayed"
        }, 
        playedByUserAndOthersPlural = {
            "Feature.Friends.Label.PlayedByUserAndOthers"; 
            name = l_name_0 or "", 
            numOfOthers = v32 - 1
        }, 
        playedByUserAndOneOther = {
            "Feature.Friends.Label.PlayedByUserAndOneOther"; 
            name = l_name_0 or ""
        }, 
        playedByUser = {
            "Feature.Friends.Label.PlayedByUser"; 
            name = l_name_0 or ""
        }
    });
    local v34 = nil;
    v34 = if l_name_0 and l_name_0 ~= "" then if v32 == 1 then v33.playedByUser else if v32 == 2 then v33.playedByUserAndOneOther else v33.playedByUserAndOthersPlural else if v32 == 1 then v33.connectionRecentlyPlayed else v33.connectionsRecentlyPlayed;
    local v35 = v30 and v30.rootPlaceId;
    local v37 = v2.useCallback(function() --[[ Line: 120 ]]
        -- upvalues: v35 (copy), l_Players_0 (ref), l_gameConnectionsPlayedChipClicked_0 (ref), l_universeId_0 (copy), v32 (copy), v26 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v31 (copy), v33 (copy)
        if v35 then
            local v36 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId;
            l_gameConnectionsPlayedChipClicked_0({
                uid = tostring(v36), 
                universeId = l_universeId_0, 
                placeId = tostring(v35), 
                totalConnections = v32
            }, "ExperienceDetailsConnectionsPlayedChip");
        end;
        v26(l_NavigateDown_0({
            name = l_AppPage_0.SocialProofVerticalUserListSheet, 
            extraProps = {
                userIds = v31, 
                title = if v32 == 1 then v33.connectionRecentlyPlayed else v33.connectionsRecentlyPlayed
            }
        }));
    end, {
        v26, 
        l_universeId_0, 
        v35, 
        v31, 
        v32, 
        v33, 
        l_Players_0.LocalPlayer
    });
    local v38 = v2.useMemo(function() --[[ Line: 144 ]]
        -- upvalues: v31 (copy)
        return {
            table.unpack(v31, 1, (math.min(2, #v31)))
        };
    end, {
        v31
    });
    local v39 = if v27 then v25.Semantic.Color.Background.Contrast else v25.Semantic.Color.Background.Default;
    local v40 = v2.useMemo(function() --[[ Line: 152 ]]
        -- upvalues: v38 (copy), l_AvatarGroupType_0 (ref), l_InputSize_0 (ref), v39 (copy)
        return {
            type = "AvatarGroup", 
            avatars = v38, 
            groupType = l_AvatarGroupType_0.Stacked, 
            max = 2, 
            size = l_InputSize_0.XSmall, 
            backplateStyle = v39
        };
    end, {
        v38, 
        v39
    });
    local v41 = v2.useMemo(function() --[[ Line: 163 ]]
        -- upvalues: v25 (copy)
        return {
            FontSize = v25.FontSize.FontSize_300
        };
    end, {
        v25
    });
    if v32 == 0 then
        return nil;
    else
        return v2.createElement(l_SduiTextAccessoryRow_0, {
            text = v34, 
            leading = v40, 
            gap = v25.Gap.Small, 
            fontStyle = v41, 
            onActivated = v37, 
            LayoutOrder = if not l_FFlagSduiServerCompat_0 then v22 else nil, 
            layoutOrder = if l_FFlagSduiServerCompat_0 then v22 else nil, 
            testId = "--experience-details-connections-played-text-row"
        });
    end;
end);