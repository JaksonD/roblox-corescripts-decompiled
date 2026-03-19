local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_Modules_0.LuaApp.Promise);
local l_PromiseUtilities_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Utils.PromiseUtilities;
local v5 = require(l_Modules_0.LuaApp.Thunks.Networking.Util.Retry);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Http.WebApi);
local v7 = require(l_Modules_0.LuaApp.Models.HumanoidDescriptionProperties);
local v8 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaSignUpMaxRetries);
local v9 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaSignUpRetryTimeMultiplier);
local v10 = math.max(0, v8());
local v11 = math.max(0, v9());
local v12 = require(l_Modules_0.LuaApp.Actions.Authentication.SetHumanoidDescriptionProperties);
return {
    Fetch = function(v13, v14) --[[ Line: 22 ]] --[[ Name: Fetch ]]
        -- upvalues: v2 (copy), v6 (copy), l_PromiseUtilities_0 (copy), v7 (copy), v12 (copy), v3 (copy), v5 (copy), v10 (copy), v11 (copy)
        return function(v15) --[[ Line: 23 ]]
            -- upvalues: v2 (ref), v14 (copy), v6 (ref), v13 (copy), l_PromiseUtilities_0 (ref), v7 (ref), v12 (ref), v3 (ref), v5 (ref), v10 (ref), v11 (ref)
            local v16 = v2.List.join(v14);
            local function v28() --[[ Line: 26 ]] --[[ Name: fetchOutfitDetails ]]
                -- upvalues: v16 (ref), v6 (ref), v13 (ref), l_PromiseUtilities_0 (ref), v7 (ref), v15 (copy), v12 (ref), v3 (ref)
                local v17 = {};
                for _, v19 in pairs(v16) do
                    v17[v19] = v6.GetOutfit(v13, v19);
                end;
                return l_PromiseUtilities_0.Batch(v17):andThen(function(v20) --[[ Line: 34 ]]
                    -- upvalues: v7 (ref), v15 (ref), v12 (ref), v3 (ref)
                    local v21 = {};
                    local v22 = {};
                    for v23, v24 in pairs(v20) do
                        local v25, v26 = v24:unwrap();
                        local v27 = v26 and v26.responseBody;
                        if v25 and v27 then
                            v22[tostring(v23)] = v7.fromOutfitDetailsWebApi(v27);
                        else
                            table.insert(v21, v23);
                        end;
                    end;
                    v15:dispatch(v12(v22));
                    return v3.resolve(v21);
                end);
            end;
            return v28():andThen(function(v29) --[[ Line: 57 ]]
                -- upvalues: v5 (ref), v10 (ref), v11 (ref), v28 (copy), v16 (ref), v2 (ref)
                return v5({
                    retryCount = v10, 
                    retryTimeMultiplier = v11, 
                    retryCallback = v28, 
                    previousResult = v29, 
                    isResolveConditionMet = function(v30) --[[ Line: 63 ]] --[[ Name: isResolveConditionMet ]]
                        -- upvalues: v16 (ref), v2 (ref)
                        if #v30 == 0 then
                            return true;
                        else
                            v16 = v2.List.join(v30);
                            return false;
                        end;
                    end
                });
            end);
        end;
    end
};