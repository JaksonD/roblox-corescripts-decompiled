local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_CorePackages_0.Packages.Signals);
local l_createSignal_0 = v3.createSignal;
local l_createComputed_0 = v3.createComputed;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v7 = require(l_CorePackages_0.Workspace.Packages.HttpStore);
local l_FFlagLuaAppUseAppHttpStore_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppUseAppHttpStore;
local v9 = require(l_CorePackages_0.Workspace.Packages.InternalHttpStore);
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
return function() --[[ Line: 34 ]] --[[ Name: createHeadShapeInventoryStore ]]
    -- upvalues: l_createSignal_0 (copy), v9 (copy), l_FFlagLuaAppUseAppHttpStore_0 (copy), v7 (copy), l_Modules_0 (copy), v3 (copy), l_HttpService_0 (copy), l_mutedError_0 (copy), l_createComputed_0 (copy)
    local v11, v12 = l_createSignal_0(nil);
    local v13 = false;
    local v14 = v9.GetHttpStore();
    local v15 = nil;
    if l_FFlagLuaAppUseAppHttpStore_0 then
        v15 = v7.Instance.get();
        if v15 then
            v14 = v15;
        end;
    end;
    local v16 = nil;
    local function v27() --[[ Line: 54 ]] --[[ Name: fetchInventory ]]
        -- upvalues: v11 (copy), v13 (ref), l_Modules_0 (ref), v14 (ref), v16 (ref), v3 (ref), l_HttpService_0 (ref), v12 (copy), l_mutedError_0 (ref)
        if v11(false) or v13 then
            return;
        else
            v13 = true;
            local v17 = require(l_Modules_0.LuaApp.Http.Url);
            local v18 = {
                pageLimit = 100, 
                sortOption = "recentAdded", 
                pageToken = "", 
                ["itemCategories[0].itemType"] = "HeadShape", 
                ["itemCategories[0].itemSubType"] = 1
            };
            local v19 = string.format("%sv1/avatar-inventory?%s", v17.AVATAR_URL, v17:makeQueryString(v18));
            local v20, _ = v14.fetch("HeadShapeInventory", {
                Url = v19, 
                Method = "GET"
            });
            if v16 then
                v16();
            end;
            v16 = v3.createEffect(function(v22) --[[ Line: 84 ]]
                -- upvalues: v20 (copy), l_HttpService_0 (ref), v12 (ref), v13 (ref), l_mutedError_0 (ref)
                local v23 = v20(v22);
                if v23.status == "Success" then
                    local l_Body_0 = v23.response.Body;
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 89 ]]
                        -- upvalues: l_HttpService_0 (ref), l_Body_0 (copy)
                        return l_HttpService_0:JSONDecode(l_Body_0);
                    end);
                    if l_status_0 and l_result_0 then
                        v12(l_result_0);
                        v13 = false;
                        return;
                    else
                        l_mutedError_0("Failed to decode HeadShape inventory JSON response");
                        v13 = false;
                        return;
                    end;
                else
                    if v23.status == "Failed" then
                        l_mutedError_0("Failed to fetch HeadShape inventory");
                        v13 = false;
                    end;
                    return;
                end;
            end);
            return;
        end;
    end;
    return {
        getInventory = l_createComputed_0(function(v28) --[[ Line: 107 ]]
            -- upvalues: v11 (copy), v13 (ref), v27 (copy)
            local v29 = v11(v28);
            if v29 == nil and not v13 then
                v27();
            end;
            return v29;
        end), 
        fetchInventory = v27
    };
end;