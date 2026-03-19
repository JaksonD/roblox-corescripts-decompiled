local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.AppPage);
local v2 = require(l_Modules_0.LuaApp.Enum.Challenge.Type);
local v3 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v4 = require(l_Modules_0.LuaApp.Flags.GetFFlagDispatchHybridWebviewWithBypassNavigationLock);
return function(v5, v6, v7) --[[ Line: 14 ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy), v1 (copy)
    return function(v8) --[[ Line: 15 ]]
        -- upvalues: v5 (copy), v2 (ref), v6 (copy), v4 (ref), v3 (ref), v1 (ref), v7 (copy)
        local v9 = v5.challengeType == v2.Captcha;
        if v6 ~= nil then
            v9 = v6;
        end;
        if v4() then
            v8:dispatch(v3({
                name = v9 and v1.ChallengeHybridOverlayPage or v1.ChallengeHybridWebView, 
                extraProps = v5
            }, v7));
            return;
        else
            v8:dispatch(v3({
                name = v9 and v1.ChallengeHybridOverlayPage or v1.ChallengeHybridWebView, 
                extraProps = v5
            }));
            return;
        end;
    end;
end;