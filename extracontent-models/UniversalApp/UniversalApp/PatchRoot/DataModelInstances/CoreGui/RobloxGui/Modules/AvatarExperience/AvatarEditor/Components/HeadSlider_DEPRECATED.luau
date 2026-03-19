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
local l_SystemSlider_0 = v7.App.Slider.SystemSlider;
local v17 = v4.PureComponent:extend("HeadSlider");
v17.init = function(v18) --[[ Line: 28 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), l_FFlagAXMigrateSystemSliderToFoundationSlider_0 (copy), v9 (copy)
    v18.moveListen = nil;
    v18.endListen = nil;
    v18.scaleRef = v4.createRef();
    if l_FFlagAXMigrateSystemSliderToFoundationSlider_0 then
        v18.convertHeadValueToSliderValue = function(v19, v20, v21) --[[ Line: 35 ]]
            -- upvalues: v9 (ref)
            if v21 <= v20 then
                v9("HeadSlider_DEPRECATED.lua convertHeadValueToSliderValue argument error: headMaxVal must be greater than headMinVal.");
                return 0.5;
            else
                return (v19 - v20) / (v21 - v20);
            end;
        end;
        v18.convertSliderValueToHeadValue = function(v22, v23, v24) --[[ Line: 45 ]]
            return v22 * (v24 - v23) + v23;
        end;
    end;
end;
v17.render = function(v25) --[[ Line: 51 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagAXMigrateSystemSliderToFoundationSlider_0 (copy), v4 (copy), v3 (copy), v10 (copy), l_SystemSlider_0 (copy)
    local l_avatarType_0 = v25.props.avatarType;
    local l_head_0 = v25.props.head;
    local l_headScaleRules_0 = v25.props.headScaleRules;
    local l_LayoutOrder_0 = v25.props.LayoutOrder;
    local l_forwardRef_0 = v25.props.forwardRef;
    if l_FFlagAXMigrateSystemSliderToFoundationSlider_0 then
        return v4.createElement(v3.Slider, {
            LayoutOrder = l_LayoutOrder_0, 
            range = NumberRange.new(0, 1), 
            value = v25.convertHeadValueToSliderValue(l_head_0, l_headScaleRules_0.min, l_headScaleRules_0.max), 
            onValueChanged = function(v31) --[[ Line: 64 ]] --[[ Name: onValueChanged ]]
                -- upvalues: v25 (copy), l_headScaleRules_0 (copy)
                local v32 = v25.convertSliderValueToHeadValue(v31, l_headScaleRules_0.min, l_headScaleRules_0.max);
                v25.props.setScales({
                    head = v32
                });
            end, 
            onDragStarted = v25.props.lockNavigationCallback, 
            onDragEnded = v25.props.unlockNavigationCallback, 
            isDisabled = l_avatarType_0 == v10.AvatarType.R6, 
            NextSelectionUp = v25.props.NextSelectionUp, 
            NextSelectionDown = v25.props.NextSelectionDown, 
            [v4.Ref] = l_forwardRef_0
        });
    else
        return v4.createElement(l_SystemSlider_0, {
            layoutOrder = l_LayoutOrder_0, 
            min = l_headScaleRules_0.min, 
            max = l_headScaleRules_0.max, 
            stepInterval = l_headScaleRules_0.increment, 
            value = l_head_0, 
            onValueChanged = function(v33) --[[ Line: 86 ]] --[[ Name: onValueChanged ]]
                -- upvalues: v25 (copy)
                v25.props.setScales({
                    head = v33
                });
            end, 
            onDragStart = v25.props.lockNavigationCallback, 
            onDragEnd = v25.props.unlockNavigationCallback, 
            isDisabled = l_avatarType_0 == v10.AvatarType.R6, 
            NextSelectionUp = v25.props.NextSelectionUp, 
            NextSelectionDown = v25.props.NextSelectionDown, 
            [v4.Ref] = l_forwardRef_0
        });
    end;
end;
v17 = l_RoactServices_0.connect({
    analytics = v8
})(v17);
v17 = v5.connect(function(v34, _) --[[ Line: 105 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v10 (copy)
    return {
        avatarType = v34.AvatarExperience.AvatarEditor.Character.AvatarType, 
        head = v34.AvatarExperience.AvatarEditor.Character.AvatarScales.head, 
        headScaleRules = v34.AvatarExperience.AvatarEditor.AvatarSettings[v10.AvatarSettings.scalesRules].head
    };
end, function(v36) --[[ Line: 113 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v11 (copy), v12 (copy), v14 (copy)
    return {
        setScales = function(v37) --[[ Line: 115 ]] --[[ Name: setScales ]]
            -- upvalues: v36 (copy), v11 (ref)
            v36(v11(v37));
        end, 
        sendAnalytics = function(v38, v39) --[[ Line: 118 ]] --[[ Name: sendAnalytics ]]
            -- upvalues: v36 (copy), v12 (ref)
            v36(v12(v38, v39));
        end, 
        setCurrentToastMessage = function(v40) --[[ Line: 121 ]] --[[ Name: setCurrentToastMessage ]]
            -- upvalues: v36 (copy), v14 (ref)
            v36(v14(v40));
        end
    };
end)(v17);
return v4.forwardRef(function(v41, v42) --[[ Line: 129 ]]
    -- upvalues: v4 (copy), v17 (ref), v2 (copy)
    return v4.createElement(v17, v2.Dictionary.join(v41, {
        forwardRef = v42
    }));
end);