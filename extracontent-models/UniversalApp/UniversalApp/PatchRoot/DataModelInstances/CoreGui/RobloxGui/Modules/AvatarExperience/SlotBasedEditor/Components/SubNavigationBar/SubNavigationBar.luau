local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Foundation);
local l_useTokens_0 = v3.Hooks.useTokens;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v6 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v12 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_FFlagAXSlotsScrollAway_0 = v12.FFlagAXSlotsScrollAway;
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.ScrollingListWithArrowsAndGradient);
local l_FitFrameHorizontal_0 = require(l_CorePackages_0.Packages.AvatarExperienceDeps).RoactFitComponents.FitFrameHorizontal;
local v17 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local function v19(v18) --[[ Line: 33 ]] --[[ Name: selectCategoryIndex ]]
    return v18.AvatarExperience.AvatarEditor.Categories.category;
end;
local function v21(v20) --[[ Line: 37 ]] --[[ Name: selectSubcategoryIndex ]]
    return v20.AvatarExperience.AvatarEditor.Categories.subcategory;
end;
local function v27(v22) --[[ Line: 49 ]] --[[ Name: SubcategoryPill ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalization_0 (copy), v6 (copy), v10 (copy), v2 (copy), v9 (copy), v3 (copy)
    local v23 = l_useDispatch_0();
    local v24 = l_useLocalization_0({
        label = v22.subCategory.Title
    });
    local v25 = v6(v10);
    local v26 = v2.useCallback(function() --[[ Line: 56 ]]
        -- upvalues: v23 (copy), v9 (ref), v22 (copy), v25 (copy)
        v23(v9(v22.subCategory.Category, v22.subCategory.Subcategory, v25));
    end, {
        v22.subCategory, 
        v23, 
        v25
    });
    return v2.createElement(v3.Chip, {
        text = v24.label, 
        isChecked = v22.isActive, 
        onActivated = v26, 
        LayoutOrder = v22.layoutOrder
    });
end;
SubNavigationBar = function(v28) --[[ Line: 72 ]] --[[ Name: SubNavigationBar ]]
    -- upvalues: l_useTokens_0 (copy), v11 (copy), l_useSelector_0 (copy), v19 (copy), v21 (copy), v2 (copy), v17 (copy), v3 (copy), v27 (copy), l_FitFrameHorizontal_0 (copy), l_FFlagAXSlotsScrollAway_0 (copy), v15 (copy)
    local v29 = l_useTokens_0();
    local v30 = v11();
    local v31 = l_useSelector_0(v19);
    local v32 = l_useSelector_0(v21);
    local v33 = v30[v31];
    local v34 = if v33 and v33.ShowSubcategoriesAsSubnavigation then v33.Subcategories else nil;
    local v35 = v2.useRef(nil);
    local v36 = v2.useRef({});
    local v37 = v17.useOrientation() == v17.BreakpointConfig.Enum.Portrait;
    local v40 = v2.useCallback(function(v38) --[[ Line: 88 ]]
        -- upvalues: v35 (copy)
        local v39 = v38.AbsoluteSize.X or 0;
        if v35.current then
            v35.current.CanvasSize = UDim2.new(0, v39, 1, 0);
        end;
    end, {});
    local v46 = v2.useCallback(function() --[[ Line: 96 ]]
        -- upvalues: v34 (copy), v2 (ref), v3 (ref), v29 (copy), v36 (copy), v32 (copy), v27 (ref), l_FitFrameHorizontal_0 (ref), v40 (copy)
        local v41 = {};
        if v34 then
            local v42 = 1;
            v41.LeftPadding = v2.createElement(v3.View, {
                tag = "auto-xy", 
                Size = UDim2.new(0, v29.Size.Size_300, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = v42
            });
            v42 = v42 + 1;
            for v43, v44 in v34 do
                if not v36.current[v43] then
                    v36.current[v43] = v2.createRef();
                end;
                local v45 = v32 == v43;
                v41[v44.Name or tostring(v43)] = v2.createElement(v27, {
                    subCategory = v44, 
                    isActive = v45, 
                    layoutOrder = v42
                });
                v42 = v42 + 1;
            end;
            v41.RightPadding = v2.createElement(v3.View, {
                tag = "auto-xy", 
                Size = UDim2.new(0, v29.Size.Size_300, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = v42
            });
        end;
        return {
            NavFrame = v2.createElement(l_FitFrameHorizontal_0, {
                height = UDim.new(1, 0), 
                FillDirection = Enum.FillDirection.Horizontal, 
                BackgroundTransparency = 1, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                [v2.Change.AbsoluteSize] = v40, 
                contentPadding = UDim.new(0, v29.Size.Size_200)
            }, v41)
        };
    end, {
        v34, 
        v32, 
        v40, 
        v29
    });
    if not v33 or not v33.ShowSubcategoriesAsSubnavigation then
        return nil;
    else
        local v47 = if l_FFlagAXSlotsScrollAway_0 then v29.Size.Size_1200 else v29.Size.Size_1700;
        return v2.createElement(v3.View, {
            tag = "clip gui-object-defaults", 
            BorderSizePixel = 0, 
            LayoutOrder = v28.LayoutOrder, 
            Size = UDim2.new(1, 0, 0, v47), 
            padding = if not v37 then {
                top = UDim.new(0, v29.Size.Size_250)
            } else nil
        }, {
            ScrollingListWithArrowsAndGradient = v2.createElement(v15, {
                getScollingListContent = v46, 
                listHeight = v47, 
                scrollingFrameRef = v35, 
                buttonRefs = v36.current, 
                buttonPadding = 0
            })
        });
    end;
end;
return SubNavigationBar;