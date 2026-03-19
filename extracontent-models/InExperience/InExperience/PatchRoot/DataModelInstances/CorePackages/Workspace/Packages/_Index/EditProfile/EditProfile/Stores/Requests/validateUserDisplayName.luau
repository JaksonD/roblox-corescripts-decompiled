local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Http);
local v3 = require(l_Parent_0.HttpRequest);
local v4 = require(l_Parent_0.Promise);
local v5 = require(l_script_FirstAncestor_0.Common.Enums);
local l_HttpService_0 = game:GetService("HttpService");
local l_Url_0 = v2.Url;
local v11 = v3.config({
    requestFunction = function(v8, v9, v10) --[[ Line: 15 ]] --[[ Name: requestFunction ]]
        -- upvalues: v3 (copy)
        return v3.requestFunctions.RequestInternal(v8, v9, v10);
    end
});
return function(v12, v13) --[[ Line: 20 ]] --[[ Name: validateUserDisplayName ]]
    -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy), v11 (copy), v5 (copy), v4 (copy)
    local v14 = string.format("%s/users/%s/display-names/validate", l_Url_0.USERS_URL, v12);
    local v15 = string.format("%s?displayName=%s", v14, l_HttpService_0:UrlEncode(v13));
    return v11(v15, v5.RequestMethods.GET):andThen(function(v16) --[[ Line: 25 ]]
        return v16.responseBody or {};
    end):catch(function(v17) --[[ Line: 28 ]]
        -- upvalues: l_HttpService_0 (ref), v4 (ref)
        if v17 then
            local v18 = {
                statusCode = v17.StatusCode, 
                errors = {}
            };
            if v17.Body then
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 35 ]]
                    -- upvalues: l_HttpService_0 (ref), v17 (copy)
                    return l_HttpService_0:JSONDecode(v17.Body);
                end);
                if l_status_0 and l_result_0 and l_result_0.errors then
                    v18.errors = l_result_0.errors;
                end;
            end;
            return v4.reject(v18);
        else
            return v4.reject(v17);
        end;
    end);
end;