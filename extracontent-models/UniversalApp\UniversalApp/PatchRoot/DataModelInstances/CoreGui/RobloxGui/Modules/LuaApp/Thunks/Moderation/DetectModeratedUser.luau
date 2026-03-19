local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local l_StatusCodes_0 = require(l_CorePackages_0.Workspace.Packages.Http).StatusCodes;
return function(v4) --[[ Line: 7 ]]
    -- upvalues: l_StatusCodes_0 (copy), l_HttpService_0 (copy), l_Logger_0 (copy)
    if v4.StatusCode == l_StatusCodes_0.FORBIDDEN then
        local l_status_0, l_result_0 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v4.Body);
        if not l_status_0 then
            l_Logger_0:info("Failed to parse JSON error body for moderation");
            l_Logger_0:info(v4.Body);
            return false;
        else
            local v7 = l_result_0 and l_result_0.errors or nil;
            if v7 == nil then
                return false;
            else
                for _, v9 in pairs(v7) do
                    for v10, v11 in pairs(v9) do
                        if v10 == "message" and v11 == "User is moderated" then
                            return true;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return false;
end;