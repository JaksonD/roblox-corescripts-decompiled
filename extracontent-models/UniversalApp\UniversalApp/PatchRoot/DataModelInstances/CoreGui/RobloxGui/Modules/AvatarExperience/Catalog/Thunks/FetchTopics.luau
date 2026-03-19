local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Promise);
local v3 = require(l_CorePackages_0.Packages.Dash);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTopics);
local function _(v12, v13, v14) --[[ Line: 32 ]] --[[ Name: keyMapper ]]
    -- upvalues: v8 (copy), v9 (copy)
    return v8.GetTopicsKey .. v9.getTopicRequestKey(v12, v13, v14);
end;
return function(v16, v17, v18, v19) --[[ Line: 36 ]]
    -- upvalues: l_PerformFetch_0 (copy), v8 (copy), v9 (copy), v7 (copy), v3 (copy), v11 (copy), v2 (copy), l_Logging_0 (copy)
    return l_PerformFetch_0.Single(v8.GetTopicsKey .. v9.getTopicRequestKey(v17, v18, v19), function(v20) --[[ Line: 42 ]]
        -- upvalues: v17 (copy), v19 (copy), v7 (ref), v16 (copy), v18 (copy), v3 (ref), v11 (ref), v2 (ref), l_Logging_0 (ref)
        return (if not (#v17 == 0) or v19 then v7.GetTopics(v16, v17, v19) else v7.GetInitialTopics(v16, v18 or {})):andThen(function(v21) --[[ Line: 47 ]]
            -- upvalues: v3 (ref), v20 (copy), v11 (ref), v17 (ref), v18 (ref), v19 (ref), v2 (ref)
            local v22 = v21.responseBody or {};
            local v24 = v3.map(v22.topics or {}, function(v23) --[[ Line: 49 ]]
                return string.lower(v23.displayName);
            end);
            v20:dispatch(v11(v17, v18, v19, v24));
            return v2.resolve(v24);
        end, function(v25) --[[ Line: 54 ]]
            -- upvalues: l_Logging_0 (ref)
            l_Logging_0.warn("FetchTopics failure: " .. tostring(v25));
        end);
    end);
end;