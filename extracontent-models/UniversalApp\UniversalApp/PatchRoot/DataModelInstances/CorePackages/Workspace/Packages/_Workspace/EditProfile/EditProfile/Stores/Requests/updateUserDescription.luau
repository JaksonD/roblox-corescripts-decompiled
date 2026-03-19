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
return function(v12) --[[ Line: 20 ]] --[[ Name: updateUserDescription ]]
    -- upvalues: l_Url_0 (copy), v11 (copy), v5 (copy), l_HttpService_0 (copy), v4 (copy)
    local v13 = string.format("%s/description", l_Url_0.USERS_URL);
    return v11(v13, v5.RequestMethods.POST, {
        postBody = l_HttpService_0:JSONEncode({
            description = v12
        })
    }):andThen(function(v14) --[[ Line: 28 ]]
        -- upvalues: v12 (copy)
        return v14.responseBody and v14.responseBody.description or v12;
    end):catch(function(v15) --[[ Line: 31 ]]
        -- upvalues: l_HttpService_0 (ref), v4 (ref)
        if v15 then
            local v16 = {
                statusCode = v15.StatusCode, 
                errors = {}
            };
            if v15.Body then
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 38 ]]
                    -- upvalues: l_HttpService_0 (ref), v15 (copy)
                    return l_HttpService_0:JSONDecode(v15.Body);
                end);
                if l_status_0 and l_result_0 and l_result_0.errors then
                    v16.errors = l_result_0.errors;
                end;
            end;
            return v4.reject(v16);
        else
            return v4.reject(v15);
        end;
    end);
end;