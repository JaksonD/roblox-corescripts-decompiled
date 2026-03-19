local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.Networking.NetworkingCatalog);
local v5 = require(l_script_FirstAncestor_0.Common.AssetInfo);
local v6 = require(l_script_FirstAncestor_0.Common.Enums);
return v2.createReducer({}, {
    [v4.GetItemAndBundleDetails.Succeeded.name] = function(v7, v8) --[[ Line: 23 ]]
        -- upvalues: v6 (copy), v5 (copy), v3 (copy)
        local v9 = {};
        for _, v11 in v8.responseBody.data do
            if v11.itemType == v6.ItemTypes.Asset then
                local v12 = v5.fromAsset(v11);
                v9[v12.id] = v12;
            end;
        end;
        return v3.Dictionary.union(v7, v9);
    end
});