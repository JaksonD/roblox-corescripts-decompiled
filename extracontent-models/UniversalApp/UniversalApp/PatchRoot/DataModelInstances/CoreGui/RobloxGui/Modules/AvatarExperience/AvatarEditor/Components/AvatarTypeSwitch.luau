local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v3.Focusable;
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_CorePackages_0.Packages.AvatarExperienceDeps);
local v8 = require(l_CorePackages_0.Packages.RoactNavigation);
local v9 = require(l_CorePackages_0.Packages.Cryo);
local l_RoactFitComponents_0 = v7.RoactFitComponents;
local l_FitFrameOnAxis_0 = l_RoactFitComponents_0.FitFrameOnAxis;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v14 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAvatarType);
local v16 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SendAnalytics);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v20 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local l_withNavigation_0 = v8.withNavigation;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_wasLastInputGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).wasLastInputGamepad;
local l_CursorKind_0 = v6.App.SelectionImage.CursorKind;
local l_SpringAnimatedItem_0 = v6.Utility.SpringAnimatedItem;
local l_withSelectionCursorProvider_0 = v6.App.SelectionImage.withSelectionCursorProvider;
local l_withStyle_0 = v6.Style.withStyle;
local l_Images_0 = v6.App.ImageSet.Images;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v32 = l_Images_0["component_assets/circle_29"];
local v33 = l_Images_0["component_assets/circle_25"];
local v34 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local v35 = v2.PureComponent:extend("AvatarTypeSwitch");
local function v39(v36) --[[ Line: 61 ]] --[[ Name: resizeTextLabel ]]
    -- upvalues: l_Text_0 (copy)
    local v37 = UDim.new(0, l_Text_0.GetTextWidth(v36.Text, v36.Font, v36.TextSize));
    local v38 = UDim.new(0, v36.TextSize);
    v36.Size = UDim2.new(v37, v38);
end;
v35.resizeTextLabels = function(v40) --[[ Line: 67 ]] --[[ Name: resizeTextLabels ]]
    -- upvalues: v39 (copy)
    local l_current_0 = v40.r6Ref.current;
    local l_current_1 = v40.r15Ref.current;
    if not l_current_0 or not l_current_1 then
        return;
    else
        v39(l_current_0);
        v39(l_current_1);
        local v43 = math.max(l_current_0.AbsoluteSize.x, l_current_1.AbsoluteSize.x);
        l_current_0.Size = UDim2.new(0, v43, 0, l_current_0.Size.Y.Offset);
        l_current_1.Size = UDim2.new(0, v43, 0, l_current_1.Size.Y.Offset);
        return;
    end;
end;
v35.makeOnOverlayClosed = function(_, v45) --[[ Line: 87 ]] --[[ Name: makeOnOverlayClosed ]]
    -- upvalues: l_wasLastInputGamepad_0 (copy), v21 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    return function() --[[ Line: 88 ]]
        -- upvalues: l_wasLastInputGamepad_0 (ref), v21 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v45 (copy)
        local v46 = l_wasLastInputGamepad_0();
        v21("AvatarTypeSwitch");
        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v46 then
            v45.captureFocus();
        end;
    end;
end;
v35.init = function(v47) --[[ Line: 98 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v14 (copy), v20 (copy), l_AvatarScreen_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    v47.r6Ref = v2.createRef();
    v47.r15Ref = v2.createRef();
    local v48, v49 = v2.createBinding(UDim2.fromScale(1, 1));
    v47.sizeBinding = v48;
    v47.updateSizeBinding = v49;
    v47.absoluteSizeChanged = function(v50) --[[ Line: 104 ]]
        -- upvalues: v47 (copy)
        v47.updateSizeBinding(UDim2.fromOffset(v50.AbsoluteSize.X, v50.AbsoluteSize.Y));
    end;
    v47.toggleAvatarType = function(v51) --[[ Line: 108 ]]
        -- upvalues: v47 (copy), v14 (ref), v20 (ref), l_AvatarScreen_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref)
        local l_sendAnalytics_0 = v47.props.sendAnalytics;
        local l_analytics_0 = v47.props.analytics;
        local l_setAvatarType_0 = v47.props.setAvatarType;
        local v55 = if v47.props.avatarType == v14.AvatarType.R6 then v14.AvatarType.R15 else v14.AvatarType.R6;
        local v56 = v20.hasWrapLayer(v47.props.currentCharacter);
        if v55 == v14.AvatarType.R6 and v56 then
            v47.props.navigation.navigate(l_AvatarScreen_0.LayeredClothingR6SwitchPrompt, {
                onOverlayClosed = v47:makeOnOverlayClosed(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v51)
            });
            return;
        else
            l_setAvatarType_0(v55);
            l_sendAnalytics_0(l_analytics_0.toggleAvatarType, v55);
            return;
        end;
    end;
end;
v35.didMount = function(v57) --[[ Line: 132 ]] --[[ Name: didMount ]]
    v57:resizeTextLabels();
end;
v35.renderWithProviders = function(v58, v59, v60, v61, v62) --[[ Line: 136 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v14 (copy), v2 (copy), l_ImageSetLabel_0 (copy), v32 (copy), l_SpringAnimatedItem_0 (copy), v34 (copy), v33 (copy), l_Focusable_0 (copy), l_CursorKind_0 (copy), l_FitFrameOnAxis_0 (copy), l_RoactFitComponents_0 (copy)
    local l_LayoutOrder_0 = v58.props.LayoutOrder;
    local l_Theme_0 = v60.Theme;
    local l_Font_0 = v60.Font;
    local v66 = nil;
    v66 = v58.props.avatarType == v14.AvatarType.R15 and 0.5 or 0;
    local function v67() --[[ Line: 148 ]]
        -- upvalues: v58 (copy), v62 (copy)
        v58.toggleAvatarType(v62);
    end;
    local l_forwardRef_0 = v58.props.forwardRef;
    return v2.createElement(l_ImageSetLabel_0, {
        Size = v58.sizeBinding, 
        Image = v32, 
        ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
        ImageTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
        BackgroundTransparency = 1, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(14, 13, 15, 15), 
        LayoutOrder = l_LayoutOrder_0, 
        NextSelectionLeft = v58.props.NextSelectionLeft, 
        NextSelectionRight = v58.props.NextSelectionRight, 
        NextSelectionUp = v58.props.NextSelectionUp, 
        NextSelectionDown = v58.props.NextSelectionDown, 
        [v2.Ref] = l_forwardRef_0
    }, {
        AnimatedFrame = v2.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
            regularProps = {
                Size = UDim2.new(0.5, 0, 1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, 
            animatedValues = {
                positionX = v66
            }, 
            mapValuesToProps = function(v69) --[[ Line: 179 ]] --[[ Name: mapValuesToProps ]]
                return {
                    Position = UDim2.new(v69.positionX, 0, 0, 0)
                };
            end, 
            springOptions = v34
        }, {
            SwitchImage = v2.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(1, 0, 1, 0), 
                Image = v33, 
                ImageColor3 = l_Theme_0.UIEmphasis.Color, 
                ImageTransparency = l_Theme_0.UIEmphasis.Transparency, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(12, 11, 13, 13)
            })
        }), 
        SwitchButton = v2.createElement(l_Focusable_0.ImageButton, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            [v2.Event.Activated] = v67, 
            SelectionImageObject = v61(l_CursorKind_0.Toggle)
        }), 
        LabelsContainer = v2.createElement(l_FitFrameOnAxis_0, {
            axis = l_FitFrameOnAxis_0.Axis.Both, 
            margin = l_RoactFitComponents_0.Rect.square(3), 
            contentPadding = UDim.new(0, 10), 
            FillDirection = Enum.FillDirection.Horizontal, 
            BackgroundTransparency = 1, 
            ZIndex = 2, 
            [v2.Change.AbsoluteSize] = v58.absoluteSizeChanged
        }, {
            R6Label = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Font = l_Font_0.Body.Font, 
                Text = v59.r6Text, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextSize = l_Font_0.CaptionHeader.RelativeSize * l_Font_0.BaseSize, 
                TextColor3 = if v58.props.avatarType == v14.AvatarType.R6 then l_Theme_0.TextEmphasis.Color else l_Theme_0.TextDefault.Color, 
                LayoutOrder = 1, 
                [v2.Ref] = v58.r6Ref
            }), 
            R15Label = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(1, 0.5), 
                Font = l_Font_0.Body.Font, 
                Text = v59.r15Text, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextSize = l_Font_0.CaptionHeader.RelativeSize * l_Font_0.BaseSize, 
                TextColor3 = if v58.props.avatarType == v14.AvatarType.R15 then l_Theme_0.TextEmphasis.Color else l_Theme_0.TextDefault.Color, 
                LayoutOrder = 2, 
                [v2.Ref] = v58.r15Ref
            })
        })
    });
end;
v35.render = function(v70) --[[ Line: 245 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_withStyle_0 (copy), l_withSelectionCursorProvider_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v3 (copy)
    return l_withLocalization_0({
        r6Text = "Feature.Avatar.Label.R6", 
        r15Text = "Feature.Avatar.Label.R15"
    })(function(v71) --[[ Line: 249 ]]
        -- upvalues: l_withStyle_0 (ref), l_withSelectionCursorProvider_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v70 (copy), v3 (ref)
        return l_withStyle_0(function(v72) --[[ Line: 250 ]]
            -- upvalues: l_withSelectionCursorProvider_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v70 (ref), v71 (copy), v3 (ref)
            return l_withSelectionCursorProvider_0(function(v73) --[[ Line: 251 ]]
                -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v70 (ref), v71 (ref), v72 (copy), v3 (ref)
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                    return v70:renderWithProviders(v71, v72, v73);
                else
                    return v3.withFocusController(function(v74) --[[ Line: 255 ]]
                        -- upvalues: v70 (ref), v71 (ref), v72 (ref), v73 (copy)
                        return v70:renderWithProviders(v71, v72, v73, v74);
                    end);
                end;
            end);
        end);
    end);
end;
v35 = l_withNavigation_0(l_RoactServices_0.connect({
    analytics = v13
})(v35), nil);
v35 = v5.connect(function(v75, _) --[[ Line: 269 ]] --[[ Name: mapStateToProps ]]
    local l_EquippedAssets_0 = v75.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    local l_CurrentCharacter_0 = v75.AvatarExperience.AvatarScene.Character.CurrentCharacter;
    return {
        equippedAssets = l_EquippedAssets_0, 
        avatarType = v75.AvatarExperience.AvatarEditor.Character.AvatarType, 
        currentCharacter = l_CurrentCharacter_0
    };
end, function(v79) --[[ Line: 280 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v15 (copy), v16 (copy)
    return {
        setAvatarType = function(v80) --[[ Line: 282 ]] --[[ Name: setAvatarType ]]
            -- upvalues: v79 (copy), v15 (ref)
            v79(v15(v80));
        end, 
        sendAnalytics = function(v81, v82) --[[ Line: 285 ]] --[[ Name: sendAnalytics ]]
            -- upvalues: v79 (copy), v16 (ref)
            v79(v16(v81, v82));
        end
    };
end)(v35);
return v2.forwardRef(function(v83, v84) --[[ Line: 293 ]]
    -- upvalues: v2 (copy), v35 (ref), v9 (copy)
    return v2.createElement(v35, v9.Dictionary.join(v83, {
        forwardRef = v84
    }));
end);