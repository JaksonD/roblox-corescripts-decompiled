local l_Parent_0 = script:FindFirstAncestor("CrossPlay").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local v2 = require(script.Parent.FStringDebugOverrideCrossPlayApiUrl);
return function(v3) --[[ Line: 14 ]]
    -- upvalues: v2 (copy), l_Url_0 (copy)
    return v3.roduxNetworking.GET(script.Name, function(v4, v5, v6, v7) --[[ Line: 19 ]]
        -- upvalues: v2 (ref), l_Url_0 (ref)
        local v8 = v4(if v2 ~= "" then v2 else l_Url_0.APIS_URL, {
            crossPlaySettingsKey = v6
        }):path("user-settings-api"):path("v1"):path("user-settings");
        if not v7 then
            v8 = v8:path("platform");
        end;
        return v8:queryArgs({
            [v7 and "requestedUserSettings" or "requestedPlatformSettings"] = v5
        });
    end);
end;