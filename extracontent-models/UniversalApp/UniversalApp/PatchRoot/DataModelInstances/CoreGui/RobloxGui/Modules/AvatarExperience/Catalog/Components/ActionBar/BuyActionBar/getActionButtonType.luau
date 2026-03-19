local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v3 = require(script.Parent.BuyActionButtonTypeEnum);
local v4 = require(script.Parent.getExperienceCount);
local v5 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXActionButtonAccountForMissingItemData);
local l_FFlagAXDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupport;
local function _(v7) --[[ Line: 30 ]] --[[ Name: getAvailableInExperienceOnly ]]
    -- upvalues: v2 (copy)
    return v7.saleLocationType == v2.SaleLocationType.ExperiencesDevApiOnly;
end;
local function _(v9) --[[ Line: 34 ]] --[[ Name: getHasLimitedAmount ]]
    -- upvalues: v2 (copy)
    local l_itemRestrictions_0 = v9.itemRestrictions;
    local v11 = l_itemRestrictions_0 and l_itemRestrictions_0[v2.ItemRestrictions.Limited];
    local v12 = l_itemRestrictions_0 and l_itemRestrictions_0[v2.ItemRestrictions.LimitedUnique];
    local v13 = l_itemRestrictions_0 and l_itemRestrictions_0[v2.ItemRestrictions.Collectible];
    return v11 or v12 or v13;
end;
local function _(v15, v16, v17) --[[ Line: 42 ]] --[[ Name: getUserHasReachedQuantityLimit ]]
    -- upvalues: v2 (copy)
    local l_itemRestrictions_1 = v15.itemRestrictions;
    local v19 = l_itemRestrictions_1 and l_itemRestrictions_1[v2.ItemRestrictions.Limited];
    local v20 = l_itemRestrictions_1 and l_itemRestrictions_1[v2.ItemRestrictions.LimitedUnique];
    local v21 = l_itemRestrictions_1 and l_itemRestrictions_1[v2.ItemRestrictions.Collectible];
    if not (v19 or v20 or v21) and v15.isOwned then
        return true;
    elseif not v16 or not v16.quantityLimitPerUser then
        return false;
    else
        l_itemRestrictions_1 = false;
        if v16.quantityLimitPerUser > 0 then
            l_itemRestrictions_1 = v16.quantityLimitPerUser <= v17;
        end;
        return l_itemRestrictions_1;
    end;
end;
local function _(v23) --[[ Line: 57 ]] --[[ Name: getOriginalStockAvailable ]]
    -- upvalues: v2 (copy)
    local l_itemRestrictions_2 = v23.itemRestrictions;
    local v25 = l_itemRestrictions_2 and l_itemRestrictions_2[v2.ItemRestrictions.Limited];
    local v26 = l_itemRestrictions_2 and l_itemRestrictions_2[v2.ItemRestrictions.LimitedUnique];
    local v27 = l_itemRestrictions_2 and l_itemRestrictions_2[v2.ItemRestrictions.Collectible];
    local v28 = v25 or v26 or v27;
    return v28 and v23.numberRobloxHasAvailable and v23.numberRobloxHasAvailable > 0 or not v28;
end;
local function _(v30, v31) --[[ Line: 65 ]] --[[ Name: getButtonTypeIsPurchaseFromResale ]]
    -- upvalues: v2 (copy)
    if not v31 or not v30.hasResellers then
        return false;
    else
        local v32 = if v30.priceInRobux and v30.lowestResalePrice then v30.lowestResalePrice < v30.priceInRobux else v30.lowestResalePrice ~= nil;
        local l_itemRestrictions_3 = v30.itemRestrictions;
        local v34 = l_itemRestrictions_3 and l_itemRestrictions_3[v2.ItemRestrictions.Limited];
        local v35 = l_itemRestrictions_3 and l_itemRestrictions_3[v2.ItemRestrictions.LimitedUnique];
        local v36 = l_itemRestrictions_3 and l_itemRestrictions_3[v2.ItemRestrictions.Collectible];
        local v37 = v34 or v35 or v36;
        local v38 = not (v37 and v30.numberRobloxHasAvailable and v30.numberRobloxHasAvailable > 0 or not v37) or v30.isOffSale == true;
        return v32 or v38;
    end;
end;
local function _(v40) --[[ Line: 76 ]] --[[ Name: getButtonTypeIsFree ]]
    -- upvalues: v2 (copy)
    if v40.isOffSale then
        return false;
    else
        return not (v40.saleLocationType == v2.SaleLocationType.ExperiencesDevApiOnly) and v40.priceInRobux == 0;
    end;
end;
local function _(v42, v43) --[[ Line: 84 ]] --[[ Name: getButtonTypeIsExperienceLink ]]
    -- upvalues: v2 (copy), v4 (copy)
    if v42.isOffSale then
        return false;
    else
        local v44 = v42.saleLocationType == v2.SaleLocationType.ExperiencesDevApiOnly;
        local l_itemRestrictions_4 = v42.itemRestrictions;
        local v46 = l_itemRestrictions_4 and l_itemRestrictions_4[v2.ItemRestrictions.Limited];
        local v47 = l_itemRestrictions_4 and l_itemRestrictions_4[v2.ItemRestrictions.LimitedUnique];
        local v48 = l_itemRestrictions_4 and l_itemRestrictions_4[v2.ItemRestrictions.Collectible];
        local v49 = v46 or v47 or v48;
        local v50 = v49 and v42.numberRobloxHasAvailable and v42.numberRobloxHasAvailable > 0 or not v49;
        v49 = v4(v43) > 0;
        return v44 and v49 and v50;
    end;
end;
local function _(v52, v53) --[[ Line: 95 ]] --[[ Name: getButtonTypeIsSoldOut ]]
    -- upvalues: v2 (copy)
    local l_itemRestrictions_5 = v52.itemRestrictions;
    local v55 = l_itemRestrictions_5 and l_itemRestrictions_5[v2.ItemRestrictions.Limited];
    local v56 = l_itemRestrictions_5 and l_itemRestrictions_5[v2.ItemRestrictions.LimitedUnique];
    local v57 = l_itemRestrictions_5 and l_itemRestrictions_5[v2.ItemRestrictions.Collectible];
    local v58 = v55 or v56 or v57;
    local v59 = v58 and v52.numberRobloxHasAvailable and v52.numberRobloxHasAvailable > 0 or not v58;
    v58 = v53 and v52.hasResellers;
    return not v59 and not v58;
end;
local function v76(v61, v62, v63, v64) --[[ Line: 101 ]] --[[ Name: getButtonTypeIsCustomizeLink ]]
    -- upvalues: l_FFlagAXDurablesSupport_0 (copy), v2 (copy)
    local l_isOwned_0 = v61.isOwned;
    local v66 = nil;
    if l_FFlagAXDurablesSupport_0 then
        v66 = v61.timedOptions and v61.isPurchasable;
    end;
    local l_itemRestrictions_6 = v61.itemRestrictions;
    local v68 = l_itemRestrictions_6 and l_itemRestrictions_6[v2.ItemRestrictions.Limited];
    local v69 = l_itemRestrictions_6 and l_itemRestrictions_6[v2.ItemRestrictions.LimitedUnique];
    local v70 = l_itemRestrictions_6 and l_itemRestrictions_6[v2.ItemRestrictions.Collectible];
    local v71 = not (v68 or v69 or v70) and v61.isOwned and true or if v62 and v62.quantityLimitPerUser then v62.quantityLimitPerUser > 0 and v62.quantityLimitPerUser <= v63 else false;
    local v72 = v64 and v61.hasResellers;
    v70 = v61.itemRestrictions;
    local v73 = v70 and v70[v2.ItemRestrictions.Limited];
    local v74 = v70 and v70[v2.ItemRestrictions.LimitedUnique];
    local v75 = v70 and v70[v2.ItemRestrictions.Collectible];
    v69 = v73 or v74 or v75;
    l_itemRestrictions_6 = not (v69 and v61.numberRobloxHasAvailable and v61.numberRobloxHasAvailable > 0 or not v69) or v71 or v61.isOffSale;
    if l_FFlagAXDurablesSupport_0 then
        return l_isOwned_0 and l_itemRestrictions_6 and not v72 and not v66;
    else
        return l_isOwned_0 and l_itemRestrictions_6 and not v72;
    end;
end;
local function _(v77) --[[ Line: 125 ]] --[[ Name: getButtonTypeIsPurchasableFromRoblox ]]
    -- upvalues: v2 (copy)
    if v77.isOffSale then
        return false;
    else
        return not (v77.saleLocationType == v2.SaleLocationType.ExperiencesDevApiOnly);
    end;
end;
return function(v79, v80, v81, v82, v83) --[[ Line: 132 ]] --[[ Name: getActionButtonType ]]
    -- upvalues: v3 (copy), v5 (copy), v76 (copy), v2 (copy), v4 (copy)
    if v82 then
        return v3.Loading;
    elseif v5 and not v79 then
        return v3.Disabled;
    elseif v76(v79, v80, v81, v83) then
        return v3.CustomizeLink;
    else
        local l_itemRestrictions_7 = v79.itemRestrictions;
        local v85 = l_itemRestrictions_7 and l_itemRestrictions_7[v2.ItemRestrictions.Limited];
        local v86 = l_itemRestrictions_7 and l_itemRestrictions_7[v2.ItemRestrictions.LimitedUnique];
        local v87 = l_itemRestrictions_7 and l_itemRestrictions_7[v2.ItemRestrictions.Collectible];
        local v88 = v85 or v86 or v87;
        local v89 = v88 and v79.numberRobloxHasAvailable and v79.numberRobloxHasAvailable > 0 or not v88;
        v88 = v83 and v79.hasResellers;
        if not v89 and not v88 then
            return v3.SoldOut;
        else
            local v90;
            if not v83 or not v79.hasResellers then
                v90 = false;
            else
                v89 = if v79.priceInRobux and v79.lowestResalePrice then v79.lowestResalePrice < v79.priceInRobux else v79.lowestResalePrice ~= nil;
                v86 = v79.itemRestrictions;
                v87 = v86 and v86[v2.ItemRestrictions.Limited];
                local v91 = v86 and v86[v2.ItemRestrictions.LimitedUnique];
                local v92 = v86 and v86[v2.ItemRestrictions.Collectible];
                v85 = v87 or v91 or v92;
                v88 = not (v85 and v79.numberRobloxHasAvailable and v79.numberRobloxHasAvailable > 0 or not v85) or v79.isOffSale == true;
                v90 = v89 or v88;
            end;
            if v90 then
                return v3.PurchaseFromResale;
            else
                if v79.isOffSale then
                    v90 = false;
                else
                    v89 = v79.saleLocationType == v2.SaleLocationType.ExperiencesDevApiOnly;
                    v85 = v79.itemRestrictions;
                    v86 = v85 and v85[v2.ItemRestrictions.Limited];
                    v87 = v85 and v85[v2.ItemRestrictions.LimitedUnique];
                    local v93 = v85 and v85[v2.ItemRestrictions.Collectible];
                    l_itemRestrictions_7 = v86 or v87 or v93;
                    v88 = l_itemRestrictions_7 and v79.numberRobloxHasAvailable and v79.numberRobloxHasAvailable > 0 or not l_itemRestrictions_7;
                    l_itemRestrictions_7 = v4(v80) > 0;
                    v90 = v89 and l_itemRestrictions_7 and v88;
                end;
                if v90 then
                    return v3.ExperienceLink;
                elseif not v79.isOffSale and not (v79.saleLocationType == v2.SaleLocationType.ExperiencesDevApiOnly) and v79.priceInRobux == 0 then
                    return v3.Free;
                elseif not v79.isOffSale and not (v79.saleLocationType == v2.SaleLocationType.ExperiencesDevApiOnly) then
                    return v3.PurchaseFromRoblox;
                else
                    return v3.Disabled;
                end;
            end;
        end;
    end;
end;