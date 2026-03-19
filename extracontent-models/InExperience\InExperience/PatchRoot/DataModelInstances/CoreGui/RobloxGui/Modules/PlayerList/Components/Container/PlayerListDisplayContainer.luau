local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.SignalsReact);
local v5 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local _ = require(l_CorePackages_0.Workspace.Packages.LeaderboardStore);
local l_useLeaderboardStore_0 = v5.Hooks.useLeaderboardStore;
local v8 = require(l_Parent_0.Components.PresentationCommon.PlayerListDisplayView);
local v9 = require(l_Parent_0.Actions.SetPlayerListVisibility);
local l_FFlagAddNewPlayerListFocusNav_0 = v5.Flags.FFlagAddNewPlayerListFocusNav;
local function v17(v11) --[[ Line: 46 ]] --[[ Name: PlayerListDisplayContainer ]]
    -- upvalues: l_useLeaderboardStore_0 (copy), v4 (copy), v2 (copy), v8 (copy)
    local v12 = l_useLeaderboardStore_0();
    local v13 = v12.getGameStatsList();
    local v14 = v12.getTeamList();
    local v15 = v4.useSignalState(v13.getCount);
    local v16 = v4.useSignalState(v14.getCount);
    if v12 then
        return (v2.createElement(v2.Fragment, nil, v2.createElement(v8, {
            teamList = v14, 
            teamListCount = v16, 
            gameStatsCount = v15, 
            entrySizeX = v11.entrySize, 
            screenSizeY = v11.screenSizeY, 
            playerIconInfo = v11.playerIconInfo, 
            playerRelationship = v11.playerRelationship, 
            dropDownPlayer = v11.dropDownPlayer, 
            dropDownVisible = v11.dropDownVisible, 
            dismissPlayerList = v11.dismissPlayerList, 
            isVisible = v11.isVisible, 
            isMinimized = v11.isMinimized, 
            isSmallTouchDevice = v11.isSmallTouchDevice, 
            isDirectionalPreferred = v11.isDirectionalPreferred, 
            isUsingGamepad = v11.isUsingGamepad
        })));
    else
        return nil;
    end;
end;
return v2.memo(v3.connect(function(v18) --[[ Line: 93 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_FFlagAddNewPlayerListFocusNav_0 (copy)
    local l_isMinimized_0 = v18.displayOptions.isMinimized;
    return {
        isVisible = if l_FFlagAddNewPlayerListFocusNav_0 then nil else v18.displayOptions.isVisible, 
        isMinimized = l_isMinimized_0, 
        isDirectionalPreferred = v18.displayOptions.isTenFootInterface, 
        isUsingGamepad = v18.displayOptions.isUsingGamepad, 
        isSmallTouchDevice = v18.displayOptions.isSmallTouchDevice, 
        playerIconInfo = v18.playerIconInfo, 
        playerRelationship = v18.playerRelationship, 
        dropDownPlayer = v18.playerDropDown.selectedPlayer, 
        dropDownVisible = v18.playerDropDown.isVisible
    };
end, function(v20) --[[ Line: 85 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v9 (copy)
    return {
        dismissPlayerList = function() --[[ Line: 87 ]] --[[ Name: dismissPlayerList ]]
            -- upvalues: v20 (copy), v9 (ref)
            return v20(v9(false));
        end
    };
end)(function(v21) --[[ Line: 77 ]] --[[ Name: PlayerListDisplayContainerWithLeaderboardStore ]]
    -- upvalues: l_useLeaderboardStore_0 (copy), v17 (copy)
    if l_useLeaderboardStore_0() then
        return (v17(v21));
    else
        return nil;
    end;
end));