local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v4 = require(l_Modules_0.LuaApp.Http.Requests.DeveloperProductApi.DeveloperProductGetStatuses);
local v5 = require(l_Modules_0.LuaApp.Actions.DeveloperProduct.SetDeveloperProductStatuses);
return function(v6, v7, v8, v9) --[[ Line: 9 ]]
    -- upvalues: l_PerformFetch_0 (copy), v4 (copy), v5 (copy), v2 (copy)
    return l_PerformFetch_0.Single("ApiFetchDeveloperProductsStatus" .. v7 .. v9, function(v10) --[[ Line: 10 ]]
        -- upvalues: v4 (ref), v6 (copy), v7 (copy), v9 (copy), v5 (ref), v8 (copy), v2 (ref)
        return v4(v6, v7, v9):andThen(function(v11) --[[ Line: 11 ]]
            -- upvalues: v10 (copy), v5 (ref), v8 (ref)
            local v12 = {};
            if v11 and v11.responseBody then
                for _, v14 in ipairs(v11.responseBody) do
                    if v14.actionArgs and v14.receipt then
                        for _, v16 in ipairs(v14.actionArgs) do
                            if v16.Key == "productId" and v16.Value then
                                if v12[v16.Value] == nil then
                                    v12[v16.Value] = {};
                                end;
                                table.insert(v12[v16.Value], v14.receipt);
                            end;
                        end;
                    end;
                end;
            end;
            return v10:dispatch(v5(v8, v12));
        end, function(_) --[[ Line: 28 ]]
            -- upvalues: v2 (ref)
            return v2.resolve();
        end);
    end);
end;