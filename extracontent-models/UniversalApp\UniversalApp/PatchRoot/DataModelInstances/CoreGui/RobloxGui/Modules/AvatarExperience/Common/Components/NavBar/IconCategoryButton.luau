local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v3.Focusable;
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_CorePackages_0.Packages.Cryo);
local l_Images_0 = v5.App.ImageSet.Images;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local v10 = require(l_CorePackages_0.Packages.t);
local v11 = require(l_CorePackages_0.Packages.Otter);
local l_withSelectionCursorProvider_0 = v5.App.SelectionImage.withSelectionCursorProvider;
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_withStyle_0 = v5.Style.withStyle;
local v16 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.CategorySubButton);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.NewItemNotification);
local l_NavInnerPadding_0 = v16.NavInnerPadding;
local l_NavCornerSize_0 = v16.NavCornerSize;
local l_NavSubButtonInnerPadding_0 = v16.NavSubButtonInnerPadding;
local l_NavButtonElementPadding_0 = v16.NavButtonElementPadding;
local l_NavButtonElementMargin_0 = v16.NavButtonElementMargin;
local v24 = {
    frequency = 3.0303030303030303, 
    dampingRatio = 1
};
local v25 = v2.PureComponent:extend("IconCategoryButton");
v25.validateProps = v10.strictInterface({
    categoryTitle = v10.string, 
    iconOn = v10.string, 
    iconOff = v10.string, 
    navHeight = v10.number, 
    isSubNavigationButton = v10.boolean, 
    layoutOrder = v10.number, 
    isSelected = v10.boolean, 
    hasNewItemNotification = v10.optional(v10.boolean), 
    frameRef = v10.table, 
    forwardRef = v10.table, 
    onActivate = v10.callback, 
    subButtons = v10.optional(v10.table), 
    onSubButtonSelected = v10.optional(v10.callback), 
    subcatIndex = v10.optional(v10.number), 
    NextSelectionUp = v10.optional(v10.table), 
    NextSelectionDown = v10.optional(v10.table), 
    NextSelectionLeft = v10.optional(v10.table), 
    NextSelectionRight = v10.optional(v10.table), 
    inputBindings = v10.optional(v10.table)
});
v25.init = function(v26) --[[ Line: 69 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v11 (copy), v3 (copy)
    local v27 = v26.props.isSelected and 1 or 0;
    local v28, v29 = v2.createBinding(v27);
    v26.nonIconSizeMultiplierBinding = v28;
    v26.nonIconSizeMultiplierBindingUpdate = v29;
    v26.motor = v11.createSingleMotor(v27);
    v26.motor:onStep(v26.nonIconSizeMultiplierBindingUpdate);
    if v26.props.subButtons and #v26.props.subButtons > 0 then
        v26.subButtonRefs = v3.createRefCache();
    end;
end;
v25.didUpdate = function(v30, v31, _) --[[ Line: 81 ]] --[[ Name: didUpdate ]]
    -- upvalues: v11 (copy), v24 (copy)
    if v30.props.isSelected ~= v31.isSelected then
        local v33 = v30.props.isSelected and 1 or 0;
        v30.motor:setGoal(v11.spring(v33, v24));
    end;
end;
v25.willUnmount = function(v34) --[[ Line: 88 ]] --[[ Name: willUnmount ]]
    v34.motor:destroy();
end;
v25.getDefaultChild = function(v35) --[[ Line: 92 ]] --[[ Name: getDefaultChild ]]
    if not v35.props.isSelected then
        return nil;
    elseif v35.props.subButtons == nil or #v35.props.subButtons == 0 then
        return nil;
    else
        return v35.subButtonRefs[1];
    end;
end;
v25.getSubButtonNextSelectionLeft = function(v36, v37) --[[ Line: 104 ]] --[[ Name: getSubButtonNextSelectionLeft ]]
    if v37 > 1 then
        return v36.subButtonRefs[v37 - 1];
    else
        return v36.props.NextSelectionLeft;
    end;
end;
v25.getSubButtonNextSelectionRight = function(v38, v39) --[[ Line: 112 ]] --[[ Name: getSubButtonNextSelectionRight ]]
    if v39 < #v38.props.subButtons then
        return v38.subButtonRefs[v39 + 1];
    else
        return v38.props.NextSelectionRight;
    end;
end;
v25.getInnerFrameChildren = function(v40, v41, v42, v43, v44, v45, v46, v47, v48) --[[ Line: 120 ]] --[[ Name: getInnerFrameChildren ]]
    -- upvalues: v2 (copy), l_NavButtonElementPadding_0 (copy), v17 (copy), l_NavCornerSize_0 (copy), l_NavButtonElementMargin_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    local v49 = {};
    local v50 = {};
    local l_Theme_0 = v42.Theme;
    local l_isSelected_0 = v40.props.isSelected;
    local v53 = l_isSelected_0 and l_Theme_0.TextEmphasis.Color or l_Theme_0.TextMuted.Color;
    local v54 = l_isSelected_0 and l_Theme_0.TextEmphasis.Transparency or l_Theme_0.TextMuted.Transparency;
    local l_Font_0 = v42.Font.Header2.Font;
    v50.UIPadding = v2.createElement("UIPadding", {
        PaddingBottom = UDim.new(0, 0), 
        PaddingTop = UDim.new(0, 0), 
        PaddingLeft = UDim.new(0, l_NavButtonElementPadding_0), 
        PaddingRight = UDim.new(0, 0)
    });
    v50.UIListLayout = v2.createElement("UIListLayout", {
        Padding = UDim.new(0, l_NavButtonElementPadding_0), 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        FillDirection = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    });
    v50.TextLabel = v2.createElement("TextLabel", {
        Size = UDim2.new(0, v43, 1, 0), 
        LayoutOrder = 1, 
        BackgroundTransparency = 1, 
        Text = v41.title, 
        TextSize = v46, 
        TextColor3 = v53, 
        TextTransparency = v54, 
        Font = l_Font_0, 
        BorderSizePixel = 0
    });
    local l_subButtons_0 = v40.props.subButtons;
    if l_subButtons_0 then
        for v57, v58 in l_subButtons_0 do
            local v59 = v40:getSubButtonNextSelectionLeft(v57);
            local v60 = v40:getSubButtonNextSelectionRight(v57);
            v50[v58.Name] = v2.createElement(v17, {
                title = v41[v58.Name], 
                width = v44[v57], 
                layoutOrder = v57 + 1, 
                index = v57, 
                onSubButtonSelected = function(v61) --[[ Line: 179 ]] --[[ Name: onSubButtonSelected ]]
                    -- upvalues: l_isSelected_0 (copy), v40 (copy)
                    if not l_isSelected_0 then
                        v40.props.onActivate();
                    end;
                    v40.props.onSubButtonSelected(v61);
                end, 
                parentButtonSelected = l_isSelected_0, 
                isClippedWhenParentUnselected = true, 
                buttonRef = v40.subButtonRefs[v57], 
                NextSelectionLeft = v59, 
                NextSelectionRight = v60
            });
        end;
    end;
    v49.UICorner = v2.createElement("UICorner", {
        CornerRadius = UDim.new(0, l_NavCornerSize_0)
    });
    v49.UIPadding = v2.createElement("UIPadding", {
        PaddingBottom = UDim.new(0, 0), 
        PaddingTop = UDim.new(0, 0), 
        PaddingLeft = UDim.new(0, l_NavButtonElementMargin_0), 
        PaddingRight = UDim.new(0, l_NavButtonElementMargin_0)
    });
    v49.Icon = v2.createElement(l_ImageSetLabel_0, {
        LayoutOrder = 2, 
        BackgroundTransparency = 1, 
        Image = if l_isSelected_0 then l_Images_0[v40.props.iconOn] else l_Images_0[v40.props.iconOff], 
        ImageColor3 = l_Theme_0.IconEmphasis.Color, 
        Size = UDim2.new(0, v45, 1, -v47), 
        ScaleType = Enum.ScaleType.Fit, 
        Position = UDim2.new(0, 0, 0, 0)
    });
    v49.ScaledFrame = v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ClipsDescendants = true, 
        Size = v40.nonIconSizeMultiplierBinding:map(function(v62) --[[ Line: 219 ]]
            -- upvalues: v48 (copy), v47 (copy)
            return UDim2.new(0, v62 * v48, 1, -v47);
        end), 
        Position = UDim2.fromOffset(v45, 0)
    }, v50);
    return v49;
end;
v25.renderButtonWithTextAndIcon = function(v63, v64, v65, v66, v67, v68, v69, v70, v71) --[[ Line: 228 ]] --[[ Name: renderButtonWithTextAndIcon ]]
    -- upvalues: v2 (copy), l_Focusable_0 (copy), l_NavInnerPadding_0 (copy), l_CursorKind_0 (copy)
    local l_Font_1 = v65.Font;
    local v73 = l_Font_1.BaseSize * l_Font_1.Header2.RelativeSize;
    local l_Theme_1 = v65.Theme;
    local l_forwardRef_0 = v63.props.forwardRef;
    local l_isSubNavigationButton_0 = v63.props.isSubNavigationButton;
    local v77 = v63:getDefaultChild();
    return v2.createElement(l_Focusable_0.ImageButton, {
        AnchorPoint = Vector2.new(0, 0), 
        Position = UDim2.new(0, 0, 0, l_NavInnerPadding_0), 
        Size = UDim2.new(1, 0, 1, -l_NavInnerPadding_0 + v67), 
        BackgroundTransparency = if l_isSubNavigationButton_0 then l_Theme_1.BackgroundUIDefault.Transparency else l_Theme_1.BackgroundDefault.Transparency, 
        BackgroundColor3 = if l_isSubNavigationButton_0 then l_Theme_1.BackgroundUIDefault.Color else l_Theme_1.BackgroundDefault.Color, 
        [v2.Event.Activated] = v63.props.onActivate, 
        [v2.Ref] = l_forwardRef_0, 
        NextSelectionLeft = v63.props.NextSelectionLeft, 
        NextSelectionRight = v63.props.NextSelectionRight, 
        SelectionImageObject = v66(l_CursorKind_0.NavHighlight), 
        restorePreviousChildFocus = true, 
        defaultChild = v77
    }, v63:getInnerFrameChildren(v64, v65, v68, v69, v70, v73, v67, v71));
end;
v25.renderWithProviders = function(v78, v79, v80, v81) --[[ Line: 282 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_Text_0 (copy), l_NavSubButtonInnerPadding_0 (copy), l_NavButtonElementPadding_0 (copy), l_NavCornerSize_0 (copy), l_NavInnerPadding_0 (copy), l_NavButtonElementMargin_0 (copy), v2 (copy), v18 (copy)
    local l_isSelected_1 = v78.props.isSelected;
    local l_hasNewItemNotification_0 = v78.props.hasNewItemNotification;
    local l_frameRef_0 = v78.props.frameRef;
    local l_Font_2 = v80.Font;
    local l_Font_3 = l_Font_2.Header2.Font;
    local v87 = l_Font_2.BaseSize * l_Font_2.Header2.RelativeSize;
    local v88 = l_Text_0.GetTextWidth(v79.title, l_Font_3, v87);
    local v89 = {};
    local v90 = 0;
    if v78.props.subButtons then
        for _, v92 in v78.props.subButtons do
            local v93 = l_Text_0.GetTextWidth(v79[v92.Name], l_Font_3, v87) + 2 * l_NavSubButtonInnerPadding_0;
            table.insert(v89, v93);
            v90 = v90 + l_NavButtonElementPadding_0 + v93;
        end;
    end;
    local v94 = v78.props.isSubNavigationButton and 0 or l_NavCornerSize_0;
    local v95 = v78.props.navHeight - l_NavInnerPadding_0 - 2 * l_NavButtonElementPadding_0;
    local v96 = l_NavButtonElementPadding_0 + v88 + v90;
    local v97 = l_NavButtonElementMargin_0 + v95 + l_NavButtonElementMargin_0;
    local v98 = v78:renderButtonWithTextAndIcon(v79, v80, v81, v94, v88, v89, v95, v96);
    return v2.createElement("Frame", {
        Size = v78.nonIconSizeMultiplierBinding:map(function(v99) --[[ Line: 319 ]]
            -- upvalues: v97 (copy), v96 (copy), l_NavInnerPadding_0 (ref), v94 (copy)
            return UDim2.new(0, v97 + v99 * v96, 1, -l_NavInnerPadding_0 + v94);
        end), 
        BackgroundTransparency = 1, 
        LayoutOrder = v78.props.layoutOrder, 
        [v2.Ref] = l_frameRef_0
    }, {
        Button = v98, 
        NewItemNotification = l_hasNewItemNotification_0 and v2.createElement(v18, {
            isSelected = l_isSelected_1
        })
    });
end;
v25.render = function(v100) --[[ Line: 339 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_withStyle_0 (copy), l_withSelectionCursorProvider_0 (copy)
    local v101 = {
        title = v100.props.categoryTitle
    };
    if v100.props.subButtons then
        for _, v103 in v100.props.subButtons do
            v101[v103.Name] = v103.Title;
        end;
    end;
    return l_withLocalization_0(v101)(function(v104) --[[ Line: 348 ]]
        -- upvalues: l_withStyle_0 (ref), l_withSelectionCursorProvider_0 (ref), v100 (copy)
        return l_withStyle_0(function(v105) --[[ Line: 349 ]]
            -- upvalues: l_withSelectionCursorProvider_0 (ref), v100 (ref), v104 (copy)
            return l_withSelectionCursorProvider_0(function(v106) --[[ Line: 350 ]]
                -- upvalues: v100 (ref), v104 (ref), v105 (copy)
                return v100:renderWithProviders(v104, v105, v106);
            end);
        end);
    end);
end;
return v2.forwardRef(function(v107, v108) --[[ Line: 357 ]]
    -- upvalues: v2 (copy), v25 (copy), v6 (copy)
    return v2.createElement(v25, v6.Dictionary.join(v107, {
        forwardRef = v108
    }));
end);