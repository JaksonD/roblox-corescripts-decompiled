local l_Parent_0 = script:FindFirstAncestor("CommunityLinks").Parent;
local v1 = require(l_Parent_0.Rodux);
local v2 = require(l_Parent_0.Cryo);
local _ = require(script.Parent.Parent.Models.CommunityInfo);
local v4 = require(script.Parent.Parent.Actions.SetExperienceCommunityLink);
return v1.createReducer({}, {
    [v4.name] = function(v5, v6) --[[ Line: 14 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v5, {
            [v6.universeId] = v6.communityLink
        });
    end
});