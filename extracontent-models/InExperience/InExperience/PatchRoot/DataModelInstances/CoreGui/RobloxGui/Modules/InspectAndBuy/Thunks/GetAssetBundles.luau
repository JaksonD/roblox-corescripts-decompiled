local l_CorePackages_0 = game:GetService("CorePackages");
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Thunk);
local v4 = require(l_Parent_0.Services.Network);
local v5 = require(l_Parent_0.Models.BundleInfo);
local v6 = require(l_Parent_0.Actions.SetBundles);
local v7 = require(l_Parent_0.Thunks.GetProductInfo);
local v8 = require(l_Parent_0.createInspectAndBuyKeyMapper);
local v9 = require(l_Parent_0.Actions.SetAssetToBundlesMapping);
local v10 = require(l_Parent_0.Thunks.SendCounter);
local v11 = require(l_Parent_0.Constants);
local v12 = {
    v4
};
local v13 = v8("getAssetBundles");
return function(v14) --[[ Line: 23 ]] --[[ Name: GetAssetBundles ]]
    -- upvalues: v3 (copy), v12 (copy), v4 (copy), v13 (copy), l_PerformFetch_0 (copy), v5 (copy), v7 (copy), v6 (copy), v9 (copy), v10 (copy), v11 (copy)
    return v3.new(script.Name, v12, function(v15, v16) --[[ Line: 24 ]]
        -- upvalues: v4 (ref), v13 (ref), v14 (copy), l_PerformFetch_0 (ref), v5 (ref), v7 (ref), v6 (ref), v9 (ref), v10 (ref), v11 (ref)
        local v17 = v16[v4];
        local v18 = v13(v15:getState().storeId, v14);
        return l_PerformFetch_0.Single(v18, function(_) --[[ Line: 29 ]]
            -- upvalues: v17 (copy), v14 (ref), v5 (ref), v15 (copy), v7 (ref), v6 (ref), v9 (ref), v10 (ref), v11 (ref)
            return v17.getAssetBundles(v14):andThen(function(v20) --[[ Line: 30 ]]
                -- upvalues: v5 (ref), v15 (ref), v7 (ref), v6 (ref), v9 (ref), v14 (ref), v10 (ref), v11 (ref)
                local v21 = {};
                local v22 = {};
                for _, v24 in pairs(v20.data) do
                    local v25 = v5.fromGetAssetBundles(v24);
                    table.insert(v22, v25);
                    table.insert(v21, (tostring(v25.bundleId)));
                    local v26 = false;
                    for _, v28 in pairs(v24.items) do
                        if v28.type == "UserOutfit" then
                            v26 = true;
                            break;
                        end;
                    end;
                    if not v26 then
                        for _, v30 in pairs(v24.items) do
                            if not v15:getState().assets[v30.id] then
                                coroutine.wrap(function() --[[ Line: 54 ]]
                                    -- upvalues: v15 (ref), v7 (ref), v30 (copy)
                                    v15:dispatch(v7(v30.id));
                                end)();
                            end;
                        end;
                    end;
                end;
                v15:dispatch(v6(v22));
                v15:dispatch(v9(tostring(v14), v21));
                v15:dispatch(v10(v11.Counters.GetAssetBundles .. v11.CounterSuffix.RequestSucceeded));
            end, function(_) --[[ Line: 69 ]]
                -- upvalues: v15 (ref), v10 (ref), v11 (ref)
                v15:dispatch(v10(v11.Counters.GetAssetBundles .. v11.CounterSuffix.RequestRejected));
            end);
        end)(v15):catch(function(_) --[[ Line: 74 ]]
            -- upvalues: v15 (copy), v10 (ref), v11 (ref)
            v15:dispatch(v10(v11.Counters.GetAssetBundles .. v11.CounterSuffix.RequestFailed));
        end);
    end);
end;