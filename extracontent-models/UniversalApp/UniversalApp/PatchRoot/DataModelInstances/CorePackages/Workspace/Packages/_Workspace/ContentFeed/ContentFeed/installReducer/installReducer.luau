local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Rodux);
local v2 = require(script.Parent.Inspect);
local v3 = require(script.Parent.ItemDetails);
return function() --[[ Line: 14 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    return v1.combineReducers({
        Inspect = v2, 
        ItemAssets = v3
    });
end;