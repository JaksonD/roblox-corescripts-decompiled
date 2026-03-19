local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(script.Parent.Parent.SQUAD_URL);
local _ = require(script.Parent.Parent.networkingSquadTypes);
return function(v3) --[[ Line: 7 ]]
    -- upvalues: v1 (copy), l_HttpService_0 (copy)
    local l_roduxNetworking_0 = v3.roduxNetworking;
    local v5 = nil;
    local v8 = l_roduxNetworking_0.POST({
        Name = "SquadInvite"
    }, function(v6, v7) --[[ Line: 13 ]]
        -- upvalues: v3 (copy), v5 (ref), v1 (ref), l_HttpService_0 (ref)
        if v3.useMockedResponse then
            v5 = {
                responseBody = {
                    channelUpgraded = false, 
                    parentChannelId = v7.parentChannelId, 
                    results = {
                        {
                            userId = 3447631062, 
                            resultStatus = {
                                resultType = "success", 
                                message = "message"
                            }
                        }
                    }
                }
            };
        end;
        return v6(v1):path("group-up"):path("v1"):path("invite"):body({
            groupUpId = v7.squadId, 
            invitedUserIds = v7.invitedUserIds, 
            parentChannelId = v7.parentChannelId, 
            isReparented = v7.isReparented, 
            requestId = l_HttpService_0:GenerateGUID()
        });
    end);
    if v3.useMockedResponse then
        v8.Mock.clear();
        v8.Mock.reply(function() --[[ Line: 44 ]]
            -- upvalues: v5 (ref)
            return v5;
        end);
    end;
    return v8;
end;