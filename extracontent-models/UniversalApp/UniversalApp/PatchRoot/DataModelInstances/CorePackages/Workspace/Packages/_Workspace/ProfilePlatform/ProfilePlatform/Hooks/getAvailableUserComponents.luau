local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.SocialCommon);
local v3 = require(l_Parent_0.Cryo);
local _ = require(l_script_FirstAncestor_0.Types.Component);
local v5 = require(l_script_FirstAncestor_0.Common.Enums);
local v6 = require(l_Parent_0.SharedFlags);
local v7 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableFavoriteExperiences);
local l_FFlagProfilePlatformEnableInventory_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableInventory;
local v9 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableSendPlayedTogetherContextToProfilePlatformService);
local l_FFlagProfilePlatformEnableStore_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableStore;
local v11 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableVR);
local v12 = require(l_script_FirstAncestor_0.Flags.FFlagPPVBackgroundEnabled);
local l_GetFFlagLuafiedReportEntryPoints_0 = v6.GetFFlagLuafiedReportEntryPoints;
local l_FFlagExperiencesOnProfile_0 = require(l_Parent_0.SharedFlags).FFlagExperiencesOnProfile;
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformAddCurrentlyPlaying);
local v16 = game:DefineFastFlag("ProfilePlatformEnableReportAllEntryPoints", false);
local l_FFlagProfilePlatformEnableCurrencyTransfer_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer;
local l_FFlagEnableProfileCompletion_0 = require(l_Parent_0.SharedFlags).FFlagEnableProfileCompletion;
local v19 = {
    [v2.Enums.ContextualInfoTypes.MutualFriends] = v5.ContextualTypes.MutualFriends, 
    [v2.Enums.ContextualInfoTypes.Frequents] = v5.ContextualTypes.PlayedTogether
};
return function(v20, v21) --[[ Line: 32 ]]
    -- upvalues: v11 (copy), v3 (copy), v5 (copy), v16 (copy), l_GetFFlagLuafiedReportEntryPoints_0 (copy), l_FFlagProfilePlatformEnableCurrencyTransfer_0 (copy), v9 (copy), v19 (copy), v2 (copy), v12 (copy), v7 (copy), l_FFlagProfilePlatformEnableInventory_0 (copy), l_FFlagProfilePlatformEnableStore_0 (copy), l_FFlagExperiencesOnProfile_0 (copy), l_FFlagEnableProfileCompletion_0 (copy), v15 (copy)
    local v22 = nil;
    if v11 then
        local v23 = v3.Dictionary.values(v5.ProfileActions);
        local v25 = v3.List.filter(v23, function(v24) --[[ Line: 45 ]]
            -- upvalues: v16 (ref), v5 (ref), v21 (copy), l_GetFFlagLuafiedReportEntryPoints_0 (ref), l_FFlagProfilePlatformEnableCurrencyTransfer_0 (ref)
            if not v16 and v24 == v5.ProfileActions.Report then
                return v21 and v21.areWebViewsSupported or l_GetFFlagLuafiedReportEntryPoints_0();
            elseif v24 == v5.ProfileActions.QrCode then
                if v21 and v21.isProfileQrCodeEnabled then
                    return true;
                else
                    return false;
                end;
            elseif v24 == v5.ProfileActions.EditProfile then
                if v21 and v21.areWebViewsSupported then
                    return true;
                else
                    return false;
                end;
            elseif l_FFlagProfilePlatformEnableCurrencyTransfer_0 and v24 == v5.ProfileActions.CurrencyTransfer then
                if v21 and v21.canRenderTransferInProfile then
                    return true;
                else
                    return false;
                end;
            else
                return true;
            end;
        end);
        v22 = {
            {
                component = v5.Components.UserProfileHeader, 
                context = if v9 then v19[v20] else if v20 == v2.Enums.ContextualInfoTypes.MutualFriends then v5.ContextualTypes.MutualFriends else nil
            }, 
            {
                component = v5.Components.SocialLinks
            }, 
            {
                component = v5.Components.About
            }, 
            {
                component = v5.Components.CurrentlyWearing
            }, 
            {
                component = v5.Components.Actions, 
                context = if v20 == v2.Enums.ContextualInfoTypes.OffNetworkFriendRequest then v5.ContextualTypes.OffNetworkFriendRequest else nil, 
                supportedActions = v25
            }
        };
        if v12 then
            table.insert(v22, {
                component = v5.Components.ProfileBackground
            });
        end;
        if v21 and v21.areWebViewsSupported then
            table.insert(v22, {
                component = v5.Components.ViewFullProfile
            });
        end;
    else
        v22 = {
            {
                component = v5.Components.UserProfileHeader, 
                context = if v20 == v2.Enums.ContextualInfoTypes.MutualFriends then v5.ContextualTypes.MutualFriends else nil
            }, 
            {
                component = v5.Components.SocialLinks
            }, 
            {
                component = v5.Components.About
            }, 
            {
                component = v5.Components.CurrentlyWearing
            }, 
            {
                component = v5.Components.ViewFullProfile
            }, 
            {
                component = v5.Components.Actions, 
                context = if v20 == v2.Enums.ContextualInfoTypes.OffNetworkFriendRequest then v5.ContextualTypes.OffNetworkFriendRequest else nil
            }
        };
        if v12 then
            table.insert(v22, {
                component = v5.Components.ProfileBackground
            });
        end;
    end;
    if v7 and (not v11 or v21 and v21.areWebViewsSupported) then
        table.insert(v22, {
            component = v5.Components.FavoriteExperiences
        });
    end;
    if l_FFlagProfilePlatformEnableInventory_0 and (not v11 or v21 and v21.areWebViewsSupported) then
        table.insert(v22, {
            component = v5.Components.Inventory
        });
    end;
    if l_FFlagProfilePlatformEnableStore_0 and (not v11 or v21 and v21.areWebViewsSupported) then
        table.insert(v22, {
            component = v5.Components.Store
        });
    end;
    if l_FFlagExperiencesOnProfile_0 then
        table.insert(v22, {
            component = v5.Components.Experiences
        });
    end;
    if l_FFlagEnableProfileCompletion_0 then
        table.insert(v22, {
            component = v5.Components.ProfileCompletion
        });
    end;
    if v15 then
        table.insert(v22, {
            component = v5.Components.CurrentlyPlaying
        });
    end;
    return v22;
end;