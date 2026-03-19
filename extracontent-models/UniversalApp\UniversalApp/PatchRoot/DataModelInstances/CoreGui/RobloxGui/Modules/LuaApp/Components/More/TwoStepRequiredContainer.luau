local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_withNavigation_0 = require(l_CorePackages_0.Packages.RoactNavigation).withNavigation;
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v6 = require(script.Parent.TwoStepRequiredOverlay);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v9 = require(l_Modules_0.LuaApp.Thunks.NavigateDownToSecuritySettings);
local v10 = v2.PureComponent:extend(script.Name);
v10.init = function(v11) --[[ Line: 21 ]] --[[ Name: init ]]
    v11.closePrompt = function() --[[ Line: 22 ]]
        -- upvalues: v11 (copy)
        v11.props.navigation.goBack();
    end;
    v11.navigateToSecuritySettings = function() --[[ Line: 27 ]]
        -- upvalues: v11 (copy)
        v11.closePrompt();
        v11.props.navigateToSecuritySettings();
    end;
end;
v10.render = function(v12) --[[ Line: 33 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_Focusable_0 (copy), v6 (copy)
    return v2.createElement(l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, {
        TwoStepRequiredOverlay = v2.createElement(v6, {
            closePrompt = v12.closePrompt, 
            navigateToSecuritySettings = v12.navigateToSecuritySettings, 
            screenSize = v12.props.screenSize
        })
    });
end;
return (l_withNavigation_0((v8((v7((v3.connect(function(v13) --[[ Line: 46 ]]
    return {
        screenSize = v13.ScreenSize
    };
end, function(v14) --[[ Line: 50 ]]
    -- upvalues: v9 (copy)
    return {
        navigateToSecuritySettings = function() --[[ Line: 52 ]] --[[ Name: navigateToSecuritySettings ]]
            -- upvalues: v14 (copy), v9 (ref)
            v14(v9());
        end
    };
end)(v10))))))));