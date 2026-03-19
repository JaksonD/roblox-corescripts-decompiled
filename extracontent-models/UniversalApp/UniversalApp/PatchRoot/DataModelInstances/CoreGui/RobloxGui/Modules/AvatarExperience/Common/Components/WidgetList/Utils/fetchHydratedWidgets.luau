local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchWidgetInfo);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchHydratedWidgetContent);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Utils.getContentToHyderate);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v11 = require(l_CorePackages_0.Packages.Promise);
local _ = require(l_Modules_0.AvatarExperience.Catalog.Reducers.Categories);
local l_FFlagAXCatalogCategoriesSDUI_0 = v2.FFlagAXCatalogCategoriesSDUI;
local v14 = require(l_Modules_0.LuaApp.mutedError);
local l_FFlagAXMoveAllTabToWidgetOnly_0 = v2.FFlagAXMoveAllTabToWidgetOnly;
local l_FFlagAXFixHydratedWidgetsParams_0 = v2.FFlagAXFixHydratedWidgetsParams;
local function _(v17) --[[ Line: 37 ]] --[[ Name: selectCatalogCategories ]]
    return v17.AvatarExperience.Catalog.Categories;
end;
local function _(v19) --[[ Line: 41 ]] --[[ Name: selectWidgetsState ]]
    return v19.AvatarExperience and v19.AvatarExperience.Common and v19.AvatarExperience.Common.Widgets;
end;
local function _(v21) --[[ Line: 45 ]] --[[ Name: getWidgetContext ]]
    -- upvalues: v7 (copy), l_AvatarScreen_0 (copy)
    local v22 = nil;
    local l_categoryId_0 = v21.categoryId;
    local l_subcategoryId_0 = v21.subcategoryId;
    if l_categoryId_0 then
        v22 = v7.getContextForWidgetsById(l_AvatarScreen_0.Catalog, l_categoryId_0, l_subcategoryId_0);
    end;
    return v22;
end;
return function(v26, v27, v28, v29, v30, v31) --[[ Line: 57 ]] --[[ Name: fetchHydratedWidgets ]]
    -- upvalues: v11 (copy), l_FFlagAXFixHydratedWidgetsParams_0 (copy), v14 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), v7 (copy), l_AvatarScreen_0 (copy), v4 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), v6 (copy), v5 (copy), l_Logging_0 (copy)
    return v11.new(function(v32, v33) --[[ Line: 65 ]]
        -- upvalues: l_FFlagAXFixHydratedWidgetsParams_0 (ref), v30 (copy), v14 (ref), v31 (copy), v28 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (ref), v7 (ref), l_AvatarScreen_0 (ref), v26 (copy), v4 (ref), v27 (copy), v29 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (ref), v6 (ref), v5 (ref), l_Logging_0 (ref)
        local v34 = nil;
        if l_FFlagAXFixHydratedWidgetsParams_0 then
            if v30 == nil then
                v14("[fetchHydratedWidgets] categoryId is required");
            end;
            v34 = {
                categoryId = v30, 
                subcategoryId = v31
            };
        else
            v34 = {
                categoryId = v28.Id, 
                subcategoryId = if l_FFlagAXFixHydratedWidgetsParams_0 then nil else v28.subcategoryId, 
                category = if l_FFlagAXFixHydratedWidgetsParams_0 then nil else v28.Category or 1, 
                subcategory = if l_FFlagAXFixHydratedWidgetsParams_0 then nil else v28.Subcategory or 0
            };
        end;
        local v35;
        if l_FFlagAXCatalogCategoriesSDUI_0 then
            v35 = v28.WidgetContext;
        else
            local l_v34_0 = v34;
            local v37 = nil;
            local l_categoryId_1 = l_v34_0.categoryId;
            local l_subcategoryId_1 = l_v34_0.subcategoryId;
            if l_categoryId_1 then
                v37 = v7.getContextForWidgetsById(l_AvatarScreen_0.Catalog, l_categoryId_1, l_subcategoryId_1);
            end;
            v35 = v37;
        end;
        local v40 = v26(v4(v27, nil, v35));
        if v40 and v40.andThen then
            v40:andThen(function(v41) --[[ Line: 87 ]]
                -- upvalues: v29 (ref), v7 (ref), l_AvatarScreen_0 (ref), l_FFlagAXMoveAllTabToWidgetOnly_0 (ref), v6 (ref), v32 (copy), v26 (ref), v5 (ref), v27 (ref)
                local v42 = v29:getState();
                local v43 = v42.AvatarExperience and v42.AvatarExperience.Common and v42.AvatarExperience.Common.Widgets;
                local v44 = v43 and v43.HydratedWidgetData or {};
                local v45 = v43 and v43.ContextWidgetInfo or {};
                local l_Categories_0 = v42.AvatarExperience.Catalog.Categories;
                local v47 = nil;
                local l_categoryId_2 = l_Categories_0.categoryId;
                local l_subcategoryId_2 = l_Categories_0.subcategoryId;
                if l_categoryId_2 then
                    v47 = v7.getContextForWidgetsById(l_AvatarScreen_0.Catalog, l_categoryId_2, l_subcategoryId_2);
                end;
                local l_v47_0 = v47;
                v47 = l_v47_0 and v45[l_v47_0] or nil;
                l_categoryId_2 = v47 and v47.Details or {};
                l_subcategoryId_2 = 0;
                if l_FFlagAXMoveAllTabToWidgetOnly_0 then
                    local v51 = {};
                    for _, v53 in l_categoryId_2 do
                        local v54 = v6(v53, v44);
                        if v54 and #v54 > 0 then
                            l_subcategoryId_2 = l_subcategoryId_2 + 1;
                            table.insert(v51, {
                                content = v54, 
                                id = v53.id
                            });
                        end;
                    end;
                    if l_subcategoryId_2 == 0 then
                        v32(v41);
                        return;
                    else
                        local v55 = 0;
                        do
                            local l_v55_0 = v55;
                            for _, v58 in v51 do
                                local function v60() --[[ Line: 124 ]]
                                    -- upvalues: v26 (ref), v5 (ref), v27 (ref), v58 (copy), l_v55_0 (ref), l_subcategoryId_2 (ref), v32 (ref), v41 (copy)
                                    local v59 = v26(v5(v27, v58.content, v58.id));
                                    if v59 and v59.andThen then
                                        v59:finally(function() --[[ Line: 127 ]]
                                            -- upvalues: l_v55_0 (ref), l_subcategoryId_2 (ref), v32 (ref), v41 (ref)
                                            l_v55_0 = l_v55_0 + 1;
                                            if l_subcategoryId_2 <= l_v55_0 then
                                                v32(v41);
                                            end;
                                        end);
                                    end;
                                end;
                                task.spawn(v60);
                            end;
                        end;
                    end;
                else
                    local v61 = 0;
                    do
                        local l_v61_0 = v61;
                        for _, v64 in l_categoryId_2 do
                            local v65 = v6(v64, v44);
                            if v65 and #v65 > 0 then
                                l_subcategoryId_2 = l_subcategoryId_2 + 1;
                                local v66 = v26(v5(v27, v65, v64.id));
                                if v66 and v66.andThen then
                                    v66:finally(function() --[[ Line: 149 ]]
                                        -- upvalues: l_v61_0 (ref), l_subcategoryId_2 (ref), v32 (ref), v41 (copy)
                                        l_v61_0 = l_v61_0 + 1;
                                        if l_subcategoryId_2 <= l_v61_0 then
                                            v32(v41);
                                        end;
                                    end);
                                end;
                            end;
                        end;
                        if l_subcategoryId_2 == 0 then
                            v32(v41);
                        end;
                    end;
                end;
            end, function(v67) --[[ Line: 164 ]]
                -- upvalues: l_Logging_0 (ref), v33 (copy)
                l_Logging_0.warn("fetchHydratedWidgets: Hydrated widgets fetch failed: " .. tostring(v67));
                v33(v67);
            end);
            return;
        else
            v32(true);
            return;
        end;
    end);
end;