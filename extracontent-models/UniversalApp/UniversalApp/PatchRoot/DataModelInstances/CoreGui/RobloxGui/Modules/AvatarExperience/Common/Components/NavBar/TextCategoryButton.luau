local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v3.Focusable;
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_CorePackages_0.Packages.Cryo);
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local v8 = require(l_CorePackages_0.Packages.t);
local l_withSelectionCursorProvider_0 = v5.App.SelectionImage.withSelectionCursorProvider;
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_withStyle_0 = v5.Style.withStyle;
local v13 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.CategorySubButton);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.NewItemNotification);
local v16 = v2.PureComponent:extend("TextCategoryButton");
local l_NavButtonElementPadding_0 = v13.NavButtonElementPadding;
local l_NavButtonElementMargin_0 = v13.NavButtonElementMargin;
local l_NavInnerPadding_0 = v13.NavInnerPadding;
local l_NavCornerSize_0 = v13.NavCornerSize;
local l_NavButtonBorderSize_0 = v13.NavButtonBorderSize;
local l_NavSubButtonInnerPadding_0 = v13.NavSubButtonInnerPadding;
v16.validateProps = v8.strictInterface({
    categoryTitle = v8.string, 
    layoutOrder = v8.number, 
    isSelected = v8.boolean, 
    hasNewItemNotification = v8.optional(v8.boolean), 
    frameRef = v8.table, 
    onActivate = v8.callback, 
    subButtons = v8.optional(v8.table), 
    onSubButtonSelected = v8.optional(v8.callback), 
    subcatIndex = v8.optional(v8.number), 
    forwardRef = v8.table, 
    NextSelectionUp = v8.optional(v8.table), 
    NextSelectionDown = v8.optional(v8.table), 
    NextSelectionLeft = v8.optional(v8.table), 
    NextSelectionRight = v8.optional(v8.table), 
    inputBindings = v8.optional(v8.table)
});
v16.init = function(v23) --[[ Line: 58 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    if v23.props.subButtons and #v23.props.subButtons > 0 then
        v23.subButtonRefs = v3.createRefCache();
    end;
end;
v16.getDefaultChild = function(v24) --[[ Line: 64 ]] --[[ Name: getDefaultChild ]]
    if v24.props.subButtons == nil or #v24.props.subButtons == 0 then
        return nil;
    else
        return v24.subButtonRefs[1];
    end;
end;
v16.getSubButtonNextSelectionLeft = function(v25, v26) --[[ Line: 71 ]] --[[ Name: getSubButtonNextSelectionLeft ]]
    if v26 > 1 then
        return v25.subButtonRefs[v26 - 1];
    else
        return nil;
    end;
end;
v16.getSubButtonNextSelectionRight = function(v27, v28) --[[ Line: 80 ]] --[[ Name: getSubButtonNextSelectionRight ]]
    if v28 < #v27.props.subButtons then
        return v27.subButtonRefs[v28 + 1];
    else
        return nil;
    end;
end;
v16.getInnerFrameChildren = function(v29, v30, v31, v32, v33, v34, v35) --[[ Line: 89 ]] --[[ Name: getInnerFrameChildren ]]
    -- upvalues: l_NavCornerSize_0 (copy), l_NavButtonBorderSize_0 (copy), v2 (copy), l_NavButtonElementMargin_0 (copy), l_NavButtonElementPadding_0 (copy), v14 (copy)
    local v36 = {};
    local l_isSelected_0 = v29.props.isSelected;
    local v38 = if l_isSelected_0 then l_NavCornerSize_0 - l_NavButtonBorderSize_0 else l_NavCornerSize_0;
    local l_Theme_0 = v31.Theme;
    local v40 = l_isSelected_0 and l_Theme_0.TextEmphasis.Transparency or l_Theme_0.TextMuted.Transparency;
    local l_Font_0 = v31.Font.Header2.Font;
    v36.UICorner = v2.createElement("UICorner", {
        CornerRadius = UDim.new(0, v38)
    });
    v36.UIPadding = v2.createElement("UIPadding", {
        PaddingBottom = UDim.new(0, 0), 
        PaddingTop = UDim.new(0, 0), 
        PaddingLeft = UDim.new(0, l_NavButtonElementMargin_0), 
        PaddingRight = UDim.new(0, l_NavButtonElementMargin_0)
    });
    v36.UIListLayout = v2.createElement("UIListLayout", {
        Padding = UDim.new(0, l_NavButtonElementPadding_0), 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        FillDirection = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    });
    v36.TextLabel = v2.createElement("TextLabel", {
        Size = UDim2.new(0, v32, 1, 0), 
        LayoutOrder = 1, 
        BackgroundTransparency = 1, 
        Text = v30.title, 
        TextSize = v35, 
        TextColor3 = v34, 
        TextTransparency = v40, 
        Font = l_Font_0, 
        BorderSizePixel = 0
    });
    local l_subButtons_0 = v29.props.subButtons;
    if l_subButtons_0 then
        for v43, v44 in l_subButtons_0 do
            local v45 = v29:getSubButtonNextSelectionLeft(v43);
            local v46 = v29:getSubButtonNextSelectionRight(v43);
            v36[v44.Name] = v2.createElement(v14, {
                title = v30[v44.Name], 
                width = v33[v43], 
                layoutOrder = v43 + 1, 
                index = v43, 
                onSubButtonSelected = function(v47) --[[ Line: 149 ]] --[[ Name: onSubButtonSelected ]]
                    -- upvalues: l_isSelected_0 (copy), v29 (copy)
                    if not l_isSelected_0 then
                        v29.props.onActivate();
                    end;
                    v29.props.onSubButtonSelected(v47);
                end, 
                parentButtonSelected = l_isSelected_0, 
                buttonRef = v29.subButtonRefs[v43], 
                NextSelectionLeft = v45, 
                NextSelectionRight = v46
            });
        end;
    end;
    return v36;
end;
v16.renderButtonWithText = function(v48, v49, v50, v51) --[[ Line: 166 ]] --[[ Name: renderButtonWithText ]]
    -- upvalues: l_Text_0 (copy), l_NavSubButtonInnerPadding_0 (copy), l_NavButtonElementPadding_0 (copy), l_NavButtonElementMargin_0 (copy), v2 (copy), l_Focusable_0 (copy), l_NavButtonBorderSize_0 (copy), l_NavInnerPadding_0 (copy), l_CursorKind_0 (copy), l_NavCornerSize_0 (copy)
    local l_Font_1 = v50.Font;
    local l_Font_2 = l_Font_1.Header2.Font;
    local v54 = l_Font_1.BaseSize * l_Font_1.Header2.RelativeSize;
    local v55 = l_Text_0.GetTextWidth(v49.title, l_Font_2, v54);
    local l_Theme_1 = v50.Theme;
    local l_isSelected_1 = v48.props.isSelected;
    local v58 = l_isSelected_1 and l_Theme_1.TextEmphasis.Color or l_Theme_1.TextMuted.Color;
    local v59 = {};
    local v60 = 0;
    if v48.props.subButtons then
        for _, v62 in v48.props.subButtons do
            local v63 = l_Text_0.GetTextWidth(v49[v62.Name], l_Font_2, v54) + 2 * l_NavSubButtonInnerPadding_0;
            table.insert(v59, v63);
            v60 = v60 + l_NavButtonElementPadding_0 + v63;
        end;
    end;
    local v64 = l_NavButtonElementMargin_0 + v55 + v60 + l_NavButtonElementMargin_0;
    local v65 = v48:getDefaultChild();
    if l_isSelected_1 then
        return v2.createElement(l_Focusable_0.TextButton, {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            Size = UDim2.new(0, v64 + l_NavButtonBorderSize_0 * 2, 1, -l_NavInnerPadding_0), 
            BackgroundTransparency = 0, 
            BackgroundColor3 = v58, 
            [v2.Event.Activated] = function() --[[ Line: 198 ]]
                -- upvalues: v48 (copy)
                v48.props.onActivate();
            end, 
            [v2.Ref] = v48.props.forwardRef, 
            NextSelectionLeft = v48.props.NextSelectionLeft, 
            NextSelectionRight = v48.props.NextSelectionRight, 
            SelectionImageObject = v51(l_CursorKind_0.NavHighlight), 
            defaultChild = v65
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, l_NavCornerSize_0)
            }), 
            InnerFrame = v2.createElement("Frame", {
                Size = UDim2.new(1, -l_NavButtonBorderSize_0 * 2, 1, -l_NavButtonBorderSize_0 * 2), 
                Position = UDim2.fromOffset(l_NavButtonBorderSize_0, l_NavButtonBorderSize_0), 
                BackgroundTransparency = 0, 
                BackgroundColor3 = l_Theme_1.BackgroundUIDefault.Color, 
                BorderSizePixel = 0
            }, v48:getInnerFrameChildren(v49, v50, v55, v59, v58, v54))
        });
    else
        return v2.createElement(l_Focusable_0.TextButton, {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            Size = UDim2.new(0, v64, 1, -l_NavInnerPadding_0), 
            BackgroundTransparency = 0, 
            BackgroundColor3 = l_Theme_1.BackgroundUIDefault.Color, 
            BorderSizePixel = 0, 
            [v2.Event.Activated] = function() --[[ Line: 227 ]]
                -- upvalues: v48 (copy)
                v48.props.onActivate();
            end, 
            [v2.Ref] = v48.props.forwardRef, 
            NextSelectionLeft = v48.props.NextSelectionLeft, 
            NextSelectionRight = v48.props.NextSelectionRight, 
            SelectionImageObject = v51(l_CursorKind_0.NavHighlight), 
            defaultChild = v65
        }, v48:getInnerFrameChildren(v49, v50, v55, v59, v58, v54));
    end;
end;
v16.renderWithProviders = function(v66, v67, v68, v69) --[[ Line: 240 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v2 (copy), v15 (copy)
    local l_isSelected_2 = v66.props.isSelected;
    local l_hasNewItemNotification_0 = v66.props.hasNewItemNotification;
    local l_frameRef_0 = v66.props.frameRef;
    local v73 = v66:renderButtonWithText(v67, v68, v69);
    return v2.createElement("Frame", {
        Size = UDim2.new(0, 0, 1, 0), 
        AutomaticSize = Enum.AutomaticSize.X, 
        BackgroundTransparency = 1, 
        LayoutOrder = v66.props.layoutOrder, 
        [v2.Ref] = l_frameRef_0
    }, {
        Button = v73, 
        NewItemNotification = l_hasNewItemNotification_0 and v2.createElement(v15, {
            isSelected = l_isSelected_2
        })
    });
end;
v16.render = function(v74) --[[ Line: 261 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_withStyle_0 (copy), l_withSelectionCursorProvider_0 (copy)
    local v75 = {
        title = v74.props.categoryTitle
    };
    if v74.props.subButtons then
        for _, v77 in v74.props.subButtons do
            v75[v77.Name] = v77.Title;
        end;
    end;
    return l_withLocalization_0(v75)(function(v78) --[[ Line: 270 ]]
        -- upvalues: l_withStyle_0 (ref), l_withSelectionCursorProvider_0 (ref), v74 (copy)
        return l_withStyle_0(function(v79) --[[ Line: 271 ]]
            -- upvalues: l_withSelectionCursorProvider_0 (ref), v74 (ref), v78 (copy)
            return l_withSelectionCursorProvider_0(function(v80) --[[ Line: 272 ]]
                -- upvalues: v74 (ref), v78 (ref), v79 (copy)
                return v74:renderWithProviders(v78, v79, v80);
            end);
        end);
    end);
end;
return v2.forwardRef(function(v81, v82) --[[ Line: 279 ]]
    -- upvalues: v2 (copy), v16 (copy), v6 (copy)
    return v2.createElement(v16, v6.Dictionary.join(v81, {
        forwardRef = v82
    }));
end);