local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v3 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCollectibleItemInfo);
return function(v5, v6) --[[ Line: 10 ]]
    -- upvalues: l_PerformFetch_0 (copy), v3 (copy), v4 (copy)
    return l_PerformFetch_0.Single(v6, function(v7) --[[ Line: 11 ]]
        -- upvalues: v3 (ref), v5 (copy), v6 (copy), v4 (ref)
        return v3.FetchCollectibleItemDetails(v5, {
            v6
        }):andThen(function(v8) --[[ Line: 12 ]]
            -- upvalues: v7 (copy), v4 (ref), v6 (ref)
            local v9 = if v8 then v8.responseBody else nil;
            local v10 = if v9 then v9[1] else nil;
            if v10 == nil then
                return;
            else
                v7:dispatch(v4(v6, v10));
                return;
            end;
        end);
    end);
end;