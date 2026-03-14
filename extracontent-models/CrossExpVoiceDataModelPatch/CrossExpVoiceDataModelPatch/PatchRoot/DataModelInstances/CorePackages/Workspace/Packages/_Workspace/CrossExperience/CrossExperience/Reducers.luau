local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperience");
local l_Rodux_0 = require(l_script_FirstAncestor_0.dependencies).Rodux;
local v2 = require(script.Participants);
local v3 = require(script.Experience);
return function(v4) --[[ Line: 9 ]]
    -- upvalues: l_Rodux_0 (copy), v2 (copy), v3 (copy)
    local v5 = nil;
    local v6 = nil;
    if v4 and v4.Participants then
        v5 = v4.Participants;
    end;
    if v4 and v4.Experience then
        v6 = v4.Experience;
    end;
    return l_Rodux_0.combineReducers({
        Participants = v2(v5), 
        Experience = v3(v6)
    });
end;