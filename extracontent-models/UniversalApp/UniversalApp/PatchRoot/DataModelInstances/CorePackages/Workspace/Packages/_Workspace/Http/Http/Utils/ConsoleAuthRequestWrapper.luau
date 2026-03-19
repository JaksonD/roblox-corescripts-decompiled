local l_MessageBusService_0 = game:GetService("MessageBusService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Http");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_Parent_0.Cryo);
local l_Logging_0 = require(l_Parent_0.AppCommonLib).Logging;
local _ = require(l_script_FirstAncestor_0.RequestTypes);
return function(v7, v8, v9, v10) --[[ Line: 16 ]]
    -- upvalues: v3 (copy), l_MessageBusService_0 (copy), l_Logging_0 (copy), v4 (copy)
    return v3.new(function(v11, v12) --[[ Line: 17 ]]
        -- upvalues: v8 (copy), v9 (copy), l_MessageBusService_0 (ref), l_Logging_0 (ref), v10 (copy), v4 (ref), v7 (copy)
        local v13 = {
            url = v8, 
            method = v9
        };
        l_MessageBusService_0:MakeRequest("CredentialsProtocol", "getHeaders", v13, function(v14) --[[ Line: 22 ]]
            -- upvalues: l_Logging_0 (ref), v12 (copy), v10 (ref), v4 (ref), v7 (ref), v8 (ref), v9 (ref), v11 (copy)
            if not v14 or not v14.success then
                l_Logging_0.warn("credential headers error");
                v12({});
            end;
            v10.headers = v4.Dictionary.join(v10.headers or {}, v14.headers or {});
            return v7(v8, v9, v10):andThen(v11):catch(v12);
        end, {});
    end);
end;