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
local v18 = {
    [v2.Enums.ContextualInfoTypes.MutualFriends] = v5.ContextualTypes.MutualFriends, 
    [v2.Enums.ContextualInfoTypes.Frequents] = v5.ContextualTypes.PlayedTogether
};
return function(v19, v20) --[[ Line: 31 ]]
    -- upvalues: v11 (copy), v3 (copy), v5 (copy), v16 (copy), l_GetFFlagLuafiedReportEntryPoints_0 (copy), l_FFlagProfilePlatformEnableCurrencyTransfer_0 (copy), v9 (copy), v18 (copy), v2 (copy), v12 (copy), v7 (copy), l_FFlagProfilePlatformEnableInventory_0 (copy), l_FFlagProfilePlatformEnableStore_0 (copy), l_FFlagExperiencesOnProfile_0 (copy), v15 (copy)
    local v21 = nil;
    if v11 then
        local v22 = v3.Dictionary.values(v5.ProfileActions);
        local v24 = v3.List.filter(v22, function(v23) --[[ Line: 44 ]]
            -- upvalues: v16 (ref), v5 (ref), v20 (copy), l_GetFFlagLuafiedReportEntryPoints_0 (ref), l_FFlagProfilePlatformEnableCurrencyTransfer_0 (ref)
            if not v16 and v23 == v5.ProfileActions.Report then
                return v20 and v20.areWebViewsSupported or l_GetFFlagLuafiedReportEntryPoints_0();
            elseif v23 == v5.ProfileActions.QrCode then
                if v20 and v20.isProfileQrCodeEnabled then
                    return true;
                else
                    return false;
                end;
            elseif v23 == v5.ProfileActions.EditProfile then
                if v20 and v20.areWebViewsSupported then
                    return true;
                else
                    return false;
                end;
            elseif l_FFlagProfilePlatformEnableCurrencyTransfer_0 and v23 == v5.ProfileActions.CurrencyTransfer then
                if v20 and v20.canRenderTransferInProfile then
                    return true;
                else
                    return false;
                end;
            else
                return true;
            end;
        end);
        v21 = {
            {
                component = v5.Components.UserProfileHeader, 
                context = if v9 then v18[v19] else if v19 == v2.Enums.ContextualInfoTypes.MutualFriends then v5.ContextualTypes.MutualFriends else nil
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
                context = if v19 == v2.Enums.ContextualInfoTypes.OffNetworkFriendRequest then v5.ContextualTypes.OffNetworkFriendRequest else nil, 
                supportedActions = v24
            }
        };
        if v12 then
            table.insert(v21, {
                component = v5.Components.ProfileBackground
            });
        end;
        if v20 and v20.areWebViewsSupported then
            table.insert(v21, {
                component = v5.Components.ViewFullProfile
            });
        end;
    else
        v21 = {
            {
                component = v5.Components.UserProfileHeader, 
                context = if v19 == v2.Enums.ContextualInfoTypes.MutualFriends then v5.ContextualTypes.MutualFriends else nil
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
                context = if v19 == v2.Enums.ContextualInfoTypes.OffNetworkFriendRequest then v5.ContextualTypes.OffNetworkFriendRequest else nil
            }
        };
        if v12 then
            table.insert(v21, {
                component = v5.Components.ProfileBackground
            });
        end;
    end;
    if v7 and (not v11 or v20 and v20.areWebViewsSupported) then
        table.insert(v21, {
            component = v5.Components.FavoriteExperiences
        });
    end;
    if l_FFlagProfilePlatformEnableInventory_0 and (not v11 or v20 and v20.areWebViewsSupported) then
        table.insert(v21, {
            component = v5.Components.Inventory
        });
    end;
    if l_FFlagProfilePlatformEnableStore_0 and (not v11 or v20 and v20.areWebViewsSupported) then
        table.insert(v21, {
            component = v5.Components.Store
        });
    end;
    if l_FFlagExperiencesOnProfile_0 then
        table.insert(v21, {
            component = v5.Components.Experiences
        });
    end;
    if v15 then
        table.insert(v21, {
            component = v5.Components.CurrentlyPlaying
        });
    end;
    return v21;
end;