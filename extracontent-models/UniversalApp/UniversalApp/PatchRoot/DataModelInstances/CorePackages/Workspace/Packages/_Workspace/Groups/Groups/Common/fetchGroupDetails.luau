local l_Parent_0 = script:FindFirstAncestor("Groups").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
return function(v3, v4) --[[ Line: 9 ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_HttpService_0 (copy)
    local v5 = l_UrlBuilder_0.fromString("apis:profile-platform-api/v1/profiles/get");
    local v6 = {
        profileId = v4, 
        profileType = "Community", 
        components = {
            {
                component = "CommunityProfileHeader"
            }, 
            {
                component = "Actions"
            }, 
            {
                component = "CommunityLocked"
            }
        }
    };
    local v7 = l_HttpService_0:JSONEncode(v6);
    return v3(v5(), "POST", {
        postBody = v7
    }):andThen(function(v8) --[[ Line: 27 ]]
        return v8.responseBody;
    end);
end;