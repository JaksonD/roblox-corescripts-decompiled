return function(v0) --[[ Line: 4 ]]
    local l_assetId_0 = v0.detailsInformation.assetId;
    if l_assetId_0 == nil then
        return nil;
    else
        local v2 = v0.assets[l_assetId_0];
        return v2 and v2.parentBundleId ~= nil;
    end;
end;