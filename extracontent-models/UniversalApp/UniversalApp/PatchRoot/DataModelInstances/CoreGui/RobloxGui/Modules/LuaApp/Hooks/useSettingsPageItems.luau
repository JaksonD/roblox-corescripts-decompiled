local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v5 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local v7 = require(l_Modules_0.LuaApp.Components.More.Config.MorePageSettings);
local l_useBillingTabVisibility_0 = require(l_CorePackages_0.Workspace.Packages.SettingsTabVisibility).useBillingTabVisibility;
local v9 = require(l_Modules_0.LuaApp.Flags.FFlagEnableBillingTabHideLogic);
return function(v10) --[[ Line: 14 ]] --[[ Name: useSettingsPageItems ]]
    -- upvalues: v4 (copy), v5 (copy), l_UiMode_0 (copy), v9 (copy), l_useBillingTabVisibility_0 (copy), v3 (copy), v7 (copy), v2 (copy)
    local v12 = v4(function(v11) --[[ Line: 15 ]]
        -- upvalues: v10 (copy)
        return v10 or v11.getSettingsPageType();
    end);
    local v14 = v4(function(v13) --[[ Line: 19 ]]
        return v13.getAllowPlatformAccountSwitching();
    end);
    local v15 = v5.useUiModeInfo().uiMode == l_UiMode_0.TenFoot;
    local v16 = if v9 then l_useBillingTabVisibility_0() else {
        showBillingTab = true
    };
    local v17 = v3.useMemo(function() --[[ Line: 30 ]]
        -- upvalues: v7 (ref), v14 (copy)
        return {
            [v7.ItemType.Settings_SwitchProfileSection] = v14
        };
    end, {
        v14
    });
    return v3.useMemo(function() --[[ Line: 37 ]]
        -- upvalues: v9 (ref), v16 (copy), v7 (ref), v12 (copy), v2 (ref), v15 (copy), v17 (copy)
        local v18 = if v9 then {
            hideBillingTab = not v16.showBillingTab
        } else nil;
        local v19 = v7.GetItemsInPage(v12, nil, nil, v18);
        v19 = v2.map(v19, function(v20) --[[ Line: 46 ]]
            return v20.contents;
        end);
        return (v2.map(v19, function(v21) --[[ Line: 50 ]]
            -- upvalues: v2 (ref), v15 (ref), v17 (ref)
            return v2.filter(v21, function(v22) --[[ Line: 51 ]]
                -- upvalues: v15 (ref), v17 (ref)
                if v15 then
                    return v17[v22.itemInfo.itemType] ~= false;
                else
                    return v17[v22.itemType] ~= false;
                end;
            end);
        end));
    end, {
        v12, 
        v15, 
        v17, 
        if v9 then not v16.showBillingTab else nil
    });
end;