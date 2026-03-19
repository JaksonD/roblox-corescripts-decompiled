local l_CorePackages_0 = game:GetService("CorePackages");
local l_VRService_0 = game:GetService("VRService");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local l_Parent_0 = script.Parent.Parent;
local l_Actions_0 = script.Parent.Parent.Actions;
local v8 = require(l_Actions_0.SetPlayerListVisibility);
local v9 = require(l_Actions_0.SetPlayerListEnabled);
local v10 = require(l_Actions_0.SetTempHideKey);
local v11 = require(l_Actions_0.SetPerformanceStatsVisible);
local v12 = require(l_Actions_0.SetSmallTouchDevice);
local v13 = require(l_Actions_0.SetTenFootInterface);
local v14 = require(l_Actions_0.SetInspectMenuEnabled);
local v15 = require(l_Actions_0.SetIsUsingGamepad);
local v16 = require(l_Actions_0.SetHasPermissionToVoiceChat);
local v17 = require(l_Actions_0.SetMinimized);
local v18 = require(l_Actions_0.SetSubjectToChinaPolicies);
local v19 = require(l_Parent_0.Flags.FFlagPlayerListPersistVisibility);
local l_FFlagAddNewPlayerListMobileFocusNav_0 = v5.Flags.FFlagAddNewPlayerListMobileFocusNav;
local l_FFlagPlayerListUseMobileOnSmallDisplay_0 = v5.Flags.FFlagPlayerListUseMobileOnSmallDisplay;
local v22 = if v19 then UserSettings().GameSettings else nil;
local v23 = {
    isMinimized = false, 
    setVisible = not l_FFlagPlayerListUseMobileOnSmallDisplay_0 and (not v19 or v22.PlayerListVisible), 
    isVisible = true, 
    isSmallTouchDevice = false, 
    performanceStatsVisible = false, 
    vrEnabled = l_VRService_0.VREnabled, 
    inspectMenuEnabled = l_GuiService_0:GetInspectMenuEnabled(), 
    playerlistCoreGuiEnabled = true, 
    isTenFootInterface = false, 
    isUsingGamepad = false, 
    hasPermissionToVoiceChat = false, 
    tempHideKeys = {}, 
    subjectToChinaPolicies = true
};
local function _(v24) --[[ Line: 48 ]] --[[ Name: updateIsVisible ]]
    -- upvalues: v4 (copy)
    v24.isVisible = v24.setVisible;
    if not v24.isTenFootInterface then
        v24.isVisible = v24.isVisible;
    end;
    v24.isVisible = v24.isVisible and v4.isEmpty(v24.tempHideKeys);
    return v24;
end;
return (v3.createReducer(v23, {
    [v8.name] = function(v26, v27) --[[ Line: 61 ]]
        -- upvalues: v19 (copy), v22 (copy), v4 (copy)
        if v19 and not v26.isSmallTouchDevice and not v26.isTenFootInterface then
            v22.PlayerListVisible = v27.isVisible;
        end;
        local v28 = v4.Dictionary.join(v26, {
            setVisible = v27.isVisible
        });
        v28.isVisible = v28.setVisible;
        if not v28.isTenFootInterface then
            v28.isVisible = v28.isVisible;
        end;
        v28.isVisible = v28.isVisible and v4.isEmpty(v28.tempHideKeys);
        return v28;
    end, 
    [v9.name] = function(v29, v30) --[[ Line: 73 ]]
        -- upvalues: l_FFlagAddNewPlayerListMobileFocusNav_0 (copy), v4 (copy)
        local v31 = nil;
        if l_FFlagAddNewPlayerListMobileFocusNav_0 and not v30.isEnabled then
            v31 = false;
        end;
        local v32 = v4.Dictionary.join(v29, {
            playerlistCoreGuiEnabled = v30.isEnabled, 
            setVisible = if l_FFlagAddNewPlayerListMobileFocusNav_0 then v31 else nil
        });
        v32.isVisible = v32.setVisible;
        if not v32.isTenFootInterface then
            v32.isVisible = v32.isVisible;
        end;
        v32.isVisible = v32.isVisible and v4.isEmpty(v32.tempHideKeys);
        return v32;
    end, 
    [v10.name] = function(v33, v34) --[[ Line: 87 ]]
        -- upvalues: v4 (copy)
        local l_tempHideValue_0 = v34.tempHideValue;
        if l_tempHideValue_0 == nil then
            l_tempHideValue_0 = v4.None;
        end;
        local v36 = v4.Dictionary.join(v33, {
            tempHideKeys = v4.Dictionary.join(v33.tempHideKeys, {
                [v34.tempHideKey] = l_tempHideValue_0
            })
        });
        v36.isVisible = v36.setVisible;
        if not v36.isTenFootInterface then
            v36.isVisible = v36.isVisible;
        end;
        v36.isVisible = v36.isVisible and v4.isEmpty(v36.tempHideKeys);
        return v36;
    end, 
    [v11.name] = function(v37, v38) --[[ Line: 99 ]]
        -- upvalues: v4 (copy)
        return v4.Dictionary.join(v37, {
            performanceStatsVisible = v38.isVisible
        });
    end, 
    [v12.name] = function(v39, v40) --[[ Line: 105 ]]
        -- upvalues: v4 (copy)
        local v41 = v4.Dictionary.join(v39, {
            isSmallTouchDevice = v40.isSmallTouchDevice
        });
        v41.isVisible = v41.setVisible;
        if not v41.isTenFootInterface then
            v41.isVisible = v41.isVisible;
        end;
        v41.isVisible = v41.isVisible and v4.isEmpty(v41.tempHideKeys);
        return v41;
    end, 
    [v13.name] = function(v42, v43) --[[ Line: 111 ]]
        -- upvalues: v4 (copy)
        local l_setVisible_0 = v42.setVisible;
        if v43.isTenFootInterface then
            l_setVisible_0 = false;
        end;
        local v45 = v4.Dictionary.join(v42, {
            isTenFootInterface = v43.isTenFootInterface, 
            setVisible = l_setVisible_0
        });
        v45.isVisible = v45.setVisible;
        if not v45.isTenFootInterface then
            v45.isVisible = v45.isVisible;
        end;
        v45.isVisible = v45.isVisible and v4.isEmpty(v45.tempHideKeys);
        return v45;
    end, 
    [v14.name] = function(v46, v47) --[[ Line: 122 ]]
        -- upvalues: v4 (copy)
        return v4.Dictionary.join(v46, {
            inspectMenuEnabled = v47.enabled
        });
    end, 
    [v15.name] = function(v48, v49) --[[ Line: 128 ]]
        -- upvalues: v4 (copy)
        return v4.Dictionary.join(v48, {
            isUsingGamepad = v49.isUsingGamepad
        });
    end, 
    [v16.name] = function(v50, v51) --[[ Line: 134 ]]
        -- upvalues: v4 (copy)
        return v4.Dictionary.join(v50, {
            hasPermissionToVoiceChat = v51.hasPermissionToVoiceChat
        });
    end, 
    [v17.name] = function(v52, v53) --[[ Line: 140 ]]
        -- upvalues: v4 (copy)
        return v4.Dictionary.join(v52, {
            isMinimized = v53.isMinimized
        });
    end, 
    [v18.name] = function(v54, v55) --[[ Line: 146 ]]
        -- upvalues: v4 (copy)
        return v4.Dictionary.join(v54, {
            subjectToChinaPolicies = v55.subjectToChinaPolicies
        });
    end
}));