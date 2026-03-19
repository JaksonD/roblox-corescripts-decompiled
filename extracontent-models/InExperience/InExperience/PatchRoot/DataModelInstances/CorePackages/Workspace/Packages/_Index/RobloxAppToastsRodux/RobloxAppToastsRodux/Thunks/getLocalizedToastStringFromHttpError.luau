local l_Parent_0 = script:FindFirstAncestor("RobloxAppToastsRodux").Parent;
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
local v2 = {
    [l_StatusCodes_0.BAD_REQUEST] = "Feature.Toast.NetworkingError.SomethingIsWrong", 
    [l_StatusCodes_0.UNAUTHORIZED] = "Feature.Toast.NetworkingError.Unauthorized", 
    [l_StatusCodes_0.FORBIDDEN] = "Feature.Toast.NetworkingError.Forbidden", 
    [l_StatusCodes_0.NOT_FOUND] = "Feature.Toast.NetworkingError.NotFound", 
    [l_StatusCodes_0.REQUEST_TIMEOUT] = "Feature.Toast.NetworkingError.Timeout", 
    [l_StatusCodes_0.TOO_MANY_REQUESTS] = "Feature.Toast.NetworkingError.TooManyRequests", 
    [l_StatusCodes_0.INTERNAL_SERVER_ERROR] = "Feature.Toast.NetworkingError.SomethingIsWrong", 
    [l_StatusCodes_0.NOT_IMPLEMENTED] = "Feature.Toast.NetworkingError.SomethingIsWrong", 
    [l_StatusCodes_0.BAD_GATEWAY] = "Feature.Toast.NetworkingError.SomethingIsWrong", 
    [l_StatusCodes_0.SERVICE_UNAVAILABLE] = "Feature.Toast.NetworkingError.ServiceUnavailable", 
    [l_StatusCodes_0.GATEWAY_TIMEOUT] = "Feature.Toast.NetworkingError.Timeout"
};
return function(v3, v4) --[[ Line: 30 ]] --[[ Name: getLocalizedToastStringFromHttpError ]]
    -- upvalues: v2 (copy)
    if v3 == Enum.HttpError.DnsResolve or v3 == Enum.HttpError.ConnectFail or v3 == Enum.HttpError.NetFail or v3 == Enum.HttpError.SslConnectFail then
        return "Feature.Toast.NetworkingError.UnableToConnect";
    elseif v3 == Enum.HttpError.TimedOut then
        return "Feature.Toast.NetworkingError.Timeout";
    elseif v3 == Enum.HttpError.Aborted then
        return nil;
    elseif v3 == Enum.HttpError.OK and v4 ~= nil and v2[v4] ~= nil then
        return v2[v4];
    else
        return "Feature.Toast.NetworkingError.SomethingIsWrong";
    end;
end;