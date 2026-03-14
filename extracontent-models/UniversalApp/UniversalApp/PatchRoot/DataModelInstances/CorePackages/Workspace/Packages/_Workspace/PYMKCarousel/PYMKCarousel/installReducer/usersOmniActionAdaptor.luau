local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_SocialCommon_0 = v1.SocialCommon;
local l_RoduxUsers_0 = v1.RoduxUsers;
local v4 = require(script.Parent.transformOmniRecommendationsToActions);
local _ = require(l_script_FirstAncestor_0.Common.OmniTypes);
local l_ContextualInfoTypes_0 = l_SocialCommon_0.Enums.ContextualInfoTypes;
local function v9(v7) --[[ Line: 10 ]]
    -- upvalues: l_ContextualInfoTypes_0 (copy), l_RoduxUsers_0 (copy)
    local v8 = if v7.contextType == l_ContextualInfoTypes_0.Contacts then {
        id = v7.ContactId or tostring(v7.userId), 
        username = v7.ContactName or "", 
        displayName = v7.ContactName or ""
    } else {
        id = tostring(v7.userId), 
        username = v7.userName, 
        displayName = v7.displayName
    };
    return l_RoduxUsers_0.Actions.UserUpdated(v8);
end;
return function(v10) --[[ Line: 25 ]]
    -- upvalues: v4 (copy), v9 (copy)
    return {
        AddContentMetadata = function(v11) --[[ Line: 27 ]] --[[ Name: AddContentMetadata ]]
            return {
                v11
            };
        end, 
        AddOmniRecommendations = function(v12) --[[ Line: 32 ]] --[[ Name: AddOmniRecommendations ]]
            -- upvalues: v4 (ref), v10 (copy), v9 (ref)
            return v4(v12.recommendations or {}, v10, v9);
        end
    };
end;