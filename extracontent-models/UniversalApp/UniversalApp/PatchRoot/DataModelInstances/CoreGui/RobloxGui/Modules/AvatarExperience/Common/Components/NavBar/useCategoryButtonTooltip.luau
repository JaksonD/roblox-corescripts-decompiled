local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_SafeAppStorageService_0 = v4.Lib.SafeAppStorageService;
local l_useAvatarRoute_0 = v3.AvatarRoute.Hooks.useAvatarRoute;
local l_useIsSpatial_0 = require(l_CorePackages_0.Workspace.Packages.Responsive).useIsSpatial;
local l_CatalogCategories_0 = v4.Enums.CatalogCategories;
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
local v10 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v11 = game:DefineFastFlag("AXCategoryButtonTooltipUseMemStorage", false);
local v12 = game:DefineFastInt("AXCategoryButtonTooltipTimeToDismiss", 5);
local v13 = game:DefineFastString("AXBodyCategoryTooltipSeen", "BodyCategoryTooltipSeen");
local v14 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXCatalogCategoryTooltip_0 = v14.FFlagAXCatalogCategoryTooltip;
local l_FFlagAXRemoveCatalogCategoryNavKey_0 = v14.FFlagAXRemoveCatalogCategoryNavKey;
local v17 = {
    enableTooltip = false, 
    titleText = nil, 
    FTUXStorageKey = "", 
    tooltipSeen = ""
};
local v18 = {
    [l_FFlagAXCatalogCategoryTooltip_0 and "BodyCategoryCatalogTooltip" or if l_FFlagAXRemoveCatalogCategoryNavKey_0 then l_CatalogCategories_0.Body:rawValue() else l_CatalogCategories_0.Body] = {
        enableTooltip = true, 
        titleText = "Feature.Catalog.Message.BodyCategoryTooltip", 
        FTUXStorageKey = "AXAvatarsTabFtux", 
        tooltipSeen = v13
    }
};
return function(v19, v20, v21) --[[ Line: 45 ]] --[[ Name: useCategoryButtonTooltip ]]
    -- upvalues: v18 (copy), l_FFlagAXCatalogCategoryTooltip_0 (copy), v17 (copy), l_useIsSpatial_0 (copy), l_useAvatarRoute_0 (copy), v2 (copy), l_SafeAppStorageService_0 (copy), v11 (copy), l_sendAXCounterV2_0 (copy), v10 (copy), v12 (copy)
    local v22 = v18[if l_FFlagAXCatalogCategoryTooltip_0 then v21 else v19] or v17;
    local v23 = l_useIsSpatial_0();
    local v24 = l_useAvatarRoute_0();
    local v25 = v2.useRef(false);
    local v26 = v2.useRef(false);
    local v27 = l_SafeAppStorageService_0.getItem(v22.FTUXStorageKey, v11) == v22.tooltipSeen;
    local v28, v29 = v2.useState(v27);
    local v30 = v2.useCallback(function() --[[ Line: 62 ]]
        -- upvalues: v29 (copy), l_SafeAppStorageService_0 (ref), v22 (copy), v11 (ref), v26 (copy), l_sendAXCounterV2_0 (ref), v10 (ref)
        v29(true);
        l_SafeAppStorageService_0.setItem(v22.FTUXStorageKey, v22.tooltipSeen, v11);
        l_SafeAppStorageService_0.flush();
        if not v26.current then
            l_sendAXCounterV2_0(v10.Counter.CategoryButtonTooltip.ClickDismiss, {
                FTUXStorageKey = v22.FTUXStorageKey, 
                FStringTooltipSeen = v22.tooltipSeen
            });
            v26.current = true;
        end;
    end, {
        v22
    });
    v2.useEffect(function() --[[ Line: 79 ]]
        -- upvalues: v22 (copy), v27 (copy), v23 (copy), v12 (ref), v26 (copy), l_sendAXCounterV2_0 (ref), v10 (ref), v30 (copy)
        if v22.enableTooltip and not v27 and not v23 then
            task.spawn(function() --[[ Line: 81 ]]
                -- upvalues: v12 (ref), v26 (ref), l_sendAXCounterV2_0 (ref), v10 (ref), v22 (ref), v30 (ref)
                task.wait(v12);
                if not v26.current then
                    l_sendAXCounterV2_0(v10.Counter.CategoryButtonTooltip.AutoDismiss, {
                        FTUXStorageKey = v22.FTUXStorageKey, 
                        FStringTooltipSeen = v22.tooltipSeen
                    });
                    v26.current = true;
                end;
                v30();
            end);
        end;
    end, {});
    local v31 = v22.enableTooltip and not v23 and v24.opaque.name == v20 and not v28;
    if v31 and not v25.current then
        l_sendAXCounterV2_0(v10.Counter.CategoryButtonTooltip.Seen, {
            FTUXStorageKey = v22.FTUXStorageKey, 
            FStringTooltipSeen = v22.tooltipSeen
        });
        v25.current = true;
    end;
    return v31, v30, v22.titleText;
end;