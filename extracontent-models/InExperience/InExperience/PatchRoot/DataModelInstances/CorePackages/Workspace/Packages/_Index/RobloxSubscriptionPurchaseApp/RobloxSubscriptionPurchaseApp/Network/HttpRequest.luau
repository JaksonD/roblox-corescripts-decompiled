local l_Parent_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = {};
v2.__index = v2;
v2.new = function(v3) --[[ Line: 9 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v4 = setmetatable({}, v2);
    v4.http = v3 or game:GetService("HttpService");
    return v4;
end;
v2.post = function(v5, v6, v7) --[[ Line: 15 ]] --[[ Name: post ]]
    -- upvalues: v1 (copy)
    return v1.new(function(v8, v9) --[[ Line: 16 ]]
        -- upvalues: v5 (copy), v6 (copy), v7 (copy)
        v5.http:RequestInternal({
            Url = v6, 
            Method = "POST", 
            Headers = {
                ["Content-Type"] = "application/json", 
                Accept = "application/json"
            }, 
            Body = v5.http:JSONEncode(v7)
        }):Start(function(_, v11) --[[ Line: 27 ]]
            -- upvalues: v8 (copy), v5 (ref), v9 (copy)
            if v11.StatusCode == 200 then
                v8(v5.http:JSONDecode(v11.Body));
                return;
            else
                v9({
                    status = v11.StatusCode, 
                    body = v11.Body
                });
                return;
            end;
        end);
    end);
end;
return v2;