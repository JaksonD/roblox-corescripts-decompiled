local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v3 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local l_CloseCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay;
local l_NavigateDown_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local v7 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
return function(v8, v9) --[[ Line: 10 ]]
    -- upvalues: l_CloseCentralOverlay_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v7 (copy), v3 (copy), v2 (copy)
    return function(v10) --[[ Line: 11 ]]
        -- upvalues: v8 (copy), l_CloseCentralOverlay_0 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v7 (ref), v9 (copy), v3 (ref), v2 (ref)
        v8.closeUpsell = function() --[[ Line: 12 ]]
            -- upvalues: v10 (copy), l_CloseCentralOverlay_0 (ref)
            return v10:dispatch(l_CloseCentralOverlay_0());
        end;
        v8.showWebpage = function(v11) --[[ Line: 15 ]]
            -- upvalues: v10 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v7 (ref)
            return v10:dispatch(l_NavigateDown_0({
                name = l_AppPage_0.GenericWebPage, 
                detail = v11, 
                extraProps = {
                    title = "", 
                    transitionAnimation = v7.SlideInFromBottom
                }
            }));
        end;
        if v9 then
            v10:dispatch(v3(v2.VoicePhoneVerificationUpsellOverlayWrapper, v8));
            return;
        else
            v10:dispatch(v3(v2.PhoneVerificationUpsellOverlayWrapper, v8));
            return;
        end;
    end;
end;