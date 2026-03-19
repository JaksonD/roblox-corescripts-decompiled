local l_Parent_0 = script:FindFirstAncestor("FoundationImages").Parent;
return {
    FixBlurryImages = require(l_Parent_0.SafeFlags).createGetFFlag("FixBlurryImages")()
};