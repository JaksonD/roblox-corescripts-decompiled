local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local v3 = require(l_CorePackages_0.Packages.Roact);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local v7 = require(l_CorePackages_0.Packages.t);
local l_Images_0 = v2.App.ImageSet.Images;
local l_Button_0 = v2.App.Button.Button;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local v11 = l_Images_0["icons/common/robux"];
local v12 = v3.PureComponent:extend("DeveloperProductFooter");
v12.validateProps = v7.strictInterface({
    price = v7.number, 
    onActivated = v7.callback, 
    localization = v7.table
});
v12.render = function(v13) --[[ Line: 29 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v11 (copy), l_NumberLocalization_0 (copy)
    local l_localization_0 = v13.props.localization;
    local l_price_0 = v13.props.price;
    return v3.createElement(l_Button_0, {
        buttonType = l_ButtonType_0.PrimarySystem, 
        size = UDim2.new(1, 0, 0, 35), 
        icon = v11, 
        text = l_NumberLocalization_0.abbreviate(l_price_0, l_localization_0:GetLocale()), 
        isDisabled = false, 
        onActivated = v13.props.onActivated
    });
end;
return (l_RoactServices_0.connect({
    localization = v5
})(v12));