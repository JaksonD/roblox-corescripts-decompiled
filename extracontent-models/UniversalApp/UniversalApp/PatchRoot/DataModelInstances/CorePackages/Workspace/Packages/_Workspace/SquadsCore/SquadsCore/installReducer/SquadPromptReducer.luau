local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Actions.SetSquadPrompt);
local v3 = require(l_script_FirstAncestor_0.Actions.CloseSquadPrompt);
local v4 = require(l_Parent_0.Cryo);
return require(l_Parent_0.Rodux).createReducer({
    arguments = {}
}, {
    [v2.name] = function(v5, v6) --[[ Line: 13 ]]
        -- upvalues: v4 (copy)
        return v4.Dictionary.join(v5, {
            arguments = v6.arguments or {}
        });
    end, 
    [v3.name] = function(_, _) --[[ Line: 18 ]]
        return {
            arguments = {}
        };
    end
});