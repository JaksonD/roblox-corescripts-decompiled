local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Actions.SetExperienceInfo);
return v2.createReducer({}, {
    [v4.name] = function(v5, v6) --[[ Line: 12 ]]
        -- upvalues: v1 (copy)
        local l_experienceInfo_0 = v6.experienceInfo;
        local l_universeId_0 = l_experienceInfo_0.universeId;
        assert(l_universeId_0 ~= nil, "Expected a universe id when setting an experiences's information.");
        local v9 = v5[l_universeId_0] or {};
        local v10 = v1.Dictionary.join(v9, l_experienceInfo_0);
        return v1.Dictionary.join(v5, {
            [l_universeId_0] = v10
        });
    end
});