local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.Networking.NetworkingCurrentlyWearing);
local v5 = require(l_script_FirstAncestor_0.Common.AssetInfo);
return v2.createReducer({}, {
    [v4.GetItemDetails.Succeeded.name] = function(v6, v7) --[[ Line: 23 ]]
        -- upvalues: v5 (copy), v3 (copy)
        local v8 = {};
        for _, v10 in v7.responseBody.data do
            local v11 = v5.fromAsset(v10);
            v8[v11.id] = v11;
        end;
        return v3.Dictionary.join(v6, v8);
    end
});