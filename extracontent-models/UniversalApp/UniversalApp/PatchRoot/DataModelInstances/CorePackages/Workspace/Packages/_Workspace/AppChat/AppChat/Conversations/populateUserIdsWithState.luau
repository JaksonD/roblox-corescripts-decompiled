local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_populateListFromIds_0 = require(l_script_FirstAncestor_0.SocialLibraries).populate.populateListFromIds;
local v2 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
return function(v3, v4) --[[ Line: 12 ]]
    -- upvalues: v2 (copy), l_populateListFromIds_0 (copy)
    local v5 = v2(v3, "Users") or {};
    return l_populateListFromIds_0(v4, v5);
end;