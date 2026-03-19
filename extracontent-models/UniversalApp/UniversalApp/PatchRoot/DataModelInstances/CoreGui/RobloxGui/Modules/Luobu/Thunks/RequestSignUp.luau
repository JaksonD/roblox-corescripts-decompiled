local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_Modules_0.LuaApp.Promise);
local v4 = require(l_Modules_0.Luobu.Http.Requests.SignUpRequest);
local v5 = require(l_Modules_0.Luobu.Thunks.LaunchLuobuApp);
local v6 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v7 = require(l_Modules_0.Luobu.Analytics.Events.AppSignupCounterNames);
local v8 = v2.interface({
    birthday = v2.string, 
    displayName = v2.string, 
    gender = v2.number, 
    voucher = v2.string, 
    channelId = v2.number, 
    agreementIds = v2.table
});
return function(v9, v10, v11, v12, v13) --[[ Line: 19 ]]
    -- upvalues: v8 (copy), v4 (copy), v7 (copy), v5 (copy), v3 (copy), v6 (copy)
    return function(v14) --[[ Line: 20 ]]
        -- upvalues: v8 (ref), v13 (copy), v4 (ref), v9 (copy), v12 (copy), v10 (copy), v7 (ref), v5 (ref), v11 (copy), v3 (ref), v6 (ref)
        assert(v8(v13));
        return v4(v9, v12, v13):andThen(function(_) --[[ Line: 22 ]]
            -- upvalues: v10 (ref), v7 (ref), v14 (copy), v5 (ref), v9 (ref), v11 (ref), v3 (ref)
            v10.Diag:reportCounter(v7.Success, 1);
            v14:dispatch(v5(v9, v10, v11));
            return v3.resolve();
        end, function(_) --[[ Line: 26 ]]
            -- upvalues: v10 (ref), v7 (ref), v14 (copy), v6 (ref), v3 (ref)
            v10.Diag:reportCounter(v7.Failure, 1);
            v14:dispatch(v6({
                HttpError = Enum.HttpError.OK
            }));
            return v3.reject();
        end);
    end;
end;