local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v3 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetHydratedWidgetData);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSearchInCatalog);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAvatarsTabSearchInfo);
local _ = require(l_Modules_0.AvatarExperience.Catalog.SearchTypes);
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
local v11 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_Api_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Api;
local v13 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v14 = game:DefineFastFlag("AXAvatarsTabNoItemsFound", false);
local l_FFlagAXLooksWidgetContextForOrganicContent_0 = v13.FFlagAXLooksWidgetContextForOrganicContent;
local _ = require(l_CorePackages_0.Packages.LuauPolyfill);
return function(v17, v18) --[[ Line: 41 ]]
    -- upvalues: l_sendAXCounterV2_0 (copy), l_FFlagAXLooksWidgetContextForOrganicContent_0 (copy), v11 (copy), v5 (copy), l_Api_0 (copy), v14 (copy), v3 (copy), v4 (copy), v6 (copy), l_Logging_0 (copy)
    return function(v19) --[[ Line: 42 ]]
        -- upvalues: l_sendAXCounterV2_0 (ref), l_FFlagAXLooksWidgetContextForOrganicContent_0 (ref), v11 (ref), v17 (copy), v5 (ref), l_Api_0 (ref), v18 (copy), v14 (ref), v3 (ref), v4 (ref), v6 (ref), l_Logging_0 (ref)
        local function v20() --[[ Line: 43 ]] --[[ Name: showAvatarsTabError ]]
            -- upvalues: l_sendAXCounterV2_0 (ref), l_FFlagAXLooksWidgetContextForOrganicContent_0 (ref), v11 (ref), v17 (ref), v19 (copy), v5 (ref)
            l_sendAXCounterV2_0(if l_FFlagAXLooksWidgetContextForOrganicContent_0 then v11.Counter.FetchCatalogSearchForLooksError else v11.Counter.AvatarsTabError, {
                page = v17.searchKeyword ~= nil and "Search" or "Catalog"
            });
            v19:dispatch(v5(v17.searchUuid, {
                hasMoreEntries = true, 
                items = {}, 
                keyword = v17.searchKeyword
            }));
        end;
        assert(l_Api_0.getLooksFromWidgetListInfo, "Function exists if Avatars Tab is enabled. Assert can be removed with Avatars Tab Experiment removal");
        local v21, _ = l_Api_0.getLooksFromWidgetListInfo(v18, v17.searchUuid, v17.searchKeyword, if l_FFlagAXLooksWidgetContextForOrganicContent_0 then v17.categoryInfo else nil);
        return v21:andThen(function(v23) --[[ Line: 73 ]]
            -- upvalues: v14 (ref), v19 (copy), v5 (ref), v17 (ref), v20 (copy), v3 (ref), v18 (ref), v4 (ref), v6 (ref), l_Logging_0 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 74 ]]
                -- upvalues: v23 (copy)
                local v24 = v23 and v23.widgets or {};
                for _, v26 in v24 do
                    return v26.content;
                end;
                return {};
            end);
            if not l_status_0 or #l_result_0 == 0 then
                if v14 and #l_result_0 == 0 then
                    return v19:dispatch(v5(v17.searchUuid, {
                        hasMoreEntries = false, 
                        items = {}, 
                        keyword = v17.searchKeyword
                    }));
                else
                    return v20();
                end;
            else
                return v3.HydrateWidgetContent(v18, l_result_0):andThen(function(v29) --[[ Line: 93 ]]
                    -- upvalues: v17 (ref), l_result_0 (copy), v20 (ref), v19 (ref), v4 (ref), v5 (ref), v6 (ref)
                    local v30 = if v29 then v29.responseBody else nil;
                    local v31 = if v30 then v30.hydratedContent else nil;
                    if v31 == nil then
                        return;
                    else
                        assert(v31, "");
                        local v32 = {
                            Look = {}
                        };
                        for _, v34 in v31 do
                            local l_type_0 = v34.type;
                            assert(l_type_0, "Look");
                            local v36 = tostring(v34.id);
                            v32[l_type_0][v36] = v34;
                        end;
                        local v37 = {
                            hasMoreEntries = false, 
                            items = {}, 
                            keyword = v17.searchKeyword
                        };
                        for _, v39 in l_result_0 do
                            local v40 = tostring(v39.id);
                            if v32.Look[v40] then
                                table.insert(v37.items, {
                                    id = v40, 
                                    type = "Look"
                                });
                            end;
                        end;
                        if #v37.items == 0 then
                            return v20();
                        else
                            v19:dispatch(v4(v32));
                            v19:dispatch(v5(v17.searchUuid, v37));
                            if v17.searchKeyword then
                                v19:dispatch(v6(v17.searchUuid, v17.searchKeyword));
                            end;
                            return;
                        end;
                    end;
                end, function(v41) --[[ Line: 135 ]]
                    -- upvalues: l_Logging_0 (ref), v20 (ref)
                    l_Logging_0.warn("WebApi failure in FetchHydratedWidgetContent: " .. tostring(v41));
                    return v20();
                end);
            end;
        end);
    end;
end;