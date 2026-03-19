local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v6 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v8 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v9 = require(l_CorePackages_0.Packages.Promise);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetOutfit);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchBundleAssetsDetails);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchBundleInfo);
local v13 = game:DefineFastFlag("AXFixBundleOutfitFetchForShoes", false);
local function _(v14) --[[ Line: 23 ]] --[[ Name: keyMapper ]]
    -- upvalues: v7 (copy)
    return v7.FetchOutfitInfoFromBundleKey .. tostring(v14);
end;
local function _(v16, v17) --[[ Line: 27 ]] --[[ Name: isBundleInfoFetching ]]
    -- upvalues: l_PerformFetch_0 (copy), v7 (copy), v8 (copy)
    return l_PerformFetch_0.GetStatus(v16, v7.FetchBundleInfoKey .. tostring(v17)) == v8.Fetching;
end;
local function _(v19, v20) --[[ Line: 32 ]] --[[ Name: isOutfitInfoFetching ]]
    -- upvalues: l_PerformFetch_0 (copy), v5 (copy), v8 (copy)
    return l_PerformFetch_0.GetStatus(v19, v5.OutfitInfoKey .. tostring(v20)) == v8.Fetching;
end;
local function _(v22, v23) --[[ Line: 37 ]] --[[ Name: shouldFetchBundleInfo ]]
    -- upvalues: l_PerformFetch_0 (copy), v7 (copy), v8 (copy)
    local v24 = v22.AvatarExperience.Common.BundleInfos[v23];
    if v24 and v24.receivedCatalogData or l_PerformFetch_0.GetStatus(v22, v7.FetchBundleInfoKey .. tostring(v23)) == v8.Fetching then
        return false;
    else
        return true;
    end;
end;
local function v30(v26, v27) --[[ Line: 46 ]] --[[ Name: shouldFetchOutfitInfo ]]
    -- upvalues: v13 (copy), v6 (copy), l_PerformFetch_0 (copy), v5 (copy), v8 (copy)
    local v28 = v26.AvatarExperience.Common.BundleInfos[v27];
    if v28 and v28.receivedCatalogData then
        if not v13 and v6.isShoeBundle(v28) then
            return false;
        else
            local v29 = v6.getUserOutfitIdFromBundle(v28);
            if v26.AvatarExperience.AvatarEditor.OutfitInfos[v29] or l_PerformFetch_0.GetStatus(v26, v5.OutfitInfoKey .. tostring(v29)) == v8.Fetching then
                return false;
            else
                return true;
            end;
        end;
    else
        return false;
    end;
end;
return function(v31, v32) --[[ Line: 67 ]]
    -- upvalues: v3 (copy), l_PerformFetch_0 (copy), v7 (copy), v8 (copy), v9 (copy), v12 (copy), v13 (copy), v6 (copy), v4 (copy), v5 (copy), v10 (copy), v11 (copy), v30 (copy)
    v3.isType(v31, "function", "FetchOutfitInfoFromBundle thunk expects networkImpl to be a function");
    v3.isType(v32, "string", "FetchOutfitInfoFromBundle thunk expects bundleId to be a string");
    return function(v33) --[[ Line: 71 ]]
        -- upvalues: l_PerformFetch_0 (ref), v32 (copy), v7 (ref), v8 (ref), v9 (ref), v12 (ref), v13 (ref), v6 (ref), v4 (ref), v5 (ref), v10 (ref), v11 (ref), v31 (copy), v30 (ref)
        local v34 = v33:getState();
        local l_GetStatus_0 = l_PerformFetch_0.GetStatus;
        local l_v34_0 = v34;
        local l_v32_0 = v32;
        if l_GetStatus_0(l_v34_0, v7.FetchOutfitInfoFromBundleKey .. tostring(l_v32_0)) == v8.Fetching then
            return v9.resolve();
        else
            l_GetStatus_0 = l_PerformFetch_0.Single;
            local l_v32_1 = v32;
            return l_GetStatus_0(v7.FetchOutfitInfoFromBundleKey .. tostring(l_v32_1), function(v39) --[[ Line: 78 ]]
                -- upvalues: v32 (ref), l_PerformFetch_0 (ref), v7 (ref), v8 (ref), v12 (ref), v13 (ref), v6 (ref), v4 (ref), v5 (ref), v10 (ref), v11 (ref), v31 (ref), v30 (ref), v9 (ref)
                local v40 = v39:getState();
                local l_v40_0 = v40;
                local l_v32_2 = v32;
                local v43 = l_v40_0.AvatarExperience.Common.BundleInfos[l_v32_2];
                if (not v43 or not v43.receivedCatalogData) and l_PerformFetch_0.GetStatus(l_v40_0, v7.FetchBundleInfoKey .. tostring(l_v32_2)) ~= v8.Fetching then
                    v39:dispatch(v12(v32)):andThen(function(_) --[[ Line: 82 ]]
                        -- upvalues: v40 (ref), v39 (copy), v13 (ref), v32 (ref), v6 (ref), v4 (ref), l_PerformFetch_0 (ref), v5 (ref), v8 (ref), v10 (ref), v11 (ref), v31 (ref), v30 (ref), v9 (ref)
                        v40 = v39:getState();
                        if v13 then
                            local v45 = v40.AvatarExperience.Common.BundleInfos[v32];
                            local v46 = v6.getUserOutfitIdsFromBundle(v45) or {};
                            if not v4.isEmpty(v46) then
                                for _, v48 in v46 do
                                    local l_v40_1 = v40;
                                    if not (l_PerformFetch_0.GetStatus(l_v40_1, v5.OutfitInfoKey .. tostring(v48)) == v8.Fetching) then
                                        v39:dispatch(v10(v48, nil, v32));
                                    end;
                                end;
                            else
                                local v50 = {};
                                if v45.items then
                                    for _, v52 in v45.items do
                                        if v52.type == v5.ItemType.Asset then
                                            table.insert(v50, (tonumber(v52.id)));
                                        end;
                                    end;
                                end;
                                v39:dispatch(v11(v31, v32, v50));
                            end;
                        elseif v30(v40, v32) then
                            local v53 = v40.AvatarExperience.Common.BundleInfos[v32];
                            for _, v55 in (v6.getUserOutfitIdsFromBundle(v53)) do
                                v39:dispatch(v10(v55, nil, v32));
                            end;
                        else
                            local v56 = v40.AvatarExperience.Common.BundleInfos[v32];
                            local v57 = v6.getUserOutfitIdsFromBundle(v56);
                            if v4.isEmpty(v57) then
                                local v58 = {};
                                if v56.items then
                                    for _, v60 in v56.items do
                                        table.insert(v58, (tonumber(v60.id)));
                                    end;
                                end;
                                v39:dispatch(v11(v31, v32, v58));
                            end;
                        end;
                        return v9.resolve();
                    end);
                elseif v30(v40, v32) then
                    local v61 = v40.AvatarExperience.Common.BundleInfos[v32];
                    for _, v63 in (v6.getUserOutfitIdsFromBundle(v61)) do
                        v39:dispatch(v10(v63, nil, v32));
                    end;
                end;
                return v9.resolve();
            end)(v33);
        end;
    end;
end;