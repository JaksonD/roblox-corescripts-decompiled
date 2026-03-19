local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactNavigation);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v6.App.ImageSet.Images;
local l_withStyle_0 = v6.Style.withStyle;
local l_IconButton_0 = v6.App.Button.IconButton;
local l_IconSize_0 = v6.App.ImageSet.Enum.IconSize;
local v11 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v13 = v4.PureComponent:extend("ManageButton");
v13.validateProps = v3.strictInterface({
    formFactor = v3.string, 
    isCompactView = v3.boolean, 
    isSearching = v3.boolean, 
    setVisible = v2.isCallable, 
    cancelSearch = v2.isCallable, 
    activateSearch = v2.isCallable, 
    buttonRef = v3.optional(v3.table), 
    navigation = v3.table
});
v13.init = function(v14) --[[ Line: 36 ]] --[[ Name: init ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    v14.showManageCostumesCallback = function() --[[ Line: 37 ]]
        -- upvalues: v14 (copy), l_AvatarScreen_0 (ref)
        v14.props.navigation.navigate(l_AvatarScreen_0.ManageOutfitPage);
    end;
end;
v13.render = function(v15) --[[ Line: 42 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v11 (copy), v4 (copy), l_IconButton_0 (copy), l_Images_0 (copy), l_IconSize_0 (copy)
    return l_withStyle_0(function(v16) --[[ Line: 43 ]]
        -- upvalues: v11 (ref), v15 (copy), v4 (ref), l_IconButton_0 (ref), l_Images_0 (ref), l_IconSize_0 (ref)
        local v17 = v11.getIconButtonSize(v15.props.formFactor);
        return v4.createElement(l_IconButton_0, {
            size = UDim2.new(0, v17, 1, 0), 
            icon = l_Images_0["icons/common/settings"], 
            iconSize = l_IconSize_0.Medium, 
            iconColor3 = v16.Theme.IconEmphasis.Color, 
            iconTransparency = v16.Theme.IconEmphasis.Transparency, 
            onActivated = v15.showManageCostumesCallback, 
            buttonRef = v15.props.buttonRef
        });
    end);
end;
return (v5.withNavigation(v13));