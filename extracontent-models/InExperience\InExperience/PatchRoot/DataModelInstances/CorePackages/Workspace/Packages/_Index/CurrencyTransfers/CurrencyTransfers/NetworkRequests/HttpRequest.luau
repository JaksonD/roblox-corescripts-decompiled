local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_script_FirstAncestor_0.Models.ErrorTransferModel);
local v4 = {};
v4.__index = v4;
v4.new = function(v5) --[[ Line: 10 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    local v6 = setmetatable({}, v4);
    v6.http = v5 or game:GetService("HttpService");
    return v6;
end;
v4.post = function(v7, v8, v9) --[[ Line: 16 ]] --[[ Name: post ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.new(function(v10, v11) --[[ Line: 17 ]]
        -- upvalues: v7 (copy), v8 (copy), v9 (copy), v3 (ref)
        v7.http:RequestInternal({
            Url = v8, 
            Method = "POST", 
            Headers = {
                ["Content-Type"] = "application/json", 
                Accept = "application/json"
            }, 
            Body = v7.http:JSONEncode(v9)
        }):Start(function(_, v13) --[[ Line: 28 ]]
            -- upvalues: v10 (copy), v7 (ref), v3 (ref), v11 (copy)
            if v13.StatusCode == 200 then
                v10(v7.http:JSONDecode(v13.Body));
                return;
            elseif v13.StatusCode == 400 then
                local v14 = if v13.Body and v13.Body ~= "" then v7.http:JSONDecode(v13.Body) else nil;
                if v14 then
                    local v15 = v3.format(v14);
                    v11(v15);
                    return;
                else
                    v11({
                        status = v13.StatusCode, 
                        body = v13.Body
                    });
                    return;
                end;
            else
                v11({
                    status = v13.StatusCode, 
                    body = v13.Body
                });
                return;
            end;
        end);
    end);
end;
return v4;