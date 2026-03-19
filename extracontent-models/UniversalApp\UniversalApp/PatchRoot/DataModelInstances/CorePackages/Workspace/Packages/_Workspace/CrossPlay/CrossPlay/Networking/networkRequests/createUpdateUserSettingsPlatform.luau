local l_Parent_0 = script:FindFirstAncestor("CrossPlay").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local v2 = require(script.Parent.FStringDebugOverrideCrossPlayApiUrl);
return function(v3) --[[ Line: 14 ]]
    -- upvalues: v2 (copy), l_Url_0 (copy)
    return v3.roduxNetworking.POST(script.Name, function(v4, v5, v6, v7, v8) --[[ Line: 19 ]]
        -- upvalues: v2 (ref), l_Url_0 (ref)
        local v9 = v4(if v2 ~= "" then v2 else l_Url_0.APIS_URL, {
            crossPlaySettingsKey = v6, 
            crossPlayValue = v7
        }):path("user-settings-api"):path("v1"):path("user-settings");
        if not v8 then
            v9 = v9:path("platform");
        end;
        return v9:body({
            [v5] = v7
        });
    end);
end;