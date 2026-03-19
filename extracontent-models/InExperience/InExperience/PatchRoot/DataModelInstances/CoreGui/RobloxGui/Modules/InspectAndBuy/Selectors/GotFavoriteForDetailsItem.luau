local l_CorePackages_0 = game:GetService("CorePackages");
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Selectors.IsDetailsItemPartOfBundleAndOffsale);
local v4 = require(l_Parent_0.UtilityFunctions);
local v5 = require(l_Parent_0.createInspectAndBuyKeyMapper);
local v6 = v5("getFavoriteForAsset");
local v7 = v5("getFavoriteForBundle");
return function(v8) --[[ Line: 14 ]]
    -- upvalues: v3 (copy), v4 (copy), v7 (copy), l_RetrievalStatus_0 (copy), v6 (copy)
    local l_assetId_0 = v8.detailsInformation.assetId;
    if not l_assetId_0 then
        return false;
    else
        local v10 = v3(v8);
        if v10 == nil then
            return false;
        else
            local v11 = v8.assets[l_assetId_0];
            if not v11 then
                return false;
            elseif v10 then
                local v12 = v4.getBundleId(v11);
                local v13 = v7(v8.storeId, v12);
                local v14 = true;
                if v8.FetchingStatus[v13] ~= l_RetrievalStatus_0.Fetching then
                    v14 = v8.FetchingStatus[v13] == l_RetrievalStatus_0.Done;
                end;
                return v14;
            else
                local v15 = v6(v8.storeId, l_assetId_0);
                local v16 = true;
                if v8.FetchingStatus[v15] ~= l_RetrievalStatus_0.Fetching then
                    v16 = v8.FetchingStatus[v15] == l_RetrievalStatus_0.Done;
                end;
                return v16;
            end;
        end;
    end;
end;