return function(v0, v1) --[[ Line: 1 ]] --[[ Name: getInvalidAssetIdsToAssetTypeIdMap ]]
    local v2 = {};
    for v3, v4 in v0 do
        if not v1[v3] then
            v2[v3] = v4;
        end;
    end;
    return v2;
end;