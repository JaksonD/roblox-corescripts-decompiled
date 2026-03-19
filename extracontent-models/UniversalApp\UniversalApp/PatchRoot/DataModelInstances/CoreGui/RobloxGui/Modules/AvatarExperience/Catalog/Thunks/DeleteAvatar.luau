local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v3 = require(l_Modules_0.LuaApp.Promise);
local v4 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v5 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v8 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveLook);
local v9 = {
    toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong", 
    isLocalized = false, 
    toastType = v5.NetworkingError
};
local function _(v10) --[[ Line: 20 ]] --[[ Name: keyMapper ]]
    -- upvalues: v6 (copy)
    return v6.FetchLookDetailInfoKey .. v10;
end;
return function(v12, v13) --[[ Line: 26 ]]
    -- upvalues: l_PerformFetch_0 (copy), v6 (copy), v7 (copy), v8 (copy), v3 (copy), v4 (copy), v9 (copy)
    return function(v14) --[[ Line: 27 ]]
        -- upvalues: l_PerformFetch_0 (ref), v13 (copy), v6 (ref), v7 (ref), v12 (copy), v8 (ref), v3 (ref), v4 (ref), v9 (ref)
        local l_Single_0 = l_PerformFetch_0.Single;
        local l_v13_0 = v13;
        return l_Single_0(v6.FetchLookDetailInfoKey .. l_v13_0, function(v17) --[[ Line: 28 ]]
            -- upvalues: v7 (ref), v12 (ref), v13 (ref), v8 (ref), v3 (ref), v4 (ref), v9 (ref)
            return v7.DeleteLook(v12, v13):andThen(function(_) --[[ Line: 30 ]]
                -- upvalues: v17 (copy), v8 (ref), v13 (ref), v3 (ref)
                v17:dispatch(v8(v13));
                return v3.resolve();
            end):catch(function(v19) --[[ Line: 34 ]]
                -- upvalues: v17 (copy), v8 (ref), v13 (ref), v3 (ref), v4 (ref), v9 (ref)
                local v20 = v19 and v19.StatusCode;
                if v20 and v20 == 404 then
                    v17:dispatch(v8(v13));
                    return v3.resolve();
                else
                    v17:dispatch(v4(v9));
                    return v3.reject(v19);
                end;
            end);
        end)(v14);
    end;
end;