local v0 = require(script.Parent.Parent.SHARELINKS_URL);
local _ = require(script.Parent.Parent.networkingShareLinkTypes);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Packages");
local v3 = require(l_script_FirstAncestor_0.tutils);
local l_HttpService_0 = game:GetService("HttpService");
return function(v5) --[[ Line: 9 ]]
    -- upvalues: v3 (copy), v0 (copy), l_HttpService_0 (copy)
    local v9 = v5.roduxNetworking.POST({
        Name = "get-or-create-link"
    }, function(v6, v7) --[[ Line: 14 ]]
        -- upvalues: v3 (ref), v0 (ref), l_HttpService_0 (ref)
        local v8 = v3.deepCopy(v7);
        v8.linkType = nil;
        return v6(v0):path("v1"):path("get-or-create-link"):body({
            linkType = v7.linkType, 
            data = if next(v8) ~= nil then l_HttpService_0:JSONEncode(v8) else nil
        });
    end);
    if v5.useMockedResponse then
        v9.Mock.clear();
        v9.Mock.reply(function() --[[ Line: 27 ]]
            return {
                responseBody = {
                    linkId = "42685"
                }
            };
        end);
    end;
    return v9;
end;