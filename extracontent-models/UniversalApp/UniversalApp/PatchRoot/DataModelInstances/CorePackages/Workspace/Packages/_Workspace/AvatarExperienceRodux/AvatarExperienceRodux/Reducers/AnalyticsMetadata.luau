local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Rodux);
local v4 = require(l_script_FirstAncestor_0.Actions.AddAnalyticsMetadata);
return v3.createReducer({}, {
    [v4.name] = function(v5, v6) --[[ Line: 18 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v5, v6.metadata);
    end
});