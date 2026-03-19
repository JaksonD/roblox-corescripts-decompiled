local l_HttpService_0 = game:GetService("HttpService");
return function(v1, v2) --[[ Line: 3 ]] --[[ Name: makeHttpServiceMock ]]
    -- upvalues: l_HttpService_0 (copy)
    return {
        lastRequestParams = nil, 
        lastEncodedBody = nil, 
        RequestInternal = function(v3, v4) --[[ Line: 9 ]] --[[ Name: RequestInternal ]]
            -- upvalues: l_HttpService_0 (ref), v2 (copy), v1 (copy)
            v3.lastRequestParams = v4;
            return {
                Start = function(_, v6) --[[ Line: 12 ]] --[[ Name: Start ]]
                    -- upvalues: l_HttpService_0 (ref), v2 (ref), v1 (ref)
                    task.defer(function() --[[ Line: 13 ]]
                        -- upvalues: l_HttpService_0 (ref), v2 (ref), v1 (ref), v6 (copy)
                        local v7 = {
                            Body = l_HttpService_0:JSONEncode(v2 or {}), 
                            StatusCode = v1
                        };
                        v6(true, v7);
                    end);
                end
            };
        end, 
        JSONEncode = function(v8, v9) --[[ Line: 24 ]] --[[ Name: JSONEncode ]]
            -- upvalues: l_HttpService_0 (ref)
            v8.lastEncodedBody = v9;
            return l_HttpService_0:JSONEncode(v9);
        end, 
        JSONDecode = function(_, v11) --[[ Line: 29 ]] --[[ Name: JSONDecode ]]
            -- upvalues: l_HttpService_0 (ref)
            return l_HttpService_0:JSONDecode(v11);
        end
    };
end;