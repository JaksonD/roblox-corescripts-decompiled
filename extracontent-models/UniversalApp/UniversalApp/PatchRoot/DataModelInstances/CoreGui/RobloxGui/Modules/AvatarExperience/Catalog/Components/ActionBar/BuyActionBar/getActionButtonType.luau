local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v2 = require(script.Parent.BuyActionButtonTypeEnum);
local v3 = require(script.Parent.getExperienceCount);
local v4 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXActionButtonAccountForMissingItemData);
local function _(v5) --[[ Line: 28 ]] --[[ Name: getAvailableInExperienceOnly ]]
    -- upvalues: v1 (copy)
    return v5.saleLocationType == v1.SaleLocationType.ExperiencesDevApiOnly;
end;
local function _(v7) --[[ Line: 32 ]] --[[ Name: getHasLimitedAmount ]]
    -- upvalues: v1 (copy)
    local l_itemRestrictions_0 = v7.itemRestrictions;
    local v9 = l_itemRestrictions_0 and l_itemRestrictions_0[v1.ItemRestrictions.Limited];
    local v10 = l_itemRestrictions_0 and l_itemRestrictions_0[v1.ItemRestrictions.LimitedUnique];
    local v11 = l_itemRestrictions_0 and l_itemRestrictions_0[v1.ItemRestrictions.Collectible];
    return v9 or v10 or v11;
end;
local function _(v13, v14, v15) --[[ Line: 40 ]] --[[ Name: getUserHasReachedQuantityLimit ]]
    -- upvalues: v1 (copy)
    local l_itemRestrictions_1 = v13.itemRestrictions;
    local v17 = l_itemRestrictions_1 and l_itemRestrictions_1[v1.ItemRestrictions.Limited];
    local v18 = l_itemRestrictions_1 and l_itemRestrictions_1[v1.ItemRestrictions.LimitedUnique];
    local v19 = l_itemRestrictions_1 and l_itemRestrictions_1[v1.ItemRestrictions.Collectible];
    if not (v17 or v18 or v19) and v13.isOwned then
        return true;
    elseif not v14 or not v14.quantityLimitPerUser then
        return false;
    else
        l_itemRestrictions_1 = false;
        if v14.quantityLimitPerUser > 0 then
            l_itemRestrictions_1 = v14.quantityLimitPerUser <= v15;
        end;
        return l_itemRestrictions_1;
    end;
end;
local function _(v21) --[[ Line: 55 ]] --[[ Name: getOriginalStockAvailable ]]
    -- upvalues: v1 (copy)
    local l_itemRestrictions_2 = v21.itemRestrictions;
    local v23 = l_itemRestrictions_2 and l_itemRestrictions_2[v1.ItemRestrictions.Limited];
    local v24 = l_itemRestrictions_2 and l_itemRestrictions_2[v1.ItemRestrictions.LimitedUnique];
    local v25 = l_itemRestrictions_2 and l_itemRestrictions_2[v1.ItemRestrictions.Collectible];
    local v26 = v23 or v24 or v25;
    return v26 and v21.numberRobloxHasAvailable and v21.numberRobloxHasAvailable > 0 or not v26;
end;
local function _(v28, v29) --[[ Line: 63 ]] --[[ Name: getButtonTypeIsPurchaseFromResale ]]
    -- upvalues: v1 (copy)
    if not v29 or not v28.hasResellers then
        return false;
    else
        local v30 = if v28.priceInRobux and v28.lowestResalePrice then v28.lowestResalePrice < v28.priceInRobux else v28.lowestResalePrice ~= nil;
        local l_itemRestrictions_3 = v28.itemRestrictions;
        local v32 = l_itemRestrictions_3 and l_itemRestrictions_3[v1.ItemRestrictions.Limited];
        local v33 = l_itemRestrictions_3 and l_itemRestrictions_3[v1.ItemRestrictions.LimitedUnique];
        local v34 = l_itemRestrictions_3 and l_itemRestrictions_3[v1.ItemRestrictions.Collectible];
        local v35 = v32 or v33 or v34;
        local v36 = not (v35 and v28.numberRobloxHasAvailable and v28.numberRobloxHasAvailable > 0 or not v35) or v28.isOffSale == true;
        return v30 or v36;
    end;
end;
local function _(v38) --[[ Line: 74 ]] --[[ Name: getButtonTypeIsFree ]]
    -- upvalues: v1 (copy)
    if v38.isOffSale then
        return false;
    else
        return not (v38.saleLocationType == v1.SaleLocationType.ExperiencesDevApiOnly) and v38.priceInRobux == 0;
    end;
end;
local function _(v40, v41) --[[ Line: 82 ]] --[[ Name: getButtonTypeIsExperienceLink ]]
    -- upvalues: v1 (copy), v3 (copy)
    if v40.isOffSale then
        return false;
    else
        local v42 = v40.saleLocationType == v1.SaleLocationType.ExperiencesDevApiOnly;
        local l_itemRestrictions_4 = v40.itemRestrictions;
        local v44 = l_itemRestrictions_4 and l_itemRestrictions_4[v1.ItemRestrictions.Limited];
        local v45 = l_itemRestrictions_4 and l_itemRestrictions_4[v1.ItemRestrictions.LimitedUnique];
        local v46 = l_itemRestrictions_4 and l_itemRestrictions_4[v1.ItemRestrictions.Collectible];
        local v47 = v44 or v45 or v46;
        local v48 = v47 and v40.numberRobloxHasAvailable and v40.numberRobloxHasAvailable > 0 or not v47;
        v47 = v3(v41) > 0;
        return v42 and v47 and v48;
    end;
end;
local function _(v50, v51) --[[ Line: 93 ]] --[[ Name: getButtonTypeIsSoldOut ]]
    -- upvalues: v1 (copy)
    local l_itemRestrictions_5 = v50.itemRestrictions;
    local v53 = l_itemRestrictions_5 and l_itemRestrictions_5[v1.ItemRestrictions.Limited];
    local v54 = l_itemRestrictions_5 and l_itemRestrictions_5[v1.ItemRestrictions.LimitedUnique];
    local v55 = l_itemRestrictions_5 and l_itemRestrictions_5[v1.ItemRestrictions.Collectible];
    local v56 = v53 or v54 or v55;
    local v57 = v56 and v50.numberRobloxHasAvailable and v50.numberRobloxHasAvailable > 0 or not v56;
    v56 = v51 and v50.hasResellers;
    return not v57 and not v56;
end;
local function _(v59, v60, v61, v62) --[[ Line: 99 ]] --[[ Name: getButtonTypeIsCustomizeLink ]]
    -- upvalues: v1 (copy)
    local l_isOwned_0 = v59.isOwned;
    local v64 = v59.timedOptions and v59.isPurchasable;
    local l_itemRestrictions_6 = v59.itemRestrictions;
    local v66 = l_itemRestrictions_6 and l_itemRestrictions_6[v1.ItemRestrictions.Limited];
    local v67 = l_itemRestrictions_6 and l_itemRestrictions_6[v1.ItemRestrictions.LimitedUnique];
    local v68 = l_itemRestrictions_6 and l_itemRestrictions_6[v1.ItemRestrictions.Collectible];
    local v69 = not (v66 or v67 or v68) and v59.isOwned and true or if v60 and v60.quantityLimitPerUser then v60.quantityLimitPerUser > 0 and v60.quantityLimitPerUser <= v61 else false;
    local v70 = v62 and v59.hasResellers;
    v68 = v59.itemRestrictions;
    local v71 = v68 and v68[v1.ItemRestrictions.Limited];
    local v72 = v68 and v68[v1.ItemRestrictions.LimitedUnique];
    local v73 = v68 and v68[v1.ItemRestrictions.Collectible];
    v67 = v71 or v72 or v73;
    l_itemRestrictions_6 = not (v67 and v59.numberRobloxHasAvailable and v59.numberRobloxHasAvailable > 0 or not v67) or v69 or v59.isOffSale;
    return l_isOwned_0 and l_itemRestrictions_6 and not v70 and not v64;
end;
local function _(v75) --[[ Line: 116 ]] --[[ Name: getButtonTypeIsPurchasableFromRoblox ]]
    -- upvalues: v1 (copy)
    if v75.isOffSale then
        return false;
    else
        return not (v75.saleLocationType == v1.SaleLocationType.ExperiencesDevApiOnly);
    end;
end;
return function(v77, v78, v79, v80, v81) --[[ Line: 123 ]] --[[ Name: getActionButtonType ]]
    -- upvalues: v2 (copy), v4 (copy), v1 (copy), v3 (copy)
    if v80 then
        return v2.Loading;
    elseif v4 and not v77 then
        return v2.Disabled;
    else
        local l_isOwned_1 = v77.isOwned;
        local v83 = v77.timedOptions and v77.isPurchasable;
        local l_itemRestrictions_7 = v77.itemRestrictions;
        local v85 = l_itemRestrictions_7 and l_itemRestrictions_7[v1.ItemRestrictions.Limited];
        local v86 = l_itemRestrictions_7 and l_itemRestrictions_7[v1.ItemRestrictions.LimitedUnique];
        local v87 = l_itemRestrictions_7 and l_itemRestrictions_7[v1.ItemRestrictions.Collectible];
        local v88 = not (v85 or v86 or v87) and v77.isOwned and true or if v78 and v78.quantityLimitPerUser then v78.quantityLimitPerUser > 0 and v78.quantityLimitPerUser <= v79 else false;
        local v89 = v81 and v77.hasResellers;
        v87 = v77.itemRestrictions;
        local v90 = v87 and v87[v1.ItemRestrictions.Limited];
        local v91 = v87 and v87[v1.ItemRestrictions.LimitedUnique];
        local v92 = v87 and v87[v1.ItemRestrictions.Collectible];
        v86 = v90 or v91 or v92;
        l_itemRestrictions_7 = not (v86 and v77.numberRobloxHasAvailable and v77.numberRobloxHasAvailable > 0 or not v86) or v88 or v77.isOffSale;
        if l_isOwned_1 and l_itemRestrictions_7 and not v89 and not v83 then
            return v2.CustomizeLink;
        else
            v88 = v77.itemRestrictions;
            v89 = v88 and v88[v1.ItemRestrictions.Limited];
            l_itemRestrictions_7 = v88 and v88[v1.ItemRestrictions.LimitedUnique];
            v85 = v88 and v88[v1.ItemRestrictions.Collectible];
            v83 = v89 or l_itemRestrictions_7 or v85;
            l_isOwned_1 = v83 and v77.numberRobloxHasAvailable and v77.numberRobloxHasAvailable > 0 or not v83;
            v83 = v81 and v77.hasResellers;
            if not l_isOwned_1 and not v83 then
                return v2.SoldOut;
            else
                local v93;
                if not v81 or not v77.hasResellers then
                    v93 = false;
                else
                    l_isOwned_1 = if v77.priceInRobux and v77.lowestResalePrice then v77.lowestResalePrice < v77.priceInRobux else v77.lowestResalePrice ~= nil;
                    l_itemRestrictions_7 = v77.itemRestrictions;
                    v85 = l_itemRestrictions_7 and l_itemRestrictions_7[v1.ItemRestrictions.Limited];
                    v86 = l_itemRestrictions_7 and l_itemRestrictions_7[v1.ItemRestrictions.LimitedUnique];
                    v87 = l_itemRestrictions_7 and l_itemRestrictions_7[v1.ItemRestrictions.Collectible];
                    v89 = v85 or v86 or v87;
                    v83 = not (v89 and v77.numberRobloxHasAvailable and v77.numberRobloxHasAvailable > 0 or not v89) or v77.isOffSale == true;
                    v93 = l_isOwned_1 or v83;
                end;
                if v93 then
                    return v2.PurchaseFromResale;
                else
                    if v77.isOffSale then
                        v93 = false;
                    else
                        l_isOwned_1 = v77.saleLocationType == v1.SaleLocationType.ExperiencesDevApiOnly;
                        v89 = v77.itemRestrictions;
                        l_itemRestrictions_7 = v89 and v89[v1.ItemRestrictions.Limited];
                        v85 = v89 and v89[v1.ItemRestrictions.LimitedUnique];
                        v86 = v89 and v89[v1.ItemRestrictions.Collectible];
                        v88 = l_itemRestrictions_7 or v85 or v86;
                        v83 = v88 and v77.numberRobloxHasAvailable and v77.numberRobloxHasAvailable > 0 or not v88;
                        v88 = v3(v78) > 0;
                        v93 = l_isOwned_1 and v88 and v83;
                    end;
                    if v93 then
                        return v2.ExperienceLink;
                    elseif not v77.isOffSale and not (v77.saleLocationType == v1.SaleLocationType.ExperiencesDevApiOnly) and v77.priceInRobux == 0 then
                        return v2.Free;
                    elseif not v77.isOffSale and not (v77.saleLocationType == v1.SaleLocationType.ExperiencesDevApiOnly) then
                        return v2.PurchaseFromRoblox;
                    else
                        return v2.Disabled;
                    end;
                end;
            end;
        end;
    end;
end;