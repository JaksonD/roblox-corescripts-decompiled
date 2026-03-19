local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlayWithRewardState");
local v1 = require(l_script_FirstAncestor_0.SetPlayWithRewardState);
local _ = require(l_script_FirstAncestor_0.PlayWithRewardAdData);
local v3 = {
    flowId = "", 
    universeId = "", 
    adData = nil
};
return function(v4, v5) --[[ Line: 22 ]]
    -- upvalues: v3 (copy), v1 (copy)
    local v6 = v4 or table.clone(v3);
    if v5.type == v1.name then
        return {
            flowId = v5.flowId, 
            universeId = v5.universeId, 
            adData = v5.adData
        };
    else
        return v6;
    end;
end;