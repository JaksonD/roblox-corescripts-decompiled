local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Parent_0.Promise);
local l_Url_0 = require(l_Parent_0.Http).Url;
local function _() --[[ Line: 10 ]] --[[ Name: getChangePasswordUrl ]]
    -- upvalues: l_Url_0 (copy)
    return string.format("%sv2/user/passwords/change", l_Url_0.AUTH_URL);
end;
return function(v5, v6) --[[ Line: 22 ]]
    -- upvalues: l_HttpService_0 (copy), l_Url_0 (copy), v2 (copy)
    local v7 = l_HttpService_0:JSONEncode({
        currentPassword = nil, 
        newPassword = v6
    });
    return v5(string.format("%sv2/user/passwords/change", l_Url_0.AUTH_URL), "POST", {
        postBody = v7
    }):andThen(function(v8) --[[ Line: 24 ]]
        -- upvalues: v2 (ref)
        return v2.resolve(v8);
    end, function(v9) --[[ Line: 26 ]]
        -- upvalues: v2 (ref)
        return v2.reject(v9);
    end);
end;