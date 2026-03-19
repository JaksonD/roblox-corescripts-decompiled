local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Packages.FitFrame);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_FitFrameVertical_0 = v3.FitFrameVertical;
local l_FitTextLabel_0 = v3.FitTextLabel;
local l_Focusable_0 = v4.Focusable;
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v9.Style.withStyle;
local l_withSelectionCursorProvider_0 = v9.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v9.App.SelectionImage.CursorKind;
local l_Images_0 = v9.App.ImageSet.Images;
local l_ImageSetLabel_0 = v9.Core.ImageSet.ImageSetLabel;
local l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateSaveOutfitPromptFromRoactGamepad;
local v16 = l_Images_0["component_assets/circle_17_stroke_1"];
local v17 = Rect.new(8, 8, 8, 8);
local v18 = v1.PureComponent:extend("OutfitNameTextBox");
v18.validateProps = v2.strictInterface({
    onOutfitNameUpdated = v2.callback
});
local function _(v19, v20) --[[ Line: 41 ]] --[[ Name: stringTooLongOrInvalid ]]
    local v21 = utf8.len(v19);
    if v21 == nil then
        return true;
    elseif v21 <= v20 then
        return false;
    else
        return v20 < utf8.len(utf8.nfcnormalize(v19));
    end;
end;
v18.init = function(v23) --[[ Line: 54 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v23:setState({
        lastValidName = "", 
        isNameInvalid = true, 
        outfitName = ""
    });
    v23.textBoxRef = v1.createRef();
    v23.wasInitiallyFocused = false;
    v23.tryFocusTextBox = function() --[[ Line: 64 ]]
        -- upvalues: v23 (copy)
        if v23.wasInitiallyFocused then
            return;
        else
            local v24 = v23.textBoxRef:getValue();
            if v24 and v24:IsDescendantOf(game) then
                v24:CaptureFocus();
                v23.wasInitiallyFocused = true;
            end;
            return;
        end;
    end;
    v23.onTextChanged = function(v25) --[[ Line: 76 ]]
        -- upvalues: v23 (copy)
        local l_Text_0 = v25.Text;
        local l_l_Text_0_0 = l_Text_0;
        local v28 = utf8.len(l_l_Text_0_0);
        if v28 == nil or not (v28 <= 99) and utf8.len(utf8.nfcnormalize(l_l_Text_0_0)) > 99 then
            l_Text_0 = v23.state.lastValidName;
            v25.Text = l_Text_0;
        end;
        local v29 = not string.match(l_Text_0, "^[0-9a-zA-Z%s]+$");
        l_l_Text_0_0 = v23.state.lastValidName;
        if not v29 then
            l_l_Text_0_0 = v25.Text;
        end;
        v23:setState({
            lastValidName = l_l_Text_0_0, 
            isNameInvalid = v29, 
            outfitName = l_Text_0
        });
        v23.props.onOutfitNameUpdated(l_Text_0, v29);
    end;
end;
v18.renderWithProviders = function(v30, v31, v32, v33) --[[ Line: 101 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v1 (copy), l_FitFrameVertical_0 (copy), l_ImageSetLabel_0 (copy), v16 (copy), v17 (copy), l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 (copy), l_Focusable_0 (copy), l_CursorKind_0 (copy), l_FitTextLabel_0 (copy)
    local l_Font_0 = v32.Font;
    local l_Theme_0 = v32.Theme;
    local v36 = v30.state.isNameInvalid and v30.state.outfitName ~= "";
    return v1.createElement(l_FitFrameVertical_0, {
        BackgroundTransparency = 1, 
        width = UDim.new(1, 0)
    }, {
        TextboxContainer = v1.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Image = v16, 
            ImageColor3 = l_Theme_0.UIDefault.Color, 
            ImageTransparency = l_Theme_0.UIDefault.Transparency, 
            LayoutOrder = 1, 
            ScaleType = Enum.ScaleType.Slice, 
            Size = UDim2.new(1, 0, 0, 30), 
            SliceCenter = v17
        }, {
            Textbox = v1.createElement(l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 and "TextBox" or l_Focusable_0.TextBox, {
                Text = "", 
                BackgroundTransparency = 1, 
                ClearTextOnFocus = false, 
                Font = l_Font_0.Header2.Font, 
                TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                PlaceholderColor3 = l_Theme_0.PlaceHolder.Color, 
                PlaceholderText = v31.placeholderText, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.new(1, -12, 1, 0), 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                OverlayNativeInput = true, 
                Selectable = true, 
                [v1.Change.Text] = v30.onTextChanged, 
                SelectionImageObject = v33(l_CursorKind_0.InputFields), 
                [v1.Ref] = v30.textBoxRef, 
                [v1.Event.AncestryChanged] = v30.tryFocusTextBox
            })
        }), 
        WarningText = v36 and v1.createElement(l_FitTextLabel_0, {
            width = UDim.new(1, 0), 
            BackgroundTransparency = 1, 
            Text = v31.warningText, 
            LayoutOrder = 2, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Size = UDim2.new(1, 0, 0, 20), 
            TextColor3 = l_Theme_0.Alert.Color, 
            TextWrapped = true, 
            Font = l_Font_0.Body.Font, 
            TextSize = l_Font_0.Body.RelativeSize * l_Font_0.BaseSize
        })
    });
end;
v18.render = function(v37) --[[ Line: 165 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_withStyle_0 (copy), l_withSelectionCursorProvider_0 (copy)
    return l_withLocalization_0({
        placeholderText = "Feature.Avatar.Label.Name", 
        warningText = "Feature.Avatar.Label.CostumeWarning"
    })(function(v38) --[[ Line: 169 ]]
        -- upvalues: l_withStyle_0 (ref), l_withSelectionCursorProvider_0 (ref), v37 (copy)
        return l_withStyle_0(function(v39) --[[ Line: 170 ]]
            -- upvalues: l_withSelectionCursorProvider_0 (ref), v37 (ref), v38 (copy)
            return l_withSelectionCursorProvider_0(function(v40) --[[ Line: 171 ]]
                -- upvalues: v37 (ref), v38 (ref), v39 (copy)
                return v37:renderWithProviders(v38, v39, v40);
            end);
        end);
    end);
end;
v18.didMount = function(v41) --[[ Line: 178 ]] --[[ Name: didMount ]]
    v41.tryFocusTextBox();
end;
return v18;