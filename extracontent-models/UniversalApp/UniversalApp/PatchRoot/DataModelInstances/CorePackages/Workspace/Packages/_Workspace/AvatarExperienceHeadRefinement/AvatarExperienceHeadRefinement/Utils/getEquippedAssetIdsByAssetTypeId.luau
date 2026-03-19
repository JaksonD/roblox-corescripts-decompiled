return function(v0, v1) --[[ Line: 1 ]] --[[ Name: getEquippedAssetIdsByAssetTypeId ]]
    local v2 = {};
    if not v0 then
        return v2;
    else
        local v3 = v0[v1];
        if v3 then
            for v4, _ in v3 do
                table.insert(v2, v4);
            end;
        end;
        return v2;
    end;
end;