local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.SignalsReact);
local v5 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local v6 = require(l_CorePackages_0.Workspace.Packages.LeaderboardStore);
local _ = require(l_CorePackages_0.Workspace.Packages.PlayerIconInfoStore);
local l_useLeaderboardStore_0 = v5.Hooks.useLeaderboardStore;
local v9 = require(l_Parent_0.Components.PresentationCommon.TeamListView);
local l_FFlagPlayerListUseFocusNavHook_0 = v5.Flags.FFlagPlayerListUseFocusNavHook;
return v2.memo(v3.connect(function(v11) --[[ Line: 127 ]] --[[ Name: mapStateToProps ]]
    return {
        isSmallTouchDevice = v11.displayOptions.isSmallTouchDevice, 
        isDirectionalPreferred = v11.displayOptions.isTenFootInterface, 
        playerIconInfo = v11.playerIconInfo, 
        playerRelationship = v11.playerRelationship
    };
end)(function(v12) --[[ Line: 60 ]] --[[ Name: TeamListContainer ]]
    -- upvalues: l_useLeaderboardStore_0 (copy), v4 (copy), v2 (copy), v6 (copy), l_FFlagPlayerListUseFocusNavHook_0 (copy), v9 (copy)
    local l_getCount_0 = l_useLeaderboardStore_0().getTeamList().getCount;
    local v14 = v4.useSignalState(l_getCount_0);
    local v15 = v4.useSignalState(v12.teamData.players.getCount);
    local v16 = v4.useSignalBinding(v12.teamData.order);
    local v17 = v2.useMemo(function() --[[ Line: 70 ]]
        -- upvalues: v12 (copy), v6 (ref), v14 (copy), v15 (copy)
        if v12.teamData.name(false) == v6.SpecialNeutralTeamName then
            if v14 == 1 then
                return false;
            elseif v15 == 0 then
                return false;
            end;
        end;
        return true;
    end, {
        v14, 
        v15, 
        v12.teamData.name
    });
    local v18 = nil;
    local v19 = nil;
    if l_FFlagPlayerListUseFocusNavHook_0 then
        local v21, v22 = v2.useMemo(function() --[[ Line: 86 ]]
            -- upvalues: v12 (copy)
            if v12.registerTeamInstance and v12.teamId then
                local v20 = v12.registerTeamInstance(v12.teamId, v12.teamData.order);
                return v20.registerPlayerInstance, v20.unregisterPlayerInstance;
            else
                return nil, nil;
            end;
        end, {
            v12.registerTeamInstance, 
            v12.teamId, 
            v12.teamData
        });
        v18 = v21;
        v19 = v22;
    end;
    if l_FFlagPlayerListUseFocusNavHook_0 then
        v2.useEffect(function() --[[ Line: 97 ]]
            -- upvalues: v12 (copy)
            return function() --[[ Line: 98 ]]
                -- upvalues: v12 (ref)
                if v12.unregisterTeamInstance and v12.teamId then
                    v12.unregisterTeamInstance(v12.teamId);
                end;
            end;
        end, {
            v12.unregisterTeamInstance, 
            v12.teamId
        });
    end;
    return v2.createElement(v9, {
        layoutOrder = v16, 
        showTeamEntry = v17, 
        teamPlayersCount = v15, 
        entrySizeX = v12.entrySizeX, 
        teamData = v12.teamData, 
        playerIconInfos = v12.playerIconInfos, 
        playerRelationships = v12.playerRelationships, 
        firstPlayerRef = v12.firstPlayerRef, 
        setDropDownPlayerDimensionY = v12.setDropDownPlayerDimensionY, 
        prevFocusedEntry = v12.prevFocusedEntry, 
        destroyedFocusedPlayerId = v12.destroyedFocusedPlayerId, 
        registerPlayerInstance = if l_FFlagPlayerListUseFocusNavHook_0 then v18 else nil, 
        unregisterPlayerInstance = if l_FFlagPlayerListUseFocusNavHook_0 then v19 else nil, 
        setSelectedPlayerId = if l_FFlagPlayerListUseFocusNavHook_0 then v12.setSelectedPlayerId else nil, 
        isSmallTouchDevice = v12.isSmallTouchDevice, 
        isDirectionalPreferred = v12.isDirectionalPreferred
    });
end));