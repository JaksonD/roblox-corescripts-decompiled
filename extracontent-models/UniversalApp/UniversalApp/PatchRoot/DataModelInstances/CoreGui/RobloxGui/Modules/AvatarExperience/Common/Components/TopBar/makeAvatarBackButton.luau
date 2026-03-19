local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.ReactUtils);
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v4.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v4.AvatarRoute.Hooks.useAvatarRoute;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v8 = require(l_Modules_0.LuaApp.Components.TopBar.Buttons.makeBackButton);
local v9 = require(l_CorePackages_0.Packages.React);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v11 = require(l_Modules_0.LuaApp.Components.TopBar.TopBarConstants);
local v12 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v13 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v14 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceExperiments);
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local l_useInitializedValue_0 = v3.useInitializedValue;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_usePreferredInput_0 = v12.usePreferredInput;
local v19 = require(l_CorePackages_0.Packages.Cryo);
local l_AXRemoveBackButtonDesktopClientsIXPTest_0 = v14.AXRemoveBackButtonDesktopClientsIXPTest;
local v21 = game:DefineFastFlag("AXRestoreBackButtonForTouch", false);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXCustomizeMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport;
local function v25(v24) --[[ Line: 46 ]] --[[ Name: selectTabBarVisible ]]
    return v24.TabBarVisible;
end;
return function(v26, v27) --[[ Line: 50 ]] --[[ Name: makeAvatarBackButton ]]
    -- upvalues: l_useInitializedValue_0 (copy), v8 (copy), v21 (copy), l_useSelector_0 (copy), v25 (copy), l_getUseSelectorDeepEquals_0 (copy), l_DeviceOrientationMode_0 (copy), l_useAvatarRoute_0 (copy), l_AvatarScreen_0 (copy), l_AXRemoveBackButtonDesktopClientsIXPTest_0 (copy), l_usePreferredInput_0 (copy), v13 (copy), v12 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v9 (copy), v11 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v19 (copy)
    return function(v28) --[[ Line: 51 ]] --[[ Name: AvatarBackButton ]]
        -- upvalues: l_useInitializedValue_0 (ref), v8 (ref), v26 (copy), v21 (ref), l_useSelector_0 (ref), v25 (ref), l_getUseSelectorDeepEquals_0 (ref), l_DeviceOrientationMode_0 (ref), l_useAvatarRoute_0 (ref), l_AvatarScreen_0 (ref), l_AXRemoveBackButtonDesktopClientsIXPTest_0 (ref), l_usePreferredInput_0 (ref), v13 (ref), v12 (ref), l_FFlagAXCustomizeMakeupSupport_0 (ref), v9 (ref), v11 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v27 (copy), v19 (ref)
        local v29 = l_useInitializedValue_0(function() --[[ Line: 53 ]]
            -- upvalues: v8 (ref), v26 (ref)
            return v8(v26);
        end);
        local v30 = if v21 then l_useSelector_0(v25, l_getUseSelectorDeepEquals_0()) else nil;
        local v32 = l_useSelector_0(function(v31) --[[ Line: 61 ]]
            -- upvalues: l_DeviceOrientationMode_0 (ref)
            return v31.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
        end, l_getUseSelectorDeepEquals_0());
        local v33 = l_useAvatarRoute_0();
        local v34 = v33.current.name == l_AvatarScreen_0.SortAndFilters;
        local v35 = v32 and v34;
        if l_AXRemoveBackButtonDesktopClientsIXPTest_0.isEnabled() then
            local v36 = l_usePreferredInput_0();
            local v37 = v13.readTestVariable(l_AXRemoveBackButtonDesktopClientsIXPTest_0.RemoveBackButtonForUser) and v36 ~= v12.Input.Directional;
            if v21 then
                v37 = v37 and v30;
            end;
            if v37 then
                if l_FFlagAXCustomizeMakeupSupport_0 then
                    local v38 = not v32 and v33.current.name ~= l_AvatarScreen_0.LayeredClothingSort and v33.current.name ~= l_AvatarScreen_0.LayeredMakeupSort;
                    v35 = v35 or v38;
                else
                    local v39 = not v32 and v33.current.name ~= l_AvatarScreen_0.LayeredClothingSort;
                    v35 = v35 or v39;
                end;
            end;
        end;
        if v35 then
            return v9.createElement("TextButton", {
                Active = false, 
                AutoButtonColor = false, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(v11.BACK_BUTTON_SIZE, v11.BACK_BUTTON_SIZE), 
                Text = "", 
                Selectable = not l_FFlagAXMigrateAXToGlobalAutofocus_0 and nil
            });
        else
            local l_v28_0 = v28;
            if v27 then
                l_v28_0 = v19.Dictionary.join(v28, {
                    customIcon = v27
                });
            end;
            return v9.createElement(v29, l_v28_0);
        end;
    end;
end;