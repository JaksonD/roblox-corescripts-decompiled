local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_Parent_1.Signals);
local _ = require(l_Parent_0.Types);
local v5 = require(l_Parent_0.SettingEnum);
local v6 = require(l_Parent_0.ValueChangedSignal);
local l_Localization_0 = require(l_Parent_1.InExperienceLocales).Localization;
local v8 = {};
v8.__index = v8;
v8.new = function() --[[ Line: 72 ]] --[[ Name: new ]]
    -- upvalues: l_LocalizationService_0 (copy), l_Localization_0 (copy), v8 (copy)
    local v9 = {};
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    v9._localization = l_Localization_0.new(l_RobloxLocaleId_0);
    v9._settings = {};
    v9._signals = {};
    v9._disposables = {};
    return (setmetatable(v9, v8));
end;
v8.registerSetting = function(v11, v12) --[[ Line: 82 ]] --[[ Name: registerSetting ]]
    -- upvalues: v3 (copy), v5 (copy)
    v11._disposables[v12.id] = {};
    if v12.alreadyLocalized == nil then
        v12.alreadyLocalized = true;
    end;
    local v13, v14 = v3.createSignal(true);
    if v12.onAvailabilityChanged then
        table.insert(v11._disposables[v12.id], v3.createEffect(function(v15) --[[ Line: 93 ]]
            -- upvalues: v13 (copy), v12 (copy)
            local v16 = v13(v15);
            v12.onAvailabilityChanged(v16);
        end));
    end;
    if v12.initialAvailability ~= nil then
        v14(v12.initialAvailability);
    end;
    local v17, v18 = v3.createSignal(true);
    if v12.onVisibilityChanged then
        table.insert(v11._disposables[v12.id], v3.createEffect(function(v19) --[[ Line: 106 ]]
            -- upvalues: v17 (copy), v12 (copy)
            local v20 = v17(v19);
            v12.onVisibilityChanged(v20);
        end));
    end;
    if v12.initialVisibility ~= nil then
        v18(v12.initialVisibility);
    end;
    v11._signals[v12.id] = {
        availability = v13, 
        setAvailability = v14, 
        visibility = v17, 
        setVisibility = v18
    };
    v12.subscribeAvailable = v13;
    v12.subscribeVisible = v17;
    if not v12.alreadyLocalized then
        v12.label = v11:_updateLocalization(v12.label);
        v12.description = v11:_updateLocalization(v12.description);
    end;
    local l_v12_0 = v12;
    if l_v12_0.field_type == v5.Selector then
        l_v12_0 = v11:_registerSelector(l_v12_0);
    elseif l_v12_0.field_type == v5.Slider then
        l_v12_0 = v11:_registerSlider(l_v12_0);
    elseif l_v12_0.field_type == v5.Dropdown then
        l_v12_0 = v11:_registerDropdown(l_v12_0);
    elseif l_v12_0.field_type == v5.TextButton then
        l_v12_0 = v11:_registerTextButton(l_v12_0);
    elseif l_v12_0.field_type == v5.Toggle then
        l_v12_0 = v11:_registerToggle(l_v12_0);
    else
        error(tostring(l_v12_0.field_type) .. " is not a valid field_type");
    end;
    v11._settings[l_v12_0.id] = l_v12_0;
    return l_v12_0;
end;
v8.setting = function(v22, v23) --[[ Line: 147 ]] --[[ Name: setting ]]
    if not v22._settings[v23] then
        error("No setting registered with id: " .. v23);
    end;
    return v22._settings[v23];
end;
v8.updateSetting = function(v24, v25, v26) --[[ Line: 154 ]] --[[ Name: updateSetting ]]
    assert(typeof(v24:setting(v25)) == "table", "No setting registered with id: " .. v25);
    if v26.available ~= nil then
        v24._signals[v25].setAvailability(v26.available);
    end;
    if v26.visible ~= nil then
        v24._signals[v25].setVisibility(v26.visible);
    end;
end;
v8.disconnect = function(v27) --[[ Line: 164 ]] --[[ Name: disconnect ]]
    for _, v29 in v27._disposables do
        for _, v31 in v29 do
            v31();
        end;
    end;
    v27._disposables = {};
    v27._signals = {};
    v27._settings = {};
end;
v8._updateLocalization = function(v32, v33) --[[ Line: 176 ]] --[[ Name: _updateLocalization ]]
    if v33 == nil then
        return nil;
    else
        local l__localization_0 = v32._localization;
        if typeof(v33) == "string" then
            return l__localization_0:Format(v33);
        else
            return l__localization_0:Format(v33.key, v33.args);
        end;
    end;
end;
v8._registerToggle = function(_, v36) --[[ Line: 188 ]] --[[ Name: _registerToggle ]]
    return v36;
end;
v8._registerOptions = function(v37, v38, v39) --[[ Line: 193 ]] --[[ Name: _registerOptions ]]
    for _, v41 in ipairs(v39) do
        if not v38 then
            v41.text = v37:_updateLocalization(v41.text);
        end;
        local v42 = v41.initialAvailability == nil or v41.initialAvailability;
        if v41.onAvailabilityChanged then
            v41.onAvailabilityChanged(v42);
        end;
    end;
    return v39;
end;
v8._registerSlider = function(v43, v44) --[[ Line: 212 ]] --[[ Name: _registerSlider ]]
    if not v44.alreadyLocalized then
        v44.sliderLeftLabel = v43:_updateLocalization(v44.sliderLeftLabel);
        v44.sliderRightLabel = v43:_updateLocalization(v44.sliderRightLabel);
    end;
    return v44;
end;
v8._registerTextButton = function(v45, v46) --[[ Line: 221 ]] --[[ Name: _registerTextButton ]]
    if not v46.alreadyLocalized then
        v46.text = v45:_updateLocalization(v46.text);
    end;
    return v46;
end;
v8._registerDropdown = function(v47, v48) --[[ Line: 233 ]] --[[ Name: _registerDropdown ]]
    -- upvalues: v6 (copy)
    if not v48.alreadyLocalized then
        v48.placeholder = v47:_updateLocalization(v48.placeholder);
    end;
    v48.onMenuOpenChange = v48.onMenuOpenChange or v6.new(nil);
    v48.options = v47:_registerOptions(v48.alreadyLocalized, v48.options);
    return v48;
end;
v8._registerSelector = function(v49, v50) --[[ Line: 243 ]] --[[ Name: _registerSelector ]]
    if not v50.alreadyLocalized then
        v50.placeholder = v49:_updateLocalization(v50.placeholder);
    end;
    v50.options = v49:_registerOptions(v50.alreadyLocalized, v50.options);
    return v50;
end;
return v8;