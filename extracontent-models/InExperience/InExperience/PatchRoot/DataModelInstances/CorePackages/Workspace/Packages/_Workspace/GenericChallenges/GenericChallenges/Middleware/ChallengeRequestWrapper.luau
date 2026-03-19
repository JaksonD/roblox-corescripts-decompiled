local l_Parent_0 = script:FindFirstAncestor("GenericChallenges").Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(script.Parent.IsChallengeHttpResponse);
local v4 = require(script.Parent.InterceptChallenge);
local _ = require(l_Parent_0.Http);
return function(v6, v7) --[[ Line: 13 ]]
    -- upvalues: v4 (copy), v1 (copy), v3 (copy), v2 (copy)
    local l_v4_0 = v4;
    if v7 ~= nil then
        l_v4_0 = v7;
    end;
    return function(v9, v10, v11) --[[ Line: 18 ]]
        -- upvalues: v6 (copy), v1 (ref), v3 (ref), v2 (ref), l_v4_0 (ref)
        local v12, v13 = v6(v9, v10, v11);
        return v12:andThen(function(v14) --[[ Line: 21 ]]
            -- upvalues: v1 (ref)
            return v1.resolve(v14);
        end):catch(function(v15) --[[ Line: 25 ]]
            -- upvalues: v3 (ref), v6 (ref), v9 (copy), v10 (copy), v2 (ref), v11 (copy), l_v4_0 (ref), v1 (ref)
            if v15.StatusCode ~= nil and v15.Headers ~= nil and v3(v15.StatusCode, v15.Headers) then
                local v17 = {
                    retryRequestCallback = function(v16) --[[ Line: 33 ]] --[[ Name: retryRequestCallback ]]
                        -- upvalues: v6 (ref), v9 (ref), v10 (ref), v2 (ref), v11 (ref)
                        return v6(v9, v10, v2.Dictionary.join(v11, {
                            headers = v16
                        }));
                    end, 
                    rawResponseHeaders = v15.Headers
                };
                return l_v4_0(v17);
            else
                return v1.reject(v15);
            end;
        end), v13;
    end;
end;