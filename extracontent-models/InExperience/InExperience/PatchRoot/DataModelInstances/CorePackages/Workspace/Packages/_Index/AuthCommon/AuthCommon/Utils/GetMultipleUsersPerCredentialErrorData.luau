local l_HttpService_0 = game:GetService("HttpService");
return function(v1) --[[ Line: 18 ]]
    -- upvalues: l_HttpService_0 (copy)
    if v1 ~= nil and v1.errors ~= nil and v1.errors[1] and v1.errors[1].fieldData then
        local l_fieldData_0 = v1.errors[1].fieldData;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 26 ]]
            -- upvalues: l_HttpService_0 (ref), l_fieldData_0 (copy)
            return l_HttpService_0:JSONDecode(l_fieldData_0);
        end);
        if l_status_0 then
            return l_result_0.users or {};
        end;
    end;
    return {};
end;