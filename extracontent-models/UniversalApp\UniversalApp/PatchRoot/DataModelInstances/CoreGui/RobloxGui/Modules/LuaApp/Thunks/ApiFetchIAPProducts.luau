local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.ArgCheck);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v4 = require(l_Modules_0.LuaApp.Http.Requests.GetIAPProducts);
local v5 = require(l_Modules_0.LuaApp.Actions.SetIAPProducts);
local v6 = require(l_Modules_0.LuaApp.Models.PremiumFeaturesApi.IAPProduct);
return {
    Fetch = function(v7) --[[ Line: 15 ]] --[[ Name: Fetch ]]
        -- upvalues: l_PerformFetch_0 (copy), v4 (copy), v2 (copy), v6 (copy), v5 (copy)
        return l_PerformFetch_0.Single("IAPProducts", function(v8) --[[ Line: 16 ]]
            -- upvalues: v4 (ref), v7 (copy), v2 (ref), v6 (ref), v5 (ref)
            return v4(v7):andThen(function(v9) --[[ Line: 17 ]]
                -- upvalues: v2 (ref), v6 (ref), v8 (copy), v5 (ref)
                if v9 == nil or v9[1] == nil or v9[1].products == nil or type(v9[1].products) ~= "table" then
                    v2.assert("Invalid response from GetIAPProducts");
                    return;
                else
                    local v10 = {};
                    local v11 = {};
                    local v12 = {};
                    for _, v14 in ipairs(v9[1].products) do
                        local v15 = v6.fromJsonData(v14, v8:getState().Platform);
                        if v15 ~= nil then
                            if v15.isSubscription then
                                table.insert(v12, v15);
                            elseif v15.requiresPremium then
                                table.insert(v10, v15);
                            else
                                table.insert(v11, v15);
                            end;
                        end;
                    end;
                    local function v18(v16, v17) --[[ Line: 41 ]]
                        return v16.robuxAmount < v17.robuxAmount;
                    end;
                    table.sort(v10, v18);
                    table.sort(v11, v18);
                    table.sort(v12, v18);
                    v8:dispatch(v5(v11, v10, v12));
                    return;
                end;
            end);
        end);
    end, 
    GetFetchingStatus = function(v19) --[[ Line: 54 ]] --[[ Name: GetFetchingStatus ]]
        -- upvalues: l_PerformFetch_0 (copy)
        return l_PerformFetch_0.GetStatus(v19, "IAPProducts");
    end
};