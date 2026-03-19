local l_GuiService_0 = game:GetService("GuiService");
local l_VRService_0 = game:GetService("VRService");
local l_Parent_0 = script:FindFirstAncestor("Responsive").Parent;
local v3 = require(script.Parent.CommonConfigs.StandardBreakpoints);
local v4 = require(script.Parent.InputMode);
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local v6 = require(script.Parent.FindFirstAncestorWithTag);
local v7 = setmetatable({}, {
    __mode = "k"
});
local v8 = {};
v8.__index = v8;
local l_rules_0 = v3.rules;
local v10 = {};
v10.__index = v10;
v10.new = function(v11) --[[ Line: 62 ]] --[[ Name: new ]]
    -- upvalues: v10 (copy)
    local v12 = {
        _hasSizeRules = false, 
        _hasInputRules = false, 
        _config = v11 or {}, 
        _currentRule = {
            Key = "Default"
        }, 
        _currentKey = "Default"
    };
    local v13 = false;
    local v14 = false;
    for _, v16 in v11 do
        v13 = v13 or v16.minWidth ~= nil or v16.maxWidth ~= nil or v16.minHeight ~= nil or v16.maxHeight ~= nil or v16.maxRatio ~= nil or v16.minRatio ~= nil;
        v14 = v14 or v16.preferredInput ~= nil or v16.lastInput ~= nil;
    end;
    v12._hasSizeRules = v13;
    v12._hasInputRules = v14;
    return (setmetatable(v12, v10));
end;
v10.hasSizeRules = function(v17) --[[ Line: 98 ]] --[[ Name: hasSizeRules ]]
    return v17._hasSizeRules;
end;
v10.hasInputRules = function(v18) --[[ Line: 101 ]] --[[ Name: hasInputRules ]]
    return v18._hasInputRules;
end;
v10.currentRule = function(v19) --[[ Line: 105 ]] --[[ Name: currentRule ]]
    return v19._currentRule;
end;
v10.currentKey = function(v20) --[[ Line: 108 ]] --[[ Name: currentKey ]]
    return v20._currentKey;
end;
v10.resolve = function(v21, v22, v23, v24, v25, v26) --[[ Line: 114 ]] --[[ Name: resolve ]]
    local v27 = "Default";
    local v28 = {};
    local v29 = v22 / v23;
    for _, v31 in v21._config do
        if (not (v31.minWidth ~= nil) or v31.minWidth <= v22) and (not (v31.maxWidth ~= nil) or v22 <= v31.maxWidth) and (not (v31.minHeight ~= nil) or v31.minHeight <= v23) and (not (v31.maxHeight ~= nil) or v23 <= v31.maxHeight) and (not (v31.minRatio ~= nil) or v31.minRatio <= v29) and (not (v31.maxRatio ~= nil) or v29 <= v31.maxRatio) and (not (v31.preferredInput ~= nil) or v24 == v31.preferredInput) and (not (v31.lastInput ~= nil) or v25 == v31.lastInput) and (v31.spatial == nil or v26 == v31.spatial) then
            v28 = v31;
            v27 = v31.Key;
            break;
        end;
    end;
    if v27 ~= v21._currentKey then
        v21._currentKey = v27;
        v21._currentRule = v28;
        return true;
    else
        return false;
    end;
end;
v8.new = function() --[[ Line: 154 ]] --[[ Name: new ]]
    -- upvalues: l_VRService_0 (copy), l_Signal_0 (copy), v8 (copy), v4 (copy)
    local v32 = {
        _layerCollectorSizeConnection = nil, 
        _inputModeConnection = nil, 
        _vrEnabledConnection = nil, 
        _vrEnabled = l_VRService_0.VREnabled, 
        _changed = l_Signal_0.new(), 
        _absoluteSize = Vector2.zero, 
        _hasInputRules = false, 
        _hasSizeRules = false, 
        _refCount = 1, 
        _configResolvers = {
            default = {}
        }
    };
    local v33 = setmetatable(v32, v8);
    v32._inputModeConnection = v4.connect(function() --[[ Line: 182 ]]
        -- upvalues: v32 (copy), v33 (copy)
        if v32._hasInputRules then
            v33:resolve();
        end;
    end);
    v32._vrEnabledConnection = l_VRService_0:GetPropertyChangedSignal("VREnabled"):Connect(function() --[[ Line: 188 ]]
        -- upvalues: v32 (copy), l_VRService_0 (ref), v33 (copy)
        v32._vrEnabled = l_VRService_0.VREnabled;
        v33:resolve();
    end);
    return v33;
end;
v8.incRef = function(v34) --[[ Line: 196 ]] --[[ Name: incRef ]]
    v34._refCount = v34._refCount + 1;
end;
v8.destroy = function(v35) --[[ Line: 201 ]] --[[ Name: destroy ]]
    -- upvalues: v7 (copy)
    if v35._refCount > 1 then
        v35._refCount = v35._refCount - 1;
        return;
    else
        if v35._layerCollectorSizeConnection then
            v35._layerCollectorSizeConnection:Disconnect();
            v35._layerCollectorSizeConnection = nil;
        end;
        if v35._inputModeConnection then
            v35._inputModeConnection:disconnect();
            v35._inputModeConnection = nil;
        end;
        if v35._vrEnabledConnection then
            v35._vrEnabledConnection:Disconnect();
            v35._vrEnabledConnection = nil;
        end;
        v35._changed = nil;
        for v36, v37 in v7 do
            if v37 == v35 then
                v7[v36] = nil;
            end;
        end;
        return;
    end;
end;
v8.connect = function(v38, v39) --[[ Line: 228 ]] --[[ Name: connect ]]
    if v38._changed == nil then
        error("Connecting to dead signal!");
    end;
    return v38._changed:connect(v39);
end;
v8.currentRule = function(v40, v41) --[[ Line: 236 ]] --[[ Name: currentRule ]]
    v41 = v41 or "default";
    return v40._configResolvers[v41]:currentRule();
end;
v8.currentKey = function(v42, v43) --[[ Line: 241 ]] --[[ Name: currentKey ]]
    v43 = v43 or "default";
    return v42._configResolvers[v43]:currentKey();
end;
v8.updateAbsoluteSize = function(v44, v45) --[[ Line: 247 ]] --[[ Name: updateAbsoluteSize ]]
    -- upvalues: l_GuiService_0 (copy)
    local l_AbsoluteSize_0 = v45.AbsoluteSize;
    if v45:IsA("LayerCollector") then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 251 ]]
            -- upvalues: v45 (copy)
            return v45.IgnoreGuiInset;
        end);
        if l_status_0 and l_result_0 then
            local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
            l_AbsoluteSize_0 = l_AbsoluteSize_0 + l_l_GuiService_0_GuiInset_0;
        end;
    end;
    if l_AbsoluteSize_0.X ~= v44._absoluteSize.X or l_AbsoluteSize_0.Y ~= v44._absoluteSize.Y then
        v44._absoluteSize = l_AbsoluteSize_0;
        if v44._hasSizeRules then
            v44:resolve();
        end;
    end;
end;
v8.resolve = function(v51) --[[ Line: 270 ]] --[[ Name: resolve ]]
    -- upvalues: v4 (copy)
    if not v51._configResolvers then
        return;
    else
        local v52 = v51._absoluteSize.X or 1;
        local v53 = v51._absoluteSize.Y or 1;
        local v54 = v4.preferred();
        local v55 = v4.last();
        local l__vrEnabled_0 = v51._vrEnabled;
        local v57 = false;
        for _, v59 in v51._configResolvers do
            if v59:resolve(v52, v53, v54, v55, l__vrEnabled_0) then
                v57 = true;
            end;
        end;
        if v57 then
            v51._changed:fire();
        end;
        return;
    end;
end;
is_array = function(v60) --[[ Line: 293 ]] --[[ Name: is_array ]]
    local v61 = false;
    if type(v60) == "table" then
        v61 = v60[1] ~= nil;
    end;
    return v61;
end;
v8.setConfig = function(v62, v63) --[[ Line: 300 ]] --[[ Name: setConfig ]]
    -- upvalues: v10 (copy)
    if is_array(v63) then
        v63 = {
            default = v63
        };
    end;
    local v64 = false;
    local v65 = false;
    local v66 = {};
    if v63 then
        for v67, v68 in v63 do
            v66[v67] = v10.new(v68);
            v64 = v64 or v66[v67]:hasSizeRules();
            v65 = v65 or v66[v67]:hasInputRules();
        end;
    end;
    v62._hasInputRules = v65;
    v62._hasSizeRules = v64;
    v62._configResolvers = v66;
    v62:resolve();
end;
v8.setLocalInstance = function(v69, v70, v71) --[[ Line: 328 ]] --[[ Name: setLocalInstance ]]
    -- upvalues: v6 (copy)
    if typeof(v70) ~= "Instance" then
        error("setLocalInstance arg1 expects Instance");
        return;
    else
        local v72 = nil;
        v72 = if typeof(v71) == "string" then v6(v70, v71) or v70 else if typeof(v71) == "Instance" then v71 else v70:FindFirstAncestorWhichIsA("LayerCollector");
        if v72 == nil then
            v72 = v70;
        end;
        if v69._layerCollectorSizeConnection then
            v69._layerCollectorSizeConnection:Disconnect();
            v69._layerCollectorSizeConnection = nil;
        end;
        if v72 then
            v69._layerCollectorSizeConnection = v72:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 354 ]]
                -- upvalues: v69 (copy), v72 (ref)
                v69:updateAbsoluteSize(v72);
            end);
            v69:updateAbsoluteSize(v72);
        end;
        return;
    end;
end;
return {
    DefaultKey = "Default", 
    bindContainer = function(v73, v74) --[[ Line: 363 ]] --[[ Name: bindContainer ]]
        -- upvalues: v7 (copy), v8 (copy), l_rules_0 (copy)
        local v75 = v7[v73];
        local v76 = v74 == nil;
        if v76 and v75 then
            v75:incRef();
            return v75;
        else
            v75 = v8.new();
            v75:setLocalInstance(v73, v73);
            v75:setConfig(v74 or l_rules_0);
            if v76 then
                v7[v73] = v75;
            end;
            return v75;
        end;
    end
};