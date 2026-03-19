local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v4 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v5 = require(l_Modules_0.LuaApp.TenFootUI.MoreComponents.MoreSection);
local v6 = require(l_Modules_0.LuaApp.TenFootUI.MoreComponents.MoreStatusButton);
local l_BodyText_0 = require(l_Modules_0.LuaApp.TenFootUI.MoreComponents.MoreText).BodyText;
local _ = require(script.Parent.Types);
local l_ThirdPartyUserService_0 = game:GetService("ThirdPartyUserService");
local function v10() --[[ Line: 19 ]] --[[ Name: onSwitchProfile ]]
    -- upvalues: l_ThirdPartyUserService_0 (copy)
    if l_ThirdPartyUserService_0 then
        l_ThirdPartyUserService_0:ShowAccountPicker();
    end;
end;
return function(v11) --[[ Line: 25 ]] --[[ Name: SwitchProfileSection ]]
    -- upvalues: v4 (copy), l_useLocalization_0 (copy), v2 (copy), v5 (copy), v6 (copy), v10 (copy), l_BodyText_0 (copy)
    local v13 = v4(function(v12) --[[ Line: 26 ]]
        return v12.getPlatformDisplayName();
    end);
    local v14 = l_useLocalization_0({
        title = v11.titleKey, 
        switchProfile = "Feature.Settings.Heading.SwitchProfile", 
        switchProfileDescription = {
            "Feature.Settings.Description.SwitchProfile"; 
            platform = v13
        }, 
        open = "Feature.Settings.Label.Open"
    });
    return v2.createElement(v5, {
        layoutOrder = v11.layoutOrder, 
        withDivider = v11.withDivider, 
        title = v14.title
    }, {
        v2.createElement(v6, {
            layoutOrder = 1, 
            title = v14.switchProfile, 
            status = v14.open, 
            onActivated = v10
        }), 
        v2.createElement(l_BodyText_0, {
            layoutOrder = 2, 
            text = v14.switchProfileDescription
        })
    });
end;