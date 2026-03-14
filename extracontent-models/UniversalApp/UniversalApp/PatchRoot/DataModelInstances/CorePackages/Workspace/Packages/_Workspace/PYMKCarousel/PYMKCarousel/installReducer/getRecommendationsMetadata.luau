local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local l_getDeepValue_0 = require(l_script_FirstAncestor_0.dependencies).SocialLibraries.Dictionary.getDeepValue;
return function(v2, v3) --[[ Line: 7 ]]
    -- upvalues: l_getDeepValue_0 (copy)
    return l_getDeepValue_0(v2, string.format("metadata.%s", v3)) or {};
end;