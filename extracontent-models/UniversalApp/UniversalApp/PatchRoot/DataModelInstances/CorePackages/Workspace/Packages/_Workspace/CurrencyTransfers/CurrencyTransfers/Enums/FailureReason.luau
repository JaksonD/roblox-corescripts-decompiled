local v0 = {
    Invalid = "Invalid", 
    InvalidInput = "InvalidInput", 
    TransferNotFound = "TransferNotFound", 
    Unauthorized = "Unauthorized", 
    InternalError = "InternalError", 
    TransferDailyLimitExceeded = "TransferDailyLimitExceeded", 
    TransferMonthlyLimitExceeded = "TransferMonthlyLimitExceeded", 
    InsufficientFunds = "InsufficientFunds", 
    UserNotAllowed = "UserNotAllowed", 
    TransferExpired = "TransferExpired", 
    TooManyRequests = "TooManyRequests", 
    TransferAlreadyProcessed = "TransferAlreadyProcessed", 
    InvalidTransferState = "InvalidTransferState", 
    AmpRecourseAvailable = "AmpRecourseAvailable", 
    TransferDisabledForUser = "TransferDisabledForUser", 
    ReceiverNotAllowed = "ReceiverNotAllowed"
};
local v1 = {
    [0] = v0.Invalid, 
    [1] = v0.InvalidInput, 
    [2] = v0.TransferNotFound, 
    [3] = v0.Unauthorized, 
    [4] = v0.InternalError, 
    [5] = v0.TransferDailyLimitExceeded, 
    [6] = v0.TransferMonthlyLimitExceeded, 
    [7] = v0.InsufficientFunds, 
    [8] = v0.UserNotAllowed, 
    [9] = v0.TransferExpired, 
    [10] = v0.TooManyRequests, 
    [11] = v0.TransferAlreadyProcessed, 
    [12] = v0.InvalidTransferState, 
    [13] = v0.AmpRecourseAvailable, 
    [14] = v0.TransferDisabledForUser, 
    [15] = v0.ReceiverNotAllowed
};
v0.fromValue = function(v2) --[[ Line: 59 ]] --[[ Name: fromValue ]]
    -- upvalues: v1 (copy), v0 (copy)
    if v2 == nil then
        return nil;
    elseif type(v2) == "number" then
        return v1[v2];
    else
        if type(v2) == "string" then
            for _, v4 in pairs(v0) do
                if v4 == v2 then
                    return v2;
                end;
            end;
        end;
        return nil;
    end;
end;
return v0;