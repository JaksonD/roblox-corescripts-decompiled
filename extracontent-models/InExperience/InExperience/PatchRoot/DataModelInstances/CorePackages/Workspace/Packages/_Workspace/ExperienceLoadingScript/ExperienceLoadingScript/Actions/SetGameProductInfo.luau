local l_Parent_0 = script:FindFirstAncestor("ExperienceLoadingScript").Parent;
local v1 = require(l_Parent_0.Rodux);
local v2 = require(l_Parent_0.ArgCheck);
return v1.makeActionCreator(script.Name, function(v3) --[[ Line: 7 ]]
    -- upvalues: v2 (copy)
    v2.isType(v3, "table", "SetGameProductInfo action expects productInfo to be a table");
    return {
        productInfo = v3
    };
end);