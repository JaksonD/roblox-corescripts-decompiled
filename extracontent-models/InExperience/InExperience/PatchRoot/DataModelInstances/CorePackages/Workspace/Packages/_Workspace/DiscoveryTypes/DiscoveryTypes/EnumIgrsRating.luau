local l_Parent_0 = script:FindFirstAncestor("DiscoveryTypes").Parent;
local l_FFlagLuaAppAllowNoIgrsImage_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAllowNoIgrsImage;
return {
    IgrsThirteenPlus = "IGRS_RATING_THIRTEEN_PLUS", 
    IgrsFifteenPlus = "IGRS_RATING_FIFTEEN_PLUS", 
    IgrsEighteenPlus = "IGRS_RATING_EIGHTEEN_PLUS", 
    IgrsUnrated = l_FFlagLuaAppAllowNoIgrsImage_0 and "IGRS_RATING_UNRATED" or nil
};