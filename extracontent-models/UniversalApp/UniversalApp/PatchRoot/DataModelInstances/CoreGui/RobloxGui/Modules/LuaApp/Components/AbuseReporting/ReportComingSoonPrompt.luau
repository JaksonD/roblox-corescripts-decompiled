local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local v3 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility);
local l_VRConstants_0 = v3.VRConstants;
local l_VRPanelWidthIXP_0 = v3.VRPanelWidthIXP;
local v6 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v7 = require(l_CorePackages_0.Workspace.Packages.Style);
local v8 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_FullPageModal_0 = v2.App.Dialog.Modal.FullPageModal;
local l_useDesignTokens_0 = v7.useDesignTokens;
local l_mapTypographyVariantToFontEnum_0 = v7.mapTypographyVariantToFontEnum;
local v12 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_GetFFlagVRPanelWidthIXPEnabled_0 = v12.GetFFlagVRPanelWidthIXPEnabled;
local l_FFlagLuaAppForceVrAppPanelWidthRollout_0 = v12.FFlagLuaAppForceVrAppPanelWidthRollout;
return function(v15) --[[ Line: 25 ]]
    -- upvalues: l_useDesignTokens_0 (copy), v8 (copy), l_FFlagLuaAppForceVrAppPanelWidthRollout_0 (copy), l_GetFFlagVRPanelWidthIXPEnabled_0 (copy), v6 (copy), l_VRPanelWidthIXP_0 (copy), v1 (copy), l_FullPageModal_0 (copy), l_VRConstants_0 (copy), l_mapTypographyVariantToFontEnum_0 (copy)
    local v16 = l_useDesignTokens_0();
    v8.assert(false, "Report Dialog's title and body text have not been localized. This needs to be addressed before this feature is released.");
    local v17 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and l_GetFFlagVRPanelWidthIXPEnabled_0() then v6.useTestVariables(l_VRPanelWidthIXP_0.VrAppPanelWidthMultiplier) else nil;
    return v1.createElement(l_FullPageModal_0, {
        title = "Reporting Coming Soon", 
        onCloseClicked = v15.onClose, 
        screenSize = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v17 then Vector2.new(l_VRConstants_0.MainScreenResolution.X * v17, l_VRConstants_0.MainScreenResolution.Y) else l_VRConstants_0.MainScreenResolution
    }, {
        Texts = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            Layout = v1.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Padding = v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 15)
            }), 
            PrimaryText = v1.createElement("TextLabel", {
                Text = "Reporting is coming soon to this platform.", 
                Font = l_mapTypographyVariantToFontEnum_0(v16.Semantic.Typography.Subheader), 
                LayoutOrder = 1, 
                TextColor3 = v16.Semantic.Color.Text.Emphasis.Color3, 
                TextTransparency = v16.Semantic.Color.Text.Emphasis.Transparency, 
                TextSize = v16.Semantic.Typography.Subheader.FontSize, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                Size = UDim2.new(1, 0, 0, v16.Semantic.Typography.Subheader.FontSize), 
                BackgroundTransparency = 1
            })
        })
    });
end;