local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v10 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.VerticalClothingList);
local v11 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.ResetButton);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneInteractionFrame);
local v13 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.VRAvatarRotateHandler);
local v15 = require(l_Modules_0.AvatarExperience.AvatarRefinement.Constants);
local v16 = require(l_Modules_0.AvatarExperience.AvatarRefinement.Components.RefinementNavBar);
local v17 = require(l_Modules_0.AvatarExperience.AvatarRefinement.Components.RefinementControlBar);
local v18 = if require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateSceneGamepadHandlerInputBindings then require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneGamepadHandler) else require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneGamepadHandler_DEPRECATED);
local v19 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v20 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v21 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v19.FocusNavigationEventNameEnum;
local l_useTableWrappedCallbackRef_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local v24 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v25 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXHideUndoRedoOnLayeredPages_0 = v24.FFlagAXHideUndoRedoOnLayeredPages;
local v28 = {
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.ButtonY] = l_FocusNavigationEventNameEnum_0.OpenLayeredMakeupSortResetPrompt
};
local function v35(v29, v30, v31) --[[ Line: 70 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v20 (copy), v28 (copy), v2 (copy), l_FocusNavigationEventNameEnum_0 (copy), v21 (copy)
    local v32 = v20.useEventMap(v28, v29);
    local v34 = v2.useMemo(function() --[[ Line: 72 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v21 (ref), v30 (copy), v31 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v21.onRelease(function(v33) --[[ Line: 75 ]]
                    -- upvalues: v30 (ref)
                    v33.cancelled = true;
                    v30();
                end)
            }, 
            [l_FocusNavigationEventNameEnum_0.OpenLayeredMakeupSortResetPrompt] = if v31 then {
                handler = v21.onRelease(v31)
            } else nil
        };
    end, {
        v30, 
        v31
    });
    return v20.useEventHandlerMap(v34, v32);
end;
local v36 = l_Images_0["icons/menu/about_large"];
local v37 = UDim.new(0, 10);
return function(v38) --[[ Line: 94 ]]
    -- upvalues: l_useStyle_0 (copy), l_useTokens_0 (copy), v2 (copy), v35 (copy), l_useTableWrappedCallbackRef_0 (copy), v12 (copy), v3 (copy), v10 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v11 (copy), v14 (copy), v15 (copy), v37 (copy), l_ImageSetLabel_0 (copy), v36 (copy), v18 (copy), v13 (copy), v25 (copy), v17 (copy), l_FFlagAXHideUndoRedoOnLayeredPages_0 (copy), v16 (copy)
    local v39 = l_useStyle_0();
    local v40 = l_useTokens_0();
    local v41 = v2.useRef(nil);
    local v42 = v2.useRef(nil);
    local v43 = v35(v41, v38.onGoBack, if #v38.equippedLayeredMakeupAssetIdsOrdered > 0 then v38.onOpenResetPrompt else nil);
    local v44 = l_useTableWrappedCallbackRef_0(v43);
    local v45 = not (#v38.equippedLayeredMakeupAssetIdsOrdered > 0) and #v38.equippedLayeredMakeupAssetIdsOrdered == 0;
    local v46 = v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, -v38.topBarHeight), 
        Position = UDim2.fromOffset(0, v38.topBarHeight), 
        BackgroundTransparency = 1, 
        ZIndex = 2
    }, {
        SceneInteractionFrame = v2.createElement(v12), 
        VerticalClothingList = not v45 and v2.createElement(v3.Focusable[v10], {
            lastInputIsGamepad = v38.isGamepad, 
            topBarRef = v42, 
            focusControllerProp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v3.createFocusController(), 
            onDragChange = v38.onDragChange
        }), 
        ResetButton = not v45 and v2.createElement(v11, {
            lastInputIsGamepad = v38.isGamepad, 
            isDragging = v38.isDragging
        }), 
        VRAvatarRotateHandler = if v38.isSpatial then v2.createElement(v14) else nil, 
        NoItemsMessage = v45 and v2.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1, v15.NoItem.BottomPadding), 
            Size = if v38.isSpatial then UDim2.new(1, 0, 0, 50) else UDim2.new(1, 0, 0, 100), 
            BackgroundColor3 = v39.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = v38.isSpatial and 0 or 1
        }, {
            UICorner = if v38.isSpatial then v2.createElement("UICorner", {
                CornerRadius = v37
            }) else nil, 
            NoItemsTextLabel = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromScale(0, 0), 
                Text = v38.localized.noItemText, 
                Font = v39.Font.CaptionHeader.Font, 
                TextSize = v40.Typography.BodyMedium.FontSize, 
                TextColor3 = v39.Theme.IconEmphasis.Color, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            }, {
                NoItemsIcon = v2.createElement(l_ImageSetLabel_0, {
                    Image = v36, 
                    AnchorPoint = Vector2.new(1, 0.5), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0, -2, 0.5, 0), 
                    Size = UDim2.fromOffset(v15.NoItem.IconSize, v15.NoItem.IconSize), 
                    ImageColor3 = v39.Theme.IconEmphasis.Color
                })
            })
        })
    });
    if v38.isSpatial then
        return v46;
    else
        return v2.createElement(v3.Focusable.Frame, {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            ref = v44
        }, {
            SceneGamepadHandler = v2.createElement(v18, nil, {
                TopBar = v2.createElement(v13.Container, {
                    titleText = v38.localized.makeupSorting, 
                    transparentBackground = true, 
                    hideSiteMessageBanner = v38.isPortrait, 
                    leftItem = v38.backButton, 
                    ZIndex = 1, 
                    ref = v42
                }), 
                RefinementControlBar = if v25() then v2.createElement(v17, {
                    hideUndoRedo = l_FFlagAXHideUndoRedoOnLayeredPages_0 and true or nil
                }) else nil, 
                RefinementNavBar = if v25() then nil else v2.createElement(v16), 
                LayeredMakeupSortPageFrame = v46
            })
        });
    end;
end;