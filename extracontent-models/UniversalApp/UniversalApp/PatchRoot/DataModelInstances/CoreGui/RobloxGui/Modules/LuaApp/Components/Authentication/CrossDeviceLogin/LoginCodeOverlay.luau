local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local l_PartialPageModal_0 = v3.App.Dialog.Modal.PartialPageModal;
local v6 = require(l_Modules_0.LuaApp.Flags.GetFFlagBottomAnchorXDLCodeModal);
return function(v7) --[[ Line: 12 ]]
    -- upvalues: v4 (copy), v2 (copy), l_PartialPageModal_0 (copy), v6 (copy)
    local v8 = v4({
        alertTitle = "Authentication.CrossDevice.Heading.QuickLogin"
    });
    return v2.createElement(l_PartialPageModal_0, {
        title = v8.alertTitle, 
        screenSize = v7.screenSize, 
        onCloseClicked = v7.onCloseClicked, 
        position = UDim2.new(0.5, 0, 0.5, 0), 
        anchorPoint = if v6() then Vector2.new(0.5, 0) else Vector2.new(0.5, 0.5)
    }, {
        ViewContainer = v7.loginCode
    });
end;