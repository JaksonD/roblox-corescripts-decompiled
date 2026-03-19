local l_CorePackages_0 = game:GetService("CorePackages");
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Thunk);
local v4 = require(l_Parent_0.Services.Network);
local v5 = require(l_Parent_0.Thunks.SendCounter);
local v6 = require(l_Parent_0.Constants);
local v7 = require(l_Parent_0.Actions.SetAssets);
local v8 = require(l_Parent_0.Thunks.GetProductInfo);
local v9 = require(l_Parent_0.Thunks.GetAssetBundles);
local v10 = require(l_Parent_0.Thunks.GetVersionInfo);
local v11 = {
    v4
};
return function(v12) --[[ Line: 19 ]] --[[ Name: BatchGetAssets ]]
    -- upvalues: v3 (copy), v11 (copy), v4 (copy), l_PerformFetch_0 (copy), v8 (copy), v9 (copy), v10 (copy), v7 (copy), v5 (copy), v6 (copy)
    return v3.new(script.Name, v11, function(v13, v14) --[[ Line: 20 ]]
        -- upvalues: v4 (ref), v12 (copy), l_PerformFetch_0 (ref), v8 (ref), v9 (ref), v10 (ref), v7 (ref), v5 (ref), v6 (ref)
        local v15 = v14[v4];
        local v16 = {};
        if v12 then
            for _, v18 in v12 do
                table.insert(v16, (tonumber(v18.assetId)));
            end;
        end;
        return l_PerformFetch_0.Single("BatchGetAssets", function() --[[ Line: 30 ]]
            -- upvalues: v15 (copy), v16 (copy), v13 (copy), v8 (ref), v9 (ref), v10 (ref), v7 (ref), v5 (ref), v6 (ref)
            return v15.getBatchItemDetails(v16, Enum.AvatarItemType.Asset):andThen(function(v19) --[[ Line: 31 ]]
                -- upvalues: v13 (ref), v8 (ref), v9 (ref), v10 (ref), v7 (ref), v5 (ref), v6 (ref)
                local v20 = {};
                for _, v22 in v19 do
                    table.insert(v20, {
                        assetId = tostring(v22.Id)
                    });
                end;
                for _, v24 in v20 do
                    coroutine.wrap(function() --[[ Line: 38 ]]
                        -- upvalues: v13 (ref), v8 (ref), v24 (copy), v9 (ref), v10 (ref)
                        v13:dispatch(v8(v24.assetId));
                        if v24.parentBundleId == nil then
                            v13:dispatch(v9(v24.assetId));
                        end;
                        v13:dispatch(v10(v24.assetId));
                    end)();
                end;
                v13:dispatch(v7(v20));
                v13:dispatch(v5(v6.Counters.BatchGetAssets .. v6.CounterSuffix.RequestSucceeded));
            end, function(_) --[[ Line: 60 ]]
                -- upvalues: v13 (ref), v5 (ref), v6 (ref)
                v13:dispatch(v5(v6.Counters.BatchGetAssets .. v6.CounterSuffix.RequestRejected));
            end);
        end)(v13):catch(function(_) --[[ Line: 65 ]]
            -- upvalues: v13 (copy), v5 (ref), v6 (ref)
            v13:dispatch(v5(v6.Counters.BatchGetAssets .. v6.CounterSuffix.RequestFailed));
        end);
    end);
end;