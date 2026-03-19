local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local l_Actions_0 = l_Modules_0.LuaApp.Actions;
local v4 = require(l_Modules_0.LuaApp.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v6 = require(l_Modules_0.LuaApp.Http.Requests.DeveloperProductApi.GameGetDeveloperProducts);
local v7 = require(l_Modules_0.LuaApp.Http.Requests.DeveloperProductApi.GameGetExperienceStoreDeveloperProducts);
local v8 = require(l_Actions_0.DeveloperProduct.SetGameDeveloperProducts);
local v9 = require(l_Modules_0.LuaApp.Thunks.DeveloperProduct.ApiFetchDeveloperProductsThumbnails);
local v10 = require(l_Modules_0.LuaApp.Thunks.DeveloperProduct.ApiFetchDeveloperProductsStatus);
local v11 = require(l_Modules_0.LuaApp.Flags.GetFIntExperienceStoreApiPageCount);
local v12 = require(l_Modules_0.LuaApp.Flags.FFlagUseExperienceStoreApiForEdp);
local _ = require(l_Modules_0.LuaApp.Models.DeveloperProductApi.StorePageTypes);
local v14 = require(l_Modules_0.LuaApp.Thunks.DeveloperProduct.util.sortDeveloperProductsComparator);
return function(v15, v16, v17, v18) --[[ Line: 23 ]]
    -- upvalues: l_PerformFetch_0 (copy), v12 (copy), v11 (copy), v4 (copy), v7 (copy), v2 (copy), v6 (copy), v14 (copy), v8 (copy), v9 (copy), v10 (copy)
    return l_PerformFetch_0.Single("ApiFetchGameDeveloperProducts" .. tostring(v16) .. v18, function(v19) --[[ Line: 24 ]]
        -- upvalues: v12 (ref), v11 (ref), v4 (ref), v7 (ref), v15 (copy), v16 (copy), v2 (ref), v6 (ref), v14 (ref), v8 (ref), v9 (ref), v10 (ref), v18 (copy), v17 (copy)
        local v20 = nil;
        if v12 then
            local v21 = v11();
            local v22 = "";
            local v23 = {};
            local function v28(v24) --[[ Line: 32 ]] --[[ Name: createProductsFromResponseData ]]
                local v25 = {};
                if v24.developerProducts then
                    for _, v27 in v24.developerProducts do
                        table.insert(v25, {
                            iconImageAssetId = v27.IconImageAssetId, 
                            id = v27.DeveloperProductId, 
                            name = v27.Name, 
                            priceInRobux = v27.PriceInRobux, 
                            productId = v27.ProductId
                        });
                    end;
                end;
                return v25;
            end;
            do
                local l_v22_0, l_v23_0 = v22, v23;
                local function v31(v32) --[[ Line: 51 ]] --[[ Name: fetchPage ]]
                    -- upvalues: v21 (copy), v4 (ref), l_v23_0 (ref), v7 (ref), v15 (ref), v16 (ref), l_v22_0 (ref), v28 (copy), v2 (ref), v31 (copy)
                    if v21 < v32 then
                        return v4.resolve({
                            responseBody = l_v23_0
                        });
                    else
                        return v7(v15, v16, l_v22_0):andThen(function(v33) --[[ Line: 57 ]]
                            -- upvalues: v28 (ref), l_v23_0 (ref), v2 (ref), l_v22_0 (ref), v31 (ref), v32 (copy), v4 (ref)
                            local l_responseBody_0 = v33.responseBody;
                            local v35 = v28(l_responseBody_0);
                            l_v23_0 = v2.List.join(l_v23_0, v35);
                            if l_responseBody_0.nextPageCursor and l_responseBody_0.nextPageCursor ~= "" then
                                l_v22_0 = l_responseBody_0.nextPageCursor;
                                return v31(v32 + 1);
                            else
                                return v4.resolve({
                                    responseBody = l_v23_0
                                });
                            end;
                        end):catch(function(_) --[[ Line: 68 ]]
                            -- upvalues: v4 (ref), l_v23_0 (ref)
                            return v4.resolve({
                                responseBody = l_v23_0
                            });
                        end);
                    end;
                end;
                v20 = v31(1);
            end;
        else
            v20 = v6(v15, v16);
        end;
        return v20:andThen(function(v37) --[[ Line: 78 ]]
            -- upvalues: v12 (ref), v14 (ref), v19 (copy), v8 (ref), v16 (ref), v9 (ref), v15 (ref), v10 (ref), v18 (ref), v17 (ref), v4 (ref)
            local l_responseBody_1 = v37.responseBody;
            if v12 then
                table.sort(l_responseBody_1, v14);
            end;
            v19:dispatch(v8(v16, l_responseBody_1));
            if l_responseBody_1 and type(l_responseBody_1) == "table" and #l_responseBody_1 > 0 then
                local v39 = {};
                for _, v41 in ipairs(l_responseBody_1) do
                    if v41.iconImageAssetId then
                        table.insert(v39, v41.iconImageAssetId);
                    end;
                end;
                v19:dispatch(v9(v15, v39));
            end;
            v19:dispatch(v10(v15, v18, v16, v17));
            return v4.resolve(v37);
        end, function(_) --[[ Line: 100 ]]
            -- upvalues: v4 (ref)
            return v4.resolve();
        end);
    end);
end;