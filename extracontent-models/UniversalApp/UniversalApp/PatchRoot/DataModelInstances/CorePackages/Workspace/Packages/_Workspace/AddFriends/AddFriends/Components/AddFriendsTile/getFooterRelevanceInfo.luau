local l_Parent_0 = script:FindFirstAncestor("AddFriends").Parent;
local v1 = require(l_Parent_0.t);
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local l_PresenceType_0 = require(l_Parent_0.AddFriendsState).RoduxPresence.Enums.PresenceType;
local l_Constants_0 = require(l_Parent_0.ContactImporter).Constants;
local l_FriendshipOriginSourceType_0 = require(l_Parent_0.FriendsNetworking).Enums.FriendshipOriginSourceType;
local v6 = require(l_Parent_0.SocialCommon);
local l_getRecommendationContextualInfoDisplay_0 = v6.Utils.getRecommendationContextualInfoDisplay;
local l_getRecommendationContextualInfoType_0 = v6.Utils.getRecommendationContextualInfoType;
local l_getMutualFriendsText_0 = v6.Utils.getMutualFriendsText;
local l_ContextualInfoTypes_0 = v6.Enums.ContextualInfoTypes;
local l_FFlagAddFriendsRenderTileRefactor_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsRenderTileRefactor;
local v12 = v1.strictInterface({
    mutualFriends = v1.optional(v1.table), 
    amIFollowingUser = v1.optional(v1.boolean), 
    isUserFollowingMe = v1.optional(v1.boolean), 
    sentFromExperienceName = v1.optional(v1.string), 
    isFriendRequest = v1.boolean, 
    isRecommendation = v1.optional(v1.boolean), 
    userPresenceType = v1.optional(v1.userdata), 
    lastLocation = v1.optional(v1.string), 
    originSourceType = v1.optional(v1.string), 
    contextType = v1.optional(v1.userdata), 
    mutualFriendsCount = v1.optional(v1.number), 
    hasIncomingFriendRequest = v1.optional(v1.boolean)
});
local function _(v13) --[[ Line: 42 ]]
    local v14 = false;
    if v13 ~= nil then
        v14 = #v13 > 0;
    end;
    return v14;
end;
return function(v16, v17, v18) --[[ Line: 46 ]]
    -- upvalues: v12 (copy), l_Constants_0 (copy), l_FriendshipOriginSourceType_0 (copy), l_getMutualFriendsText_0 (copy), l_Images_0 (copy), l_ContextualInfoTypes_0 (copy), l_FFlagAddFriendsRenderTileRefactor_0 (copy), l_PresenceType_0 (copy), l_getRecommendationContextualInfoDisplay_0 (copy), l_getRecommendationContextualInfoType_0 (copy)
    assert(v12(v16));
    if v16.isFriendRequest then
        if v18.contactNameText then
            return {
                text = v18.contactNameText, 
                fontStyle = v17.Font.CaptionBody
            }, "HaveContact";
        elseif v16.originSourceType == l_Constants_0.PHONE_CONTACT_IMPORTER then
            return {
                text = v18.fromContactsText, 
                fontStyle = v17.Font.CaptionBody
            }, "FromCI";
        elseif v16.originSourceType == l_FriendshipOriginSourceType_0.QrCode.rawValue() then
            return {
                text = v18.foundThroughQRCode, 
                fontStyle = v17.Font.CaptionBody
            }, "FRomQR";
        else
            local l_mutualFriends_0 = v16.mutualFriends;
            local v20 = false;
            if l_mutualFriends_0 ~= nil then
                v20 = #l_mutualFriends_0 > 0;
            end;
            if v20 then
                return {
                    text = l_getMutualFriendsText_0({
                        mutualFriendsCount = #v16.mutualFriends, 
                        localized = {
                            mutualConnections = v18.mutualConnections, 
                            singularMutualConnection = v18.singularMutualConnection
                        }
                    }), 
                    fontStyle = v17.Font.CaptionBody, 
                    icon = l_Images_0["icons/status/player/friend"]
                }, l_ContextualInfoTypes_0.MutualFriends;
            elseif v16.sentFromExperienceName ~= nil then
                return {
                    text = v18.sentFromWithContextText, 
                    fontStyle = v17.Font.CaptionBody
                }, "FromExperience";
            elseif v16.amIFollowingUser then
                return {
                    text = v18.youAreFollowingText, 
                    fontStyle = v17.Font.CaptionBody, 
                    icon = l_Images_0["icons/status/player/following"]
                }, "FollowingUser";
            elseif v16.isUserFollowingMe then
                return {
                    text = v18.followsYouText, 
                    fontStyle = v17.Font.CaptionBody, 
                    icon = l_Images_0["icons/status/player/following"]
                }, "FollowingMe";
            else
                return nil;
            end;
        end;
    elseif not l_FFlagAddFriendsRenderTileRefactor_0 and v16.userPresenceType == l_PresenceType_0.InGame then
        return v16.lastLocation and {
            text = v16.lastLocation, 
            fontStyle = v17.Font.CaptionBody, 
            icon = l_Images_0["icons/actions/friends/friendsplaying"], 
            iconTransparency = v17.Theme.BackgroundUIDefault.Transparency, 
            iconSize = UDim2.new(0, 24, 0, 24)
        }, "LastLocation";
    elseif v16.isRecommendation then
        local v21 = {
            contextType = v16.contextType, 
            mutualFriendsCount = v16.mutualFriendsCount, 
            hasIncomingFriendRequest = v16.hasIncomingFriendRequest
        };
        local v22 = {
            mutualConnections = v18.mutualConnections, 
            singularMutualConnection = v18.singularMutualConnection, 
            frequents = v18.frequents, 
            connectionRequests = v18.connectionRequests, 
            contacts = v18.fromContacts
        };
        local v23 = l_getRecommendationContextualInfoDisplay_0({
            recommendation = v21, 
            localized = v22
        });
        return {
            text = v23.text, 
            fontStyle = v17.Font.CaptionBody, 
            icon = v23.icon
        }, l_getRecommendationContextualInfoType_0(v21);
    else
        return nil;
    end;
end;