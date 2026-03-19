local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v4 = require(l_Modules_0.LuaApp.Actions.SetUserRobux);
local v5 = require(l_Modules_0.LuaApp.Http.Requests.EconomyGetCurrency);
local v6 = game:DefineFastInt("LuaAppPollRobuxBalanceAttempts", 7);
local v7 = game:DefineFastInt("LuaAppPollRobuxBalanceIntervalSec", 2);
local function v8(v9, v10, v11, v12, v13, v14) --[[ Line: 12 ]] --[[ Name: PollRobuxBalance ]]
    -- upvalues: v5 (copy), l_Logging_0 (copy), v4 (copy), v7 (copy), v8 (copy)
    return v5(v10, v11):andThen(function(v15) --[[ Line: 20 ]]
        -- upvalues: l_Logging_0 (ref), v13 (copy), v12 (copy), v9 (copy), v4 (ref), v11 (copy), v14 (copy), v7 (ref), v8 (ref), v10 (copy)
        local l_responseBody_0 = v15.responseBody;
        if l_responseBody_0 == nil or l_responseBody_0.robux == nil then
            l_Logging_0.warn("Response from EconomyGetCurrency is malformed!");
            v13(v12);
            return;
        else
            local l_robux_0 = l_responseBody_0.robux;
            if l_robux_0 ~= v12 then
                v9:dispatch(v4(v11, l_robux_0));
                v13(l_robux_0);
                return;
            elseif v14 > 0 then
                delay(v7, function() --[[ Line: 36 ]]
                    -- upvalues: v8 (ref), v9 (ref), v10 (ref), v11 (ref), v12 (ref), v13 (ref), v14 (ref)
                    v8(v9, v10, v11, v12, v13, v14 - 1);
                end);
                return;
            else
                v13(v12);
                return;
            end;
        end;
    end):catch(function() --[[ Line: 42 ]]
        -- upvalues: v13 (copy), v12 (copy)
        v13(v12);
    end);
end;
return function(v18, v19, v20, v21) --[[ Line: 47 ]]
    -- upvalues: l_PerformFetch_0 (copy), v8 (copy), v6 (copy)
    return l_PerformFetch_0.Single("com.roblox.economy.users." .. v19 .. ".currency.poll", function(v22) --[[ Line: 48 ]]
        -- upvalues: v8 (ref), v18 (copy), v19 (copy), v20 (copy), v21 (copy), v6 (ref)
        return v8(v22, v18, v19, v20, v21, v6);
    end);
end;