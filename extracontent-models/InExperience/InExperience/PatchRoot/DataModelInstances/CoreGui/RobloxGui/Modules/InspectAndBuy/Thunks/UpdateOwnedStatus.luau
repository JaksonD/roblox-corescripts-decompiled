local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Thunk);
local v2 = require(l_Parent_0.Constants);
local v3 = require(l_Parent_0.Models.BundleInfo);
local v4 = require(l_Parent_0.Models.AssetInfo);
local v5 = require(l_Parent_0.Actions.SetBundles);
local v6 = require(l_Parent_0.Actions.SetAssets);
return function(v7, v8) --[[ Line: 12 ]] --[[ Name: UpdateOwnedStatus ]]
    -- upvalues: v1 (copy), v2 (copy), v4 (copy), v6 (copy), v3 (copy), v5 (copy)
    return v1.new(script.Name, {}, function(v9, _) --[[ Line: 13 ]]
        -- upvalues: v8 (copy), v2 (ref), v7 (copy), v4 (ref), v6 (ref), v3 (ref), v5 (ref)
        local v11 = v9:getState();
        if v8 == v2.ItemType.Asset then
            if v11.assets[v7] then
                local v12 = v4.fromPurchaseSuccess(v7);
                v9:dispatch(v6({
                    v12
                }));
                return;
            end;
        elseif v8 == v2.ItemType.Bundle and v11.bundles[v7] then
            local v13 = v3.fromPurchaseSuccess(v7);
            v9:dispatch(v5({
                v13
            }));
        end;
    end);
end;