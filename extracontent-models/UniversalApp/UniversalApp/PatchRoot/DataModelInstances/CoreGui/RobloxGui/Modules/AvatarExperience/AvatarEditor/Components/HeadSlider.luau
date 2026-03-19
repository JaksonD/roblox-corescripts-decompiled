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
local function v16(v15) --[[ Line: 35 ]] --[[ Name: selectHeadState ]]
    -- upvalues: v10 (copy)
    return {
        avatarType = v15.AvatarExperience.AvatarEditor.Character.AvatarType, 
        head = v15.AvatarExperience.AvatarEditor.Character.AvatarScales.head, 
        headScaleRules = v15.AvatarExperience.AvatarEditor.AvatarSettings[v10.AvatarSettings.scalesRules].head
    };
end;
local v17 = nil;
local v18 = nil;
if l_FFlagAXMigrateSystemSliderToFoundationSlider_0 then
    v17 = function(v19, v20, v21) --[[ Line: 46 ]]
        -- upvalues: v9 (copy)
        if v21 <= v20 then
            v9("HeadSlider.lua convertHeadValueToSliderValue argument error: headMaxVal must be greater than headMinVal.");
            return 0.5;
        else
            return (v19 - v20) / (v21 - v20);
        end;
    end;
    v18 = function(v22, v23, v24) --[[ Line: 56 ]]
        return v22 * (v24 - v23) + v23;
    end;
end;
local function v42(v25, v26) --[[ Line: 61 ]] --[[ Name: HeadSlider ]]
    -- upvalues: l_useSelector_0 (copy), v16 (copy), v7 (copy), l_useDispatch_0 (copy), v8 (copy), v10 (copy), v4 (copy), l_FFlagAXMigrateSystemSliderToFoundationSlider_0 (copy), v18 (ref), v11 (copy), v3 (copy), v17 (ref), l_SystemSlider_0 (copy)
    local v27 = l_useSelector_0(v16, v7.deepEqual);
    local v28 = l_useDispatch_0();
    local v29 = v8();
    local l_avatarType_0 = v27.avatarType;
    local l_head_0 = v27.head;
    local l_headScaleRules_0 = v27.headScaleRules;
    local v33 = v25.isDisabled or l_avatarType_0 == v10.AvatarType.R6;
    local v34, v35 = v4.useState({
        head = l_head_0
    });
    local v39 = if l_FFlagAXMigrateSystemSliderToFoundationSlider_0 then v4.useCallback(function(v36) --[[ Line: 76 ]]
        -- upvalues: v18 (ref), l_headScaleRules_0 (copy), v29 (copy), v35 (copy)
        local v37 = v18(v36, l_headScaleRules_0.min, l_headScaleRules_0.max);
        v29.setAvatarScales({
            head = v37
        });
        v35({
            head = v37
        });
    end, {
        v29
    }) else v4.useCallback(function(v38) --[[ Line: 81 ]]
        -- upvalues: v29 (copy), v35 (copy)
        v29.setAvatarScales({
            head = v38
        });
        v35({
            head = v38
        });
    end, {
        v29, 
        l_headScaleRules_0
    });
    local v40 = v4.useCallback(function() --[[ Line: 86 ]]
        -- upvalues: v25 (copy)
        if v25.lockNavigationCallback then
            v25.lockNavigationCallback();
        end;
    end, {
        v25.lockNavigationCallback
    });
    local v41 = v4.useCallback(function() --[[ Line: 92 ]]
        -- upvalues: v25 (copy), v29 (copy), v28 (copy), v11 (ref), v34 (copy)
        if v25.unlockNavigationCallback then
            v25.unlockNavigationCallback();
        end;
        v29.setAvatarScales(nil);
        v28(v11({
            head = v34.head
        }));
    end, {
        v25.unlockNavigationCallback, 
        v34, 
        v29, 
        v28
    });
    if l_FFlagAXMigrateSystemSliderToFoundationSlider_0 then
        return v4.createElement(v3.Slider, {
            LayoutOrder = v25.LayoutOrder, 
            range = NumberRange.new(0, 1), 
            value = v17(v34.head, l_headScaleRules_0.min, l_headScaleRules_0.max), 
            onValueChanged = v39, 
            onDragStarted = v40, 
            onDragEnded = v41, 
            isDisabled = v33, 
            NextSelectionUp = v25.NextSelectionUp, 
            NextSelectionDown = v25.NextSelectionDown, 
            ref = v26
        });
    else
        return v4.createElement(l_SystemSlider_0, {
            layoutOrder = v25.LayoutOrder, 
            min = l_headScaleRules_0.min, 
            max = l_headScaleRules_0.max, 
            stepInterval = l_headScaleRules_0.increment, 
            value = v34.head, 
            onValueChanged = v39, 
            onDragStart = v40, 
            onDragEnd = v41, 
            isDisabled = v33, 
            NextSelectionUp = v25.NextSelectionUp, 
            NextSelectionDown = v25.NextSelectionDown, 
            ref = v26
        });
    end;
end;
return v4.memo(v4.forwardRef(v42));