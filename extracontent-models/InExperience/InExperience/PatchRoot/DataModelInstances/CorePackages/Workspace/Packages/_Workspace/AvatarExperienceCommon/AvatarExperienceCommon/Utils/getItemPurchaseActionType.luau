local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local v1 = require(l_script_FirstAncestor_0.Enums.ItemPurchaseActionTypeEnum);
local v2 = require(l_script_FirstAncestor_0.Enums.SalesLocationType);
local v3 = require(l_script_FirstAncestor_0.Enums.ItemRestrictions);
local function _(v4) --[[ Line: 24 ]] --[[ Name: getExperienceCount ]]
    return #if v4 then v4.experiences or {} else {};
end;
local function _(v6) --[[ Line: 29 ]] --[[ Name: getAvailableInExperienceOnly ]]
    -- upvalues: v2 (copy)
    return v6.saleLocationType == v2.ExperiencesDevApiOnly;
end;
local function _(v8) --[[ Line: 33 ]] --[[ Name: getHasLimitedAmount ]]
    -- upvalues: v3 (copy)
    local l_itemRestrictions_0 = v8.itemRestrictions;
    local v10 = l_itemRestrictions_0 and l_itemRestrictions_0[v3.Limited];
    local v11 = l_itemRestrictions_0 and l_itemRestrictions_0[v3.LimitedUnique];
    local v12 = l_itemRestrictions_0 and l_itemRestrictions_0[v3.Collectible];
    return v10 or v11 or v12;
end;
local function _(v14, v15, v16) --[[ Line: 41 ]] --[[ Name: getUserHasReachedQuantityLimit ]]
    -- upvalues: v3 (copy)
    local l_itemRestrictions_1 = v14.itemRestrictions;
    local v18 = l_itemRestrictions_1 and l_itemRestrictions_1[v3.Limited];
    local v19 = l_itemRestrictions_1 and l_itemRestrictions_1[v3.LimitedUnique];
    local v20 = l_itemRestrictions_1 and l_itemRestrictions_1[v3.Collectible];
    if not (v18 or v19 or v20) and v14.isOwned then
        return true;
    elseif not v15 or not v15.quantityLimitPerUser then
        return false;
    else
        if v15 then
            l_itemRestrictions_1 = false;
            if v15.quantityLimitPerUser > 0 then
                return v15.quantityLimitPerUser <= v16;
            end;
        else
            l_itemRestrictions_1 = false;
        end;
        return l_itemRestrictions_1;
    end;
end;
local function _(v22) --[[ Line: 59 ]] --[[ Name: getOriginalStockAvailable ]]
    -- upvalues: v3 (copy)
    local l_itemRestrictions_2 = v22.itemRestrictions;
    local v24 = l_itemRestrictions_2 and l_itemRestrictions_2[v3.Limited];
    local v25 = l_itemRestrictions_2 and l_itemRestrictions_2[v3.LimitedUnique];
    local v26 = l_itemRestrictions_2 and l_itemRestrictions_2[v3.Collectible];
    local v27 = v24 or v25 or v26;
    return v27 and v22.numberRobloxHasAvailable and v22.numberRobloxHasAvailable > 0 or not v27;
end;
local function _(v29, v30) --[[ Line: 67 ]] --[[ Name: getButtonTypeIsPurchaseFromResale ]]
    -- upvalues: v2 (copy), v3 (copy)
    if not v30 or not v29.hasResellers then
        return false;
    else
        local v31 = if v29.priceInRobux and v29.lowestResalePrice then v29.lowestResalePrice < v29.priceInRobux else v29.lowestResalePrice ~= nil;
        local v32 = v29.saleLocationType == v2.ExperiencesDevApiOnly;
        local l_itemRestrictions_3 = v29.itemRestrictions;
        local v34 = l_itemRestrictions_3 and l_itemRestrictions_3[v3.Limited];
        local v35 = l_itemRestrictions_3 and l_itemRestrictions_3[v3.LimitedUnique];
        local v36 = l_itemRestrictions_3 and l_itemRestrictions_3[v3.Collectible];
        local v37 = v34 or v35 or v36;
        local v38 = not (v37 and v29.numberRobloxHasAvailable and v29.numberRobloxHasAvailable > 0 or not v37) or v29.isOffSale == true or v32;
        return v31 or v38;
    end;
end;
local function _(v40) --[[ Line: 81 ]] --[[ Name: getButtonTypeIsFree ]]
    -- upvalues: v2 (copy)
    if v40.isOffSale then
        return false;
    else
        return not (v40.saleLocationType == v2.ExperiencesDevApiOnly) and v40.priceInRobux == 0;
    end;
end;
local function _(v42, v43) --[[ Line: 89 ]] --[[ Name: getButtonTypeIsExperienceLink ]]
    -- upvalues: v2 (copy), v3 (copy)
    if v42.isOffSale then
        return false;
    else
        local v44 = v42.saleLocationType == v2.ExperiencesDevApiOnly;
        local l_itemRestrictions_4 = v42.itemRestrictions;
        local v46 = l_itemRestrictions_4 and l_itemRestrictions_4[v3.Limited];
        local v47 = l_itemRestrictions_4 and l_itemRestrictions_4[v3.LimitedUnique];
        local v48 = l_itemRestrictions_4 and l_itemRestrictions_4[v3.Collectible];
        local v49 = v46 or v47 or v48;
        local v50 = v49 and v42.numberRobloxHasAvailable and v42.numberRobloxHasAvailable > 0 or not v49;
        v49 = #(if v43 then v43.experiences or {} else {}) > 0;
        return v44 and v49 and v50;
    end;
end;
local function _(v52, v53) --[[ Line: 99 ]] --[[ Name: getButtonTypeIsSoldOut ]]
    -- upvalues: v3 (copy)
    local l_itemRestrictions_5 = v52.itemRestrictions;
    local v55 = l_itemRestrictions_5 and l_itemRestrictions_5[v3.Limited];
    local v56 = l_itemRestrictions_5 and l_itemRestrictions_5[v3.LimitedUnique];
    local v57 = l_itemRestrictions_5 and l_itemRestrictions_5[v3.Collectible];
    local v58 = v55 or v56 or v57;
    local v59 = v58 and v52.numberRobloxHasAvailable and v52.numberRobloxHasAvailable > 0 or not v58;
    v58 = v53 and v52.hasResellers;
    return not v59 and not v58;
end;
local function _(v61, v62, v63, v64) --[[ Line: 105 ]] --[[ Name: getButtonTypeIsCustomizeLink ]]
    -- upvalues: v3 (copy)
    local l_isOwned_0 = v61.isOwned;
    local l_itemRestrictions_6 = v61.itemRestrictions;
    local v67 = l_itemRestrictions_6 and l_itemRestrictions_6[v3.Limited];
    local v68 = l_itemRestrictions_6 and l_itemRestrictions_6[v3.LimitedUnique];
    local v69 = l_itemRestrictions_6 and l_itemRestrictions_6[v3.Collectible];
    local v70 = not (v67 or v68 or v69) and v61.isOwned and true or if v62 and v62.quantityLimitPerUser then if v62 then v62.quantityLimitPerUser > 0 and v62.quantityLimitPerUser <= v63 else false else false;
    local v71 = v64 and v61.hasResellers;
    v69 = v61.itemRestrictions;
    local v72 = v69 and v69[v3.Limited];
    local v73 = v69 and v69[v3.LimitedUnique];
    local v74 = v69 and v69[v3.Collectible];
    v68 = v72 or v73 or v74;
    l_itemRestrictions_6 = not (v68 and v61.numberRobloxHasAvailable and v61.numberRobloxHasAvailable > 0 or not v68) or v70 or v61.isOffSale;
    return l_isOwned_0 and l_itemRestrictions_6 and not v71;
end;
local function _(v76) --[[ Line: 121 ]] --[[ Name: getButtonTypeIsPurchasableFromRoblox ]]
    -- upvalues: v2 (copy)
    if v76.isOffSale then
        return false;
    else
        return not (v76.saleLocationType == v2.ExperiencesDevApiOnly);
    end;
end;
return function(v78, v79, v80, v81) --[[ Line: 128 ]] --[[ Name: getItemPurchaseActionType ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    if not v78 then
        return v1.Disabled;
    else
        local l_isOwned_1 = v78.isOwned;
        local l_itemRestrictions_7 = v78.itemRestrictions;
        local v84 = l_itemRestrictions_7 and l_itemRestrictions_7[v3.Limited];
        local v85 = l_itemRestrictions_7 and l_itemRestrictions_7[v3.LimitedUnique];
        local v86 = l_itemRestrictions_7 and l_itemRestrictions_7[v3.Collectible];
        local v87 = not (v84 or v85 or v86) and v78.isOwned and true or if v79 and v79.quantityLimitPerUser then if v79 then v79.quantityLimitPerUser > 0 and v79.quantityLimitPerUser <= v80 else false else false;
        local v88 = v81 and v78.hasResellers;
        v86 = v78.itemRestrictions;
        local v89 = v86 and v86[v3.Limited];
        local v90 = v86 and v86[v3.LimitedUnique];
        local v91 = v86 and v86[v3.Collectible];
        v85 = v89 or v90 or v91;
        l_itemRestrictions_7 = not (v85 and v78.numberRobloxHasAvailable and v78.numberRobloxHasAvailable > 0 or not v85) or v87 or v78.isOffSale;
        if l_isOwned_1 and l_itemRestrictions_7 and not v88 then
            return v1.CustomizeLink;
        else
            v88 = v78.itemRestrictions;
            l_itemRestrictions_7 = v88 and v88[v3.Limited];
            v84 = v88 and v88[v3.LimitedUnique];
            v85 = v88 and v88[v3.Collectible];
            v87 = l_itemRestrictions_7 or v84 or v85;
            l_isOwned_1 = v87 and v78.numberRobloxHasAvailable and v78.numberRobloxHasAvailable > 0 or not v87;
            v87 = v81 and v78.hasResellers;
            if not l_isOwned_1 and not v87 then
                return v1.SoldOut;
            else
                local v92;
                if not v81 or not v78.hasResellers then
                    v92 = false;
                else
                    l_isOwned_1 = if v78.priceInRobux and v78.lowestResalePrice then v78.lowestResalePrice < v78.priceInRobux else v78.lowestResalePrice ~= nil;
                    v87 = v78.saleLocationType == v2.ExperiencesDevApiOnly;
                    v85 = v78.itemRestrictions;
                    v86 = v85 and v85[v3.Limited];
                    v89 = v85 and v85[v3.LimitedUnique];
                    v90 = v85 and v85[v3.Collectible];
                    v84 = v86 or v89 or v90;
                    v88 = not (v84 and v78.numberRobloxHasAvailable and v78.numberRobloxHasAvailable > 0 or not v84) or v78.isOffSale == true or v87;
                    v92 = l_isOwned_1 or v88;
                end;
                if v92 then
                    return v1.PurchaseFromResale;
                else
                    if v78.isOffSale then
                        v92 = false;
                    else
                        l_isOwned_1 = v78.saleLocationType == v2.ExperiencesDevApiOnly;
                        l_itemRestrictions_7 = v78.itemRestrictions;
                        v84 = l_itemRestrictions_7 and l_itemRestrictions_7[v3.Limited];
                        v85 = l_itemRestrictions_7 and l_itemRestrictions_7[v3.LimitedUnique];
                        v86 = l_itemRestrictions_7 and l_itemRestrictions_7[v3.Collectible];
                        v88 = v84 or v85 or v86;
                        v87 = v88 and v78.numberRobloxHasAvailable and v78.numberRobloxHasAvailable > 0 or not v88;
                        v88 = #(if v79 then v79.experiences or {} else {}) > 0;
                        v92 = l_isOwned_1 and v88 and v87;
                    end;
                    if v92 then
                        return v1.ExperienceLink;
                    elseif not v78.isOffSale and not (v78.saleLocationType == v2.ExperiencesDevApiOnly) and v78.priceInRobux == 0 then
                        return v1.Free;
                    elseif not v78.isOffSale and not (v78.saleLocationType == v2.ExperiencesDevApiOnly) then
                        return v1.PurchaseFromRoblox;
                    else
                        return v1.Disabled;
                    end;
                end;
            end;
        end;
    end;
end;