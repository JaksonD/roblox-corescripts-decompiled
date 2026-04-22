local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlayWithRewardState");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_makeActionCreator_0 = require(l_Parent_0.Rodux).makeActionCreator;
local _ = require(l_script_FirstAncestor_0.PlayWithRewardAdData);
return l_makeActionCreator_0(script.Name, function(v4, v5, v6, v7) --[[ Line: 11 ]]
    return {
        flowId = v4, 
        universeId = v5, 
        isAdDataExpected = v6, 
        adData = v7
    };
end);