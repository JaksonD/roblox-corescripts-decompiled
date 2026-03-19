local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_script_FirstAncestor_0.Actions.SetAppLoaded);
return v2.createReducer(false, {
    [v3.name] = function(_, v5) --[[ Line: 9 ]]
        return v5.value;
    end
});