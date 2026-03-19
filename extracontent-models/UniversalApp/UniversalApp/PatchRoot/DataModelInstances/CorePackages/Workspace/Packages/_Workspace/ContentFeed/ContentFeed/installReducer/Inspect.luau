local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Cryo);
local v3 = require(l_Parent_1.Rodux);
local v4 = require(l_Parent_0.Actions.InspectClosed);
local v5 = require(l_Parent_0.Actions.InspectOpened);
local v6 = {
    IsOpen = false, 
    AssetIds = {}
};
return v3.createReducer(v6, {
    [v4.name] = function(v7, _) --[[ Line: 21 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v7, {
            IsOpen = false
        });
    end, 
    [v5.name] = function(v9, v10) --[[ Line: 27 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v9, {
            IsOpen = true, 
            AssetIds = v10.assetIds
        });
    end
});