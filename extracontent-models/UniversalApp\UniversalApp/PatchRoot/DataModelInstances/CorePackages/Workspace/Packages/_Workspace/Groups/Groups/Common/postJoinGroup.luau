local l_script_FirstAncestor_0 = script:FindFirstAncestor("Groups");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v5, v6) --[[ Line: 9 ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_Url_0 (copy), l_HttpService_0 (copy)
    local v7 = l_UrlBuilder_0.fromString(l_Url_0.GROUPS_URL .. "v1/groups/{id}/users");
    local v8 = l_HttpService_0:JSONEncode({});
    return v5(v7({
        id = tostring(v6)
    }), "POST", {
        postBody = v8
    }):andThen(function(v9) --[[ Line: 16 ]]
        return v9.responseBody;
    end);
end;