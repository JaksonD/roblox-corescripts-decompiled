local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v5 = require(l_Modules_0.LuaApp.AppPage);
local v6 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local l_InteractiveAlert_0 = v9.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v9.App.Button.Enum.ButtonType;
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v13 = v2.PureComponent:extend("PremiumSellOnlyPrompt");
v13.init = function(v14) --[[ Line: 20 ]] --[[ Name: init ]]
    -- upvalues: v12 (copy)
    v14.openPremiumPage = function() --[[ Line: 21 ]]
        -- upvalues: v14 (copy)
        v14.closePrompt();
        v14.props.openPremiumPage();
    end;
    v14.closePrompt = function() --[[ Line: 26 ]]
        -- upvalues: v12 (ref), v14 (copy)
        v12.closeOverlay(v14.props.navigation);
    end;
end;
v13.renderAlertLocalized = function(v15, v16) --[[ Line: 31 ]] --[[ Name: renderAlertLocalized ]]
    -- upvalues: v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    return v2.createElement(l_InteractiveAlert_0, {
        title = v16.titleText, 
        bodyText = v16.messageText, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v15.closePrompt, 
                        text = v16.cancelButtonText
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v15.openPremiumPage, 
                        text = v16.confirmButtonText
                    }
                }
            }
        }, 
        screenSize = v15.props.screenSize, 
        defaultChildRef = v15.props.defaultChildRef
    });
end;
v13.render = function(v17) --[[ Line: 58 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy)
    return l_withLocalization_0({
        titleText = "Feature.Catalog.Heading.PremiumOnly", 
        messageText = "Feature.Catalog.Label.SellPageUpsell", 
        confirmButtonText = "Feature.Catalog.Action.Upgrade", 
        cancelButtonText = "Feature.Catalog.Action.Cancel"
    })(function(v18) --[[ Line: 64 ]]
        -- upvalues: v17 (copy)
        return v17:renderAlertLocalized(v18);
    end);
end;
return (v8((v3.connect(function(v19, _) --[[ Line: 69 ]]
    return {
        screenSize = v19.ScreenSize
    };
end, function(v21) --[[ Line: 73 ]]
    -- upvalues: v6 (copy), v5 (copy)
    return {
        openPremiumPage = function() --[[ Line: 75 ]] --[[ Name: openPremiumPage ]]
            -- upvalues: v21 (copy), v6 (ref), v5 (ref)
            return v21(v6({
                name = v5.BuildersClub
            }));
        end
    };
end)(v13))));