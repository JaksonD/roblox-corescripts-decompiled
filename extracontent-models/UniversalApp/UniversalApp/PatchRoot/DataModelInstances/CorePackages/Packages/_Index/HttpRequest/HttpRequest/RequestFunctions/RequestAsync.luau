local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(script.Parent.Util.getHeaders);
local v2 = require(script.Parent.Util.getPostBody);
return function(v3, v4, v5) --[[ Line: 6 ]]
    -- upvalues: l_HttpService_0 (copy), v2 (copy), v1 (copy)
    return {
        Start = function(_, v7) --[[ Line: 8 ]] --[[ Name: Start ]]
            -- upvalues: l_HttpService_0 (ref), v3 (copy), v4 (copy), v2 (ref), v5 (copy), v1 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 9 ]]
                -- upvalues: l_HttpService_0 (ref), v3 (ref), v4 (ref), v2 (ref), v5 (ref), v1 (ref)
                return l_HttpService_0:RequestAsync({
                    Url = v3, 
                    Method = v4, 
                    Body = v2(v5.postBody, v4), 
                    Headers = v1(v5.headers, v4)
                });
            end);
            v7(l_status_0, l_result_0);
        end, 
        Cancel = function() --[[ Line: 20 ]] --[[ Name: Cancel ]]

        end
    };
end;