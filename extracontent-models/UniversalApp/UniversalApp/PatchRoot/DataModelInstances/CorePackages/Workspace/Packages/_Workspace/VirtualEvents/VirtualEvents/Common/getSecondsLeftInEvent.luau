local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local v2 = require(l_script_FirstAncestor_0.Common.getVirtualEventDates);
return function(v3, v4) --[[ Line: 6 ]] --[[ Name: getSecondsLeftInEvent ]]
    -- upvalues: v2 (copy)
    local v5 = v2(v3);
    if v4.UnixTimestamp < v5.startDate.UnixTimestamp then
        return 1e999;
    elseif v4.UnixTimestamp > v5.endDate.UnixTimestamp then
        return 0;
    else
        return v5.endDate.UnixTimestamp - v5.startDate.UnixTimestamp - (v4.UnixTimestamp - v5.startDate.UnixTimestamp);
    end;
end;