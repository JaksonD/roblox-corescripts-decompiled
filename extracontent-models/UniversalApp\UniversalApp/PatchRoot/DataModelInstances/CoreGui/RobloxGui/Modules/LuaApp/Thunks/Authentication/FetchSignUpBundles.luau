local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.t);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v4 = require(l_CorePackages_0.Packages.Promise);
local v5 = require(l_Modules_0.LuaApp.Thunks.Networking.Util.Retry);
local v6 = require(l_Modules_0.LuaApp.Models.Authentication.SignUpBundle);
local v7 = require(l_Modules_0.LuaApp.Actions.Authentication.SetSignUpBundles);
local v8 = require(l_Modules_0.LuaApp.Http.Requests.GetSignUpBundles);
local v9 = require(l_Modules_0.LuaApp.Thunks.Authentication.FetchHumanoidDescriptionProperties);
local v10 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaSignUpMaxRetries);
local v11 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaSignUpRetryTimeMultiplier);
local v12 = math.max(0, v10());
local v13 = math.max(0, v11());
local v14 = {};
local v15 = v2.array(v2.optional(v2.interface({
    bundleId = v2.number, 
    userOutfitId = v2.number
})));
v14._fetchSignUpBundles = function(v16) --[[ Line: 44 ]] --[[ Name: _fetchSignUpBundles ]]
    -- upvalues: v8 (copy), v15 (copy), v4 (copy)
    return v8(v16):andThen(function(v17) --[[ Line: 45 ]]
        -- upvalues: v15 (ref), v4 (ref)
        local v18 = v17 and v17.responseBody and v17.responseBody.bundles;
        if v15(v18) then
            return v4.resolve(v18);
        else
            return v4.resolve();
        end;
    end);
end;
v14._fetchSignUpBundlesWithRetry = function(v19) --[[ Line: 57 ]] --[[ Name: _fetchSignUpBundlesWithRetry ]]
    -- upvalues: v14 (copy), v5 (copy), v12 (copy), v13 (copy)
    local function v20() --[[ Line: 58 ]] --[[ Name: fetchSignUpBundles ]]
        -- upvalues: v14 (ref), v19 (copy)
        return v14._fetchSignUpBundles(v19);
    end;
    return v14._fetchSignUpBundles(v19):andThen(function(v21) --[[ Line: 62 ]]
        -- upvalues: v5 (ref), v12 (ref), v13 (ref), v20 (copy)
        return v5({
            retryCount = v12, 
            retryTimeMultiplier = v13, 
            retryCallback = v20, 
            previousResult = v21, 
            isResolveConditionMet = function(v22) --[[ Line: 71 ]] --[[ Name: isResolveConditionMet ]]
                return v22 ~= nil;
            end
        });
    end);
end;
v14.Fetch = function(v23) --[[ Line: 78 ]] --[[ Name: Fetch ]]
    -- upvalues: l_PerformFetch_0 (copy), v14 (copy), v15 (copy), v6 (copy), v7 (copy), v4 (copy), v9 (copy)
    return l_PerformFetch_0.Single("signUpBundles", function(v24) --[[ Line: 79 ]]
        -- upvalues: v14 (ref), v23 (copy), v15 (ref), v6 (ref), v7 (ref), v4 (ref), v9 (ref)
        return v14._fetchSignUpBundlesWithRetry(v23):andThen(function(v25) --[[ Line: 86 ]]
            -- upvalues: v15 (ref), v6 (ref), v24 (copy), v7 (ref), v4 (ref)
            local v26 = {};
            if v15(v25) then
                for _, v28 in ipairs(v25) do
                    table.insert(v26, v6.fromData(v28));
                end;
                v24:dispatch(v7(v26));
                return v4.resolve(v26);
            else
                return v4.reject();
            end;
        end):andThen(function(v29) --[[ Line: 106 ]]
            -- upvalues: v24 (copy), v9 (ref), v23 (ref)
            local v30 = {};
            for _, v32 in pairs(v29) do
                table.insert(v30, v32.userOutfitId);
            end;
            return v24:dispatch(v9.Fetch(v23, v30));
        end);
    end);
end;
v14.GetFetchingStatus = function(v33) --[[ Line: 118 ]] --[[ Name: GetFetchingStatus ]]
    -- upvalues: l_PerformFetch_0 (copy)
    return l_PerformFetch_0.GetStatus(v33, "signUpBundles");
end;
return v14;