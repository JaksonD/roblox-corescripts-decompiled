local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local v1 = require(l_script_FirstAncestor_0.Service.ChromeUtils);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v6 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization.new(l_LocalizationService_0.RobloxLocaleId);
local v7 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local _ = require(l_script_FirstAncestor_0.Service.Types);
local l_Signal_0 = v7.Signal;
local l_AvailabilitySignal_0 = v1.AvailabilitySignal;
local l_AvailabilitySignalState_0 = v1.AvailabilitySignalState;
local v12 = {};
v12.__index = v12;
local _ = function(v13) --[[ Line: 70 ]] --[[ Name: _handleShortcutEvent ]]
    return function(v14, v15, _) --[[ Line: 71 ]]
        -- upvalues: v13 (copy)
        if v15 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass;
        else
            for v17, v18 in v13._shortcuts do
                if v18.actionName and v18.actionName == v14 then
                    return v13:activateShortcut(v17) or Enum.ContextActionResult.Sink;
                end;
            end;
            return Enum.ContextActionResult.Pass;
        end;
    end;
end;
v12.new = function() --[[ Line: 85 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), v12 (copy)
    return (setmetatable({
        _shortcuts = {}, 
        _shortcutBarList = {}, 
        _shortcutBarHiddenOverrides = {}, 
        onShortcutBarChanged = l_Signal_0.new(), 
        _boundShortcuts = {}
    }, v12));
end;
v12.registerShortcut = function(v20, v21) --[[ Line: 99 ]] --[[ Name: registerShortcut ]]
    -- upvalues: v6 (copy), l_AvailabilitySignal_0 (copy), l_AvailabilitySignalState_0 (copy), l_UserInputService_0 (copy)
    if v20._shortcuts[v21.id] then
        warn(string.format("shortcut " .. v21.id .. " already registered", debug.traceback()));
    end;
    if v21.label then
        v21.label = v6:Format(v21.label);
    end;
    v21.displayPriority = v21.displayPriority or 0;
    if v21.availability == nil then
        v21.availability = l_AvailabilitySignal_0.new(l_AvailabilitySignalState_0.Available);
    end;
    v21.availability:connect(function() --[[ Line: 113 ]]
        -- upvalues: v20 (copy), v21 (copy)
        v20:shortcutChanged(v21);
    end);
    v21.icon = l_UserInputService_0:GetImageForKeyCode(v21.keyCode);
    v20._shortcuts[v21.id] = v21;
end;
v12.activateShortcut = function(v22, v23) --[[ Line: 122 ]] --[[ Name: activateShortcut ]]
    if v22._shortcuts[v23] then
        local v24 = v22._shortcuts[v23];
        if v24.activated then
            return v24.activated();
        end;
    end;
    return nil;
end;
v12.shortcutChanged = function(v25, _) --[[ Line: 133 ]] --[[ Name: shortcutChanged ]]
    v25:updateShortcutBar(v25:getCurrentShortcutBar());
end;
v12.updateShortcutBar = function(v27, v28) --[[ Line: 137 ]] --[[ Name: updateShortcutBar ]]
    v27:_unbindAllShortcuts();
    v27._currentShortcutBar = v28;
    if v27._shortcutBarHidden then
        v27.onShortcutBarChanged:fire(nil);
        return;
    else
        v27.onShortcutBarChanged:fire(v28);
        if v28 and v27._shortcutBarList[v28] then
            v27:_bindShortcutBar(v28);
        end;
        return;
    end;
end;
v12.configureShortcutBar = function(v29, v30, v31) --[[ Line: 152 ]] --[[ Name: configureShortcutBar ]]
    v29._shortcutBarList[v30] = v31;
end;
v12.setShortcutBar = function(v32, v33) --[[ Line: 156 ]] --[[ Name: setShortcutBar ]]
    if v32._currentShortcutBar ~= v33 then
        v32:updateShortcutBar(v33);
    end;
end;
v12.setHideShortcutBar = function(v34, v35, v36) --[[ Line: 162 ]] --[[ Name: setHideShortcutBar ]]
    if v34._shortcutBarHiddenOverrides[v35] ~= v36 then
        if v36 then
            v34._shortcutBarHiddenOverrides[v35] = v36;
        else
            v34._shortcutBarHiddenOverrides[v35] = nil;
        end;
        local v37 = false;
        for _, v39 in pairs(v34._shortcutBarHiddenOverrides) do
            if v39 then
                v37 = true;
                break;
            end;
        end;
        v34._shortcutBarHidden = v37;
        v34:updateShortcutBar(v34._currentShortcutBar);
    end;
end;
v12.getHideShortcutBar = function(v40) --[[ Line: 183 ]] --[[ Name: getHideShortcutBar ]]
    return v40._shortcutBarHidden;
end;
v12.getShortcut = function(v41, v42) --[[ Line: 187 ]] --[[ Name: getShortcut ]]
    return v41._shortcuts[v42];
end;
v12.getShortcutsFromBar = function(v43, v44, _) --[[ Line: 191 ]] --[[ Name: getShortcutsFromBar ]]
    -- upvalues: l_AvailabilitySignalState_0 (copy)
    if not v44 then
        return {};
    else
        local v46 = {};
        for _, v48 in v43._shortcutBarList[v44] do
            if not v43._shortcuts[v48] then
                warn(string.format("shortcut " .. v48 .. " not found", debug.traceback()));
            else
                local v49 = v43._shortcuts[v48];
                if v49.availability:get() ~= l_AvailabilitySignalState_0.Unavailable then
                    table.insert(v46, v49);
                end;
            end;
        end;
        return v46;
    end;
end;
v12.getCurrentShortcutBar = function(v50) --[[ Line: 213 ]] --[[ Name: getCurrentShortcutBar ]]
    return v50._currentShortcutBar;
end;
v12._bindShortcutBar = function(v51, v52) --[[ Line: 217 ]] --[[ Name: _bindShortcutBar ]]
    -- upvalues: l_AvailabilitySignalState_0 (copy)
    for _, v54 in v51._shortcutBarList[v52] do
        local v55 = v51._shortcuts[v54];
        if v55 and v55.actionName then
            v51:_unbindShortcut(v54);
            if v55.availability:get() ~= l_AvailabilitySignalState_0.Unavailable then
                v51:_bindShortcut(v54);
            end;
        end;
    end;
end;
v12._unbindShortcutBar = function(v56, v57) --[[ Line: 231 ]] --[[ Name: _unbindShortcutBar ]]
    if v57 then
        for _, v59 in v56._shortcutBarList[v57] do
            local v60 = v56._shortcuts[v59];
            if v60 and v60.actionName then
                v56:_unbindShortcut(v59);
            end;
        end;
    end;
end;
v12._bindShortcut = function(v61, v62) --[[ Line: 242 ]] --[[ Name: _bindShortcut ]]
    -- upvalues: l_ContextActionService_0 (copy)
    local v63 = v61._shortcuts[v62];
    if v63 and v63.actionName then
        l_ContextActionService_0:BindCoreAction(v63.actionName, function(v64, v65, _) --[[ Line: 71 ]]
            -- upvalues: v61 (copy)
            if v65 ~= Enum.UserInputState.Begin then
                return Enum.ContextActionResult.Pass;
            else
                for v67, v68 in v61._shortcuts do
                    if v68.actionName and v68.actionName == v64 then
                        return v61:activateShortcut(v67) or Enum.ContextActionResult.Sink;
                    end;
                end;
                return Enum.ContextActionResult.Pass;
            end;
        end, false, v63.keyCode);
        v61._boundShortcuts[v63.actionName] = true;
    end;
end;
v12._unbindShortcut = function(v69, v70) --[[ Line: 250 ]] --[[ Name: _unbindShortcut ]]
    -- upvalues: l_ContextActionService_0 (copy)
    local v71 = v69._shortcuts[v70];
    if v71 and v71.actionName then
        l_ContextActionService_0:UnbindCoreAction(v71.actionName);
        v69._boundShortcuts[v71.actionName] = false;
    end;
end;
v12._unbindAllShortcuts = function(v72) --[[ Line: 258 ]] --[[ Name: _unbindAllShortcuts ]]
    -- upvalues: l_ContextActionService_0 (copy)
    for v73, v74 in v72._boundShortcuts do
        if v74 then
            l_ContextActionService_0:UnbindCoreAction(v73);
            v72._boundShortcuts[v73] = false;
        end;
    end;
end;
return v12;