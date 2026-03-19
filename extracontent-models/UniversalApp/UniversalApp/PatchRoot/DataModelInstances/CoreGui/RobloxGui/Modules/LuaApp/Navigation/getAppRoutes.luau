local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.Navigation);
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_FFlagProfilePlatformEnableCurrencyTransfer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer;
local v5 = require(l_Modules_0.LuaApp.Components.Social.getSocialRoutes);
local v6 = require(l_Modules_0.LuaApp.Components.CurrencyTransfer.getCurrencyTransferRoutes);
local v7 = require(l_Modules_0.LuaApp.Components.ProfilePlatform.getProfilePlatformRoutes);
local v8 = require(l_Modules_0.LuaApp.Components.Groups.getGroupRoutes);
local function v14(v9) --[[ Line: 13 ]] --[[ Name: validateNoDuplicateRoutes ]]
    local v10 = {};
    for _, v12 in v9 do
        local v13 = next(v12);
        if v10[v13] then
            error((("Duplicate route name found: %*"):format(v13)));
        end;
        v10[v13] = true;
    end;
end;
local function v19(v15) --[[ Line: 24 ]] --[[ Name: sanitizeRoutes ]]
    local v16 = {};
    for _, v18 in v15 do
        if v18 ~= nil and next(v18) ~= nil then
            table.insert(v16, v18);
        end;
    end;
    return v16;
end;
local function v25(...) --[[ Line: 36 ]] --[[ Name: joinHoleyArrays ]]
    local v20 = {};
    for v21 = 1, select("#", ...) do
        local v22 = select(v21, ...);
        if v22 ~= nil then
            for _, v24 in v22 do
                if v24 ~= nil then
                    table.insert(v20, v24);
                end;
            end;
        end;
    end;
    return v20;
end;
return function() --[[ Line: 55 ]]
    -- upvalues: v25 (copy), l_Modules_0 (copy), l_getAppFeaturePolicies_0 (copy), l_FFlagProfilePlatformEnableCurrencyTransfer_0 (copy), v6 (copy), v7 (copy), v5 (copy), v8 (copy), v19 (copy), v14 (copy)
    local v26 = v25(require(l_Modules_0.LuaApp.Navigation.getLegacyRoutes)(l_getAppFeaturePolicies_0()), require(l_Modules_0.LuaApp.Components.Authentication.getAuthenticationRoutes)(), require(l_Modules_0.Personalization.getPersonalizationRoutes)(), require(l_Modules_0.LuaApp.Components.More.getMoreRoutes)(), if l_FFlagProfilePlatformEnableCurrencyTransfer_0 then v6() else {}, v7(), v5(), v8());
    v26 = v19(v26);
    v14(v26);
    return v26;
end;