local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v3 = require(l_Modules_0.LuaApp.Promise);
local v4 = require(l_Modules_0.LuaApp.Http.Requests.PaymentsGatewayApi.CheckUserPurchaseSettings);
local v5 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.addRawValueMethodToEnum);
local v6 = require(l_CorePackages_0.Packages.enumerate);
local v7 = {};
local v8 = {
    None = "None", 
    PurchaseNotEnabled = "PurchaseNotEnabled", 
    SpendLimitExceeded = "SpendLimitExceeded"
};
v7.FailureReason = v6(script.Name, v8);
v5(v7.FailureReason, v8);
v7.Post = function(v9) --[[ Line: 24 ]] --[[ Name: Post ]]
    -- upvalues: l_PerformFetch_0 (copy), v4 (copy), v3 (copy)
    return l_PerformFetch_0.Single("PostCheckUserPurchaseSettings", function(_) --[[ Line: 26 ]]
        -- upvalues: v4 (ref), v9 (copy), v3 (ref)
        return v4(v9):andThen(function(v11) --[[ Line: 27 ]]
            -- upvalues: v3 (ref)
            local v12 = v11[1];
            return v3.resolve(v12);
        end, function(_) --[[ Line: 30 ]]
            -- upvalues: v3 (ref)
            return v3.resolve();
        end);
    end);
end;
return v7;