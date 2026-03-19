local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v4 = require(l_Actions_0.ShowLikelySpeakingBubblesChanged);
return v2.createReducer(false, {
    [v4.name] = function(_, v6) --[[ Line: 9 ]]
        return v6.showLikelySpeakingBubbles;
    end
});