local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.PurchasePromptDeps);
local l_Rodux_0 = v2.Rodux;
local l_Cryo_0 = v2.Cryo;
local v5 = require(l_script_FirstAncestor_0.Actions.SetABVariation);
return (l_Rodux_0.createReducer({}, {
    [v5.name] = function(v6, v7) --[[ Line: 10 ]]
        -- upvalues: l_Cryo_0 (copy)
        assert(type(v7.key) == "string", "Expected 'key' to be a string");
        assert(type(v7.variation) == "string", "Expected 'variation' to be a string");
        return l_Cryo_0.Dictionary.join(v6, {
            [v7.key] = v7.variation
        });
    end
}));