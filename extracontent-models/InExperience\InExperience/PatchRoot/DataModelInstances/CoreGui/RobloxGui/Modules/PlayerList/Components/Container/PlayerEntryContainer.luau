local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.SignalsReact);
local v5 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local _ = require(l_CorePackages_0.Workspace.Packages.LeaderboardStore);
local v7 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v8 = require(l_CorePackages_0.Workspace.Packages.PlayerIconInfoStore);
local l_useLeaderboardStore_0 = v5.Hooks.useLeaderboardStore;
local v10 = require(l_Parent_0.Components.PresentationCommon.PlayerEntryView);
local v11 = require(l_Parent_0.Actions.ClosePlayerDropDown);
local v12 = require(l_Parent_0.Actions.OpenPlayerDropDown);
local l_FFlagReplacePlayerIconRoduxWithSignal_0 = v7.FFlagReplacePlayerIconRoduxWithSignal;
local v14 = if l_FFlagReplacePlayerIconRoduxWithSignal_0 then v8.PlayerIconInfoStore else nil;
local l_FFlagPlayerListFixLeaderstatsStacking_0 = v7.FFlagPlayerListFixLeaderstatsStacking;
local l_FFlagPlayerListUseFocusNavHook_0 = v5.Flags.FFlagPlayerListUseFocusNavHook;
return v2.memo(v3.connect(function(v17) --[[ Line: 116 ]] --[[ Name: mapStateToProps ]]
    return {
        selectedPlayer = v17.playerDropDown.selectedPlayer, 
        dropdownOpen = v17.playerDropDown.isVisible, 
        isSmallTouchDevice = v17.displayOptions.isSmallTouchDevice, 
        isDirectionalPreferred = v17.displayOptions.isTenFootInterface
    };
end, function(v18) --[[ Line: 126 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v11 (copy), v12 (copy)
    return {
        closeDropdown = function() --[[ Line: 128 ]] --[[ Name: closeDropdown ]]
            -- upvalues: v18 (copy), v11 (ref)
            return v18(v11());
        end, 
        openDropdown = function(v19) --[[ Line: 131 ]] --[[ Name: openDropdown ]]
            -- upvalues: v18 (copy), v12 (ref)
            return v18(v12(v19));
        end
    };
end)(function(v20) --[[ Line: 71 ]] --[[ Name: PlayerEntryContainer ]]
    -- upvalues: l_useLeaderboardStore_0 (copy), l_FFlagReplacePlayerIconRoduxWithSignal_0 (copy), v14 (copy), v4 (copy), l_FFlagPlayerListFixLeaderstatsStacking_0 (copy), v2 (copy), v10 (copy), l_FFlagPlayerListUseFocusNavHook_0 (copy)
    local v21 = l_useLeaderboardStore_0();
    local v22 = nil;
    if l_FFlagReplacePlayerIconRoduxWithSignal_0 then
        local v23 = v14.getPlayerIconInfoReactive(v20.player.UserId);
        v22 = v4.useSignalState(v23);
    else
        v22 = v20.playerIconInfo;
    end;
    local v24 = v21.getGameStatsList();
    local v25 = v21.getPlayerEntry(v20.player, false);
    local v26 = if l_FFlagPlayerListFixLeaderstatsStacking_0 then nil else v4.useSignalState(v24.getCount);
    if v25 then
        return (v2.createElement(v10, {
            playerData = v25, 
            gameStats = v24, 
            gameStatsCount = if l_FFlagPlayerListFixLeaderstatsStacking_0 then nil else v26, 
            size = v20.size, 
            entrySizeX = v20.entrySizeX, 
            layoutOrder = v20.layoutOrder, 
            player = v20.player, 
            titlePlayerEntry = v20.titlePlayerEntry, 
            playerIconInfo = v22, 
            playerRelationship = v20.playerRelationship, 
            dropdownOpen = v20.dropdownOpen, 
            selectedPlayer = v20.selectedPlayer, 
            firstPlayerRef = v20.firstPlayerRef, 
            openDropdown = v20.openDropdown, 
            closeDropdown = v20.closeDropdown, 
            setDropDownPlayerDimensionY = v20.setDropDownPlayerDimensionY, 
            prevFocusedEntry = v20.prevFocusedEntry, 
            destroyedFocusedPlayerId = v20.destroyedFocusedPlayerId, 
            registerPlayerInstance = if l_FFlagPlayerListUseFocusNavHook_0 then v20.registerPlayerInstance else nil, 
            unregisterPlayerInstance = if l_FFlagPlayerListUseFocusNavHook_0 then v20.unregisterPlayerInstance else nil, 
            setSelectedPlayerId = if l_FFlagPlayerListUseFocusNavHook_0 then v20.setSelectedPlayerId else nil, 
            isSmallTouchDevice = v20.isSmallTouchDevice, 
            isDirectionalPreferred = v20.isDirectionalPreferred
        }));
    else
        return nil;
    end;
end));