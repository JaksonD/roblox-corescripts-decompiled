local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local _ = require(l_Parent_0.SocialCommon);
local v4 = require(l_script_FirstAncestor_0.Actions.EnteredChatFromEntryPoint);
return v2.createReducer("NotSet", {
    [v4.name] = function(_, v6) --[[ Line: 11 ]]
        return v6.entryPoint;
    end
});