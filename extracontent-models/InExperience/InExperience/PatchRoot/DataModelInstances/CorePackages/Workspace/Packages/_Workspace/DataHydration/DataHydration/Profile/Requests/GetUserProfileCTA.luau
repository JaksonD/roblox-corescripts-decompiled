local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Profile_0 = l_script_FirstAncestor_0.Profile;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v5 = require(l_Profile_0.Networking.myHttpRequest);
local v6 = l_UrlBuilder_0.new({
    base = l_Url_0.APIS_URL, 
    path = "profile-platform-api/v1/profiles/batch/get"
})();
return function(v7) --[[ Line: 15 ]]
    -- upvalues: v5 (copy), v6 (copy)
    local v8 = {
        profileType = "User", 
        profileIds = v7, 
        components = {
            {
                component = "Actions"
            }
        }, 
        excludeContextualActions = true
    };
    return v5(v6, "POST", {
        postBody = v8
    }):catch(function(v9) --[[ Line: 26 ]]
        error(v9);
    end);
end;