local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.RoactGamepad);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_wasLastInputGamepad_0 = require(l_Parent_0.RoactUtils).wasLastInputGamepad;
local v8 = require(l_Parent_0.AXCommon);
local v9 = require(l_script_FirstAncestor_0.Components.FlexLayout);
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_ImageSetButton_0 = v3.Core.ImageSet.ImageSetButton;
local l_useSelectionCursor_0 = v3.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v3.App.SelectionImage.CursorKind;
local l_Focusable_0 = v4.Focusable;
local l_AXRecentlyViewedSearchItemsIXPTest_0 = v8.Experiments.AXRecentlyViewedSearchItemsIXPTest;
local v17 = game:DefineFastFlag("AXFixConditionalUseRefSearchBar", false);
local v18 = {
    clear = l_Images_0["icons/actions/edit/clear_small"], 
    search = l_Images_0["icons/common/search_small"]
};
local v19 = {
    cancelButtonText = "Feature.Catalog.Action.Cancel", 
    placeholder = "Feature.Catalog.Search.Placeholder"
};
local function v21(v20) --[[ Line: 37 ]] --[[ Name: mapTokens ]]
    return {
        borderRadius = v20.Semantic.Radius.Medium, 
        cancelButtonPadding = v20.Global.Space_100, 
        defaultHeight = v20.Global.Size_500, 
        font = v20.Semantic.Typography.Body.Font, 
        iconAndTextInputMargin = v20.Global.Space_200, 
        iconOffsetX = v20.Global.Size_150, 
        iconSize = v20.Global.Size_200, 
        inputAndCancelButtonMargin = v20.Global.Space_100, 
        inputBackgroundColor = v20.Semantic.Color.Background.Contrast.Color3, 
        textIconColor = v20.Semantic.Color.Text.Emphasis.Color3, 
        textIconTransparency = v20.Semantic.Color.Text.Emphasis.Transparency, 
        textSize = v20.Semantic.Typography.Body.FontSize
    };
end;
return v2.forwardRef(function(v22, v23) --[[ Line: 71 ]] --[[ Name: SearchBar ]]
    -- upvalues: l_useLocalization_0 (copy), v19 (copy), l_useDesignTokens_0 (copy), v21 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), v2 (copy), l_AXRecentlyViewedSearchItemsIXPTest_0 (copy), v17 (copy), l_wasLastInputGamepad_0 (copy), v9 (copy), l_ImageSetLabel_0 (copy), v18 (copy), l_Focusable_0 (copy), l_ImageSetButton_0 (copy)
    local v24 = l_useLocalization_0(v19);
    local v25 = l_useDesignTokens_0(v21);
    local v26 = l_useSelectionCursor_0(l_CursorKind_0.InputFields);
    local v27 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRect);
    local v28 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRectNoInset);
    local v29, v30 = v2.useState(v22.text and v22.text ~= "");
    local v31 = if not not l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() or v17 then v23 else v23 or v2.useRef(nil);
    local v32 = v2.useRef(nil);
    local v33 = v2.useRef(nil);
    local v34 = v2.useRef(false);
    local v35 = v22.height or v25.defaultHeight;
    local v36 = v22.placeholder or v24.placeholder;
    local v37 = v25.iconSize + 2 * v25.iconOffsetX;
    local v38 = -v37 + if v29 then -v37 else 0;
    local v39 = -(v25.iconSize + v25.iconOffsetX);
    v2.useEffect(function() --[[ Line: 96 ]]
        -- upvalues: v22 (copy), v17 (ref), v31 (copy), v34 (copy), l_wasLastInputGamepad_0 (ref)
        if v22.autofocus and (not v17 or v31) and v31.current and not v34.current and not l_wasLastInputGamepad_0() then
            v34.current = true;
            v31.current:CaptureFocus();
        end;
    end, {
        v22.autofocus
    });
    local function v40() --[[ Line: 114 ]]
        -- upvalues: v17 (ref), v31 (copy), v22 (copy)
        if (not v17 or v31) and v31.current then
            if v22.onClear then
                v22.onClear(v31.current.Text or "");
            end;
            v31.current.Text = "";
            v31.current:CaptureFocus();
        end;
    end;
    return v2.createElement(v9, {
        margin = v25.inputAndCancelButtonMargin, 
        flexSlot = v2.createElement("Frame", {
            BackgroundColor3 = v25.inputBackgroundColor, 
            BackgroundTransparency = 0, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, v35)
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, v25.borderRadius)
            }), 
            SearchIcon = v2.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                Image = v18.search, 
                ImageColor3 = v25.textIconColor, 
                ImageTransparency = v25.textIconTransparency, 
                Position = UDim2.new(0, v25.iconOffsetX, 0.5, 0), 
                Size = UDim2.fromOffset(v25.iconSize, v25.iconSize)
            }), 
            SearchBox = v2.createElement(l_Focusable_0.TextBox, {
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ClearTextOnFocus = false, 
                ClipsDescendants = true, 
                Font = v25.font, 
                OverlayNativeInput = true, 
                PlaceholderColor3 = v25.textIconColor, 
                PlaceholderText = v36, 
                Position = UDim2.new(0, v37, 0.5, 0), 
                ReturnKeyType = Enum.ReturnKeyType.Search, 
                RichText = false, 
                Size = UDim2.new(1, v38, 1, 0), 
                Text = v22.text or "", 
                TextColor3 = v25.textIconColor, 
                TextInputType = Enum.TextInputType.NoSuggestions, 
                TextSize = v25.textSize, 
                TextTransparency = v25.textIconTransparency, 
                TextWrapped = false, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                [v2.Change.Text] = function(v41) --[[ Line: 125 ]]
                    -- upvalues: v22 (copy), v30 (copy)
                    if v22.onChange then
                        v22.onChange(v41.Text or "");
                    end;
                    v30(v41.Text ~= "");
                end, 
                [v2.Event.Focused] = function(v42) --[[ Line: 133 ]]
                    -- upvalues: v22 (copy)
                    if v22.onFocus then
                        v22.onFocus(v42);
                    end;
                end, 
                [v2.Event.FocusLost] = function(v43, v44, _) --[[ Line: 139 ]]
                    -- upvalues: v22 (copy)
                    if v44 and v22.onSubmit then
                        v22.onSubmit(v43.Text or "");
                    end;
                end, 
                [v2.Event.ReturnPressedFromOnScreenKeyboard] = function(v46) --[[ Line: 147 ]]
                    -- upvalues: v22 (copy)
                    if v22.onSubmit then
                        v22.onSubmit(v46.Text or "");
                    end;
                end, 
                [v2.Tag] = "data-testid=AvatarExperienceSearch_SearchBar_TextBox", 
                ref = v31, 
                SelectionImageObject = v26, 
                NextSelectionDown = v22.nextSelectionDown, 
                NextSelectionUp = v22.nextSelectionUp, 
                NextSelectionRight = if v29 then v32 else if v22.showCancelButton then v33 else nil
            }), 
            ClearSearchButton = v29 and v2.createElement(l_Focusable_0[l_ImageSetButton_0], {
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                Image = v18.clear, 
                ImageColor3 = v25.textIconColor, 
                ImageTransparency = v25.textIconTransparency, 
                Position = UDim2.new(1, v39, 0.5, 0), 
                Size = UDim2.fromOffset(v25.iconSize, v25.iconSize), 
                [v2.Event.Activated] = v40, 
                [v2.Tag] = "data-testid=AvatarExperienceSearch_SearchBar_ClearButton", 
                SelectionImageObject = v27, 
                NextSelectionDown = v22.nextSelectionDown, 
                NextSelectionUp = v22.nextSelectionUp, 
                NextSelectionLeft = v31, 
                NextSelectionRight = if v22.showCancelButton then v33 else nil
            })
        }), 
        rigidSlot = if v22.showCancelButton then v2.createElement(l_Focusable_0.TextButton, {
            AutomaticSize = Enum.AutomaticSize.X, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Font = v25.font, 
            Size = UDim2.new(0, 0, 0, v35), 
            Text = v24.cancelButtonText, 
            TextColor3 = v25.textIconColor, 
            TextSize = v25.textSize, 
            TextTransparency = v25.textIconTransparency, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            [v2.Event.Activated] = v22.onCancel, 
            [v2.Tag] = "data-testid=AvatarExperienceSearch_SearchBar_CancelButton", 
            SelectionImageObject = v28, 
            NextSelectionDown = v22.nextSelectionDown, 
            NextSelectionUp = v22.nextSelectionUp, 
            NextSelectionLeft = if v29 then v32 else v31
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingRight = UDim.new(0, v25.cancelButtonPadding), 
                PaddingLeft = UDim.new(0, v25.cancelButtonPadding)
            })
        }) else nil
    });
end);