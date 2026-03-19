local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.API_URL);
local _ = require(l_Parent_0.Types.networkRequestsTypes);
return function(v3) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    return v3.roduxNetworking.POST({
        Name = "UploadContactsByUser"
    }, function(v4, v5) --[[ Line: 10 ]]
        -- upvalues: v1 (ref)
        return v4(v1):path("contacts-api"):path("v1"):path("contacts"):body({
            contacts = v5
        });
    end);
end;