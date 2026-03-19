local l_CorePackages_0 = game:GetService("CorePackages");
local l_createSignal_0 = require(l_CorePackages_0.Packages.Signals).createSignal;
local v2 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXPrefetchOnlyWithinTTL_0 = v2.FFlagAXPrefetchOnlyWithinTTL;
local l_FFlagAXCatalogCategoriesSDUI_0 = v2.FFlagAXCatalogCategoriesSDUI;
local l_FFlagAXMoveAllTabToWidgetOnly_0 = v2.FFlagAXMoveAllTabToWidgetOnly;
return function() --[[ Line: 29 ]]
    -- upvalues: l_createSignal_0 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_FFlagAXPrefetchOnlyWithinTTL_0 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy)
    local v6, v7 = l_createSignal_0(false);
    local v8, v9 = l_createSignal_0(false);
    local v10, v11 = l_createSignal_0(false);
    local v12 = nil;
    local v13 = nil;
    if l_FFlagAXCatalogCategoriesSDUI_0 then
        local v14, v15 = l_createSignal_0(false);
        v12 = v14;
        v13 = v15;
    end;
    local v16 = nil;
    local v17 = nil;
    if l_FFlagAXPrefetchOnlyWithinTTL_0 then
        local v18, v19 = l_createSignal_0(nil);
        v16 = v18;
        v17 = v19;
    end;
    local v20 = nil;
    local v21 = nil;
    if l_FFlagAXMoveAllTabToWidgetOnly_0 then
        local v22, v23 = l_createSignal_0(false);
        v20 = v22;
        v21 = v23;
    end;
    return {
        getFetchingMarketplace = v6, 
        getFetchedMarketplace = v8, 
        getFetchingMarketplaceError = v10, 
        getCatalogCategoriesError = if l_FFlagAXCatalogCategoriesSDUI_0 then v12 else nil, 
        getFetchedMarketplaceTimestamp = if l_FFlagAXPrefetchOnlyWithinTTL_0 then v16 else nil, 
        getFetchingMarketplaceProcessed = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v20 else nil, 
        setFetchingMarketplaceInProgress = function() --[[ Line: 60 ]] --[[ Name: setFetchingMarketplaceInProgress ]]
            -- upvalues: v11 (copy), v7 (copy), v9 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (ref), v21 (ref)
            v11(false);
            v7(true);
            v9(false);
            if l_FFlagAXMoveAllTabToWidgetOnly_0 then
                v21(false);
            end;
        end, 
        setFetchedMarketplaceCompleted = function() --[[ Line: 68 ]] --[[ Name: setFetchedMarketplaceCompleted ]]
            -- upvalues: v9 (copy), v7 (copy), v11 (copy), l_FFlagAXPrefetchOnlyWithinTTL_0 (ref), v17 (ref), l_FFlagAXMoveAllTabToWidgetOnly_0 (ref), v21 (ref)
            v9(true);
            v7(false);
            v11(false);
            if l_FFlagAXPrefetchOnlyWithinTTL_0 then
                v17(os.time());
            end;
            if l_FFlagAXMoveAllTabToWidgetOnly_0 then
                v21(true);
            end;
        end, 
        setFetchingMarketplaceErrorOccured = function() --[[ Line: 79 ]] --[[ Name: setFetchingMarketplaceErrorOccured ]]
            -- upvalues: v11 (copy), v9 (copy), v7 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (ref), v21 (ref)
            v11(true);
            v9(false);
            v7(false);
            if l_FFlagAXMoveAllTabToWidgetOnly_0 then
                v21(true);
            end;
        end, 
        setCatalogCategoriesErrorOccured = l_FFlagAXCatalogCategoriesSDUI_0 and function() --[[ Line: 88 ]]
            -- upvalues: v13 (ref)
            v13(true);
        end or nil, 
        setFetchingMarketplaceProcessed = l_FFlagAXMoveAllTabToWidgetOnly_0 and function() --[[ Line: 93 ]]
            -- upvalues: v21 (ref), v7 (copy), v9 (copy)
            v21(true);
            v7(false);
            v9(true);
        end or nil, 
        resetFetchMarketplaceStore = function() --[[ Line: 99 ]] --[[ Name: resetFetchMarketplaceStore ]]
            -- upvalues: v11 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (ref), v13 (ref), v9 (copy), v7 (copy), l_FFlagAXPrefetchOnlyWithinTTL_0 (ref), v17 (ref), l_FFlagAXMoveAllTabToWidgetOnly_0 (ref), v21 (ref)
            v11(false);
            if l_FFlagAXCatalogCategoriesSDUI_0 then
                v13(false);
            end;
            v9(false);
            v7(false);
            if l_FFlagAXPrefetchOnlyWithinTTL_0 then
                v17(nil);
            end;
            if l_FFlagAXMoveAllTabToWidgetOnly_0 then
                v21(false);
            end;
        end
    };
end;