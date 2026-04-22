local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local l_getSduiTelemetryHandlerNameRegistry_0 = require(l_Parent_0.SduiCoreSystem).getSduiTelemetryHandlerNameRegistry;
return function() --[[ Line: 7 ]] --[[ Name: registerDiscoveryActionTelemetryHandlers ]]
    -- upvalues: l_getSduiTelemetryHandlerNameRegistry_0 (copy)
    l_getSduiTelemetryHandlerNameRegistry_0().registerTelemetryHandlers({
        LeavingRoblox = {
            lazyHandler = function() --[[ Line: 10 ]] --[[ Name: lazyHandler ]]
                return require(script.Parent.SduiLeavingRobloxTelemetryHandler);
            end
        }, 
        SocialLinkClick = {
            lazyHandler = function() --[[ Line: 15 ]] --[[ Name: lazyHandler ]]
                return require(script.Parent.SduiOpenSocialLinkProfileTelemetryHandler);
            end
        }
    });
end;