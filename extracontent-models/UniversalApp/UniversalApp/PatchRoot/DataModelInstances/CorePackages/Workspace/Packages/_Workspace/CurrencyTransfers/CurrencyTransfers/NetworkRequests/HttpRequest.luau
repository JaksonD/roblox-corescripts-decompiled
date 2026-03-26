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
v4.get = function(v7, v8) --[[ Line: 16 ]] --[[ Name: get ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.new(function(v9, v10) --[[ Line: 17 ]]
        -- upvalues: v7 (copy), v8 (copy), v3 (ref)
        v7.http:RequestInternal({
            Url = v8, 
            Method = "GET", 
            Headers = {
                Accept = "application/json"
            }
        }):Start(function(_, v12) --[[ Line: 26 ]]
            -- upvalues: v9 (copy), v7 (ref), v3 (ref), v10 (copy)
            if v12.StatusCode == 200 then
                v9(v7.http:JSONDecode(v12.Body));
                return;
            elseif v12.StatusCode == 400 or v12.StatusCode == 403 then
                local v13 = if v12.Body and v12.Body ~= "" then v7.http:JSONDecode(v12.Body) else nil;
                if v13 then
                    local v14 = v3.format(v13);
                    v10(v14);
                    return;
                else
                    v10({
                        status = v12.StatusCode, 
                        body = v12.Body
                    });
                    return;
                end;
            else
                v10({
                    status = v12.StatusCode, 
                    body = v12.Body
                });
                return;
            end;
        end);
    end);
end;
v4.post = function(v15, v16, v17) --[[ Line: 53 ]] --[[ Name: post ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.new(function(v18, v19) --[[ Line: 54 ]]
        -- upvalues: v15 (copy), v16 (copy), v17 (copy), v3 (ref)
        v15.http:RequestInternal({
            Url = v16, 
            Method = "POST", 
            Headers = {
                ["Content-Type"] = "application/json", 
                Accept = "application/json"
            }, 
            Body = v15.http:JSONEncode(v17)
        }):Start(function(_, v21) --[[ Line: 65 ]]
            -- upvalues: v18 (copy), v15 (ref), v3 (ref), v19 (copy)
            if v21.StatusCode == 200 then
                v18(v15.http:JSONDecode(v21.Body));
                return;
            elseif v21.StatusCode == 400 or v21.StatusCode == 403 then
                local v22 = if v21.Body and v21.Body ~= "" then v15.http:JSONDecode(v21.Body) else nil;
                if v22 then
                    local v23 = v3.format(v22);
                    v19(v23);
                    return;
                else
                    v19({
                        status = v21.StatusCode, 
                        body = v21.Body
                    });
                    return;
                end;
            else
                v19({
                    status = v21.StatusCode, 
                    body = v21.Body
                });
                return;
            end;
        end);
    end);
end;
return v4;