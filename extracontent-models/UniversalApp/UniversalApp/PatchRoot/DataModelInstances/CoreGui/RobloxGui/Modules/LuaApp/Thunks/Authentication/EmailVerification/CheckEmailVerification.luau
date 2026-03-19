local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Promise);
local v2 = require(l_Modules_0.LuaApp.Http.Requests.GetVerifiedEmail);
local v3 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v4 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local l_CorePackages_0 = game:GetService("CorePackages");
local v6 = require(l_CorePackages_0.Packages.Cryo);
return function(v7, v8, v9) --[[ Line: 25 ]]
    -- upvalues: v2 (copy), v1 (copy), v6 (copy), v4 (copy), v3 (copy)
    return function(v10) --[[ Line: 26 ]]
        -- upvalues: v2 (ref), v7 (copy), v8 (copy), v1 (ref), v9 (copy), v6 (ref), v4 (ref), v3 (ref)
        return v2(v7):andThen(function(v11) --[[ Line: 27 ]]
            -- upvalues: v8 (ref), v1 (ref), v9 (ref), v6 (ref), v10 (copy), v4 (ref), v3 (ref)
            local l_verified_0 = v11.responseBody.verified;
            local l_emailAddress_0 = v11.responseBody.emailAddress;
            local v14 = l_emailAddress_0 and l_emailAddress_0 ~= "";
            local l_l_verified_0_0 = l_verified_0;
            if v8 then
                l_l_verified_0_0 = l_l_verified_0_0 or v14;
            end;
            if l_l_verified_0_0 then
                return v1.resolve({
                    EmailAddress = l_emailAddress_0
                });
            else
                local v16 = {
                    emailAddress = l_emailAddress_0
                };
                if v9 then
                    v16 = v6.Dictionary.join(v16, v9);
                end;
                v10:dispatch(v4(v3.EmailVerificationUpsellOverlay, v16));
                return v1.reject();
            end;
        end, function(_) --[[ Line: 54 ]]
            -- upvalues: v1 (ref)
            return v1.resolve();
        end);
    end;
end;