local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local _ = require(l_script_FirstAncestor_0.Common.AssetInfo);
return function(v2, v3) --[[ Line: 5 ]] --[[ Name: sortCurrentlyWearingItems ]]
    local v4 = {
        isOffSale = v2.isOffSale or false, 
        price = v2.price or v2.lowestResalePrice or 0, 
        favoriteCount = v2.favoriteCount or 0
    };
    local v5 = {
        isOffSale = v3.isOffSale or false, 
        price = v3.price or v3.lowestResalePrice or 0, 
        favoriteCount = v3.favoriteCount or 0
    };
    if v4.isOffSale ~= v5.isOffSale then
        return not v4.isOffSale;
    elseif v4.price ~= v5.price then
        if v4.price == 0 then
            return false;
        elseif v5.price == 0 then
            return true;
        else
            return v4.price > v5.price;
        end;
    else
        return (tonumber(v2.id) or 0) < (tonumber(v3.id) or 0);
    end;
end;