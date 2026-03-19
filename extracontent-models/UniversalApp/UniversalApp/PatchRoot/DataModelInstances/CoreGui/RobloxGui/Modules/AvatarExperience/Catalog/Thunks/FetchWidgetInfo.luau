local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetWidgetInfo);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ClearWidgetInfo);
local v6 = require(l_Modules_0.LuaApp.SearchUuid);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local l_Api_0 = v9.Api;
local l_getAXMarketplaceWidgetStore_0 = v9.Stores.getAXMarketplaceWidgetStore;
local l_logWidgetLoaded_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).logWidgetLoaded;
local l_FFlagAXPassScreenSizeToWidgetApi_0 = v8.FFlagAXPassScreenSizeToWidgetApi;
local l_FFlagAXMoveAllTabToWidgetOnly_0 = v8.FFlagAXMoveAllTabToWidgetOnly;
local v15 = game:DefineFastFlag("AXAddWidgetLoadedEvent", true);
return function(v16, v17, v18) --[[ Line: 30 ]]
    -- upvalues: v7 (copy), v6 (copy), l_FFlagAXPassScreenSizeToWidgetApi_0 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), l_getAXMarketplaceWidgetStore_0 (copy), l_PerformFetch_0 (copy), v5 (copy), l_Api_0 (copy), v4 (copy), v15 (copy), l_logWidgetLoaded_0 (copy), l_Logging_0 (copy)
    local v19 = v7.getFetchWidgetInfoFetchKey(v17, v18);
    local v20 = v6();
    local v21 = l_FFlagAXPassScreenSizeToWidgetApi_0 and l_FFlagAXMoveAllTabToWidgetOnly_0;
    local v22 = l_FFlagAXPassScreenSizeToWidgetApi_0 and not l_FFlagAXMoveAllTabToWidgetOnly_0;
    if v21 then
        local v23 = l_getAXMarketplaceWidgetStore_0(false).getDebouncedScreenSize(false);
        v19 = v7.getFetchWidgetInfoFetchKey(v17, v18, v23);
        return l_PerformFetch_0.Single(v19, function(v24) --[[ Line: 46 ]]
            -- upvalues: v5 (ref), v17 (copy), v18 (copy), l_Api_0 (ref), v16 (copy), v20 (copy), v23 (copy), v4 (ref), v15 (ref), l_logWidgetLoaded_0 (ref), l_Logging_0 (ref)
            v24:dispatch(v5(v17, v18));
            local v25 = nil;
            local v26 = nil;
            if v17 then
                local v27, v28 = l_Api_0.getWidgetListInfoSearch(v16, v20, v17);
                v25 = v27;
                v26 = v28;
            else
                local v29, v30 = l_Api_0.getWidgetListInfo(v16, v20, v18, v23);
                v25 = v29;
                v26 = v30;
            end;
            return v25:andThen(function(v31) --[[ Line: 58 ]]
                -- upvalues: v24 (copy), v4 (ref), v20 (ref), v17 (ref), v18 (ref), v15 (ref), l_logWidgetLoaded_0 (ref)
                local v32 = if v31 and v31.widgets then v31.widgets else {};
                local v33 = if v31 and v31.configuration then v31.configuration else {};
                v24:dispatch(v4(v32, v20, v17, v18, v33));
                if v15 and v31 and v31.widgets then
                    l_logWidgetLoaded_0(v31.widgets, v20);
                end;
                return v31;
            end):catch(function(v34) --[[ Line: 71 ]]
                -- upvalues: l_Logging_0 (ref)
                l_Logging_0.warn("WebApi failure in FetchWidgetInfo: " .. tostring(v34));
            end);
        end);
    elseif v22 then
        local v35 = l_getAXMarketplaceWidgetStore_0(false).getDebouncedScreenSize(false);
        v19 = v7.getFetchWidgetInfoFetchKey(v17, v18, nil);
        return l_PerformFetch_0.Single(v19, function(v36) --[[ Line: 84 ]]
            -- upvalues: v5 (ref), v17 (copy), v18 (copy), l_Api_0 (ref), v16 (copy), v20 (copy), v6 (ref), v35 (copy), l_Logging_0 (ref), v4 (ref)
            v36:dispatch(v5(v17, v18));
            local v37 = nil;
            local v38 = nil;
            if v17 then
                local v39, v40 = l_Api_0.getWidgetListInfoSearch(v16, v20, v17);
                v37 = v39;
                v38 = v40;
            else
                local v41, v42 = l_Api_0.getWidgetListInfo(v16, v20, v18, nil);
                v37 = v41;
                v38 = v42;
            end;
            local v43 = v6();
            local v44 = nil;
            local v45 = nil;
            if v17 then
                local v46, v47 = l_Api_0.getWidgetListInfoSearch(v16, v43, v17);
                v44 = v46;
                v45 = v47;
            else
                local v48, v49 = l_Api_0.getWidgetListInfo(v16, v43, v18, v35);
                v44 = v48;
                v45 = v49;
            end;
            v44:catch(function(v50) --[[ Line: 109 ]]
                -- upvalues: l_Logging_0 (ref)
                l_Logging_0.warn("WebApi failure in FetchWidgetInfo (shadow traffic): " .. tostring(v50));
            end);
            return v37:andThen(function(v51) --[[ Line: 115 ]]
                -- upvalues: v36 (copy), v4 (ref), v20 (ref), v17 (ref), v18 (ref)
                local v52 = if v51 and v51.widgets then v51.widgets else {};
                local v53 = if v51 and v51.configuration then v51.configuration else {};
                v36:dispatch(v4(v52, v20, v17, v18, v53));
                return v51;
            end):catch(function(v54) --[[ Line: 124 ]]
                -- upvalues: l_Logging_0 (ref)
                l_Logging_0.warn("WebApi failure in FetchWidgetInfo: " .. tostring(v54));
            end);
        end);
    else
        return l_PerformFetch_0.Single(v19, function(v55) --[[ Line: 130 ]]
            -- upvalues: v5 (ref), v17 (copy), v18 (copy), l_Api_0 (ref), v16 (copy), v20 (copy), v4 (ref), l_Logging_0 (ref)
            v55:dispatch(v5(v17, v18));
            local v56 = nil;
            local v57 = nil;
            if v17 then
                local v58, v59 = l_Api_0.getWidgetListInfoSearch(v16, v20, v17);
                v56 = v58;
                v57 = v59;
            else
                local v60, v61 = l_Api_0.getWidgetListInfo(v16, v20, v18);
                v56 = v60;
                v57 = v61;
            end;
            return v56:andThen(function(v62) --[[ Line: 144 ]]
                -- upvalues: v55 (copy), v4 (ref), v20 (ref), v17 (ref), v18 (ref)
                local v63 = if v62 and v62.widgets then v62.widgets else {};
                local v64 = if v62 and v62.configuration then v62.configuration else {};
                v55:dispatch(v4(v63, v20, v17, v18, v64));
            end):catch(function(v65) --[[ Line: 151 ]]
                -- upvalues: l_Logging_0 (ref)
                l_Logging_0.warn("WebApi failure in FetchWidgetInfo: " .. tostring(v65));
            end);
        end);
    end;
end;