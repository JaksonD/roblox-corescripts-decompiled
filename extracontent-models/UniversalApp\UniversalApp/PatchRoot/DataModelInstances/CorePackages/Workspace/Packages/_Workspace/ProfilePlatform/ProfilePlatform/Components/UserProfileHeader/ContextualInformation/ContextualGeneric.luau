local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v4 = require(l_Parent_0.UIBlox);
local l_Images_0 = v4.App.ImageSet.Images;
local l_PlayerContext_0 = v4.App.Indicator.PlayerContext;
local v7 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v8 = require(l_script_FirstAncestor_0.Common.Enums);
return function(v9) --[[ Line: 21 ]] --[[ Name: ContextualInformation ]]
    -- upvalues: l_useLocalization_0 (copy), v8 (copy), v7 (copy), l_Images_0 (copy), v2 (copy), l_PlayerContext_0 (copy)
    local v10 = l_useLocalization_0({
        [v8.ContextualTypes.AccountDeleted] = v7.AccountDeleted, 
        [v8.ContextualTypes.IsYourself] = v7.ThisIsYou, 
        [v8.ContextualTypes.PreviousUsername] = v7.Previously, 
        [v8.ContextualTypes.YouAreFollowing] = v7.YouAreFollowing, 
        [v8.ContextualTypes.FollowsYou] = v7.FollowsYou, 
        [v8.ContextualTypes.PlayedTogether] = v7.PlayedTogether, 
        [v8.ContextualTypes.OffNetworkFriendRequest] = v7.FriendInvite, 
        [v8.ContextualTypes.SentFromQrCode] = v7.FromQRCode, 
        [v8.ContextualTypes.SentFromExperience] = {
            v7.SentFromWithContext; 
            gameName = v9.experienceName
        }
    });
    local l_contextualType_0 = v9.contextualType;
    local v12 = v10[l_contextualType_0];
    local v13 = nil;
    if l_contextualType_0 == v8.ContextualTypes.YouAreFollowing or l_contextualType_0 == v8.ContextualTypes.FollowsYou then
        v13 = l_Images_0["icons/status/player/following"];
    end;
    return v2.createElement(l_PlayerContext_0, {
        text = v9.textOverride or v12, 
        icon = v9.iconOverride or v13
    });
end;