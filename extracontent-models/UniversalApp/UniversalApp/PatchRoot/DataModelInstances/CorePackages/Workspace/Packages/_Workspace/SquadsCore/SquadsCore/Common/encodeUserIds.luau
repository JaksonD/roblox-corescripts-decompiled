local l_HttpService_0 = game:GetService("HttpService");
return function(v1) --[[ Line: 3 ]] --[[ Name: encodeUserIds ]]
    -- upvalues: l_HttpService_0 (copy)
    if v1 == nil then
        return "[]";
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 8 ]]
            -- upvalues: l_HttpService_0 (ref), v1 (copy)
            return l_HttpService_0:JSONEncode(v1);
        end);
        if l_status_0 then
            return l_result_0;
        else
            return "[]";
        end;
    end;
end;