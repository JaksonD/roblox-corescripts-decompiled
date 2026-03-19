local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Http);
local v3 = require(l_Parent_0.HttpRequest);
local _ = require(l_Parent_0.DataHydration);
local v5 = require(l_script_FirstAncestor_0.Common.Enums);
local l_Url_0 = v2.Url;
local v10 = v3.config({
    requestFunction = function(v7, v8, v9) --[[ Line: 16 ]] --[[ Name: requestFunction ]]
        -- upvalues: v3 (copy)
        return v3.requestFunctions.RequestInternal(v7, v8, v9);
    end
});
return function(v11) --[[ Line: 21 ]] --[[ Name: fetchUserDescription ]]
    -- upvalues: l_Url_0 (copy), v10 (copy), v5 (copy)
    local v12 = string.format("%s/users/%s", l_Url_0.USERS_URL, v11);
    return v10(v12, v5.RequestMethods.GET):andThen(function(v13) --[[ Line: 25 ]]
        return v13.responseBody.description or "";
    end):catch(function(v14) --[[ Line: 28 ]]
        error(v14);
    end);
end;