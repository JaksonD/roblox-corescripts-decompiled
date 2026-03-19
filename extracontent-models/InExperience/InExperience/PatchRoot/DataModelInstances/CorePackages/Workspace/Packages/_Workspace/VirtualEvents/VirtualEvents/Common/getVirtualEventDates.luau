local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
return function(v2) --[[ Line: 10 ]] --[[ Name: getVirtualEventDates ]]
    local v3 = if v2.eventTime and v2.eventTime.startUtc then DateTime.fromIsoDate(v2.eventTime.startUtc) else nil;
    local v4 = if v2.eventTime and v2.eventTime.endUtc then DateTime.fromIsoDate(v2.eventTime.endUtc) else nil;
    return {
        startDate = v3 or DateTime.now(), 
        endDate = v4 or DateTime.now()
    };
end;