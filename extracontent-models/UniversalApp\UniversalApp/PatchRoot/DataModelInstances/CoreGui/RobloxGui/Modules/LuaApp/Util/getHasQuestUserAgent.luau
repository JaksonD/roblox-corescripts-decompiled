local l_HttpService_0 = game:GetService("HttpService");
return function() --[[ Line: 3 ]]
    -- upvalues: l_HttpService_0 (copy)
    return string.find(l_HttpService_0:GetUserAgent(), "OculusQuest3Store") ~= nil;
end;