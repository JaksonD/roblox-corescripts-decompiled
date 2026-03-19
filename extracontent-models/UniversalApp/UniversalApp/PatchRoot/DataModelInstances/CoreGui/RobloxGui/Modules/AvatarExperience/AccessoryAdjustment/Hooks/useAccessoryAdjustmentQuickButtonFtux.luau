local l_CorePackages_0 = game:GetService("CorePackages");
local l_SafeAppStorageService_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Lib.SafeAppStorageService;
local v2 = game:DefineFastFlag("AXAccessoryAdjustmentFtuxUseMemStorage", false);
return function() --[[ Line: 11 ]] --[[ Name: useAccessoryAdjustmentQuickButtonFtux ]]
    -- upvalues: l_SafeAppStorageService_0 (copy), v2 (copy)
    local function v3() --[[ Line: 12 ]]
        -- upvalues: l_SafeAppStorageService_0 (ref), v2 (ref)
        return l_SafeAppStorageService_0.getItem("AXMarketplaceAccessoryAdjustmentQuickButtonFTUX", v2) ~= "SEEN";
    end;
    local function v4() --[[ Line: 17 ]]
        -- upvalues: l_SafeAppStorageService_0 (ref), v2 (ref)
        l_SafeAppStorageService_0.setItem("AXMarketplaceAccessoryAdjustmentQuickButtonFTUX", "SEEN", v2);
        l_SafeAppStorageService_0.flush();
    end;
    return {
        shouldShowFirstTimeGlow = v3, 
        completeFirstTimeGlow = v4
    };
end;