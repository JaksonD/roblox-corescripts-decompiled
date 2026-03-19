local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_ContextualMenu_0 = v5.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v5.App.Menu.MenuDirection;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v14 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v15 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v16 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v17 = require(l_Modules_0.LuaApp.Constants);
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXMigrateCatalogContextMenuFromRoactGamepad_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateCatalogContextMenuFromRoactGamepad;
local v21 = game:DefineFastFlag("FixNilButtonCrashApp", false);
local l_Focusable_0 = v3.Focusable;
local v42 = v12(function(v23) --[[ Line: 60 ]] --[[ Name: ContextFrame ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDesignTokens_0 (copy), v11 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), v15 (copy), v14 (copy), v16 (copy), v17 (copy), v2 (copy), v21 (copy), v4 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), l_ContextualMenu_0 (copy), l_MenuDirection_0 (copy)
    local v24 = l_useNavigation_0();
    local v25 = l_useDesignTokens_0();
    local function v26() --[[ Line: 64 ]]
        -- upvalues: v11 (ref), v24 (copy), v23 (copy)
        v11.closeOverlay(v24);
        if v23.onOverlayClosed ~= nil then
            v23.onOverlayClosed();
        end;
    end;
    local v28 = l_useSelector_0(function(v27) --[[ Line: 71 ]]
        return v27.ScreenSize;
    end, l_getUseSelectorDeepEquals_0());
    local v30 = l_useSelector_0(function(v29) --[[ Line: 75 ]]
        return v29.GamepadBottomBar.boundInputs;
    end, l_getUseSelectorDeepEquals_0());
    local v31 = l_useSelector_0(v15, l_getUseSelectorDeepEquals_0());
    local v32 = v31 and 0 or v14.LandscapeNavWidth;
    local v33 = v31 and 1 or v14.LandscapeSceneWidth;
    local v34 = -76;
    if v16.getNumElementsWithKeyField(v30) > 0 then
        v34 = -76 - v17.GAMEPAD_BOTTOM_BAR_SIZE;
    end;
    local v35 = nil;
    local v36 = nil;
    if v23.centered and not v31 then
        local v37 = math.min(v28.X, 640);
        v35 = UDim2.fromOffset((v28.X - v37) / 2, 0);
        v36 = UDim2.new(0, v37, 1, 0);
    else
        v35 = UDim2.fromScale(v32, 0);
        v36 = UDim2.fromScale(v33, 1);
    end;
    local v41 = v2.useMemo(function() --[[ Line: 99 ]]
        -- upvalues: v23 (copy), v21 (ref), v4 (ref), v24 (copy)
        local l_contextButtons_0 = v23.contextButtons;
        if v21 then
            l_contextButtons_0 = v4.List.filter(v23.contextButtons, function(v39) --[[ Line: 102 ]]
                return v39 ~= nil;
            end);
        end;
        return v4.List.map(l_contextButtons_0, function(v40) --[[ Line: 106 ]]
            -- upvalues: v4 (ref), v24 (ref)
            if not v40.onActivated then
                return v40;
            else
                return v4.Dictionary.join(v40, {
                    onActivated = function() --[[ Line: 112 ]] --[[ Name: onActivated ]]
                        -- upvalues: v40 (copy), v24 (ref)
                        v40.onActivated(v24);
                    end
                });
            end;
        end);
    end, {
        v23.contextButtons, 
        v24
    });
    return v2.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Position = v35, 
        Size = v36
    }, {
        SizeFrame = v2.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(0.5, 0), 
            Size = UDim2.fromScale(1, 1)
        }, {
            ContextMenuPadding = v2.createElement("UIPadding", {
                PaddingRight = UDim.new(0, v25.Global.Size_300), 
                PaddingLeft = UDim.new(0, v25.Global.Size_300)
            }), 
            ContextMenu = v2.createElement(l_ContextualMenu_0, {
                buttonProps = v41, 
                closeBackgroundVisible = true, 
                menuDirection = l_MenuDirection_0.Up, 
                onDismiss = v26, 
                open = true, 
                openPositionY = UDim.new(1, v34), 
                screenSize = v28, 
                contextMenuWidthOverride = UDim.new(1, 0)
            })
        })
    });
end);
if l_FFlagAXMigrateAXToGlobalAutofocus_0 or not l_FFlagAXMigrateCatalogContextMenuFromRoactGamepad_0 then
    v42 = v13(v42);
end;
return v42;