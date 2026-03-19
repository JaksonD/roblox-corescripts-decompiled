local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AXCommon);
local v3 = require(l_script_FirstAncestor_0.Enums.PriceStatus);
local l_ItemRestrictions_0 = v2.Enums.ItemRestrictions;
local l_SalesLocationType_0 = v2.Enums.SalesLocationType;
local l_NoPriceStatus_0 = v2.Enums.NoPriceStatus;
local l_FFlagAXPurchaseFromQuantityFirst_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXPurchaseFromQuantityFirst;
local _ = require(l_script_FirstAncestor_0.Types);
local function _(v9) --[[ Line: 20 ]] --[[ Name: getAvailableInExperienceOnly ]]
    -- upvalues: l_SalesLocationType_0 (copy)
    return v9.saleLocationType == l_SalesLocationType_0.ExperiencesDevApiOnly;
end;
local function _(v11) --[[ Line: 27 ]] --[[ Name: getHasLimitedAmount ]]
    -- upvalues: l_ItemRestrictions_0 (copy)
    local l_itemRestrictions_0 = v11.itemRestrictions;
    local v13 = l_itemRestrictions_0 and l_itemRestrictions_0[l_ItemRestrictions_0.Limited];
    local v14 = l_itemRestrictions_0 and l_itemRestrictions_0[l_ItemRestrictions_0.LimitedUnique];
    local v15 = l_itemRestrictions_0 and l_itemRestrictions_0[l_ItemRestrictions_0.Collectible];
    return v13 or v14 or v15;
end;
local function _(v17) --[[ Line: 39 ]] --[[ Name: getUserHasReachedQuantityLimit ]]
    -- upvalues: l_ItemRestrictions_0 (copy)
    local l_itemRestrictions_1 = v17.itemRestrictions;
    local v19 = l_itemRestrictions_1 and l_itemRestrictions_1[l_ItemRestrictions_0.Limited];
    local v20 = l_itemRestrictions_1 and l_itemRestrictions_1[l_ItemRestrictions_0.LimitedUnique];
    local v21 = l_itemRestrictions_1 and l_itemRestrictions_1[l_ItemRestrictions_0.Collectible];
    if not (v19 or v20 or v21) and v17.isOwned then
        return true;
    elseif not v17.collectibleItemDetails or not v17.collectibleItemDetails.quantityLimitPerUser then
        return false;
    else
        l_itemRestrictions_1 = false;
        if v17.collectibleItemDetails.quantityLimitPerUser > 0 then
            l_itemRestrictions_1 = v17.collectibleItemDetails.resellableCount >= v17.collectibleItemDetails.quantityLimitPerUser;
        end;
        return l_itemRestrictions_1;
    end;
end;
local function _(v23) --[[ Line: 55 ]] --[[ Name: getOriginalStockAvailable ]]
    -- upvalues: l_ItemRestrictions_0 (copy)
    local l_itemRestrictions_2 = v23.itemRestrictions;
    local v25 = l_itemRestrictions_2 and l_itemRestrictions_2[l_ItemRestrictions_0.Limited];
    local v26 = l_itemRestrictions_2 and l_itemRestrictions_2[l_ItemRestrictions_0.LimitedUnique];
    local v27 = l_itemRestrictions_2 and l_itemRestrictions_2[l_ItemRestrictions_0.Collectible];
    local v28 = v25 or v26 or v27;
    return v28 and v23.collectibleItemDetails and v23.collectibleItemDetails.unitsAvailableForConsumption and v23.collectibleItemDetails.unitsAvailableForConsumption > 0 or not v28;
end;
local function v40(v30) --[[ Line: 71 ]] --[[ Name: gethasReachedQuantityLimitOfLimitedItem ]]
    -- upvalues: l_ItemRestrictions_0 (copy)
    local l_itemRestrictions_3 = v30.itemRestrictions;
    local v32 = l_itemRestrictions_3 and l_itemRestrictions_3[l_ItemRestrictions_0.Limited];
    local v33 = l_itemRestrictions_3 and l_itemRestrictions_3[l_ItemRestrictions_0.LimitedUnique];
    local v34 = l_itemRestrictions_3 and l_itemRestrictions_3[l_ItemRestrictions_0.Collectible];
    if not (v32 or v33 or v34) then
        return false;
    elseif not v30.collectibleItemDetails then
        return false;
    else
        l_itemRestrictions_3 = v30.isOwned == true;
        v32 = false;
        if v30.collectibleItemDetails.quantityLimitPerUser and v30.collectibleItemDetails.resellableCount then
            v33 = false;
            if v30.collectibleItemDetails.quantityLimitPerUser > 0 then
                v33 = v30.collectibleItemDetails.resellableCount >= v30.collectibleItemDetails.quantityLimitPerUser;
            end;
            v32 = v33;
        end;
        v33 = v30.collectibleItemDetails.hasResellers or false;
        local l_itemRestrictions_4 = v30.itemRestrictions;
        local v36 = l_itemRestrictions_4 and l_itemRestrictions_4[l_ItemRestrictions_0.Limited];
        local v37 = l_itemRestrictions_4 and l_itemRestrictions_4[l_ItemRestrictions_0.LimitedUnique];
        local v38 = l_itemRestrictions_4 and l_itemRestrictions_4[l_ItemRestrictions_0.Collectible];
        local v39 = v36 or v37 or v38;
        v34 = not (v39 and v30.collectibleItemDetails and v30.collectibleItemDetails.unitsAvailableForConsumption and v30.collectibleItemDetails.unitsAvailableForConsumption > 0 or not v39) or v32 or v30.isOffSale == true;
        return l_itemRestrictions_3 and v34 and not v33;
    end;
end;
local function _(v41) --[[ Line: 102 ]] --[[ Name: getIsFree ]]
    -- upvalues: l_SalesLocationType_0 (copy), l_NoPriceStatus_0 (copy)
    if v41.isOffSale then
        return false;
    else
        local v42 = not (v41.saleLocationType == l_SalesLocationType_0.ExperiencesDevApiOnly);
        local v43 = true;
        if v41.noPriceStatus ~= l_NoPriceStatus_0.Free then
            v43 = v42 and v41.priceInRobux == 0 or v41.catalogPriceStatus == "Free";
        end;
        return v43;
    end;
end;
local function _(v45) --[[ Line: 115 ]] --[[ Name: getIsExperienceOnly ]]
    -- upvalues: l_SalesLocationType_0 (copy), l_ItemRestrictions_0 (copy), l_FFlagAXPurchaseFromQuantityFirst_0 (copy), l_NoPriceStatus_0 (copy)
    if v45.isOffSale then
        return false;
    else
        local v46 = true;
        if v45.saleLocationType ~= l_SalesLocationType_0.ExperiencesDevApiOnly then
            v46 = true;
            if v45.saleLocationType ~= l_SalesLocationType_0.MyExperiencesOnly then
                v46 = v45.saleLocationType == l_SalesLocationType_0.ExperiencesById;
            end;
        end;
        local l_itemRestrictions_5 = v45.itemRestrictions;
        local v48 = l_itemRestrictions_5 and l_itemRestrictions_5[l_ItemRestrictions_0.Limited];
        local v49 = l_itemRestrictions_5 and l_itemRestrictions_5[l_ItemRestrictions_0.LimitedUnique];
        local v50 = l_itemRestrictions_5 and l_itemRestrictions_5[l_ItemRestrictions_0.Collectible];
        local v51 = v48 or v49 or v50;
        local v52 = v51 and v45.collectibleItemDetails and v45.collectibleItemDetails.unitsAvailableForConsumption and v45.collectibleItemDetails.unitsAvailableForConsumption > 0 or not v51;
        return v46 and v52 or not l_FFlagAXPurchaseFromQuantityFirst_0 and v45.noPriceStatus == l_NoPriceStatus_0.InExperience;
    end;
end;
local function v73(v54, v55) --[[ Line: 143 ]] --[[ Name: getIsPurchaseFromResale ]]
    -- upvalues: l_FFlagAXPurchaseFromQuantityFirst_0 (copy), l_ItemRestrictions_0 (copy), l_SalesLocationType_0 (copy)
    if not v54.collectibleItemDetails or not v54.collectibleItemDetails.hasResellers then
        return false;
    elseif l_FFlagAXPurchaseFromQuantityFirst_0 and v55 then
        local l_itemRestrictions_6 = v54.itemRestrictions;
        local v57 = l_itemRestrictions_6 and l_itemRestrictions_6[l_ItemRestrictions_0.Limited];
        local v58 = l_itemRestrictions_6 and l_itemRestrictions_6[l_ItemRestrictions_0.LimitedUnique];
        local v59 = l_itemRestrictions_6 and l_itemRestrictions_6[l_ItemRestrictions_0.Collectible];
        local v60 = v57 or v58 or v59;
        return not (v60 and v54.collectibleItemDetails and v54.collectibleItemDetails.unitsAvailableForConsumption and v54.collectibleItemDetails.unitsAvailableForConsumption > 0 or not v60);
    else
        local v61 = true;
        if v54.saleLocationType ~= l_SalesLocationType_0.ExperiencesDevApiOnly then
            v61 = true;
            if v54.saleLocationType ~= l_SalesLocationType_0.MyExperiencesOnly then
                v61 = v54.saleLocationType == l_SalesLocationType_0.ExperiencesById;
            end;
        end;
        if v55 and v61 then
            local l_itemRestrictions_7 = v54.itemRestrictions;
            local v63 = l_itemRestrictions_7 and l_itemRestrictions_7[l_ItemRestrictions_0.Limited];
            local v64 = l_itemRestrictions_7 and l_itemRestrictions_7[l_ItemRestrictions_0.LimitedUnique];
            local v65 = l_itemRestrictions_7 and l_itemRestrictions_7[l_ItemRestrictions_0.Collectible];
            local v66 = v63 or v64 or v65;
            return not (v66 and v54.collectibleItemDetails and v54.collectibleItemDetails.unitsAvailableForConsumption and v54.collectibleItemDetails.unitsAvailableForConsumption > 0 or not v66);
        elseif v54.collectibleItemDetails and v54.collectibleItemDetails.lowestResalePrice ~= nil and v54.saleLocationType == l_SalesLocationType_0.ShopOnly then
            return true;
        else
            v61 = if v54.priceInRobux and v54.collectibleItemDetails and v54.collectibleItemDetails.lowestResalePrice and v54.catalogPriceStatus ~= "Free" then v54.collectibleItemDetails.lowestResalePrice < v54.priceInRobux else v54.collectibleItemDetails and v54.collectibleItemDetails.lowestResalePrice ~= nil;
            local l_itemRestrictions_8 = v54.itemRestrictions;
            local v68 = l_itemRestrictions_8 and l_itemRestrictions_8[l_ItemRestrictions_0.Limited];
            local v69 = l_itemRestrictions_8 and l_itemRestrictions_8[l_ItemRestrictions_0.LimitedUnique];
            local v70 = l_itemRestrictions_8 and l_itemRestrictions_8[l_ItemRestrictions_0.Collectible];
            local v71 = v68 or v69 or v70;
            local v72 = not (v71 and v54.collectibleItemDetails and v54.collectibleItemDetails.unitsAvailableForConsumption and v54.collectibleItemDetails.unitsAvailableForConsumption > 0 or not v71) or v54.isOffSale == true;
            return v61 or v72;
        end;
    end;
end;
local function _(v74) --[[ Line: 187 ]] --[[ Name: getIsSoldOut ]]
    -- upvalues: l_ItemRestrictions_0 (copy)
    local l_itemRestrictions_9 = v74.itemRestrictions;
    local v76 = l_itemRestrictions_9 and l_itemRestrictions_9[l_ItemRestrictions_0.Limited];
    local v77 = l_itemRestrictions_9 and l_itemRestrictions_9[l_ItemRestrictions_0.LimitedUnique];
    local v78 = l_itemRestrictions_9 and l_itemRestrictions_9[l_ItemRestrictions_0.Collectible];
    local v79 = v76 or v77 or v78;
    local v80 = v79 and v74.collectibleItemDetails and v74.collectibleItemDetails.unitsAvailableForConsumption and v74.collectibleItemDetails.unitsAvailableForConsumption > 0 or not v79;
    v79 = v74.collectibleItemDetails and v74.collectibleItemDetails.hasResellers;
    return not v80 and not v79;
end;
local function _(v82) --[[ Line: 197 ]] --[[ Name: getIsOwned ]]
    -- upvalues: l_ItemRestrictions_0 (copy)
    local l_isOwned_0 = v82.isOwned;
    local l_itemRestrictions_10 = v82.itemRestrictions;
    local v85 = l_itemRestrictions_10 and l_itemRestrictions_10[l_ItemRestrictions_0.Limited];
    local v86 = l_itemRestrictions_10 and l_itemRestrictions_10[l_ItemRestrictions_0.LimitedUnique];
    local v87 = l_itemRestrictions_10 and l_itemRestrictions_10[l_ItemRestrictions_0.Collectible];
    local v88 = not (v85 or v86 or v87) and v82.isOwned and true or if v82.collectibleItemDetails and v82.collectibleItemDetails.quantityLimitPerUser then v82.collectibleItemDetails.quantityLimitPerUser > 0 and v82.collectibleItemDetails.resellableCount >= v82.collectibleItemDetails.quantityLimitPerUser else false;
    local v89 = v82.collectibleItemDetails and v82.collectibleItemDetails.hasResellers;
    v87 = v82.itemRestrictions;
    local v90 = v87 and v87[l_ItemRestrictions_0.Limited];
    local v91 = v87 and v87[l_ItemRestrictions_0.LimitedUnique];
    local v92 = v87 and v87[l_ItemRestrictions_0.Collectible];
    v86 = v90 or v91 or v92;
    l_itemRestrictions_10 = not (v86 and v82.collectibleItemDetails and v82.collectibleItemDetails.unitsAvailableForConsumption and v82.collectibleItemDetails.unitsAvailableForConsumption > 0 or not v86) or v88 or v82.isOffSale;
    return l_isOwned_0 and l_itemRestrictions_10 and not v89;
end;
local function _(v94) --[[ Line: 211 ]] --[[ Name: getIsPurchasableFromRoblox ]]
    -- upvalues: l_NoPriceStatus_0 (copy), l_SalesLocationType_0 (copy)
    if v94.isOffSale or v94.noPriceStatus == l_NoPriceStatus_0.OffSale then
        return false;
    else
        return not (v94.saleLocationType == l_SalesLocationType_0.ExperiencesDevApiOnly);
    end;
end;
local function _(v96) --[[ Line: 221 ]] --[[ Name: getIsOffSale ]]
    -- upvalues: l_NoPriceStatus_0 (copy)
    return v96.isOffSale or v96.noPriceStatus == l_NoPriceStatus_0.OffSale;
end;
local function _(v98) --[[ Line: 229 ]] --[[ Name: getIsShopOnly ]]
    -- upvalues: l_SalesLocationType_0 (copy)
    return v98.saleLocationType == l_SalesLocationType_0.ShopOnly;
end;
return function(v100, v101) --[[ Line: 237 ]] --[[ Name: getPriceStatus ]]
    -- upvalues: v3 (copy), v40 (copy), l_ItemRestrictions_0 (copy), v73 (copy), l_SalesLocationType_0 (copy), l_FFlagAXPurchaseFromQuantityFirst_0 (copy), l_NoPriceStatus_0 (copy)
    if not v100 then
        return v3.Unavailable;
    elseif v40(v100) then
        return v3.QuantityLimitReached;
    else
        local l_isOwned_1 = v100.isOwned;
        local l_itemRestrictions_11 = v100.itemRestrictions;
        local v104 = l_itemRestrictions_11 and l_itemRestrictions_11[l_ItemRestrictions_0.Limited];
        local v105 = l_itemRestrictions_11 and l_itemRestrictions_11[l_ItemRestrictions_0.LimitedUnique];
        local v106 = l_itemRestrictions_11 and l_itemRestrictions_11[l_ItemRestrictions_0.Collectible];
        local v107 = not (v104 or v105 or v106) and v100.isOwned and true or if v100.collectibleItemDetails and v100.collectibleItemDetails.quantityLimitPerUser then v100.collectibleItemDetails.quantityLimitPerUser > 0 and v100.collectibleItemDetails.resellableCount >= v100.collectibleItemDetails.quantityLimitPerUser else false;
        local v108 = v100.collectibleItemDetails and v100.collectibleItemDetails.hasResellers;
        v106 = v100.itemRestrictions;
        local v109 = v106 and v106[l_ItemRestrictions_0.Limited];
        local v110 = v106 and v106[l_ItemRestrictions_0.LimitedUnique];
        local v111 = v106 and v106[l_ItemRestrictions_0.Collectible];
        v105 = v109 or v110 or v111;
        l_itemRestrictions_11 = not (v105 and v100.collectibleItemDetails and v100.collectibleItemDetails.unitsAvailableForConsumption and v100.collectibleItemDetails.unitsAvailableForConsumption > 0 or not v105) or v107 or v100.isOffSale;
        if l_isOwned_1 and l_itemRestrictions_11 and not v108 then
            return v3.Owned;
        else
            v108 = v100.itemRestrictions;
            l_itemRestrictions_11 = v108 and v108[l_ItemRestrictions_0.Limited];
            v104 = v108 and v108[l_ItemRestrictions_0.LimitedUnique];
            v105 = v108 and v108[l_ItemRestrictions_0.Collectible];
            v107 = l_itemRestrictions_11 or v104 or v105;
            l_isOwned_1 = v107 and v100.collectibleItemDetails and v100.collectibleItemDetails.unitsAvailableForConsumption and v100.collectibleItemDetails.unitsAvailableForConsumption > 0 or not v107;
            v107 = v100.collectibleItemDetails and v100.collectibleItemDetails.hasResellers;
            if not l_isOwned_1 and not v107 then
                return v3.SoldOut;
            elseif v73(v100, v101) then
                return v3.PurchaseFromResale;
            else
                local v112;
                if v100.isOffSale then
                    v112 = false;
                else
                    l_isOwned_1 = true;
                    if v100.saleLocationType ~= l_SalesLocationType_0.ExperiencesDevApiOnly then
                        l_isOwned_1 = true;
                        if v100.saleLocationType ~= l_SalesLocationType_0.MyExperiencesOnly then
                            l_isOwned_1 = v100.saleLocationType == l_SalesLocationType_0.ExperiencesById;
                        end;
                    end;
                    l_itemRestrictions_11 = v100.itemRestrictions;
                    v104 = l_itemRestrictions_11 and l_itemRestrictions_11[l_ItemRestrictions_0.Limited];
                    v105 = l_itemRestrictions_11 and l_itemRestrictions_11[l_ItemRestrictions_0.LimitedUnique];
                    v106 = l_itemRestrictions_11 and l_itemRestrictions_11[l_ItemRestrictions_0.Collectible];
                    v108 = v104 or v105 or v106;
                    v107 = v108 and v100.collectibleItemDetails and v100.collectibleItemDetails.unitsAvailableForConsumption and v100.collectibleItemDetails.unitsAvailableForConsumption > 0 or not v108;
                    v112 = l_isOwned_1 and v107 or not l_FFlagAXPurchaseFromQuantityFirst_0 and v100.noPriceStatus == l_NoPriceStatus_0.InExperience;
                end;
                if v112 then
                    return v3.InExperienceOnly;
                elseif v100.saleLocationType == l_SalesLocationType_0.ShopOnly then
                    return v3.Unavailable;
                else
                    if v100.isOffSale then
                        v112 = false;
                    else
                        l_isOwned_1 = not (v100.saleLocationType == l_SalesLocationType_0.ExperiencesDevApiOnly);
                        v112 = true;
                        if v100.noPriceStatus ~= l_NoPriceStatus_0.Free then
                            v112 = l_isOwned_1 and v100.priceInRobux == 0 or v100.catalogPriceStatus == "Free";
                        end;
                    end;
                    if v112 then
                        return v3.Free;
                    elseif not v100.isOffSale and not (v100.noPriceStatus == l_NoPriceStatus_0.OffSale) and not (v100.saleLocationType == l_SalesLocationType_0.ExperiencesDevApiOnly) then
                        return v3.PurchaseFromRoblox;
                    elseif v100.isOffSale or v100.noPriceStatus == l_NoPriceStatus_0.OffSale then
                        return v3.OffSale;
                    else
                        return v3.Unavailable;
                    end;
                end;
            end;
        end;
    end;
end;