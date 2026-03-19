local v0 = require(script.FriendsOwnedUserList);
local v1 = require(script.SocialProofVerticalUserListSheet);
local l_Parent_0 = script:FindFirstAncestor("SocialProof").Parent;
local l_FFlagEnableSocialProofVerticalUserListSheet_0 = require(l_Parent_0.SharedFlags).FFlagEnableSocialProofVerticalUserListSheet;
return {
    FriendsOwnedUserList = v0, 
    SocialProofVerticalUserListSheet = if l_FFlagEnableSocialProofVerticalUserListSheet_0 then v1 else nil
};