local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.getMutualFriendsText);
local v3 = require(l_script_FirstAncestor_0.Enums.RecommendationContextType);
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local l_FFlagHomepagePYMKUseHorizontalUserList_0 = require(l_Parent_0.SharedFlags).FFlagHomepagePYMKUseHorizontalUserList;
return function(v6) --[[ Line: 45 ]]
    -- upvalues: l_FFlagHomepagePYMKUseHorizontalUserList_0 (copy), v3 (copy), v2 (copy), l_Images_0 (copy)
    local v7 = nil;
    local v8 = nil;
    local v9 = v6.recommendation.contextType and v6.recommendation.contextType.rawValue();
    local v10 = v6.recommendation.mutualFriendsCount or 0;
    if l_FFlagHomepagePYMKUseHorizontalUserList_0 and v6.recommendation.hasIncomingFriendRequest then
        v7 = v6.localized.connectionRequests;
        v8 = nil;
    end;
    if v9 == v3.Contacts.rawValue() then
        v7 = v6.localized.contacts;
    elseif v9 == v3.MutualFriends.rawValue() and v10 > 0 then
        v7 = v2({
            mutualFriendsCount = v10, 
            localized = {
                mutualConnections = v6.localized.mutualConnections, 
                singularMutualConnection = v6.localized.singularMutualConnection
            }
        });
        v8 = l_Images_0["icons/status/player/friend"];
    elseif v9 == v3.Frequents.rawValue() then
        v7 = v6.localized.frequents;
    end;
    if not l_FFlagHomepagePYMKUseHorizontalUserList_0 and v6.recommendation.hasIncomingFriendRequest then
        v7 = v6.localized.connectionRequests;
        v8 = nil;
    end;
    return {
        text = v7, 
        icon = v8
    };
end;