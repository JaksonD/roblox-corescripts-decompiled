local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_script_FirstAncestor_0.Actions.AvatarExperienceLoaded);
return v2.createReducer(false, {
    [v3.name] = function(_, _) --[[ Line: 10 ]]
        return true;
    end
});