local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v2.Hooks.RoactRodux.useDispatch;
local l_useEffectOnce_0 = v2.Hooks.useEffectOnce;
local l_useSelector_0 = v2.Hooks.RoactRodux.useSelector;
local v6 = require(l_script_FirstAncestor_0.Networking.NetworkingPresence);
local v7 = require(l_script_FirstAncestor_0.Networking.myRoduxNetworking);
local l_IconName_0 = require(l_Parent_0.Foundation).Enums.IconName;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_NetworkStatus_0 = v7.Enum.NetworkStatus;
local v11 = require(l_script_FirstAncestor_0.Common.Enums);
local v12 = require(l_script_FirstAncestor_0.Hooks.useProfileActions);
local v13 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local v14 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformUpdateUXForNonSocialCommunities);
local l_FFlagEnableProfilePlatformDisabledActions_0 = require(l_Parent_0.SharedFlags).FFlagEnableProfilePlatformDisabledActions;
local v16 = require(l_script_FirstAncestor_0.Flags.FFlagEnableCommunityVerificationModal);
local v17 = require(l_script_FirstAncestor_0.Flags.FFlagPortEnableCommunityVerificationModal);
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagEnableProfilePlatformDisabledReasonText);
local v19 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableUserProfileButtonsBacktest);
local v20 = game:DefineFastFlag("ProfilePlatformUnfriendPrimaryActionEnabled", false);
local l_FFlagProfilePlatformEnableCurrencyTransfer_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer;
local v22 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableEditAppearanceMenu);
local v23 = require(l_Parent_0.Dash);
local v24 = {
    [v11.ProfileActions.AcceptFriendRequest] = true, 
    [v11.ProfileActions.AcceptOffNetworkFriendRequest] = true, 
    [v11.ProfileActions.AddFriend] = true, 
    [v11.ProfileActions.AddFriendFromContacts] = true, 
    [v11.ProfileActions.AddFriendFromContactsSent] = true, 
    [v11.ProfileActions.CannotAddFriend] = true, 
    [v11.ProfileActions.Chat] = true, 
    [v11.ProfileActions.EditAlias] = true, 
    [v11.ProfileActions.EditAppearance] = v22 and true or nil, 
    [v11.ProfileActions.EditAvatar] = true, 
    [v11.ProfileActions.EditProfile] = true, 
    [v11.ProfileActions.JoinExperience] = true, 
    [v11.ProfileActions.PendingFriendRequest] = true, 
    [v11.ProfileActions.Unblock] = true, 
    [v11.ProfileActions.JoinCommunity] = true, 
    [v11.ProfileActions.Follow] = v14 and true or nil, 
    [v11.ProfileActions.CancelJoinCommunityRequest] = true, 
    [v11.ProfileActions.ViewCommunity] = true, 
    [v11.ProfileActions.ViewFullProfile] = v14 and true or nil, 
    [v11.ProfileActions.ShareProfile] = true, 
    [v11.ProfileActions.Unfriend] = v20 and true or nil, 
    [v11.ProfileActions.CurrencyTransfer] = l_FFlagProfilePlatformEnableCurrencyTransfer_0 and true or nil
};
isJoinExperience = function(v25) --[[ Line: 73 ]] --[[ Name: isJoinExperience ]]
    -- upvalues: v11 (copy)
    for _, v27 in v25 do
        if v27.type == v11.ProfileActions.JoinExperience then
            return true;
        end;
    end;
    return false;
end;
return function(v28) --[[ Line: 82 ]]
    -- upvalues: l_useDispatch_0 (copy), v13 (copy), v11 (copy), l_useSelector_0 (copy), v6 (copy), l_NetworkStatus_0 (copy), v12 (copy), l_useEffectOnce_0 (copy), v19 (copy), v23 (copy), v24 (copy), v22 (copy), l_FFlagEnableProfilePlatformDisabledActions_0 (copy), v16 (copy), v17 (copy), l_IconName_0 (copy), l_NavigateDown_0 (copy), v18 (copy)
    local v29 = l_useDispatch_0();
    local v30 = v13(v11.Components.Actions) or {};
    local v32 = l_useSelector_0(function(v31) --[[ Line: 86 ]]
        -- upvalues: v6 (ref), v28 (copy), l_NetworkStatus_0 (ref)
        return v6.GetPresencesFromUserIds.getStatus(v31, v28) == l_NetworkStatus_0.NotStarted;
    end);
    local v33 = v12(v11.ButtonSurface.Actions);
    local v34 = {};
    local v35 = {};
    local v36 = {};
    l_useEffectOnce_0(function() --[[ Line: 97 ]]
        -- upvalues: v29 (copy), v6 (ref), v28 (copy)
        v29(v6.GetPresencesFromUserIds.API({
            v28
        }));
    end, isJoinExperience(v30.buttons) and v32);
    local v38 = v19 and v23.find(v30.buttons, function(v37) --[[ Line: 102 ]]
        -- upvalues: v11 (ref)
        return v37.type == v11.ProfileActions.JoinExperience;
    end);
    for _, v40 in ipairs(v30.buttons) do
        if not v38 or v40.type == v11.ProfileActions.JoinExperience or not v24[v40.type] then
            local v41 = v33[v40.type];
            if v22 and v40.subActions then
                local v42 = {};
                for _, v44 in v40.subActions do
                    local v45 = v33[v44];
                    if v45 then
                        table.insert(v42, {
                            id = v44, 
                            text = v45.text, 
                            icon = v45.icon, 
                            onActivated = v45.onActivated
                        });
                    end;
                end;
                if #v42 > 0 then
                    v41.menuItems = v42;
                end;
            end;
            if l_FFlagEnableProfilePlatformDisabledActions_0 and v40.disabledReason then
                if v16 and v40.type == v11.ProfileActions.JoinCommunity and (v40.disabledReason == v11.DisabledReasons.InsufficientVerificationLevelLow or v40.disabledReason == v11.DisabledReasons.InsufficientVerificationLevelMedium or v40.disabledReason == v11.DisabledReasons.InsufficientVerificationLevelHigh) then
                    v41.icon = if v16 and v17 then l_IconName_0.LockClosed else nil;
                    v41.onActivated = function() --[[ Line: 151 ]]
                        -- upvalues: v29 (copy), l_NavigateDown_0 (ref), v11 (ref), v40 (copy)
                        return v29(l_NavigateDown_0({
                            name = v11.Screens.CommunityVerificationModal, 
                            extraProps = {
                                disabledReason = v40.disabledReason
                            }
                        }));
                    end;
                else
                    v41.isDisabled = true;
                    v41.disabledReason = if v18 then v40.disabledReason else nil;
                end;
            end;
            if v24[v40.type] then
                table.insert(v35, v41);
            else
                table.insert(v36, v41);
            end;
        end;
    end;
    if #v35 > 0 then
        v34.primary = v35;
    end;
    if #v36 > 0 then
        v34.secondary = v36;
    end;
    return v34, v30.contextual and true or false;
end;