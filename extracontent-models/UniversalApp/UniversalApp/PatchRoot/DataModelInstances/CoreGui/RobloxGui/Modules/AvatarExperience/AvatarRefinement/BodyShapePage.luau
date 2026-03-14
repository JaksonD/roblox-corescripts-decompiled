local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v3.Focusable;
local v5 = require(l_CorePackages_0.Packages.Foundation);
local v6 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useTopBarHeight_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useTopBarHeight;
local l_useTokens_0 = v5.Hooks.useTokens;
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v12 = require(l_Modules_0.LuaApp.Util.debounce);
local v13 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v14 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneInteractionFrame);
local v17 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v18 = require(l_Modules_0.AvatarExperience.AvatarRefinement.Components.RefinementControlBar);
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.ScalesPage);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v21 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXRemoveBodyShapePageGamepadBindings);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v23 = v14.PeekHeaderHeight + v14.MainNavHeight + v14.SubNavHeight;
return (v20(function() --[[ Line: 44 ]] --[[ Name: BodyShapePage ]]
    -- upvalues: l_useTokens_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v3 (copy), v2 (copy), l_useSelector_0 (copy), v13 (copy), l_useTopBarHeight_0 (copy), l_useNavigation_0 (copy), l_useLocalization_0 (copy), v12 (copy), l_Focusable_0 (copy), v19 (copy), v5 (copy), v23 (copy), v21 (copy), v15 (copy), v17 (copy), v18 (copy), v16 (copy)
    local v24 = l_useTokens_0();
    local v25 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v3.useRootFocusController();
    local v26, v27 = v2.useState(true);
    local v28 = l_useSelector_0(v13);
    local v29 = l_useTopBarHeight_0();
    local v30 = l_useNavigation_0();
    local v31 = l_useLocalization_0({
        title = "Feature.Avatar.Label.Title.BodyShape"
    });
    local v32 = v2.useRef(nil);
    local v33 = v2.useRef(nil);
    local v34 = v2.useCallback(function() --[[ Line: 59 ]]
        -- upvalues: v27 (copy)
        v27(true);
    end, {});
    local v35 = v2.useCallback(function() --[[ Line: 63 ]]
        -- upvalues: v27 (copy)
        v27(false);
    end, {});
    local v36 = v2.useCallback(v12(function() --[[ Line: 68 ]]
        -- upvalues: v27 (copy)
        v27(true);
    end, 1), {});
    local v37 = v2.useCallback(function() --[[ Line: 74 ]]
        -- upvalues: v27 (copy), v36 (copy)
        v27(false);
        v36();
    end, {
        v36
    });
    local function v38() --[[ Line: 80 ]] --[[ Name: onBackButtonPressed ]]
        -- upvalues: v30 (copy)
        v30.pop();
    end;
    local function v39() --[[ Line: 84 ]] --[[ Name: renderLandscapeBodyShapePanel ]]
        -- upvalues: v2 (ref), l_Focusable_0 (ref), v24 (copy), v29 (copy), v19 (ref), v35 (copy), v34 (copy), v37 (copy), v32 (copy)
        return v2.createElement(l_Focusable_0.Frame, {
            BackgroundColor3 = v24.Semantic.Color.Background.Default.Color3, 
            Position = UDim2.fromOffset(v24.Size.Size_2400, v29 + v24.Size.Size_500), 
            Size = UDim2.new(0.5, -v24.Size.Size_2400, 0.8, 0), 
            ZIndex = 2
        }, {
            CornerRadius = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, v24.Size.Size_200)
            }), 
            ScalesPage = v2.createElement(v19, {
                lockNavigationCallback = v35, 
                unlockNavigationCallback = v34, 
                enableNavigation = true, 
                onCanvasPositionChanged = v37, 
                NextSelectionUp = v32
            })
        });
    end;
    local function v40() --[[ Line: 104 ]] --[[ Name: renderPortraitBodyShapePanel ]]
        -- upvalues: v2 (ref), v5 (ref), v26 (copy), v19 (ref), v35 (copy), v34 (copy), v23 (ref)
        return v2.createElement(v5.View, {
            tag = "size-full-full", 
            ZIndex = 2
        }, {
            ScalesPageContainer = v2.createElement(v5.ScrollView, {
                tag = "bg-surface-0 anchor-bottom-left position-bottom-left auto-xy", 
                scroll = {
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    AutomaticCanvasSize = Enum.AutomaticSize.Y
                }, 
                Size = UDim2.new(1, 0, 0.4, 0), 
                isDisabled = not v26
            }, {
                ScalesPage = v2.createElement(v19, {
                    lockNavigationCallback = v35, 
                    unlockNavigationCallback = v34, 
                    enableNavigation = v26
                })
            }), 
            BodyShapePageBottomFiller = v2.createElement(v5.View, {
                tag = "bg-surface-0 position-bottom-left", 
                Size = UDim2.new(1, 0, 0, v23)
            })
        });
    end;
    return v2.createElement(l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v25, 
        defaultChild = v32, 
        inputBindings = if v21 then nil else {
            Back = v3.Input.onBegin(Enum.KeyCode.ButtonB, v38)
        }
    }, {
        GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v2.createElement(v15, {
            focusController = v25, 
            captureFocusOnMount = true
        }), 
        BodyShapePageTopBar = v2.createElement(v17.Container, {
            titleText = v31.title, 
            transparentBackground = true, 
            leftItem = v17.makeBackButton(v38), 
            ref = v32, 
            NextSelectionDown = v33, 
            ZIndex = 3
        }), 
        RefinementControlBar = v2.createElement(v18), 
        BodyShapePageSceneInteractionFrame = if v26 then v2.createElement(v16) else nil, 
        BodyShapePageControlPanel = if v28 then v40() else v39()
    });
end));