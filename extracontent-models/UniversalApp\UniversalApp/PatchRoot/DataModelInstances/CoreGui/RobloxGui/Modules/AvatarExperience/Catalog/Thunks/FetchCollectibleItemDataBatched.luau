local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local l_FetchCollectibleItemDataBatchedSuccess_0 = v3.State.Actions.FetchCollectibleItemDataBatchedSuccess;
local function _(v6) --[[ Line: 13 ]] --[[ Name: getFetchKey ]]
    return "BatchCollectibles-" .. table.concat(v6, ",");
end;
return function(v8, v9) --[[ Line: 19 ]]
    -- upvalues: l_PerformFetch_0 (copy), v4 (copy), l_FetchCollectibleItemDataBatchedSuccess_0 (copy)
    local v10 = "BatchCollectibles-" .. table.concat(v9, ",");
    return l_PerformFetch_0.Single(v10, function(v11) --[[ Line: 21 ]]
        -- upvalues: v4 (ref), v8 (copy), v9 (copy), l_FetchCollectibleItemDataBatchedSuccess_0 (ref)
        return v4.FetchCollectibleItemDetails(v8, v9):andThen(function(v12) --[[ Line: 22 ]]
            -- upvalues: v11 (copy), l_FetchCollectibleItemDataBatchedSuccess_0 (ref)
            local v13 = if v12 then v12.responseBody else {};
            v11:dispatch(l_FetchCollectibleItemDataBatchedSuccess_0({
                collectibleItemData = v13
            }));
        end);
    end);
end;