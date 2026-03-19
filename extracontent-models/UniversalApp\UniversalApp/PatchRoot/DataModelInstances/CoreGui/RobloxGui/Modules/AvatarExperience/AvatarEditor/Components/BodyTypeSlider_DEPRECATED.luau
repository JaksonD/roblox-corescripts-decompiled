local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAvatarScales);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.TwoAxisSlider);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_withStyle_0 = v6.Style.withStyle;
local v12 = Vector2.new(224, 195);
local v13 = v4.PureComponent:extend("BodyTypeSlider");
v13.init = function(v14) --[[ Line: 30 ]] --[[ Name: init ]]
    local l_forwardRef_0 = v14.props.forwardRef;
    v14.mapPositionToScales = function(v16) --[[ Line: 34 ]]
        -- upvalues: v14 (copy)
        local l_bodyTypeScaleRules_0 = v14.props.bodyTypeScaleRules;
        local v18 = l_bodyTypeScaleRules_0.max - l_bodyTypeScaleRules_0.min;
        local v19 = math.clamp((1 - v16.Y) * v18 + l_bodyTypeScaleRules_0.min, l_bodyTypeScaleRules_0.min, l_bodyTypeScaleRules_0.max);
        local l_proportionScaleRules_0 = v14.props.proportionScaleRules;
        local v21 = l_proportionScaleRules_0.max - l_proportionScaleRules_0.min;
        return math.clamp((1 - (v19 == 0 and 0.5 or (v16.X - 0.5 * v16.Y) / v19)) * v21 + l_proportionScaleRules_0.min, l_proportionScaleRules_0.min, l_proportionScaleRules_0.max), v19;
    end;
    v14.mapScalesToPosition = function(v22, v23) --[[ Line: 59 ]]
        -- upvalues: v14 (copy)
        local l_bodyTypeScaleRules_1 = v14.props.bodyTypeScaleRules;
        local v25 = l_bodyTypeScaleRules_1.max - l_bodyTypeScaleRules_1.min;
        local v26 = (v23 - l_bodyTypeScaleRules_1.min) / v25;
        local l_proportionScaleRules_1 = v14.props.proportionScaleRules;
        local v28 = l_proportionScaleRules_1.max - l_proportionScaleRules_1.min;
        local v29 = (v22 - l_proportionScaleRules_1.min) / v28;
        return Vector2.new((1 - v29) * v26 + 0.5 * (1 - v26), 1 - v26);
    end;
    v14.setScales = function(v30, v31) --[[ Line: 74 ]]
        -- upvalues: v14 (copy)
        v14.props.setScales({
            proportion = v30, 
            bodyType = v31
        });
    end;
    v14.getBackgroundAbsolutePosition = function() --[[ Line: 81 ]]
        -- upvalues: l_forwardRef_0 (copy)
        local v32 = l_forwardRef_0:getValue();
        if v32 then
            return v32.AbsolutePosition;
        else
            return nil;
        end;
    end;
    v14.getBackgroundAbsoluteSize = function() --[[ Line: 88 ]]
        -- upvalues: l_forwardRef_0 (copy)
        local v33 = l_forwardRef_0:getValue();
        if v33 then
            return v33.AbsoluteSize;
        else
            return nil;
        end;
    end;
end;
v13.render = function(v34) --[[ Line: 97 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v12 (copy), v4 (copy), v9 (copy)
    local l_proportion_0 = v34.props.proportion;
    local l_bodyType_0 = v34.props.bodyType;
    local l_proportionScaleRules_2 = v34.props.proportionScaleRules;
    local l_bodyTypeScaleRules_2 = v34.props.bodyTypeScaleRules;
    local l_LayoutOrder_0 = v34.props.LayoutOrder;
    local l_lockNavigationCallback_0 = v34.props.lockNavigationCallback;
    local l_unlockNavigationCallback_0 = v34.props.unlockNavigationCallback;
    local l_forwardRef_1 = v34.props.forwardRef;
    return l_withStyle_0(function(v43) --[[ Line: 108 ]]
        -- upvalues: v12 (ref), v34 (copy), v4 (ref), l_LayoutOrder_0 (copy), l_forwardRef_1 (copy), v9 (ref), l_proportionScaleRules_2 (copy), l_bodyTypeScaleRules_2 (copy), l_proportion_0 (copy), l_bodyType_0 (copy), l_lockNavigationCallback_0 (copy), l_unlockNavigationCallback_0 (copy)
        local l_Theme_0 = v43.Theme;
        local v45 = v12.X / v12.Y;
        local v46 = v12.X / v45;
        local l_isDisabled_0 = v34.props.isDisabled;
        return v4.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            Image = "rbxasset://textures/AvatarEditorImages/Sliders/body-type-slider-background.png", 
            LayoutOrder = l_LayoutOrder_0, 
            Size = UDim2.new(0, v12.X, 0, v46), 
            BackgroundTransparency = 1, 
            ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
            ImageTransparency = l_isDisabled_0 and 0.5 or l_Theme_0.BackgroundUIDefault.Transparency, 
            [v4.Ref] = l_forwardRef_1
        }, {
            TwoAxisSlider = v4.createElement(v9, {
                mapPositionToScales = v34.mapPositionToScales, 
                mapScalesToPosition = v34.mapScalesToPosition, 
                setScales = v34.setScales, 
                xScaleRules = l_proportionScaleRules_2, 
                yScaleRules = l_bodyTypeScaleRules_2, 
                xScale = l_proportion_0, 
                yScale = l_bodyType_0, 
                getBackgroundAbsolutePosition = v34.getBackgroundAbsolutePosition, 
                getBackgroundAbsoluteSize = v34.getBackgroundAbsoluteSize, 
                invertDPadX = true, 
                isDisabled = l_isDisabled_0, 
                onDragStart = l_lockNavigationCallback_0, 
                onDragEnd = l_unlockNavigationCallback_0
            })
        });
    end);
end;
v13 = v5.connect(function(v48, _) --[[ Line: 151 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v7 (copy)
    local l_AvatarScales_0 = v48.AvatarExperience.AvatarEditor.Character.AvatarScales;
    local v51 = v48.AvatarExperience.AvatarEditor.AvatarSettings[v7.AvatarSettings.scalesRules];
    return {
        avatarType = v48.AvatarExperience.AvatarEditor.Character.AvatarType, 
        bodyType = l_AvatarScales_0.bodyType, 
        proportion = l_AvatarScales_0.proportion, 
        bodyTypeScaleRules = v51.bodyType, 
        proportionScaleRules = v51.proportion
    };
end, function(v52) --[[ Line: 165 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v8 (copy)
    return {
        setScales = function(v53) --[[ Line: 167 ]] --[[ Name: setScales ]]
            -- upvalues: v52 (copy), v8 (ref)
            v52(v8(v53));
        end
    };
end)(v13);
return v4.forwardRef(function(v54, v55) --[[ Line: 175 ]]
    -- upvalues: v4 (copy), v13 (ref), v3 (copy)
    return v4.createElement(v13, v3.Dictionary.join(v54, {
        forwardRef = v55
    }));
end);