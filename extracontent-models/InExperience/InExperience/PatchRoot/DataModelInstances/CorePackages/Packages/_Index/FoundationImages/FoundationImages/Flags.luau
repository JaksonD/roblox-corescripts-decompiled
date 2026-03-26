local l_Parent_0 = script:FindFirstAncestor("FoundationImages").Parent;
local v1 = require(l_Parent_0.SafeFlags);
return {
    FixBlurryImages = v1.createGetFFlag("FixBlurryImages")(), 
    FoundationImagesRemoveDeprecatedIconAssets = v1.createGetFFlag("FoundationImagesRemoveDeprecatedIconAssets")()
};