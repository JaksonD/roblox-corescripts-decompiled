local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_RobloxGui_0.Modules.PlayerPermissionsModule);
local v5 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v6 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local v7 = require(l_CorePackages_0.Workspace.Packages.BlockingUtility);
local v8 = require(l_RobloxGui_0.Modules.Common.Flags.FFlagInExperienceUserProfileSettingsEnabled);
local v9 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagBadgeVisibilitySettingEnabled_0 = v9.FFlagBadgeVisibilitySettingEnabled;
local l_FFlagReplacePlayerIconRoduxWithSignal_0 = v9.FFlagReplacePlayerIconRoduxWithSignal;
local l_FFlagEnableMobilePlayerListOnConsole_0 = v6.Flags.FFlagEnableMobilePlayerListOnConsole;
local v13 = game:DefineFastFlag("EnableBadgeCheckForUserCreator", false);
local l_PlayerIconInfoStore_0 = require(l_CorePackages_0.Workspace.Packages.PlayerIconInfoStore).PlayerIconInfoStore;
local l_Images_0 = require(l_CorePackages_0.Packages.UIBlox).App.ImageSet.Images;
local l_Parent_0 = script.Parent.Parent;
local v17 = {
    Admin = l_Images_0["icons/status/player/admin"], 
    Intern = l_Images_0["icons/status/player/intern"], 
    Star = l_Images_0["icons/status/player/videostar"]
};
local v18 = require(l_Parent_0.Actions.SetPlayerSpecialGroupIcon);
local v19 = require(l_Parent_0.Actions.SetPlayerIsCreator);
local v20 = require(l_Parent_0.Actions.SetPlayerAvatarIcon);
local v21 = require(l_Parent_0.Actions.SetPlayerIsBlocked);
local v22 = require(l_Parent_0.Actions.SetPlayerFriendStatus);
local function v30(v23, v24, v25) --[[ Line: 47 ]] --[[ Name: dispatchIfPlayerExists ]]
    local l_players_0 = v23:getState().players;
    local v27 = false;
    for _, v29 in ipairs(l_players_0) do
        if v24 == v29 then
            v27 = true;
            break;
        end;
    end;
    if v27 then
        v23:dispatch(v25);
    end;
end;
local function _(v31) --[[ Line: 61 ]] --[[ Name: isInExperienceNameEnabled ]]
    -- upvalues: v8 (copy), v4 (copy)
    if v8 and v4.IsPlayerInExperienceNameEnabledAsync(v31) then
        return true;
    else
        return false;
    end;
end;
local function v41(v33, v34) --[[ Line: 70 ]] --[[ Name: getGroupsPermissionsInfo ]]
    -- upvalues: l_FFlagBadgeVisibilitySettingEnabled_0 (copy), v4 (copy), v17 (copy), l_FFlagReplacePlayerIconRoduxWithSignal_0 (copy), l_PlayerIconInfoStore_0 (copy), v8 (copy), v30 (copy), v18 (copy)
    if l_FFlagBadgeVisibilitySettingEnabled_0 then
        local v35 = nil;
        if v4.IsPlayerAdminAsync(v34) then
            v35 = v17.Admin;
        elseif v4.IsPlayerStarAsync(v34) then
            v35 = v17.Star;
        elseif v4.IsPlayerInternAsync(v34) then
            v35 = v17.Intern;
        end;
        if v35 then
            if l_FFlagReplacePlayerIconRoduxWithSignal_0 then
                local v36 = l_PlayerIconInfoStore_0.getPlayerIconInfoReactive(v34.UserId)(false);
                l_PlayerIconInfoStore_0.setPlayerIconInfo(v34.UserId, {
                    isPlaceOwner = v36.isPlaceOwner, 
                    avatarIcon = v36.avatarIcon, 
                    specialGroupIcon = v35
                });
                return;
            else
                local v37 = not (v8 and v4.IsPlayerInExperienceNameEnabledAsync(v34) and true or false) and v35 or nil;
                v30(v33, v34, v18(v34, v37));
                return;
            end;
        end;
    elseif v4.IsPlayerAdminAsync(v34) then
        if l_FFlagReplacePlayerIconRoduxWithSignal_0 then
            local v38 = l_PlayerIconInfoStore_0.getPlayerIconInfoReactive(v34.UserId)(false);
            l_PlayerIconInfoStore_0.setPlayerIconInfo(v34.UserId, {
                isPlaceOwner = v38.isPlaceOwner, 
                avatarIcon = v38.avatarIcon, 
                specialGroupIcon = v17.Admin
            });
            return;
        elseif not (v8 and v4.IsPlayerInExperienceNameEnabledAsync(v34) and true or false) then
            v30(v33, v34, v18(v34, v17.Admin));
            return;
        end;
    elseif v4.IsPlayerStarAsync(v34) then
        if l_FFlagReplacePlayerIconRoduxWithSignal_0 then
            local v39 = l_PlayerIconInfoStore_0.getPlayerIconInfoReactive(v34.UserId)(false);
            l_PlayerIconInfoStore_0.setPlayerIconInfo(v34.UserId, {
                isPlaceOwner = v39.isPlaceOwner, 
                avatarIcon = v39.avatarIcon, 
                specialGroupIcon = v17.Star
            });
            return;
        elseif not (v8 and v4.IsPlayerInExperienceNameEnabledAsync(v34) and true or false) then
            v30(v33, v34, v18(v34, v17.Star));
            return;
        end;
    elseif v4.IsPlayerInternAsync(v34) then
        if l_FFlagReplacePlayerIconRoduxWithSignal_0 then
            local v40 = l_PlayerIconInfoStore_0.getPlayerIconInfoReactive(v34.UserId)(false);
            l_PlayerIconInfoStore_0.setPlayerIconInfo(v34.UserId, {
                isPlaceOwner = v40.isPlaceOwner, 
                avatarIcon = v40.avatarIcon, 
                specialGroupIcon = v17.Intern
            });
            return;
        elseif not (v8 and v4.IsPlayerInExperienceNameEnabledAsync(v34) and true or false) then
            v30(v33, v34, v18(v34, v17.Intern));
        end;
    end;
end;
local function v45(v42, v43) --[[ Line: 142 ]] --[[ Name: getGameCreator ]]
    -- upvalues: v13 (copy), v4 (copy), l_FFlagReplacePlayerIconRoduxWithSignal_0 (copy), l_PlayerIconInfoStore_0 (copy), v8 (copy), v30 (copy), v19 (copy)
    if not v13 and game.CreatorType ~= Enum.CreatorType.Group then
        return;
    else
        if v4.CanPlayerManagePlaceAsync(v43) then
            if l_FFlagReplacePlayerIconRoduxWithSignal_0 then
                local v44 = l_PlayerIconInfoStore_0.getPlayerIconInfoReactive(v43.UserId)(false);
                l_PlayerIconInfoStore_0.setPlayerIconInfo(v43.UserId, {
                    isPlaceOwner = true, 
                    avatarIcon = v44.avatarIcon, 
                    specialGroupIcon = v44.specialGroupIcon
                });
                return;
            elseif not (v8 and v4.IsPlayerInExperienceNameEnabledAsync(v43) and true or false) then
                v30(v42, v43, v19(v43, true));
            end;
        end;
        return;
    end;
end;
local function v50(v46, v47) --[[ Line: 164 ]] --[[ Name: getPlayerAvatarIcon ]]
    -- upvalues: l_FFlagEnableMobilePlayerListOnConsole_0 (copy), v5 (copy), l_FFlagReplacePlayerIconRoduxWithSignal_0 (copy), l_PlayerIconInfoStore_0 (copy), v30 (copy), v20 (copy)
    if l_FFlagEnableMobilePlayerListOnConsole_0 or not v5:IsEnabled() then
        return;
    else
        local v48 = "rbxthumb://type=Avatar&id=" .. v47.UserId .. "&w=100&h=100";
        if l_FFlagReplacePlayerIconRoduxWithSignal_0 then
            local v49 = l_PlayerIconInfoStore_0.getPlayerIconInfoReactive(v47.UserId)(false);
            l_PlayerIconInfoStore_0.setPlayerIconInfo(v47.UserId, {
                isPlaceOwner = v49.isPlaceOwner, 
                avatarIcon = v48, 
                specialGroupIcon = v49.specialGroupIcon
            });
            return;
        else
            v30(v46, v47, v20(v47, v48));
            return;
        end;
    end;
end;
local function v53(v51, v52) --[[ Line: 183 ]] --[[ Name: getPlayerIsBlocked ]]
    -- upvalues: v7 (copy), v30 (copy), v21 (copy)
    if v7:IsPlayerBlockedByUserId(v52.UserId) then
        v30(v51, v52, v21(v52, true));
    end;
end;
local function v56(v54, v55) --[[ Line: 189 ]] --[[ Name: getPlayerFriendStatus ]]
    -- upvalues: l_Players_0 (copy), v30 (copy), v22 (copy)
    if v55 ~= l_Players_0.LocalPlayer and v55.Parent == l_Players_0 and l_Players_0.LocalPlayer.Parent == l_Players_0 then
        v30(v54, v55, v22(v55, l_Players_0.LocalPlayer:GetFriendStatus(v55)));
    end;
end;
return function(v57) --[[ Line: 199 ]] --[[ Name: MakePlayerInfoRequests ]]
    -- upvalues: l_FFlagReplacePlayerIconRoduxWithSignal_0 (copy), v8 (copy), v4 (copy), l_PlayerIconInfoStore_0 (copy), v41 (copy), v45 (copy), v50 (copy), v53 (copy), v56 (copy)
    return function(v58) --[[ Line: 200 ]]
        -- upvalues: l_FFlagReplacePlayerIconRoduxWithSignal_0 (ref), v57 (copy), v8 (ref), v4 (ref), l_PlayerIconInfoStore_0 (ref), v41 (ref), v45 (ref), v50 (ref), v53 (ref), v56 (ref)
        if l_FFlagReplacePlayerIconRoduxWithSignal_0 then
            coroutine.wrap(function() --[[ Line: 202 ]]
                -- upvalues: v57 (ref), v8 (ref), v4 (ref), l_PlayerIconInfoStore_0 (ref), v41 (ref), v58 (copy), v45 (ref), v50 (ref)
                local l_v57_0 = v57;
                if v8 and v4.IsPlayerInExperienceNameEnabledAsync(l_v57_0) and true or false then
                    l_PlayerIconInfoStore_0.setPlayerIconInfo(v57.UserId, {
                        isPlaceOwner = false, 
                        avatarIcon = nil, 
                        specialGroupIcon = nil
                    });
                    return;
                else
                    coroutine.wrap(v41)(v58, v57);
                    coroutine.wrap(v45)(v58, v57);
                    coroutine.wrap(v50)(v58, v57);
                    return;
                end;
            end)();
        else
            coroutine.wrap(v41)(v58, v57);
            coroutine.wrap(v45)(v58, v57);
            coroutine.wrap(v50)(v58, v57);
        end;
        coroutine.wrap(v53)(v58, v57);
        coroutine.wrap(v56)(v58, v57);
    end;
end;