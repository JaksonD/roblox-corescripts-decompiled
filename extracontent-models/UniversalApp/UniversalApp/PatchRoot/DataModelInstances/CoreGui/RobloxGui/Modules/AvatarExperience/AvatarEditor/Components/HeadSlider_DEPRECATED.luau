local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Foundation);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v9 = require(l_Modules_0.LuaApp.mutedError);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAvatarScales);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SendAnalytics);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v14 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local l_FFlagAXMigrateSystemSliderToFoundationSlider_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateSystemSliderToFoundationSlider;
local l_FFlagAXMakeSlidersSmoothWithGamepad_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMakeSlidersSmoothWithGamepad;
local l_SystemSlider_0 = v7.App.Slider.SystemSlider;
local v18 = v4.PureComponent:extend("HeadSlider");
v18.init = function(v19) --[[ Line: 30 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), l_FFlagAXMigrateSystemSliderToFoundationSlider_0 (copy), v9 (copy)
    v19.moveListen = nil;
    v19.endListen = nil;
    v19.scaleRef = v4.createRef();
    if l_FFlagAXMigrateSystemSliderToFoundationSlider_0 then
        v19.convertHeadValueToSliderValue = function(v20, v21, v22) --[[ Line: 37 ]]
            -- upvalues: v9 (ref)
            if v22 <= v21 then
                v9("HeadSlider_DEPRECATED.lua convertHeadValueToSliderValue argument error: headMaxVal must be greater than headMinVal.");
                return 0.5;
            else
                return (v20 - v21) / (v22 - v21);
            end;
        end;
        v19.convertSliderValueToHeadValue = function(v23, v24, v25) --[[ Line: 47 ]]
            return v23 * (v25 - v24) + v24;
        end;
    end;
end;
v18.render = function(v26) --[[ Line: 53 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagAXMigrateSystemSliderToFoundationSlider_0 (copy), v4 (copy), v3 (copy), v10 (copy), l_FFlagAXMakeSlidersSmoothWithGamepad_0 (copy), l_SystemSlider_0 (copy)
    local l_avatarType_0 = v26.props.avatarType;
    local l_head_0 = v26.props.head;
    local l_headScaleRules_0 = v26.props.headScaleRules;
    local l_LayoutOrder_0 = v26.props.LayoutOrder;
    local l_forwardRef_0 = v26.props.forwardRef;
    if l_FFlagAXMigrateSystemSliderToFoundationSlider_0 then
        return v4.createElement(v3.Slider, {
            LayoutOrder = l_LayoutOrder_0, 
            range = NumberRange.new(0, 1), 
            value = v26.convertHeadValueToSliderValue(l_head_0, l_headScaleRules_0.min, l_headScaleRules_0.max), 
            onValueChanged = function(v32) --[[ Line: 66 ]] --[[ Name: onValueChanged ]]
                -- upvalues: v26 (copy), l_headScaleRules_0 (copy)
                local v33 = v26.convertSliderValueToHeadValue(v32, l_headScaleRules_0.min, l_headScaleRules_0.max);
                v26.props.setScales({
                    head = v33
                });
            end, 
            onDragStarted = v26.props.lockNavigationCallback, 
            onDragEnded = v26.props.unlockNavigationCallback, 
            isDisabled = l_avatarType_0 == v10.AvatarType.R6, 
            NextSelectionUp = v26.props.NextSelectionUp, 
            NextSelectionDown = v26.props.NextSelectionDown, 
            [v4.Ref] = l_forwardRef_0, 
            step = l_FFlagAXMakeSlidersSmoothWithGamepad_0 and 0.01 or nil
        });
    else
        return v4.createElement(l_SystemSlider_0, {
            layoutOrder = l_LayoutOrder_0, 
            min = l_headScaleRules_0.min, 
            max = l_headScaleRules_0.max, 
            stepInterval = l_headScaleRules_0.increment, 
            value = l_head_0, 
            onValueChanged = function(v34) --[[ Line: 89 ]] --[[ Name: onValueChanged ]]
                -- upvalues: v26 (copy)
                v26.props.setScales({
                    head = v34
                });
            end, 
            onDragStart = v26.props.lockNavigationCallback, 
            onDragEnd = v26.props.unlockNavigationCallback, 
            isDisabled = l_avatarType_0 == v10.AvatarType.R6, 
            NextSelectionUp = v26.props.NextSelectionUp, 
            NextSelectionDown = v26.props.NextSelectionDown, 
            [v4.Ref] = l_forwardRef_0
        });
    end;
end;
v18 = l_RoactServices_0.connect({
    analytics = v8
})(v18);
v18 = v5.connect(function(v35, _) --[[ Line: 108 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v10 (copy)
    return {
        avatarType = v35.AvatarExperience.AvatarEditor.Character.AvatarType, 
        head = v35.AvatarExperience.AvatarEditor.Character.AvatarScales.head, 
        headScaleRules = v35.AvatarExperience.AvatarEditor.AvatarSettings[v10.AvatarSettings.scalesRules].head
    };
end, function(v37) --[[ Line: 116 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v11 (copy), v12 (copy), v14 (copy)
    return {
        setScales = function(v38) --[[ Line: 118 ]] --[[ Name: setScales ]]
            -- upvalues: v37 (copy), v11 (ref)
            v37(v11(v38));
        end, 
        sendAnalytics = function(v39, v40) --[[ Line: 121 ]] --[[ Name: sendAnalytics ]]
            -- upvalues: v37 (copy), v12 (ref)
            v37(v12(v39, v40));
        end, 
        setCurrentToastMessage = function(v41) --[[ Line: 124 ]] --[[ Name: setCurrentToastMessage ]]
            -- upvalues: v37 (copy), v14 (ref)
            v37(v14(v41));
        end
    };
end)(v18);
return v4.forwardRef(function(v42, v43) --[[ Line: 132 ]]
    -- upvalues: v4 (copy), v18 (ref), v2 (copy)
    return v4.createElement(v18, v2.Dictionary.join(v42, {
        forwardRef = v43
    }));
end);