local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_makeActionCreator_0 = require(l_Parent_0.Rodux).makeActionCreator;
local _ = require(l_script_FirstAncestor_0.Models.RobuxUpsell);
local v7 = l_makeActionCreator_0(script.Name, function(v4, v5, v6) --[[ Line: 10 ]]
    return {
        products = v4, 
        selection = v5, 
        virtualItemBadgeType = v6
    };
end);
local v12 = {
    name = v7.name, 
    __call = function(_, v9, v10, v11) --[[ Line: 23 ]] --[[ Name: __call ]]
        -- upvalues: v7 (copy)
        return v7(v9, v10, v11);
    end
};
setmetatable(v12, v12);
return v12;