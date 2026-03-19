local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableCrossDeviceLoginUsingQRCodes);
local v4 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.ShowCodeView);
local v5 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.ShowProfileView);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v7 = require(l_Modules_0.LuaApp.FitChildren);
return function(v8) --[[ Line: 16 ]]
    -- upvalues: l_useDesignTokens_0 (copy), v2 (copy), v7 (copy), v4 (copy), v3 (copy), v5 (copy)
    local l_LoginView_0 = l_useDesignTokens_0().LuaApps.LoginView;
    return v2.createElement(v7.FitFrame, {
        Size = UDim2.new(1, 0, 0, 0), 
        fitAxis = v7.FitAxis.Height, 
        BackgroundTransparency = 1
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = if v8.isDualLayout then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 12)
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingTop = if v8.isDualLayout then UDim.new(0, 0) else UDim.new(0, 24), 
            PaddingBottom = if v8.isDualLayout then UDim.new(0, 0) else UDim.new(0, 12), 
            PaddingLeft = if v8.isDualLayout then UDim.new(0, l_LoginView_0.dualLayoutPadding) else nil
        }), 
        View = v8.showCodeView and v2.createElement(v4, {
            DeviceCode = v8.DeviceCode, 
            QrCodeUrl = if v3() then v8.QrCodeUrl else nil, 
            AltTitle = v8.AltTitle, 
            AltInstruction = v8.AltInstruction, 
            AltMobileInstruction = v8.AltMobileInstruction, 
            AltDesktopInstruction = v8.AltDesktopInstruction, 
            DisableQrCode = v8.disableCdlQrCodeForMaquettes or false, 
            hideDeviceCode = v8.hideDeviceCode, 
            showLockIcon = v8.showLockIcon, 
            isDualLayout = v8.isDualLayout, 
            leftAlignText = v8.isDualLayout, 
            showConfirmLoginText = v8.showConfirmLoginText, 
            DisplayName = v8.DisplayName, 
            isCrossApp = v8.isCrossApp
        }) or v2.createElement(v5, {
            Url = v8.AccountPictureUrl, 
            DisplayName = v8.DisplayName, 
            leftAlignText = v8.isDualLayout
        })
    });
end;