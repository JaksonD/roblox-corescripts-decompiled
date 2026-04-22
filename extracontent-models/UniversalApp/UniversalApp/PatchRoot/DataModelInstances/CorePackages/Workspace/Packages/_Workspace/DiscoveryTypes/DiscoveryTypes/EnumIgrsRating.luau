local l_Parent_0 = script:FindFirstAncestor("DiscoveryTypes").Parent;
local l_FFlagLuaAppAllowNoIgrsImage_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAllowNoIgrsImage;
local l_FFlagLuaAppAddIgrsImages_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddIgrsImages;
return {
    IgrsThreePlus = l_FFlagLuaAppAddIgrsImages_0 and "IGRS_RATING_THREE_PLUS" or nil, 
    IgrsSevenPlus = l_FFlagLuaAppAddIgrsImages_0 and "IGRS_RATING_SEVEN_PLUS" or nil, 
    IgrsThirteenPlus = "IGRS_RATING_THIRTEEN_PLUS", 
    IgrsFifteenPlus = "IGRS_RATING_FIFTEEN_PLUS", 
    IgrsEighteenPlus = "IGRS_RATING_EIGHTEEN_PLUS", 
    IgrsUnrated = l_FFlagLuaAppAllowNoIgrsImage_0 and "IGRS_RATING_UNRATED" or nil
};