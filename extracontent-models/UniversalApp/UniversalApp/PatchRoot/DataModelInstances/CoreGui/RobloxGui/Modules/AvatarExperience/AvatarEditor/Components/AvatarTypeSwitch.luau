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
local l_FFlagAXBlockMakeupEquipR6_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXBlockMakeupEquipR6;
local v33 = l_Images_0["component_assets/circle_29"];
local v34 = l_Images_0["component_assets/circle_25"];
local v35 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local v36 = v2.PureComponent:extend("AvatarTypeSwitch");
local function v40(v37) --[[ Line: 63 ]] --[[ Name: resizeTextLabel ]]
    -- upvalues: l_Text_0 (copy)
    local v38 = UDim.new(0, l_Text_0.GetTextWidth(v37.Text, v37.Font, v37.TextSize));
    local v39 = UDim.new(0, v37.TextSize);
    v37.Size = UDim2.new(v38, v39);
end;
v36.resizeTextLabels = function(v41) --[[ Line: 69 ]] --[[ Name: resizeTextLabels ]]
    -- upvalues: v40 (copy)
    local l_current_0 = v41.r6Ref.current;
    local l_current_1 = v41.r15Ref.current;
    if not l_current_0 or not l_current_1 then
        return;
    else
        v40(l_current_0);
        v40(l_current_1);
        local v44 = math.max(l_current_0.AbsoluteSize.x, l_current_1.AbsoluteSize.x);
        l_current_0.Size = UDim2.new(0, v44, 0, l_current_0.Size.Y.Offset);
        l_current_1.Size = UDim2.new(0, v44, 0, l_current_1.Size.Y.Offset);
        return;
    end;
end;
v36.makeOnOverlayClosed = function(_, v46) --[[ Line: 89 ]] --[[ Name: makeOnOverlayClosed ]]
    -- upvalues: l_wasLastInputGamepad_0 (copy), v21 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    return function() --[[ Line: 90 ]]
        -- upvalues: l_wasLastInputGamepad_0 (ref), v21 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v46 (copy)
        local v47 = l_wasLastInputGamepad_0();
        v21("AvatarTypeSwitch");
        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v47 then
            v46.captureFocus();
        end;
    end;
end;
v36.init = function(v48) --[[ Line: 100 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v14 (copy), v20 (copy), l_FFlagAXBlockMakeupEquipR6_0 (copy), l_AvatarScreen_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    v48.r6Ref = v2.createRef();
    v48.r15Ref = v2.createRef();
    local v49, v50 = v2.createBinding(UDim2.fromScale(1, 1));
    v48.sizeBinding = v49;
    v48.updateSizeBinding = v50;
    v48.absoluteSizeChanged = function(v51) --[[ Line: 106 ]]
        -- upvalues: v48 (copy)
        v48.updateSizeBinding(UDim2.fromOffset(v51.AbsoluteSize.X, v51.AbsoluteSize.Y));
    end;
    v48.toggleAvatarType = function(v52) --[[ Line: 110 ]]
        -- upvalues: v48 (copy), v14 (ref), v20 (ref), l_FFlagAXBlockMakeupEquipR6_0 (ref), l_AvatarScreen_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref)
        local l_sendAnalytics_0 = v48.props.sendAnalytics;
        local l_analytics_0 = v48.props.analytics;
        local l_setAvatarType_0 = v48.props.setAvatarType;
        local v56 = if v48.props.avatarType == v14.AvatarType.R6 then v14.AvatarType.R15 else v14.AvatarType.R6;
        local v57 = v20.hasWrapLayer(v48.props.currentCharacter);
        local v58 = if l_FFlagAXBlockMakeupEquipR6_0 then v20.hasMakeup(v48.props.equippedAssets) else nil;
        if v56 == v14.AvatarType.R6 and (v57 or v58) then
            v48.props.navigation.navigate(l_AvatarScreen_0.LayeredClothingR6SwitchPrompt, {
                onOverlayClosed = v48:makeOnOverlayClosed(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v52)
            });
            return;
        else
            l_setAvatarType_0(v56);
            l_sendAnalytics_0(l_analytics_0.toggleAvatarType, v56);
            return;
        end;
    end;
end;
v36.didMount = function(v59) --[[ Line: 137 ]] --[[ Name: didMount ]]
    v59:resizeTextLabels();
end;
v36.renderWithProviders = function(v60, v61, v62, v63, v64) --[[ Line: 141 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v14 (copy), v2 (copy), l_ImageSetLabel_0 (copy), v33 (copy), l_SpringAnimatedItem_0 (copy), v35 (copy), v34 (copy), l_Focusable_0 (copy), l_CursorKind_0 (copy), l_FitFrameOnAxis_0 (copy), l_RoactFitComponents_0 (copy)
    local l_LayoutOrder_0 = v60.props.LayoutOrder;
    local l_Theme_0 = v62.Theme;
    local l_Font_0 = v62.Font;
    local v68 = nil;
    v68 = v60.props.avatarType == v14.AvatarType.R15 and 0.5 or 0;
    local function v69() --[[ Line: 153 ]]
        -- upvalues: v60 (copy), v64 (copy)
        v60.toggleAvatarType(v64);
    end;
    local l_forwardRef_0 = v60.props.forwardRef;
    return v2.createElement(l_ImageSetLabel_0, {
        Size = v60.sizeBinding, 
        Image = v33, 
        ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
        ImageTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
        BackgroundTransparency = 1, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(14, 13, 15, 15), 
        LayoutOrder = l_LayoutOrder_0, 
        NextSelectionLeft = v60.props.NextSelectionLeft, 
        NextSelectionRight = v60.props.NextSelectionRight, 
        NextSelectionUp = v60.props.NextSelectionUp, 
        NextSelectionDown = v60.props.NextSelectionDown, 
        [v2.Ref] = l_forwardRef_0
    }, {
        AnimatedFrame = v2.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
            regularProps = {
                Size = UDim2.new(0.5, 0, 1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, 
            animatedValues = {
                positionX = v68
            }, 
            mapValuesToProps = function(v71) --[[ Line: 184 ]] --[[ Name: mapValuesToProps ]]
                return {
                    Position = UDim2.new(v71.positionX, 0, 0, 0)
                };
            end, 
            springOptions = v35
        }, {
            SwitchImage = v2.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(1, 0, 1, 0), 
                Image = v34, 
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
            [v2.Event.Activated] = v69, 
            SelectionImageObject = v63(l_CursorKind_0.Toggle)
        }), 
        LabelsContainer = v2.createElement(l_FitFrameOnAxis_0, {
            axis = l_FitFrameOnAxis_0.Axis.Both, 
            margin = l_RoactFitComponents_0.Rect.square(3), 
            contentPadding = UDim.new(0, 10), 
            FillDirection = Enum.FillDirection.Horizontal, 
            BackgroundTransparency = 1, 
            ZIndex = 2, 
            [v2.Change.AbsoluteSize] = v60.absoluteSizeChanged
        }, {
            R6Label = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Font = l_Font_0.Body.Font, 
                Text = v61.r6Text, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextSize = l_Font_0.CaptionHeader.RelativeSize * l_Font_0.BaseSize, 
                TextColor3 = if v60.props.avatarType == v14.AvatarType.R6 then l_Theme_0.TextEmphasis.Color else l_Theme_0.TextDefault.Color, 
                LayoutOrder = 1, 
                [v2.Ref] = v60.r6Ref
            }), 
            R15Label = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(1, 0.5), 
                Font = l_Font_0.Body.Font, 
                Text = v61.r15Text, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextSize = l_Font_0.CaptionHeader.RelativeSize * l_Font_0.BaseSize, 
                TextColor3 = if v60.props.avatarType == v14.AvatarType.R15 then l_Theme_0.TextEmphasis.Color else l_Theme_0.TextDefault.Color, 
                LayoutOrder = 2, 
                [v2.Ref] = v60.r15Ref
            })
        })
    });
end;
v36.render = function(v72) --[[ Line: 250 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_withStyle_0 (copy), l_withSelectionCursorProvider_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v3 (copy)
    return l_withLocalization_0({
        r6Text = "Feature.Avatar.Label.R6", 
        r15Text = "Feature.Avatar.Label.R15"
    })(function(v73) --[[ Line: 254 ]]
        -- upvalues: l_withStyle_0 (ref), l_withSelectionCursorProvider_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v72 (copy), v3 (ref)
        return l_withStyle_0(function(v74) --[[ Line: 255 ]]
            -- upvalues: l_withSelectionCursorProvider_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v72 (ref), v73 (copy), v3 (ref)
            return l_withSelectionCursorProvider_0(function(v75) --[[ Line: 256 ]]
                -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v72 (ref), v73 (ref), v74 (copy), v3 (ref)
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                    return v72:renderWithProviders(v73, v74, v75);
                else
                    return v3.withFocusController(function(v76) --[[ Line: 260 ]]
                        -- upvalues: v72 (ref), v73 (ref), v74 (ref), v75 (copy)
                        return v72:renderWithProviders(v73, v74, v75, v76);
                    end);
                end;
            end);
        end);
    end);
end;
v36 = l_withNavigation_0(l_RoactServices_0.connect({
    analytics = v13
})(v36), nil);
v36 = v5.connect(function(v77, _) --[[ Line: 274 ]] --[[ Name: mapStateToProps ]]
    local l_EquippedAssets_0 = v77.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    local l_CurrentCharacter_0 = v77.AvatarExperience.AvatarScene.Character.CurrentCharacter;
    return {
        equippedAssets = l_EquippedAssets_0, 
        avatarType = v77.AvatarExperience.AvatarEditor.Character.AvatarType, 
        currentCharacter = l_CurrentCharacter_0
    };
end, function(v81) --[[ Line: 285 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v15 (copy), v16 (copy)
    return {
        setAvatarType = function(v82) --[[ Line: 287 ]] --[[ Name: setAvatarType ]]
            -- upvalues: v81 (copy), v15 (ref)
            v81(v15(v82));
        end, 
        sendAnalytics = function(v83, v84) --[[ Line: 290 ]] --[[ Name: sendAnalytics ]]
            -- upvalues: v81 (copy), v16 (ref)
            v81(v16(v83, v84));
        end
    };
end)(v36);
return v2.forwardRef(function(v85, v86) --[[ Line: 298 ]]
    -- upvalues: v2 (copy), v36 (ref), v9 (copy)
    return v2.createElement(v36, v9.Dictionary.join(v85, {
        forwardRef = v86
    }));
end);