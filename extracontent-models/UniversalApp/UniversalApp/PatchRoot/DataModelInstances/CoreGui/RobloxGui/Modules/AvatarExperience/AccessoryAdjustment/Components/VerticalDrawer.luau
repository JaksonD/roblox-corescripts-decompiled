local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v6.Focusable;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local l_useSelectionCursor_0 = v5.App.SelectionImage.useSelectionCursor;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useProperty_0 = require(l_CorePackages_0.Workspace.Packages.GuiObjectUtils).useProperty;
local v14 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v15 = require(l_Modules_0.AvatarExperience.Common.Context.AppliedDescription.useAppliedDescriptionValueContext);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_withNavigationFocus_0 = require(l_CorePackages_0.Packages.RoactNavigation).withNavigationFocus;
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local v19 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.AccessoryAdjustmentUtils);
local l_LoadableImage_0 = v5.App.Loading.LoadableImage;
local v21 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_getRbxthumbWithTypeSizeAndOptions_0 = v21.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_Constants_0 = v21.Utils.Constants;
local v24 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Actions.SetSelectedAccessory);
local v25 = require(l_Modules_0.AvatarExperience.AvatarRefinement.Constants);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v27 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Services.Analytics);
local v28 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Thunks.SendRefinementAnalytics);
local v29 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v30 = game:DefineFastFlag("AXVerticalDrawerCropTiles", false);
local v31 = game:DefineFastFlag("AXFixUndoRedoAccessoryAdjustment", false);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v33 = UDim.new(0, 6);
local function v35(v34) --[[ Line: 67 ]] --[[ Name: selectTopbarHeight ]]
    return v34.TopBar.topBarHeight;
end;
local function v41(v36) --[[ Line: 71 ]] --[[ Name: selectMaxScreenHeight ]]
    -- upvalues: v30 (copy)
    local l_GlobalGuiInset_0 = v36.GlobalGuiInset;
    local l_ScreenSize_0 = v36.ScreenSize;
    local l_topBarHeight_0 = v36.TopBar.topBarHeight;
    local v40 = l_ScreenSize_0.Y - l_topBarHeight_0 - l_GlobalGuiInset_0.bottom - l_GlobalGuiInset_0.top - 32 - 48;
    if v30 and (v40 - 16) % 50 < 12.5 then
        v40 = v40 - 25;
    end;
    return v40;
end;
local function v43(v42) --[[ Line: 92 ]] --[[ Name: selectAllowedAATypes ]]
    -- upvalues: v29 (copy)
    return v42.AvatarExperience.AvatarEditor.AvatarSettings[v29.AvatarSettings.accessoryRefinementTypes];
end;
local function v59(v44, v45, v46) --[[ Line: 96 ]] --[[ Name: getChildren ]]
    -- upvalues: l_useSelector_0 (copy), v43 (copy), v15 (copy), v19 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), v14 (copy), v27 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), v3 (copy), l_Constants_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v31 (copy), v4 (copy), l_Focusable_0 (copy), l_AvatarScreen_0 (copy), v28 (copy), v24 (copy), l_LoadableImage_0 (copy), v33 (copy)
    local v47 = {};
    local v48 = l_useSelector_0(v43);
    local v49 = v15().appliedDescriptionBinding:getValue();
    if v49 then
        v47 = v19.getAdjustableAccessories(v49, v48);
    end;
    local v50 = {};
    local l_Theme_0 = l_useStyle_0().Theme;
    local v52 = l_useDispatch_0();
    local v53 = v14(v27);
    local v54 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRectNoInset);
    v50.UIListLayout = v3.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        FillDirection = Enum.FillDirection.Vertical, 
        Padding = UDim.new(0, 8), 
        ref = v44
    });
    v50.UIPadding = v3.createElement("UIPadding", {
        PaddingTop = UDim.new(0, 16), 
        PaddingBottom = UDim.new(0, 16), 
        PaddingLeft = UDim.new(0, 8), 
        PaddingRight = UDim.new(0, 8)
    });
    for v55, v56 in v47 do
        local l_Asset_0 = l_Constants_0.RbxthumbTypes.Asset;
        local v58 = l_getRbxthumbWithTypeSizeAndOptions_0(v56, l_Asset_0, 150);
        v50[if v31 then v55 else v56] = v4.createElement(l_Focusable_0.ImageButton, {
            Size = UDim2.fromOffset(50, 50), 
            BackgroundTransparency = 1, 
            SizeConstraint = Enum.SizeConstraint.RelativeXX, 
            LayoutOrder = v55, 
            ref = v45[v55], 
            [v4.Event.Activated] = function() --[[ Line: 141 ]]
                -- upvalues: v46 (copy), l_AvatarScreen_0 (ref), v52 (copy), v28 (ref), v53 (copy), v24 (ref), v56 (copy)
                v46.navigation.navigate(l_AvatarScreen_0.AdjustAccessoryView);
                v52(v28(v53.avatarRefineAccessoryStart));
                v52(v24(v56));
            end, 
            NextSelectionDown = v55 < #v47 and v45[v55 + 1] or nil, 
            NextSelectionUp = v55 > 1 and v45[v55 - 1] or nil, 
            SelectionImageObject = v54
        }, {
            BackgroundImage = v4.createElement("Frame", {
                BackgroundColor3 = l_Theme_0.PlaceHolder.Color, 
                BackgroundTransparency = l_Theme_0.PlaceHolder.Transparency, 
                BorderSizePixel = 0, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromScale(1, 1), 
                ZIndex = 0
            }, {
                Image = v4.createElement(l_LoadableImage_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = v58, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.fromScale(1, 1), 
                    ZIndex = 0, 
                    cornerRadius = v33, 
                    showFailedStateWhenLoadingFailed = true, 
                    useShimmerAnimationWhileLoading = true
                }), 
                UICorner = v4.createElement("UICorner", {
                    CornerRadius = v33
                })
            })
        });
    end;
    return v50;
end;
local v70 = l_withNavigationFocus_0((v18(function(v60) --[[ Line: 182 ]] --[[ Name: VerticalDrawer ]]
    -- upvalues: l_useStyle_0 (copy), v6 (copy), v3 (copy), l_useProperty_0 (copy), l_useSelector_0 (copy), v41 (copy), v59 (copy), v35 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), l_IsVRAppBuild_0 (copy), v25 (copy)
    local l_Theme_1 = l_useStyle_0().Theme;
    local l_forwardRef_0 = v60.forwardRef;
    local v63 = v6.useRefCache();
    local v64 = v3.useRef(nil);
    local v65 = l_useProperty_0(v64, "AbsoluteContentSize") or Vector2.new(0, 0);
    local function _() --[[ Line: 194 ]] --[[ Name: useVerticalDrawerHeight ]]
        -- upvalues: l_useSelector_0 (ref), v41 (ref), v65 (copy)
        return (math.min(l_useSelector_0(v41), v65.Y + 32));
    end;
    local v67 = math.min(l_useSelector_0(v41), v65.Y + 32);
    local v68 = v59(v64, v63, v60);
    local v69 = l_useSelector_0(v35);
    return v3.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
        AnchorPoint = if l_IsVRAppBuild_0() then Vector2.new(1, 0) else Vector2.new(1, 0), 
        Size = UDim2.new(0, 66, 0, v67), 
        Position = if l_IsVRAppBuild_0() then UDim2.new(1, 0, 0, v25.Tile.MoreIconSize + v25.VerticalList.Padding) else UDim2.new(1, -v25.RightMargin, 0, v69), 
        BackgroundColor3 = l_Theme_1.BackgroundMuted.Color, 
        BackgroundTransparency = l_Theme_1.BackgroundMuted.Transparency, 
        ClipsDescendants = true, 
        defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v63[1], 
        ref = l_forwardRef_0, 
        NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v60.NextSelectionLeft, 
        restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil, 
        ZIndex = 3
    }, {
        UICorner = v3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        ScrollingFrame = v3.createElement("ScrollingFrame", {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            CanvasSize = UDim2.new(1, 0, 0, 0), 
            ScrollBarThickness = 0, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            Size = UDim2.fromScale(1, 1), 
            Selectable = not l_FFlagAXMigrateAXToGlobalAutofocus_0 and nil
        }, v68)
    });
end)));
return v4.forwardRef(function(v71, v72) --[[ Line: 238 ]]
    -- upvalues: v4 (copy), v70 (ref), v2 (copy)
    return v4.createElement(v70, v2.Dictionary.join(v71, {
        forwardRef = v72
    }));
end);