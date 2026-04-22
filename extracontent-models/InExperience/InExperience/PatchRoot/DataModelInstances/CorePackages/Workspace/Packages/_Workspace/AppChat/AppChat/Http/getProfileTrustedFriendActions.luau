local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Http);
local v2 = require(script.Parent.RoduxNetworking);
local v3 = v1.Url.APIS_URL .. "profile-platform-api/v1/profiles/get";
return function(v4, v5) --[[ Line: 10 ]]
    -- upvalues: v2 (copy), v3 (copy)
    return (v5 or v2.getNetworkImpl())(v3, "POST", {
        postBody = {
            profileType = "User", 
            profileId = v4, 
            components = {
                {
                    component = "Actions"
                }
            }, 
            includeComponentOrdering = false
        }
    }):andThen(function(v6) --[[ Line: 24 ]]
        return v6 and v6.responseBody and v6.responseBody.components and v6.responseBody.components.Actions and v6.responseBody.components.Actions.contextual or {};
    end);
end;