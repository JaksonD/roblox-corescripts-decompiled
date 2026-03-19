local l_Parent_0 = script.Parent.Parent;
local l_Promise_0 = require(l_Parent_0.dependencies).Promise;
local v2 = require(l_Parent_0.Requests.PostSendCode);
local _ = require(l_Parent_0.Common.otpLoginTypes);
local v4 = require(l_Parent_0.Flags.GetFFlagOtpLoginParseJsonErrorBody);
local v5 = require(l_Parent_0.Utils.parseOtpErrorBody);
local v6 = game:DefineFastFlag("CheckBodyForOtpErrors", false);
return function(v7, v8) --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_Promise_0 (copy), v4 (copy), v5 (copy), v6 (copy)
    return function() --[[ Line: 12 ]]
        -- upvalues: v2 (ref), v7 (copy), v8 (copy), l_Promise_0 (ref), v4 (ref), v5 (ref), v6 (ref)
        return v2(v7, v8):andThen(function(v9) --[[ Line: 13 ]]
            -- upvalues: l_Promise_0 (ref)
            return l_Promise_0.resolve(v9.responseBody);
        end):catch(function(v10) --[[ Line: 15 ]]
            -- upvalues: l_Promise_0 (ref), v4 (ref), v5 (ref), v6 (ref)
            if v10.data then
                return l_Promise_0.reject(v10.data.errorCode);
            else
                if v4() then
                    local v11 = v5(v10.Body);
                    if v11 then
                        return l_Promise_0.reject(v11);
                    end;
                end;
                if v6 and v10.Body and (type(v10.Body) == "number" or tonumber(v10.Body) ~= nil) then
                    return l_Promise_0.reject(v10.Body);
                elseif v10.StatusCode then
                    return l_Promise_0.reject(v10.StatusCode);
                else
                    return l_Promise_0.reject();
                end;
            end;
        end);
    end;
end;