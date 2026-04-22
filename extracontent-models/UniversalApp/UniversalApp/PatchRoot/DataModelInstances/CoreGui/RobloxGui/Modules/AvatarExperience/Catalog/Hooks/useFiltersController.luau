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
local l_FFlagMinMaxPriceValidation_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagMinMaxPriceValidation;
local function _(v19, v20) --[[ Line: 74 ]] --[[ Name: getPriceSelection ]]
    -- upvalues: v9 (copy), v4 (copy)
    if v9.MinPriceFilter < v19 or v20 < v9.MaxPriceFilter then
        return v4.PriceRange;
    else
        return v4.AnyPrice;
    end;
end;
local function _(v22) --[[ Line: 82 ]] --[[ Name: getCreatorSelection ]]
    -- upvalues: v3 (copy)
    if v22 == nil or v22 == "" then
        return v3.AllCreators;
    else
        return v3.Username;
    end;
end;
local function v26(v24, v25) --[[ Line: 90 ]] --[[ Name: wearTimeFilterChanged ]]
    return v24 ~= v25;
end;
return function() --[[ Line: 95 ]] --[[ Name: useFiltersController ]]
    -- upvalues: l_useSelector_0 (copy), v16 (copy), l_getUseSelectorDeepEquals_0 (copy), v2 (copy), v3 (copy), v9 (copy), v4 (copy), l_useDispatch_0 (copy), v5 (copy), v7 (copy), v6 (copy), v26 (copy), l_FFlagMinMaxPriceValidation_0 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy), v15 (copy)
    local v27 = l_useSelector_0(v16.selectSalesTypeFilter, l_getUseSelectorDeepEquals_0());
    local v28, v29 = v2.useState(v27);
    local v30 = l_useSelector_0(v16.selectCreatorFilter, l_getUseSelectorDeepEquals_0());
    local v31 = if not (v30 ~= nil) or v30 == "" then v3.AllCreators else v3.Username;
    local v32, v33 = v2.useState(v31);
    local v34, v35 = v2.useState(v30);
    local v36 = l_useSelector_0(v16.selectMinPrice, l_getUseSelectorDeepEquals_0());
    local v37 = l_useSelector_0(v16.selectMaxPrice, l_getUseSelectorDeepEquals_0());
    local v38 = if not (v9.MinPriceFilter >= v36) or v37 < v9.MaxPriceFilter then v4.PriceRange else v4.AnyPrice;
    local v39, v40 = v2.useState(v38);
    local v41, v42 = v2.useState(v36);
    local v43, v44 = v2.useState(v37);
    local v45 = l_useSelector_0(v16.selectUnavailableItemFilter, l_getUseSelectorDeepEquals_0());
    local v46, v47 = v2.useState(v45);
    local v48 = l_useSelector_0(v16.selectWearTimeFilter, l_getUseSelectorDeepEquals_0());
    local v49, v50 = v2.useState(v48);
    local v51 = l_useDispatch_0();
    local v52 = true;
    if v28 == v5.All then
        v52 = true;
        if v32 == v3.AllCreators then
            v52 = true;
            if v39 == v4.AnyPrice then
                v52 = true;
                if v46 == v7.Hide then
                    v52 = v49 ~= v6.All;
                end;
            end;
        end;
    end;
    local v53 = v32 == v3.AllCreators and "" or v34;
    local v54 = if v39 == v4.AnyPrice then v9.MinPriceFilter else v41;
    local v55 = if v39 == v4.AnyPrice then v9.MaxPriceFilter else v43;
    local v56 = true;
    if v28 == v27 then
        v56 = true;
        if v53 == v30 then
            v56 = true;
            if v54 == v36 then
                v56 = true;
                if v55 == v37 then
                    v56 = true;
                    if v46 == v45 then
                        v56 = v26 and v49 ~= v48;
                    end;
                end;
            end;
        end;
    end;
    if l_FFlagMinMaxPriceValidation_0 and v55 < v54 then
        v56 = false;
    end;
    local v57 = v2.useCallback(function() --[[ Line: 146 ]]
        -- upvalues: v29 (copy), v5 (ref), v33 (copy), v3 (ref), v40 (copy), v4 (ref), v47 (copy), v7 (ref), v50 (copy), v6 (ref)
        v29(v5.All);
        v33(v3.AllCreators);
        v40(v4.AnyPrice);
        v47(v7.Hide);
        v50(v6.All);
    end);
    local v58 = v2.useCallback(function() --[[ Line: 155 ]]
        -- upvalues: v51 (copy), v11 (ref), v28 (copy), v12 (ref), v53 (copy), v13 (ref), v54 (copy), v55 (copy), v14 (ref), v46 (copy), v15 (ref), v49 (copy)
        v51(v11(v28));
        v51(v12(v53));
        v51(v13(v54, v55));
        v51(v14(v46));
        v51(v15(v49));
    end, {
        v28, 
        v53, 
        v54, 
        v55, 
        v46, 
        v49
    });
    return {
        salesTypeFilter = v28, 
        setSalesTypeFilter = v29, 
        creatorFilter = v32, 
        setCreatorFilter = v33, 
        creatorUsername = v34, 
        setCreatorUsername = v35, 
        priceFilter = v39, 
        setPriceFilter = v40, 
        minPrice = v41, 
        setMinPrice = v42, 
        maxPrice = v43, 
        setMaxPrice = v44, 
        wearTimeFilter = v49, 
        setWearTimeFilter = v50, 
        unavailableItemFilter = v46, 
        setUnavailableItemFilter = v47, 
        canReset = v52, 
        canApply = v56, 
        reset = v57, 
        apply = v58
    };
end;