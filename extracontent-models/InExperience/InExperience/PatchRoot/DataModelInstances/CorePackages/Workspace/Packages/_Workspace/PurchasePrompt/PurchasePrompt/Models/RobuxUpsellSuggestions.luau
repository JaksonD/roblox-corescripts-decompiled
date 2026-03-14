local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Models.RobuxUpsell);
local v3 = {
    new = function(v2) --[[ Line: 17 ]] --[[ Name: new ]]
        return {
            products = v2
        };
    end
};
v3.fromJson = function(v4) --[[ Line: 25 ]] --[[ Name: fromJson ]]
    -- upvalues: v1 (copy), v3 (copy)
    local v5 = {};
    for v6, v7 in pairs(v4.products) do
        v5[v6] = v1.fromJson(v7);
    end;
    return v3.new(v5);
end;
return v3;