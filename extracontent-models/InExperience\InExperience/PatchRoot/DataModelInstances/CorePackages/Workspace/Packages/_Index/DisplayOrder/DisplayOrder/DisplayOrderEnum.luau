local l_Parent_0 = script:FindFirstAncestor("DisplayOrder").Parent;
return {
    SocialContextToastContainer = require(l_Parent_0.SharedFlags).GetFFlagIncreaseSocialContextDisplayOrder() and 8 or 7
};