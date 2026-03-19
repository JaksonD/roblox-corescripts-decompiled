local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.Packages.LuauPolyfill);
local v3 = require(l_CorePackages_0.Packages.Promise);
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v5 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Services.RoactNetworking);
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.GetCatalogCategories);
local v10 = require(l_Modules_0.AvatarExperience.Common.Debug.CatalogCategoryDiffUtils);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_Api_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Api;
local v14 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXCatalogCategoriesSDUI_0 = v14.FFlagAXCatalogCategoriesSDUI;
local l_FFlagAXCatalogCategoriesSDUIDebugDiff_0 = v14.FFlagAXCatalogCategoriesSDUIDebugDiff;
local l_FFlagAXCatalogCategoriesSDUILinks_0 = v14.FFlagAXCatalogCategoriesSDUILinks;
return function() --[[ Line: 66 ]] --[[ Name: useCatalogCategoriesFetcher ]]
    -- upvalues: l_useRoactService_0 (copy), v5 (copy), l_FFlagAXCatalogCategoriesSDUILinks_0 (copy), l_useDispatch_0 (copy), v1 (copy), v8 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), v3 (copy), l_Api_0 (copy), l_Logging_0 (copy), v9 (copy), l_FFlagAXCatalogCategoriesSDUIDebugDiff_0 (copy), v10 (copy)
    local v18 = l_useRoactService_0(v5);
    local v19 = if l_FFlagAXCatalogCategoriesSDUILinks_0 then l_useDispatch_0() else nil;
    return (v1.useCallback(function(v20) --[[ Line: 72 ]]
        -- upvalues: v8 (ref), l_FFlagAXCatalogCategoriesSDUI_0 (ref), v3 (ref), l_Api_0 (ref), v18 (copy), l_Logging_0 (ref), v9 (ref), l_FFlagAXCatalogCategoriesSDUIDebugDiff_0 (ref), v10 (ref), l_FFlagAXCatalogCategoriesSDUILinks_0 (ref), v19 (copy)
        local v21 = v8.getCatalogCategoriesStore();
        if l_FFlagAXCatalogCategoriesSDUI_0 and v21.getHasFetchedCategories(false) and not v20 then
            return v3.resolve(nil);
        else
            local v22, _ = l_Api_0.getCatalogCategories(v18, 1);
            return (v22:andThen(function(v24) --[[ Line: 86 ]]
                -- upvalues: l_Logging_0 (ref), v9 (ref), l_FFlagAXCatalogCategoriesSDUIDebugDiff_0 (ref), v10 (ref), v21 (copy), l_FFlagAXCatalogCategoriesSDUILinks_0 (ref), v19 (ref)
                if not v24 then
                    l_Logging_0.warn("fetchCatalogCategories: categoriesResponse is nil");
                    return;
                else
                    local v25 = v9();
                    if l_FFlagAXCatalogCategoriesSDUIDebugDiff_0 then
                        v10.logCategoryDifferences(v24, v25);
                    end;
                    local v26 = {
                        v25[1]
                    };
                    for _, v28 in v24 do
                        if v28.Id ~= "1" then
                            table.insert(v26, v28);
                        end;
                    end;
                    v21.setCategories(v26);
                    if l_FFlagAXCatalogCategoriesSDUILinks_0 then
                        local v29 = v21.setHasFetchedCategories(true);
                        if l_FFlagAXCatalogCategoriesSDUILinks_0 and v29 and v19 then
                            v19(v29);
                        end;
                    end;
                    return v26;
                end;
            end):catch(function(v30) --[[ Line: 121 ]]
                -- upvalues: l_Logging_0 (ref), l_FFlagAXCatalogCategoriesSDUI_0 (ref)
                l_Logging_0.warn("fetchCatalogCategories error: " .. tostring(v30));
                if l_FFlagAXCatalogCategoriesSDUI_0 then
                    error(v30);
                end;
            end));
        end;
    end, {
        v18
    }));
end;