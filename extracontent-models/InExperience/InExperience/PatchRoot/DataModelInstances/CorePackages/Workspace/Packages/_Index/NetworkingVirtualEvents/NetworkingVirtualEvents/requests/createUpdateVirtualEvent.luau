local l_script_FirstAncestor_0 = script:FindFirstAncestor("NetworkingVirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.Http);
local _ = require(l_script_FirstAncestor_0.types);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    return (v3.POST(script.Name, function(v4, v5, v6) --[[ Line: 9 ]]
        -- upvalues: v1 (ref)
        local l_eventTime_0 = v6.eventTime;
        return v4(v1.Url.APIS_URL):path("virtual-events"):path("v1"):path("virtual-events"):id(v5):body({
            title = v6.title, 
            description = v6.description, 
            eventTime = if l_eventTime_0 then {
                startTime = l_eventTime_0.startTime:ToIsoDate(), 
                endTime = l_eventTime_0.endTime:ToIsoDate()
            } else nil, 
            universeId = v6.universeId
        });
    end));
end;