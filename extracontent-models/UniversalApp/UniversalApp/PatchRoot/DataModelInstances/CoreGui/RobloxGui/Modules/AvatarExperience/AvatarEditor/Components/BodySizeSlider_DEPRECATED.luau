local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_CorePackages_0.Packages.Cryo);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAvatarScales);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.TwoAxisSlider);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_withStyle_0 = v5.Style.withStyle;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v5.App.ImageSet.Images;
local v14 = Vector2.new(224, 224);
local v15 = l_Images_0["component_assets/circle_17"];
local v16 = v3.PureComponent:extend("BodySizeSlider");
v16.init = function(v17) --[[ Line: 30 ]] --[[ Name: init ]]
    local l_forwardRef_0 = v17.props.forwardRef;
    v17.mapPositionToScales = function(v19) --[[ Line: 34 ]]
        -- upvalues: v17 (copy)
        local l_widthRules_0 = v17.props.widthRules;
        local v21 = l_widthRules_0.max - l_widthRules_0.min;
        local v22 = math.clamp(v19.X * v21 + l_widthRules_0.min, l_widthRules_0.min, l_widthRules_0.max);
        local l_heightRules_0 = v17.props.heightRules;
        local v24 = l_heightRules_0.max - l_heightRules_0.min;
        return v22, (math.clamp((1 - v19.Y) * v24 + l_heightRules_0.min, l_heightRules_0.min, l_heightRules_0.max));
    end;
    v17.mapScalesToPosition = function(v25, v26) --[[ Line: 49 ]]
        -- upvalues: v17 (copy)
        local l_widthRules_1 = v17.props.widthRules;
        local v28 = l_widthRules_1.max - l_widthRules_1.min;
        local v29 = (v25 - l_widthRules_1.min) / v28;
        local l_heightRules_1 = v17.props.heightRules;
        local v31 = l_heightRules_1.max - l_heightRules_1.min;
        local v32 = (v26 - l_heightRules_1.min) / v31;
        return Vector2.new(v29, 1 - v32);
    end;
    v17.setScales = function(v33, v34) --[[ Line: 61 ]]
        -- upvalues: v17 (copy)
        v17.props.setScales({
            width = v33, 
            height = v34
        });
    end;
    v17.getBackgroundAbsolutePosition = function() --[[ Line: 68 ]]
        -- upvalues: l_forwardRef_0 (copy)
        local v35 = l_forwardRef_0:getValue();
        if v35 then
            return v35.AbsolutePosition;
        else
            return nil;
        end;
    end;
    v17.getBackgroundAbsoluteSize = function() --[[ Line: 75 ]]
        -- upvalues: l_forwardRef_0 (copy)
        local v36 = l_forwardRef_0:getValue();
        if v36 then
            return v36.AbsoluteSize;
        else
            return nil;
        end;
    end;
end;
v16.render = function(v37) --[[ Line: 84 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v3 (copy), l_ImageSetLabel_0 (copy), v15 (copy), v14 (copy), v9 (copy)
    local l_width_0 = v37.props.width;
    local l_height_0 = v37.props.height;
    local l_widthRules_2 = v37.props.widthRules;
    local l_heightRules_2 = v37.props.heightRules;
    local l_LayoutOrder_0 = v37.props.LayoutOrder;
    local l_lockNavigationCallback_0 = v37.props.lockNavigationCallback;
    local l_unlockNavigationCallback_0 = v37.props.unlockNavigationCallback;
    local l_isDisabled_0 = v37.props.isDisabled;
    local l_forwardRef_1 = v37.props.forwardRef;
    return l_withStyle_0(function(v47) --[[ Line: 95 ]]
        -- upvalues: v3 (ref), l_ImageSetLabel_0 (ref), v15 (ref), v14 (ref), l_isDisabled_0 (copy), l_LayoutOrder_0 (copy), l_forwardRef_1 (copy), v9 (ref), v37 (copy), l_widthRules_2 (copy), l_heightRules_2 (copy), l_width_0 (copy), l_height_0 (copy), l_lockNavigationCallback_0 (copy), l_unlockNavigationCallback_0 (copy)
        local l_Theme_0 = v47.Theme;
        return v3.createElement(l_ImageSetLabel_0, {
            Image = v15, 
            Size = UDim2.new(0, v14.X, 0, v14.Y), 
            BackgroundTransparency = 1, 
            ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
            ImageTransparency = l_isDisabled_0 and 0.5 or l_Theme_0.BackgroundUIDefault.Transparency, 
            LayoutOrder = l_LayoutOrder_0, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(9, 9, 9, 9), 
            ZIndex = 2, 
            [v3.Ref] = l_forwardRef_1
        }, {
            TwoAxisSlider = v3.createElement(v9, {
                mapPositionToScales = v37.mapPositionToScales, 
                mapScalesToPosition = v37.mapScalesToPosition, 
                setScales = v37.setScales, 
                xScaleRules = l_widthRules_2, 
                yScaleRules = l_heightRules_2, 
                xScale = l_width_0, 
                yScale = l_height_0, 
                getBackgroundAbsolutePosition = v37.getBackgroundAbsolutePosition, 
                getBackgroundAbsoluteSize = v37.getBackgroundAbsoluteSize, 
                isDisabled = l_isDisabled_0, 
                onDragStart = l_lockNavigationCallback_0, 
                onDragEnd = l_unlockNavigationCallback_0
            })
        });
    end);
end;
v16 = v4.connect(function(v49, _) --[[ Line: 132 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v7 (copy)
    local l_AvatarScales_0 = v49.AvatarExperience.AvatarEditor.Character.AvatarScales;
    local v52 = v49.AvatarExperience.AvatarEditor.AvatarSettings[v7.AvatarSettings.scalesRules];
    return {
        height = l_AvatarScales_0.height, 
        width = l_AvatarScales_0.width, 
        heightRules = v52.height, 
        widthRules = v52.width, 
        avatarType = v49.AvatarExperience.AvatarEditor.Character.AvatarType
    };
end, function(v53) --[[ Line: 146 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v8 (copy)
    return {
        setScales = function(v54) --[[ Line: 148 ]] --[[ Name: setScales ]]
            -- upvalues: v53 (copy), v8 (ref)
            v53(v8(v54));
        end
    };
end)(v16);
return v3.forwardRef(function(v55, v56) --[[ Line: 156 ]]
    -- upvalues: v3 (copy), v16 (ref), v6 (copy)
    return v3.createElement(v16, v6.Dictionary.join(v55, {
        forwardRef = v56
    }));
end);