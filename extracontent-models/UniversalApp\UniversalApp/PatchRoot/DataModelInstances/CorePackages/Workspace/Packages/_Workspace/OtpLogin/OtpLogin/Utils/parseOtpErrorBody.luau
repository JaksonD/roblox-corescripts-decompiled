local l_HttpService_0 = game:GetService("HttpService");
return function(v1) --[[ Line: 3 ]]
    -- upvalues: l_HttpService_0 (copy)
    if not v1 then
        return nil;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 8 ]]
            -- upvalues: l_HttpService_0 (ref), v1 (copy)
            return l_HttpService_0:JSONDecode(v1);
        end);
        if l_status_0 and type(l_result_0) == "table" and l_result_0.errors and type(l_result_0.errors) == "table" then
            local v4 = l_result_0.errors[1];
            if v4 and v4.code and v4.code > 0 then
                return v4.code;
            end;
        end;
        return nil;
    end;
end;