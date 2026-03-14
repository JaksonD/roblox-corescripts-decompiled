local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxSquads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local _ = require(l_script_FirstAncestor_0.RoduxSquadsTypes);
return v2.makeActionCreator(script.Name, function(v4) --[[ Line: 6 ]]
    return {
        payload = {
            channelId = v4
        }
    };
end);