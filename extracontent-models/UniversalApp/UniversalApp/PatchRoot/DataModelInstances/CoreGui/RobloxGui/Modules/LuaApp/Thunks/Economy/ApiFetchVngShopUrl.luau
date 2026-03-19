local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.VngPayments.GetVngShopUrl);
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
local l_GetFStringVNGWebshopUrl_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringVNGWebshopUrl;
return function(v6) --[[ Line: 14 ]]
    -- upvalues: v3 (copy), l_GetFStringVNGWebshopUrl_0 (copy), v2 (copy)
    return function(_) --[[ Line: 15 ]]
        -- upvalues: v3 (ref), v6 (copy), l_GetFStringVNGWebshopUrl_0 (ref), v2 (ref)
        return v3(v6):andThen(function(v8) --[[ Line: 16 ]]
            -- upvalues: l_GetFStringVNGWebshopUrl_0 (ref), v2 (ref)
            if v8 == nil or v8[1] == nil then
                local v9 = {
                    vngShopRedirectUrl = l_GetFStringVNGWebshopUrl_0()
                };
                return v2.resolve(v9);
            else
                local v10 = {
                    vngShopRedirectUrl = v8[1].vngShopRedirectUrl
                };
                return v2.resolve(v10);
            end;
        end):catch(function(_) --[[ Line: 30 ]]
            -- upvalues: l_GetFStringVNGWebshopUrl_0 (ref), v2 (ref)
            local v12 = {
                vngShopRedirectUrl = l_GetFStringVNGWebshopUrl_0()
            };
            return v2.resolve(v12);
        end);
    end;
end;