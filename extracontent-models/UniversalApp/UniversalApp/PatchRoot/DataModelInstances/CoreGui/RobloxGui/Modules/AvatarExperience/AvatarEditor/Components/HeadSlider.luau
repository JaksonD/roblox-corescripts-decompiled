local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Foundation);
local v4 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v7 = require(l_CorePackages_0.Packages.tutils);
local v8 = require(l_Modules_0.AvatarExperience.Common.Context.useBodyDataCallbacksContext);
local v9 = require(l_Modules_0.LuaApp.mutedError);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAvatarScales);
local l_SystemSlider_0 = require(l_CorePackages_0.Packages.UIBlox).App.Slider.SystemSlider;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_FFlagAXMigrateSystemSliderToFoundationSlider_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateSystemSliderToFoundationSlider;
local l_FFlagAXMakeSlidersSmoothWithGamepad_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMakeSlidersSmoothWithGamepad;
local function v17(v16) --[[ Line: 37 ]] --[[ Name: selectHeadState ]]
    -- upvalues: v10 (copy)
    return {
        avatarType = v16.AvatarExperience.AvatarEditor.Character.AvatarType, 
        head = v16.AvatarExperience.AvatarEditor.Character.AvatarScales.head, 
        headScaleRules = v16.AvatarExperience.AvatarEditor.AvatarSettings[v10.AvatarSettings.scalesRules].head
    };
end;
local v18 = nil;
local v19 = nil;
if l_FFlagAXMigrateSystemSliderToFoundationSlider_0 then
    v18 = function(v20, v21, v22) --[[ Line: 48 ]]
        -- upvalues: v9 (copy)
        if v22 <= v21 then
            v9("HeadSlider.lua convertHeadValueToSliderValue argument error: headMaxVal must be greater than headMinVal.");
            return 0.5;
        else
            return (v20 - v21) / (v22 - v21);
        end;
    end;
    v19 = function(v23, v24, v25) --[[ Line: 58 ]]
        return v23 * (v25 - v24) + v24;
    end;
end;
local function v43(v26, v27) --[[ Line: 63 ]] --[[ Name: HeadSlider ]]
    -- upvalues: l_useSelector_0 (copy), v17 (copy), v7 (copy), l_useDispatch_0 (copy), v8 (copy), v10 (copy), v4 (copy), l_FFlagAXMigrateSystemSliderToFoundationSlider_0 (copy), v19 (ref), v11 (copy), v3 (copy), v18 (ref), l_FFlagAXMakeSlidersSmoothWithGamepad_0 (copy), l_SystemSlider_0 (copy)
    local v28 = l_useSelector_0(v17, v7.deepEqual);
    local v29 = l_useDispatch_0();
    local v30 = v8();
    local l_avatarType_0 = v28.avatarType;
    local l_head_0 = v28.head;
    local l_headScaleRules_0 = v28.headScaleRules;
    local v34 = v26.isDisabled or l_avatarType_0 == v10.AvatarType.R6;
    local v35, v36 = v4.useState({
        head = l_head_0
    });
    local v40 = if l_FFlagAXMigrateSystemSliderToFoundationSlider_0 then v4.useCallback(function(v37) --[[ Line: 78 ]]
        -- upvalues: v19 (ref), l_headScaleRules_0 (copy), v30 (copy), v36 (copy)
        local v38 = v19(v37, l_headScaleRules_0.min, l_headScaleRules_0.max);
        v30.setAvatarScales({
            head = v38
        });
        v36({
            head = v38
        });
    end, {
        v30
    }) else v4.useCallback(function(v39) --[[ Line: 83 ]]
        -- upvalues: v30 (copy), v36 (copy)
        v30.setAvatarScales({
            head = v39
        });
        v36({
            head = v39
        });
    end, {
        v30, 
        l_headScaleRules_0
    });
    local v41 = v4.useCallback(function() --[[ Line: 88 ]]
        -- upvalues: v26 (copy)
        if v26.lockNavigationCallback then
            v26.lockNavigationCallback();
        end;
    end, {
        v26.lockNavigationCallback
    });
    local v42 = v4.useCallback(function() --[[ Line: 94 ]]
        -- upvalues: v26 (copy), v30 (copy), v29 (copy), v11 (ref), v35 (copy)
        if v26.unlockNavigationCallback then
            v26.unlockNavigationCallback();
        end;
        v30.setAvatarScales(nil);
        v29(v11({
            head = v35.head
        }));
    end, {
        v26.unlockNavigationCallback, 
        v35, 
        v30, 
        v29
    });
    if l_FFlagAXMigrateSystemSliderToFoundationSlider_0 then
        return v4.createElement(v3.Slider, {
            LayoutOrder = v26.LayoutOrder, 
            range = NumberRange.new(0, 1), 
            value = v18(v35.head, l_headScaleRules_0.min, l_headScaleRules_0.max), 
            onValueChanged = v40, 
            onDragStarted = v41, 
            onDragEnded = v42, 
            isDisabled = v34, 
            NextSelectionUp = v26.NextSelectionUp, 
            NextSelectionDown = v26.NextSelectionDown, 
            ref = v27, 
            step = l_FFlagAXMakeSlidersSmoothWithGamepad_0 and 0.01 or nil
        });
    else
        return v4.createElement(l_SystemSlider_0, {
            layoutOrder = v26.LayoutOrder, 
            min = l_headScaleRules_0.min, 
            max = l_headScaleRules_0.max, 
            stepInterval = l_headScaleRules_0.increment, 
            value = v35.head, 
            onValueChanged = v40, 
            onDragStart = v41, 
            onDragEnd = v42, 
            isDisabled = v34, 
            NextSelectionUp = v26.NextSelectionUp, 
            NextSelectionDown = v26.NextSelectionDown, 
            ref = v27
        });
    end;
end;
return v4.memo(v4.forwardRef(v43));