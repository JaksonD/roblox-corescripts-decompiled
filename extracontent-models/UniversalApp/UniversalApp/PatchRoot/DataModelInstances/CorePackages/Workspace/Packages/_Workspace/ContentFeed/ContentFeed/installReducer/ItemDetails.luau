local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local v3 = require(l_Parent_1.Cryo);
local l_NetworkingCurrentlyWearing_0 = require(l_Parent_0.App.Networking).NetworkingCurrentlyWearing;
local v5 = require(l_Parent_0.Utils.getAssetInfo);
return v2.createReducer({}, {
    [l_NetworkingCurrentlyWearing_0.GetItemDetails.Succeeded.name] = function(v6, v7) --[[ Line: 15 ]]
        -- upvalues: v5 (copy), v3 (copy)
        local v8 = {};
        for _, v10 in v7.responseBody.data do
            local v11 = v5.fromAsset(v10);
            v8[v11.id] = v11;
        end;
        return v3.Dictionary.join(v6, v8);
    end
});