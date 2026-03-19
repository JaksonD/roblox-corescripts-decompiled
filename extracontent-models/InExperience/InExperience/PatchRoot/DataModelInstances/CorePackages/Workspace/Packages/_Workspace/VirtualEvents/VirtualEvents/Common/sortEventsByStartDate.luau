local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
return function(v2) --[[ Line: 7 ]] --[[ Name: sortEventsByStartDate ]]
    local v3 = table.clone(v2);
    table.sort(v3, function(v4, v5) --[[ Line: 9 ]]
        if v4.eventTime and v4.eventTime.startUtc and v5.eventTime and v5.eventTime.startUtc then
            local v6 = DateTime.fromIsoDate(v4.eventTime.startUtc) or DateTime.now();
            local v7 = DateTime.fromIsoDate(v5.eventTime.startUtc) or DateTime.now();
            return v6.UnixTimestamp < v7.UnixTimestamp;
        else
            return true;
        end;
    end);
    return v3;
end;