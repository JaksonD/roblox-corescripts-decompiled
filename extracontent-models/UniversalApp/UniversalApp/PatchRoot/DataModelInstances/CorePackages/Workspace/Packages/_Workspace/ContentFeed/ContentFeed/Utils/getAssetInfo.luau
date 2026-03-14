local v0 = 0;
local function _() --[[ Line: 8 ]]
    -- upvalues: v0 (ref)
    v0 = v0 + 1;
    return (tostring(v0));
end;
return {
    mock = function(v2) --[[ Line: 29 ]] --[[ Name: mock ]]
        -- upvalues: v0 (ref)
        local v3 = {};
        local v4 = tostring(v2);
        if not v4 then
            v0 = v0 + 1;
            v4 = tostring(v0);
        end;
        v3.id = v4;
        v3.assetType = "0";
        v3.name = "";
        return v3;
    end, 
    fromAsset = function(v5) --[[ Line: 43 ]] --[[ Name: fromAsset ]]
        return {
            id = tostring(v5.id), 
            assetType = tostring(v5.assetType), 
            name = v5.name, 
            price = v5.price, 
            lowestResalePrice = v5.lowestResalePrice, 
            isOffSale = v5.isOffSale, 
            favoriteCount = v5.favoriteCount
        };
    end
};