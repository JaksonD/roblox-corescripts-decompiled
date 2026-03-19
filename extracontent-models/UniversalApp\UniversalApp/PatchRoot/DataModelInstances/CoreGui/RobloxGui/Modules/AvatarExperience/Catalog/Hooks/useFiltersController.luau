local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.AvatarExperience.Common.Enum.CreatorFilter);
local v4 = require(l_Modules_0.AvatarExperience.Common.Enum.PriceFilter);
local v5 = require(l_Modules_0.AvatarExperience.Common.Enum.SalesTypeFilter);
local v6 = require(l_Modules_0.AvatarExperience.Common.Enum.WearTimeFilter);
local v7 = require(l_Modules_0.AvatarExperience.Common.Enum.UnavailableItemFilter);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v9 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSalesTypeFilter);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCreatorFilter);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetPriceRange);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetUnavailableItemFilter);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetWearTimeFilter);
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterUtils);
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local v18 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagMinMaxPriceValidation_0 = v18.FFlagMinMaxPriceValidation;
local l_FFlagAXDurablesSupport_0 = v18.FFlagAXDurablesSupport;
local function _(v21, v22) --[[ Line: 75 ]] --[[ Name: getPriceSelection ]]
    -- upvalues: v9 (copy), v4 (copy)
    if v9.MinPriceFilter < v21 or v22 < v9.MaxPriceFilter then
        return v4.PriceRange;
    else
        return v4.AnyPrice;
    end;
end;
local function _(v24) --[[ Line: 83 ]] --[[ Name: getCreatorSelection ]]
    -- upvalues: v3 (copy)
    if v24 == nil or v24 == "" then
        return v3.AllCreators;
    else
        return v3.Username;
    end;
end;
local function v28(v26, v27) --[[ Line: 91 ]] --[[ Name: wearTimeFilterChanged ]]
    return v26 ~= v27;
end;
return function() --[[ Line: 96 ]] --[[ Name: useFiltersController ]]
    -- upvalues: l_useSelector_0 (copy), v16 (copy), l_getUseSelectorDeepEquals_0 (copy), v2 (copy), v3 (copy), v9 (copy), v4 (copy), l_FFlagAXDurablesSupport_0 (copy), v6 (copy), l_useDispatch_0 (copy), v5 (copy), v7 (copy), v28 (copy), l_FFlagMinMaxPriceValidation_0 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy), v15 (copy)
    local v29 = l_useSelector_0(v16.selectSalesTypeFilter, l_getUseSelectorDeepEquals_0());
    local v30, v31 = v2.useState(v29);
    local v32 = l_useSelector_0(v16.selectCreatorFilter, l_getUseSelectorDeepEquals_0());
    local v33 = if not (v32 ~= nil) or v32 == "" then v3.AllCreators else v3.Username;
    local v34, v35 = v2.useState(v33);
    local v36, v37 = v2.useState(v32);
    local v38 = l_useSelector_0(v16.selectMinPrice, l_getUseSelectorDeepEquals_0());
    local v39 = l_useSelector_0(v16.selectMaxPrice, l_getUseSelectorDeepEquals_0());
    local v40 = if not (v9.MinPriceFilter >= v38) or v39 < v9.MaxPriceFilter then v4.PriceRange else v4.AnyPrice;
    local v41, v42 = v2.useState(v40);
    local v43, v44 = v2.useState(v38);
    local v45, v46 = v2.useState(v39);
    local v47 = l_useSelector_0(v16.selectUnavailableItemFilter, l_getUseSelectorDeepEquals_0());
    local v48, v49 = v2.useState(v47);
    local v50 = if l_FFlagAXDurablesSupport_0 then l_useSelector_0(v16.selectWearTimeFilter, l_getUseSelectorDeepEquals_0()) else v6.All;
    local v51 = if l_FFlagAXDurablesSupport_0 then v2.useState(v50) else v6.All;
    local function v52() --[[ Line: 122 ]]

    end;
    local v53 = l_useDispatch_0();
    local v54 = true;
    if v30 == v5.All then
        v54 = true;
        if v34 == v3.AllCreators then
            v54 = true;
            if v41 == v4.AnyPrice then
                v54 = true;
                if v48 == v7.Hide then
                    v54 = l_FFlagAXDurablesSupport_0 and v51 ~= v6.All;
                end;
            end;
        end;
    end;
    local v55 = v34 == v3.AllCreators and "" or v36;
    local v56 = if v41 == v4.AnyPrice then v9.MinPriceFilter else v43;
    local v57 = if v41 == v4.AnyPrice then v9.MaxPriceFilter else v45;
    local v58 = true;
    if v30 == v29 then
        v58 = true;
        if v55 == v32 then
            v58 = true;
            if v56 == v38 then
                v58 = true;
                if v57 == v39 then
                    v58 = true;
                    if v48 == v47 then
                        v58 = l_FFlagAXDurablesSupport_0 and v28 and v51 ~= v50;
                    end;
                end;
            end;
        end;
    end;
    if l_FFlagMinMaxPriceValidation_0 and v57 < v56 then
        v58 = false;
    end;
    local v60 = v2.useCallback(function() --[[ Line: 154 ]]
        -- upvalues: v31 (copy), v5 (ref), v35 (copy), v3 (ref), v42 (copy), v4 (ref), v49 (copy), v7 (ref), l_FFlagAXDurablesSupport_0 (ref), v6 (ref)
        v31(v5.All);
        v35(v3.AllCreators);
        v42(v4.AnyPrice);
        v49(v7.Hide);
        if l_FFlagAXDurablesSupport_0 then
            local _ = v6.All;
        end;
    end);
    local v61 = v2.useCallback(function() --[[ Line: 165 ]]
        -- upvalues: v53 (copy), v11 (ref), v30 (copy), v12 (ref), v55 (copy), v13 (ref), v56 (copy), v57 (copy), v14 (ref), v48 (copy), l_FFlagAXDurablesSupport_0 (ref), v15 (ref), v51 (copy)
        v53(v11(v30));
        v53(v12(v55));
        v53(v13(v56, v57));
        v53(v14(v48));
        if l_FFlagAXDurablesSupport_0 then
            v53(v15(v51));
        end;
    end, {
        v30, 
        v55, 
        v56, 
        v57, 
        v48, 
        if l_FFlagAXDurablesSupport_0 then v51 else nil
    });
    return {
        salesTypeFilter = v30, 
        setSalesTypeFilter = v31, 
        creatorFilter = v34, 
        setCreatorFilter = v35, 
        creatorUsername = v36, 
        setCreatorUsername = v37, 
        priceFilter = v41, 
        setPriceFilter = v42, 
        minPrice = v43, 
        setMinPrice = v44, 
        maxPrice = v45, 
        setMaxPrice = v46, 
        wearTimeFilter = v51, 
        setWearTimeFilter = v52, 
        unavailableItemFilter = v48, 
        setUnavailableItemFilter = v49, 
        canReset = v54, 
        canApply = v58, 
        reset = v60, 
        apply = v61
    };
end;