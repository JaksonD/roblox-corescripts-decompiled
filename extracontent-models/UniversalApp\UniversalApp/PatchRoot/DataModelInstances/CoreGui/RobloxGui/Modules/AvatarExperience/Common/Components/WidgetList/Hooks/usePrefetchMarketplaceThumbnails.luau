local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.tutils);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v5 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Utils.fetchCatalogItemThumbnails);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v11 = require(l_Modules_0.AvatarExperience.Common.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useGetSelectedCategoryAndSubcategoryId);
local v14 = game:DefineFastInt("AXMaxThumbnailsToPrefetchPerWidgetLargeScreen", 8);
local v15 = game:DefineFastInt("AXMaxThumbnailsToPrefetchPerWidgetSmallScreen", 3);
local function v17(v16) --[[ Line: 43 ]] --[[ Name: selectContextWidgetInfo ]]
    return v16.AvatarExperience.Common.Widgets.ContextWidgetInfo;
end;
local function v19(v18) --[[ Line: 47 ]] --[[ Name: selectSearchesInCatalog ]]
    return v18.Search.SearchesInCatalog;
end;
return function() --[[ Line: 51 ]] --[[ Name: usePrefetchMarketplaceThumbnails ]]
    -- upvalues: v13 (copy), l_useSelector_0 (copy), v17 (copy), v3 (copy), v8 (copy), l_AvatarScreen_0 (copy), v19 (copy), v11 (copy), v7 (copy), v5 (copy), v14 (copy), v15 (copy), v2 (copy), v9 (copy)
    local v20, v21 = v13();
    local v22 = l_useSelector_0(v17, v3.deepEqual);
    local v23 = nil;
    if v20 then
        v23 = v8.getContextForWidgetsById(l_AvatarScreen_0.Catalog, v20, v21);
    end;
    local v24 = if v23 then v22[v23] else nil;
    local v25 = l_useSelector_0(v19, v3.deepEqual);
    local v26 = if v20 then v11.getCatalogCategoryInfoById(v20, v21) else nil;
    local v27 = if v26 then v7.getSearchUuidAndAssetTypes(v26, nil, nil) else nil;
    local v28 = if v27 then v25[v27] else nil;
    local v29 = if v28 then v28.items else nil;
    local v30 = v5.useResponsive();
    local v31 = false;
    if v30 ~= v5.BreakpointConfig.Enum.Medium then
        v31 = false;
        if v30 ~= v5.BreakpointConfig.Enum.Small then
            v31 = v30 ~= v5.BreakpointConfig.Enum.XSmall;
        end;
    end;
    local v32 = if v31 then v14 else v15;
    local v33 = if v31 then nil else v15;
    local v34 = if v31 then v14 else v15;
    return (v2.useCallback(function() --[[ Line: 85 ]]
        -- upvalues: v24 (copy), v33 (copy), v32 (copy), v29 (copy), v34 (copy), v9 (ref)
        local v35 = {};
        local v36 = 0;
        local v37 = 0;
        if v24 and v24.Details then
            for _, v39 in v24.Details do
                if not v33 or v33 > v36 then
                    if v39.content and #v39.content > 0 then
                        for v40 = 1, math.min(v32, #v39.content) do
                            local v41 = v39.content[v40];
                            table.insert(v35, {
                                id = tostring(v41.id), 
                                type = v41.type
                            });
                        end;
                        v36 = v36 + 1;
                    end;
                else
                    break;
                end;
            end;
        end;
        if v29 and #v29 > 0 then
            for v42 = 1, math.min(v34, #v29) do
                local v43 = v29[v42];
                if v43.id and v43.type then
                    table.insert(v35, {
                        id = tostring(v43.id), 
                        type = v43.type
                    });
                    v37 = v37 + 1;
                end;
            end;
        end;
        if #v35 > 0 then
            v9(v35);
        end;
        return v35;
    end, {
        v24, 
        v29, 
        v32, 
        v33, 
        v34
    }));
end;