local l_Parent_0 = script.Parent.Parent;
local l_Promise_0 = require(l_Parent_0.dependencies).Promise;
local v2 = require(l_Parent_0.Requests.PostSendCode);
local _ = require(l_Parent_0.Common.otpLoginTypes);
local v4 = require(l_Parent_0.Flags.GetFFlagOtpLoginParseJsonErrorBody);
local v5 = require(l_Parent_0.Utils.parseOtpErrorBody);
return function(v6, v7) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), l_Promise_0 (copy), v4 (copy), v5 (copy)
    return function() --[[ Line: 10 ]]
        -- upvalues: v2 (ref), v6 (copy), v7 (copy), l_Promise_0 (ref), v4 (ref), v5 (ref)
        return v2(v6, v7):andThen(function(v8) --[[ Line: 11 ]]
            -- upvalues: l_Promise_0 (ref)
            return l_Promise_0.resolve(v8.responseBody);
        end):catch(function(v9) --[[ Line: 13 ]]
            -- upvalues: l_Promise_0 (ref), v4 (ref), v5 (ref)
            if v9.data then
                return l_Promise_0.reject(v9.data.errorCode);
            else
                if v4() then
                    local v10 = v5(v9.Body);
                    if v10 then
                        return l_Promise_0.reject(v10);
                    end;
                end;
                if v9.Body and (type(v9.Body) == "number" or tonumber(v9.Body) ~= nil) then
                    return l_Promise_0.reject(v9.Body);
                elseif v9.StatusCode then
                    return l_Promise_0.reject(v9.StatusCode);
                else
                    return l_Promise_0.reject();
                end;
            end;
        end);
    end;
end;