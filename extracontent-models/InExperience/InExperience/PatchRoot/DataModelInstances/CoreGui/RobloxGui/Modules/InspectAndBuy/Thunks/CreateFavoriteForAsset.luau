local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Thunk);
local v5 = require(l_Parent_0.Services.Network);
local v6 = require(l_Parent_0.Services.Analytics);
local v7 = require(l_Parent_0.Actions.SetFavoriteAsset);
local v8 = require(l_Parent_0.Actions.SetAssets);
local v9 = require(l_Parent_0.Models.AssetInfo);
local v10 = require(l_Parent_0.createInspectAndBuyKeyMapper);
local v11 = require(l_Parent_0.Thunks.SendCounter);
local v12 = require(l_Parent_0.Constants);
local v13 = {
    v5, 
    v6
};
local v14 = v10("createFavoriteForAsset");
return function(v15) --[[ Line: 26 ]] --[[ Name: CreateFavoriteForAsset ]]
    -- upvalues: v4 (copy), v13 (copy), v5 (copy), v6 (copy), v14 (copy), l_PerformFetch_0 (copy), v7 (copy), v9 (copy), v8 (copy), v11 (copy), v12 (copy), v1 (copy)
    return v4.new(script.Name, v13, function(v16, v17) --[[ Line: 27 ]]
        -- upvalues: v5 (ref), v6 (ref), v14 (ref), v15 (copy), l_PerformFetch_0 (ref), v7 (ref), v9 (ref), v8 (ref), v11 (ref), v12 (ref), v1 (ref)
        local v18 = v17[v5];
        local v19 = v17[v6];
        local v20 = v14(v16:getState().storeId, v15);
        return l_PerformFetch_0.Single(v20, function(_) --[[ Line: 33 ]]
            -- upvalues: v18 (copy), v15 (ref), v16 (copy), v7 (ref), v9 (ref), v8 (ref), v19 (copy), v11 (ref), v12 (ref), v1 (ref)
            return v18.createFavoriteForAsset(v15):andThen(function() --[[ Line: 34 ]]
                -- upvalues: v16 (ref), v7 (ref), v15 (ref), v9 (ref), v8 (ref), v19 (ref), v11 (ref), v12 (ref), v1 (ref)
                v16:dispatch(v7(v15, true));
                local l_numFavorites_0 = v16:getState().assets[v15].numFavorites;
                local v23 = v9.fromGetAssetFavoriteCount(v15, l_numFavorites_0 + 1);
                v16:dispatch(v8({
                    v23
                }));
                v19.reportFavoriteItem("Asset", v15, true, true, "", l_numFavorites_0 + 1);
                v16:dispatch(v11(v12.Counters.CreateFavoriteForAsset .. v12.CounterSuffix.RequestSucceeded));
                return v1.resolve();
            end, function(v24) --[[ Line: 46 ]]
                -- upvalues: v16 (ref), v11 (ref), v12 (ref), v1 (ref)
                v16:dispatch(v11(v12.Counters.CreateFavoriteForAsset .. v12.CounterSuffix.RequestRejected));
                return v1.reject((tostring(v24.StatusMessage)));
            end);
        end)(v16):catch(function(v25) --[[ Line: 52 ]]
            -- upvalues: v16 (copy), v15 (ref), v19 (copy), v11 (ref), v12 (ref)
            local l_numFavorites_1 = v16:getState().assets[v15].numFavorites;
            v19.reportFavoriteItem("Asset", v15, true, false, v25, l_numFavorites_1);
            v16:dispatch(v11(v12.Counters.CreateFavoriteForAsset .. v12.CounterSuffix.RequestFailed));
        end);
    end);
end;