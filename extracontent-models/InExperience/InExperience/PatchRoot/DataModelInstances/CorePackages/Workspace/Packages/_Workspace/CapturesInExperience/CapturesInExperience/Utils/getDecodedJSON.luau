local l_HttpService_0 = game:GetService("HttpService");
return function(v1) --[[ Line: 3 ]] --[[ Name: getDecodedJSON ]]
    -- upvalues: l_HttpService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 4 ]]
        -- upvalues: l_HttpService_0 (ref), v1 (copy)
        return l_HttpService_0:JSONDecode(v1);
    end);
    if l_status_0 then
        return l_result_0;
    elseif _G.__TEST_SUITE_PACKAGE__ or _G.__TESTEZ_RUNNING_TEST__ then
        return nil;
    else
        warn(debug.traceback("Failed to decode JSON: " .. v1));
        return nil;
    end;
end;