local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Http);
local v3 = require(l_Parent_0.HttpRequest);
local v4 = require(l_Parent_0.Promise);
local l_HttpService_0 = game:GetService("HttpService");
local l_Url_0 = v2.Url;
local v7 = require(l_script_FirstAncestor_0.Common.Enums);
local v11 = v3.config({
    requestFunction = function(v8, v9, v10) --[[ Line: 16 ]] --[[ Name: requestFunction ]]
        -- upvalues: v3 (copy)
        return v3.requestFunctions.RequestInternal(v8, v9, v10);
    end
});
return function(v12, v13) --[[ Line: 21 ]] --[[ Name: updateUserDisplayName ]]
    -- upvalues: l_Url_0 (copy), v11 (copy), v7 (copy), l_HttpService_0 (copy), v4 (copy)
    local v14 = string.format("%s/users/%s/display-names", l_Url_0.USERS_URL, v12);
    return v11(v14, v7.RequestMethods.PATCH, {
        postBody = l_HttpService_0:JSONEncode({
            newDisplayName = v13
        })
    }):andThen(function(v15) --[[ Line: 29 ]]
        -- upvalues: v13 (copy)
        return v15.responseBody and v15.responseBody.displayName or v13;
    end):catch(function(v16) --[[ Line: 32 ]]
        -- upvalues: l_HttpService_0 (ref), v4 (ref)
        if v16 then
            local v17 = {
                statusCode = v16.StatusCode, 
                errors = {}
            };
            if v16.Body then
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 39 ]]
                    -- upvalues: l_HttpService_0 (ref), v16 (copy)
                    return l_HttpService_0:JSONDecode(v16.Body);
                end);
                if l_status_0 and l_result_0 and l_result_0.errors then
                    v17.errors = l_result_0.errors;
                end;
            end;
            return v4.reject(v17);
        else
            return v4.reject(v16);
        end;
    end);
end;