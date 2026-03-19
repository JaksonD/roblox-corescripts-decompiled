local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.API_URL);
local _ = require(l_Parent_0.networkingShareLinkTypes);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    local v6 = v3.roduxNetworking.POST({
        Name = "resolve-link"
    }, function(v4, v5) --[[ Line: 11 ]]
        -- upvalues: v1 (ref)
        return v4(v1):path("sharelinks"):path("v1"):path("resolve-link"):body({
            linkType = v5.linkType, 
            linkId = v5.linkId
        });
    end);
    if v3.useMockedResponse then
        v6.Mock.clear();
        v6.Mock.reply(function() --[[ Line: 21 ]]
            return {
                responseBody = {
                    experienceInviteData = {
                        instanceId = "ABCDEF", 
                        inviterId = 46430379, 
                        placeId = 1818, 
                        status = "Valid", 
                        universeId = 13058
                    }
                }
            };
        end);
    end;
    return v6;
end;