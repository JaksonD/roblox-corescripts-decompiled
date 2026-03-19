local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.API_URL);
local _ = require(l_Parent_0.networkingShareLinkTypes);
local v4 = require(l_Parent_1.tutils);
local l_HttpService_0 = game:GetService("HttpService");
return function(v6) --[[ Line: 10 ]]
    -- upvalues: v4 (copy), v2 (copy), l_HttpService_0 (copy)
    local v10 = v6.roduxNetworking.POST({
        Name = "get-or-create-link"
    }, function(v7, v8) --[[ Line: 15 ]]
        -- upvalues: v4 (ref), v2 (ref), l_HttpService_0 (ref)
        local v9 = v4.deepCopy(v8);
        v9.linkType = nil;
        return v7(v2):path("sharelinks"):path("v1"):path("get-or-create-link"):body({
            linkType = v8.linkType, 
            data = if next(v9) ~= nil then l_HttpService_0:JSONEncode(v9) else nil
        });
    end);
    if v6.useMockedResponse then
        v10.Mock.clear();
        v10.Mock.reply(function() --[[ Line: 28 ]]
            return {
                responseBody = {
                    linkId = "42685"
                }
            };
        end);
    end;
    return v10;
end;