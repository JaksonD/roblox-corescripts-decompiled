return function(v0) --[[ Line: 1 ]] --[[ Name: getGearAssetIdFromEquippedAssets ]]
    local v1 = nil;
    local v2 = v0[tostring(Enum.AssetType.Gear.Value)];
    if v2 then
        local v3, _ = next(v2);
        if v3 then
            v1 = tonumber(v3);
        end;
    end;
    return v1;
end;