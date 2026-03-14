local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local v5 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
    v5 = true;
    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.OSX then
        v5 = true;
        if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Linux then
            v5 = l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP;
        end;
    end;
end;
local v6 = l_GuiService_0:IsTenFootInterface();
return function() --[[ Line: 14 ]] --[[ Name: useSharePolicy ]]
    -- upvalues: l_useAppPolicy_0 (copy), v6 (copy), v5 (copy)
    local v8 = l_useAppPolicy_0(function(v7) --[[ Line: 16 ]]
        return v7.shouldShowCatalogShareButton();
    end);
    local v10 = l_useAppPolicy_0(function(v9) --[[ Line: 20 ]]
        return v9.getWebViewSupport();
    end);
    local v11 = v8 and not v6 and v10;
    local l_v5_0 = v5;
    return {
        supportShareButton = v11, 
        supportCopyLinkButton = l_v5_0
    };
end;