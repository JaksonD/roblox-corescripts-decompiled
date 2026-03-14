local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.API_URL);
local _ = require(l_Parent_0.Types.networkRequestsTypes);
return function(v3) --[[ Line: 7 ]]
    -- upvalues: v1 (copy)
    return v3.roduxNetworking.POST({
        Name = "UploadContactsByUser"
    }, function(v4, v5) --[[ Line: 12 ]]
        -- upvalues: v1 (ref)
        return v4(v1):path("contacts-api"):path("v1"):path("contacts"):body({
            countryCode = v5.countryCode, 
            contacts = v5.contacts, 
            source = v5.source
        });
    end);
end;