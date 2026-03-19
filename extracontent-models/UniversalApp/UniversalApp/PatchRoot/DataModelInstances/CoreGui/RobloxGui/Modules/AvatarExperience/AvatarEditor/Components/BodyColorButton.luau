local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_withSelectionCursorProvider_0 = v5.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local l_withStyle_0 = v5.Style.withStyle;
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v14 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SetBodyColor3);
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SendAnalytics);
local v16 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v17 = require(l_Modules_0.AvatarExperience.AvatarEditor.Selectors.selectRangeIdForSelectedBodyParts);
local v18 = require(l_Modules_0.AvatarExperience.AvatarEditor.Selectors.selectButtonColor3);
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.Selectors.selectButtonSliderValue);
local v20 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectDefaultTryOnBodyColorsToggled);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v22 = v3.PureComponent:extend("BodyColorButton");
local v23 = l_Images_0["icons/actions/selectOn"];
v22.validateProps = v2.strictInterface({
    rangeId = v2.optional(v2.string), 
    userId = v2.optional(v2.string), 
    sliderValue = v2.number, 
    isBodyColorButtonSelected = v2.boolean, 
    buttonColor3 = v2.Color3, 
    sendAnalytics = v2.callback, 
    setBodyColor3 = v2.callback, 
    analytics = v2.table, 
    disabled = v2.optional(v2.boolean)
});
v22.onActivated = function(v24) --[[ Line: 56 ]] --[[ Name: onActivated ]]
    local l_rangeId_0 = v24.props.rangeId;
    local l_buttonColor3_0 = v24.props.buttonColor3;
    local l_sliderValue_0 = v24.props.sliderValue;
    v24.props.setBodyColor3(l_buttonColor3_0, l_rangeId_0, l_sliderValue_0, v24.props.analytics);
end;
v22.render = function(v28) --[[ Line: 64 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v3 (copy), l_ImageSetLabel_0 (copy), v23 (copy), l_withSelectionCursorProvider_0 (copy), l_Focusable_0 (copy), l_CursorKind_0 (copy)
    return l_withStyle_0(function(v29) --[[ Line: 65 ]]
        -- upvalues: v28 (copy), v3 (ref), l_ImageSetLabel_0 (ref), v23 (ref), l_withSelectionCursorProvider_0 (ref), l_Focusable_0 (ref), l_CursorKind_0 (ref)
        local l_Theme_0 = v29.Theme;
        local l_isBodyColorButtonSelected_0 = v28.props.isBodyColorButtonSelected;
        local v32 = nil;
        if l_isBodyColorButtonSelected_0 then
            v32 = v3.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(0.8, 0, 0.8, 0), 
                BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
                BackgroundColor3 = l_Theme_0.Overlay.Color, 
                BorderSizePixel = 0
            }, {
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0.5, 0)
                }), 
                Checkmark = v3.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.new(0, 30, 0, 30), 
                    BackgroundTransparency = 1, 
                    Image = v23, 
                    ImageColor3 = l_Theme_0.ContextualPrimaryContent.Color, 
                    ImageTransparency = l_Theme_0.ContextualPrimaryContent.Transparency
                })
            });
        end;
        local l_buttonColor3_1 = v28.props.buttonColor3;
        assert(l_buttonColor3_1 ~= nil, "backgroundColor3 is nil");
        return l_withSelectionCursorProvider_0(function(v34) --[[ Line: 101 ]]
            -- upvalues: v3 (ref), l_Focusable_0 (ref), l_buttonColor3_1 (copy), l_CursorKind_0 (ref), v28 (ref), v32 (ref), l_Theme_0 (copy)
            return v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, {
                TextButton = v3.createElement(l_Focusable_0.TextButton, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 0, 
                    BackgroundColor3 = l_buttonColor3_1, 
                    Text = "", 
                    BorderSizePixel = 0, 
                    AutoButtonColor = false, 
                    ZIndex = 2, 
                    SelectionImageObject = v34(l_CursorKind_0.SkinToneCircle), 
                    [v3.Event.Activated] = if v28.props.disabled then nil else function(_) --[[ Line: 120 ]]
                        -- upvalues: v28 (ref)
                        v28:onActivated();
                    end
                }, {
                    UICorner = v3.createElement("UICorner", {
                        CornerRadius = UDim.new(0.5, 0)
                    }), 
                    EquippedFrame = v32
                }), 
                Border = v3.createElement("Frame", {
                    Size = UDim2.new(1, 2, 1, 2), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundColor3 = l_Theme_0.Divider.Color, 
                    BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                    BorderSizePixel = 0, 
                    ZIndex = 1
                }, {
                    UICorner = v3.createElement("UICorner", {
                        CornerRadius = UDim.new(0.5, 0)
                    })
                })
            });
        end);
    end);
end;
v22 = l_RoactServices_0.connect({
    analytics = v13
})(v22);
return (v4.connect(function(v36, v37) --[[ Line: 152 ]]
    -- upvalues: v20 (copy), v18 (copy), v17 (copy), v16 (copy), v19 (copy)
    local v38 = v20(v36);
    local v39 = v18(v36.AvatarExperience, v37.rangeId);
    local v40 = v17(v36);
    local v41 = false;
    if v40 == v37.rangeId then
        v41 = not v38;
    end;
    local v42 = v16.getUserId(v36);
    return {
        sliderValue = v19(v36.AvatarExperience, v37.rangeId), 
        buttonColor3 = v39, 
        isBodyColorButtonSelected = v41, 
        userId = v42, 
        disabled = v38
    };
end, function(v43) --[[ Line: 169 ]]
    -- upvalues: v15 (copy), v14 (copy)
    return {
        sendAnalytics = function(v44, v45) --[[ Line: 171 ]] --[[ Name: sendAnalytics ]]
            -- upvalues: v43 (copy), v15 (ref)
            v43(v15(v44, v45));
        end, 
        setBodyColor3 = function(v46, v47, v48, v49) --[[ Line: 174 ]] --[[ Name: setBodyColor3 ]]
            -- upvalues: v43 (copy), v14 (ref)
            v43(v14(v46, v47, v48, v49));
        end
    };
end)(v22));