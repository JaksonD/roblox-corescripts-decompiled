local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useEffectOnce_0 = v3.Hooks.useEffectOnce;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local v7 = require(l_script_FirstAncestor_0.Networking.NetworkingPresence);
local v8 = require(l_script_FirstAncestor_0.Networking.myRoduxNetworking);
local l_IconName_0 = require(l_Parent_0.Foundation).Enums.IconName;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_NetworkStatus_0 = v8.Enum.NetworkStatus;
local v12 = require(l_script_FirstAncestor_0.Common.Enums);
local v13 = require(l_script_FirstAncestor_0.Hooks.useProfileActions);
local v14 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformUpdateUXForNonSocialCommunities);
local l_FFlagEnableProfilePlatformDisabledActions_0 = require(l_Parent_0.SharedFlags).FFlagEnableProfilePlatformDisabledActions;
local v17 = require(l_script_FirstAncestor_0.Flags.FFlagEnableCommunityVerificationModal);
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagPortEnableCommunityVerificationModal);
local v19 = require(l_script_FirstAncestor_0.Flags.FFlagEnableProfilePlatformDisabledReasonText);
local v20 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableUserProfileButtonsBacktest);
local v21 = game:DefineFastFlag("ProfilePlatformUnfriendPrimaryActionEnabled", false);
local l_FFlagProfilePlatformEnableCurrencyTransfer_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer;
local v23 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableEditAppearanceMenu);
local v24 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableEditLook);
local v25 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformAddCurrentlyPlaying);
local v26 = require(l_Parent_0.Dash);
local v27 = {
    [v12.ProfileActions.AcceptFriendRequest] = true, 
    [v12.ProfileActions.AcceptOffNetworkFriendRequest] = true, 
    [v12.ProfileActions.AddFriend] = true, 
    [v12.ProfileActions.AddFriendFromContacts] = true, 
    [v12.ProfileActions.AddFriendFromContactsSent] = true, 
    [v12.ProfileActions.CannotAddFriend] = true, 
    [v12.ProfileActions.Chat] = true, 
    [v12.ProfileActions.EditAlias] = true, 
    [v12.ProfileActions.EditAppearance] = v23 and true or nil, 
    [v12.ProfileActions.EditAvatar] = true, 
    [v12.ProfileActions.EditLook] = v24 and true or nil, 
    [v12.ProfileActions.EditProfile] = true, 
    [v12.ProfileActions.JoinExperience] = true, 
    [v12.ProfileActions.PendingFriendRequest] = true, 
    [v12.ProfileActions.Unblock] = true, 
    [v12.ProfileActions.JoinCommunity] = true, 
    [v12.ProfileActions.Follow] = v15 and true or nil, 
    [v12.ProfileActions.CancelJoinCommunityRequest] = true, 
    [v12.ProfileActions.ViewCommunity] = true, 
    [v12.ProfileActions.ViewFullProfile] = v15 and true or nil, 
    [v12.ProfileActions.ShareProfile] = true, 
    [v12.ProfileActions.Unfriend] = v21 and true or nil, 
    [v12.ProfileActions.CurrencyTransfer] = l_FFlagProfilePlatformEnableCurrencyTransfer_0 and true or nil
};
isJoinExperience = function(v28) --[[ Line: 77 ]] --[[ Name: isJoinExperience ]]
    -- upvalues: v12 (copy)
    for _, v30 in v28 do
        if v30.type == v12.ProfileActions.JoinExperience then
            return true;
        end;
    end;
    return false;
end;
return function(v31) --[[ Line: 86 ]]
    -- upvalues: l_useDispatch_0 (copy), v14 (copy), v12 (copy), l_useSelector_0 (copy), v7 (copy), l_NetworkStatus_0 (copy), v13 (copy), v25 (copy), v2 (copy), l_useEffectOnce_0 (copy), v20 (copy), v26 (copy), v27 (copy), v23 (copy), l_FFlagEnableProfilePlatformDisabledActions_0 (copy), v17 (copy), v18 (copy), l_IconName_0 (copy), l_NavigateDown_0 (copy), v19 (copy), l_FFlagProfilePlatformEnableCurrencyTransfer_0 (copy)
    local v32 = l_useDispatch_0();
    local v33 = v14(v12.Components.Actions) or {};
    local v35 = l_useSelector_0(function(v34) --[[ Line: 90 ]]
        -- upvalues: v7 (ref), v31 (copy), l_NetworkStatus_0 (ref)
        return v7.GetPresencesFromUserIds.getStatus(v34, v31) == l_NetworkStatus_0.NotStarted;
    end);
    local v36 = v13(v12.ButtonSurface.Actions);
    local v37 = {};
    local v38 = {};
    local v39 = {};
    if v25 then
        v2.useEffect(function() --[[ Line: 103 ]]
            -- upvalues: v33 (copy), v32 (copy), v7 (ref), v31 (copy)
            if isJoinExperience(v33.buttons) then
                v32(v7.GetPresencesFromUserIds.API({
                    v31
                }));
            end;
        end, {
            v33.buttons, 
            v32, 
            v31
        });
    else
        l_useEffectOnce_0(function() --[[ Line: 109 ]]
            -- upvalues: v32 (copy), v7 (ref), v31 (copy)
            v32(v7.GetPresencesFromUserIds.API({
                v31
            }));
        end, isJoinExperience(v33.buttons) and v35);
    end;
    local v41 = v20 and v26.find(v33.buttons, function(v40) --[[ Line: 115 ]]
        -- upvalues: v12 (ref)
        return v40.type == v12.ProfileActions.JoinExperience;
    end);
    for _, v43 in ipairs(v33.buttons) do
        if not v41 or v43.type == v12.ProfileActions.JoinExperience or not v27[v43.type] then
            local v44 = v36[v43.type];
            if v23 and v43.subActions then
                local v45 = {};
                for _, v47 in v43.subActions do
                    local v48 = v36[v47];
                    if v48 then
                        table.insert(v45, {
                            id = v47, 
                            text = v48.text, 
                            icon = v48.icon, 
                            onActivated = v48.onActivated
                        });
                    end;
                end;
                if #v45 > 0 then
                    v44.menuItems = v45;
                end;
            end;
            if l_FFlagEnableProfilePlatformDisabledActions_0 and v43.disabledReason then
                if v17 and v43.type == v12.ProfileActions.JoinCommunity and (v43.disabledReason == v12.DisabledReasons.InsufficientVerificationLevelLow or v43.disabledReason == v12.DisabledReasons.InsufficientVerificationLevelMedium or v43.disabledReason == v12.DisabledReasons.InsufficientVerificationLevelHigh) then
                    v44.icon = if v17 and v18 then l_IconName_0.LockClosed else nil;
                    v44.onActivated = function() --[[ Line: 164 ]]
                        -- upvalues: v32 (copy), l_NavigateDown_0 (ref), v12 (ref), v43 (copy)
                        return v32(l_NavigateDown_0({
                            name = v12.Screens.CommunityVerificationModal, 
                            extraProps = {
                                disabledReason = v43.disabledReason
                            }
                        }));
                    end;
                else
                    v44.isDisabled = true;
                    v44.disabledReason = if v19 then v43.disabledReason else nil;
                end;
            end;
            if v27[v43.type] then
                table.insert(v38, v44);
            else
                table.insert(v39, v44);
            end;
        end;
    end;
    if #v38 > 0 then
        v37.primary = v38;
    end;
    if #v39 > 0 then
        v37.secondary = v39;
    end;
    return v37, v33.contextual and true or false, l_FFlagProfilePlatformEnableCurrencyTransfer_0 and v33.contextual ~= nil and v26.find(v33.contextual, function(v49) --[[ Line: 201 ]]
        -- upvalues: v12 (ref)
        return v49 == v12.ProfileActions.CurrencyTransfer;
    end) ~= nil;
end;