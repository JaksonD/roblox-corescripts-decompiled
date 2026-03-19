local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_Focusable_0 = v4.Focusable;
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemInfo.ItemInfoRow);
local v9 = require(l_Modules_0.LuaApp.Common.Experience.Connectors.LaunchExperienceConnector);
local _ = require(l_CorePackages_0.Workspace.Packages.PlayabilityRodux);
local l_GameIconReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.GameIconReducer;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.AttributionConstants);
local v21 = v2.forwardRef(function(v14, _) --[[ Line: 48 ]]
    -- upvalues: v13 (copy), l_useNavigation_0 (copy), l_AvatarScreen_0 (copy), v2 (copy), l_Focusable_0 (copy), v8 (copy)
    local v16 = nil;
    local v17 = nil;
    if v14.playabilityStatus then
        local l_playabilityStatus_0 = v14.playabilityStatus.playabilityStatus;
        v16 = v13.ShowPlayableAttributionMapper[l_playabilityStatus_0];
        v17 = v13.ShowTraversalAlertMapper[l_playabilityStatus_0];
    end;
    local v19 = l_useNavigation_0();
    local function v20() --[[ Line: 62 ]] --[[ Name: onClickAttribution ]]
        -- upvalues: v17 (ref), v19 (copy), l_AvatarScreen_0 (ref), v14 (copy)
        if v17 then
            v19.navigate(l_AvatarScreen_0.OpenExperienceTraversalPrompt, {
                onPlayButtonActivated = v14.onPlayButtonActivated, 
                gameName = v14.gameName, 
                gameUniverseId = v14.creatingUniverseId, 
                thumbnailUrl = v14.thumbnailUrl
            });
            return;
        else
            v14.onPlayButtonActivated();
            return;
        end;
    end;
    return v16 and v2.createElement(l_Focusable_0[v8], {
        infoName = v14.infoName, 
        infoData = if v14.gameName then v14.gameName else "", 
        onActivate = v20, 
        LayoutOrder = v14.LayoutOrder, 
        hideDivider = v14.hideDivider, 
        ref = v14.attributionRef, 
        NextSelectionUp = v14.NextSelectionUp, 
        NextSelectionDown = v14.NextSelectionDown
    });
end);
v21 = v9.connect(function(v22) --[[ Line: 95 ]]
    return {
        extraParams = if v22.gameJoinContext then {
            gameJoinContext = v22.gameJoinContext
        } else nil, 
        universeId = v22.creatingUniverseId, 
        launchSource = "AttributionItemRow", 
        referralSource = "ItemDetailsPage"
    };
end, function(v23, _) --[[ Line: 102 ]]
    return {
        playabilityStatus = v23.playabilityStatus, 
        playButtonState = v23.playButtonState, 
        gameName = v23.gameName, 
        onPlayButtonActivated = v23.onPlayButtonActivated
    };
end)(v21);
return (v3.connect(function(v25, v26) --[[ Line: 112 ]]
    -- upvalues: l_GameIconReducer_0 (copy)
    local v27 = v25[l_GameIconReducer_0.key][v26.creatingUniverseId];
    return {
        thumbnailUrl = if v27 then v27.url else nil
    };
end)(v21));