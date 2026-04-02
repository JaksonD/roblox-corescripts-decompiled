local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v3.App.ImageSet.Images;
local v7 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Constants);
local _ = require(l_script_FirstAncestor_0.ChromeShared.Service.ChromeUtils);
local v9 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.SubMenuContext);
local l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 = require(l_script_FirstAncestor_0.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider;
local v11 = require(l_script_FirstAncestor_0.ChromeShared.Hooks.useMappedSignal);
local l_UnibarStyle_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).UnibarStyle;
CommonIconComponent = function(v13) --[[ Line: 22 ]] --[[ Name: CommonIconComponent ]]
    -- upvalues: l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), l_UnibarStyle_0 (copy), v7 (copy), v11 (copy), l_Images_0 (copy), l_useStyle_0 (copy), v2 (copy), v9 (copy), l_ImageSetLabel_0 (copy)
    local _ = nil;
    local v15 = nil;
    v15 = if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then l_UnibarStyle_0.use().ICON_SIZE else v7.ICON_SIZE;
    local v16 = v13.activeSignalValue and v11(v13.activeSignalValue) or false;
    local l_icon_0 = v13.icon;
    if v16 and v13.iconOn then
        l_icon_0 = v13.iconOn;
    end;
    if typeof(l_icon_0) == "string" and l_icon_0:sub(1, 11) ~= "rbxasset://" then
        l_icon_0 = l_Images_0[l_icon_0];
    end;
    local v18 = l_useStyle_0();
    local v19 = v2.useContext(v9);
    return v2.createElement(l_ImageSetLabel_0, {
        BackgroundTransparency = 1, 
        Image = l_icon_0, 
        Size = UDim2.new(0, v15, 0, v15), 
        ImageColor3 = v18.Theme.IconEmphasis.Color, 
        ImageTransparency = if v19 then v19:map(function(v20) --[[ Line: 53 ]]
            -- upvalues: v18 (copy)
            return v18.Theme.IconEmphasis.Transparency + (1 - v18.Theme.IconEmphasis.Transparency) * (1 - v20);
        end) else v18.Theme.IconEmphasis.Transparency
    });
end;
CommonIcon = function(v21, v22, v23) --[[ Line: 60 ]] --[[ Name: CommonIcon ]]
    -- upvalues: v2 (copy)
    return v2.createElement(CommonIconComponent, {
        icon = v21, 
        iconOn = v22, 
        activeSignalValue = v23
    });
end;
return CommonIcon;