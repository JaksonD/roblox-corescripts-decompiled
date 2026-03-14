local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCommon");
local v1 = require(l_script_FirstAncestor_0.Enums.RecommendationContextType);
local v2 = require(l_script_FirstAncestor_0.Enums.ContextualInfoTypes);
return function(v3) --[[ Line: 11 ]] --[[ Name: getRecommendationContextualInfoType ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4 = v3.contextType and v3.contextType.rawValue();
    if v4 == v1.MutualFriends.rawValue() then
        return v2.MutualFriends;
    elseif v4 == v1.Frequents.rawValue() then
        return v2.Frequents;
    elseif v4 == v1.Contacts.rawValue() then
        return v2.Contacts;
    else
        return nil;
    end;
end;