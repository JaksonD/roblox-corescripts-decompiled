local l_CollectionService_0 = game:GetService("CollectionService");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script:FindFirstAncestor("Impressions").Parent;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(script.Parent.Constants);
local v5 = game:DefineFastFlag("DebugEnableImpressionsVisualizer", false);
local v6 = {
    Color3.new(0.941176, 0.941176, 0.015686), 
    Color3.new(0.890196, 0.058823, 0.058823), 
    Color3.new(0.031372, 0.870588, 0.031372), 
    Color3.new(0.866666, 0.039215, 0.647058), 
    Color3.new(0.035294, 0.631372, 0.866666), 
    Color3.new(0.882352, 0.556862, 0.035294), 
    Color3.new(0.729411, 0.043137, 0.835294)
};
local v7 = 1;
local v8 = {
    None = "None", 
    Highlight = "Highlight", 
    FadeOut = "FadeOut"
};
local v9 = {
    BackgroundColor3 = Color3.new(1, 1, 1), 
    BorderColor3 = Color3.new(1, 1, 1), 
    BackgroundTransparency = 0, 
    BorderMode = Enum.BorderMode.Outline, 
    BorderSizePixel = 15, 
    ZIndex = 100
};
local v10 = {
    BackgroundTransparency = 0.65, 
    BorderSizePixel = 8
};
local v11 = {};
v11.__index = v11;
local function v18(v12) --[[ Line: 82 ]] --[[ Name: getTaggedInstances ]]
    -- upvalues: l_CollectionService_0 (copy), v4 (copy)
    local v13 = {};
    local l_l_CollectionService_0_Tagged_0 = l_CollectionService_0:GetTagged(v12);
    for _, v16 in ipairs(l_l_CollectionService_0_Tagged_0) do
        local l_v16_Attribute_0 = v16:GetAttribute(v4.ItemIndex);
        if l_v16_Attribute_0 and v16:IsA("GuiObject") then
            v13[l_v16_Attribute_0] = v16;
        end;
    end;
    return v13;
end;
v11.new = function(v19, v20) --[[ Line: 95 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy), v7 (ref), v11 (copy), v5 (copy), l_RunService_0 (copy)
    local v22 = {
        impressionsTag = v19, 
        highlightedInstances = {}, 
        originalInstances = {}, 
        highlightColor = v6[v7], 
        customKeyMapper = v20 or function(v21) --[[ Line: 101 ]]
            return v21;
        end
    };
    setmetatable(v22, v11);
    if v5 then
        v7 = v7 + 1;
        if v7 > #v6 then
            v7 = v7 % #v6;
        end;
        if v19 then
            local v23 = nil;
            do
                local l_v23_0 = v23;
                l_v23_0 = l_RunService_0.RenderStepped:Connect(function(v25) --[[ Line: 115 ]]
                    -- upvalues: v22 (copy), l_v23_0 (ref)
                    if v22 then
                        v22:_step(v25);
                        return;
                    else
                        if l_v23_0 then
                            l_v23_0:Disconnect();
                        end;
                        return;
                    end;
                end);
                v22.renderConnection = l_v23_0;
            end;
        end;
    end;
    return v22;
end;
v11.destroy = function(v26) --[[ Line: 131 ]] --[[ Name: destroy ]]
    if v26.renderConnection then
        v26.renderConnection:Disconnect();
    end;
end;
v11._startHighlightState = function(v27, v28, v29, v30, v31, v32) --[[ Line: 137 ]] --[[ Name: _startHighlightState ]]
    local v33 = v27.highlightedInstances[v28];
    if v33 == nil then
        v27.highlightedInstances[v28] = {
            highlightState = v29, 
            currentFields = {}
        };
        v33 = v27.highlightedInstances[v28];
    else
        v33.highlightState = v29;
    end;
    v33.totalDuration = v30;
    v33.duration = v30;
    v33.doLerp = v32;
    if v32 then
        local v34 = {};
        local v35 = {};
        for v36, v37 in pairs(v31) do
            v34[v36] = v33.currentFields[v36];
            v35[v36] = v37;
        end;
        v33.startFields = v34;
        v33.targetFields = v35;
    else
        v33.startFields = nil;
        v33.targetFields = nil;
        for v38, v39 in pairs(v31) do
            v33.currentFields[v38] = v39;
        end;
    end;
    v27.highlightedInstances[v28] = v33;
end;
v11._step = function(v40, v41) --[[ Line: 172 ]] --[[ Name: _step ]]
    -- upvalues: v8 (copy), v10 (copy), v18 (copy), v9 (copy)
    assert(v40.impressionsTag, "impressionsTag is nil");
    for v42, v43 in pairs(v40.highlightedInstances) do
        if v43.doLerp and v43.duration ~= nil and v43.totalDuration ~= nil then
            assert(v43.startFields, "startFields is nil");
            assert(v43.targetFields, "targetFields is nil");
            if v43.duration <= 0 then
                v43.doLerp = nil;
                v43.duration = nil;
                for v44, v45 in pairs(v43.targetFields) do
                    v43.currentFields[v44] = v45;
                end;
            else
                local v46 = math.clamp((v43.totalDuration - v43.duration) / v43.totalDuration, 0, 1);
                for v47, v48 in pairs(v43.targetFields) do
                    local v49 = v43.startFields[v47];
                    local v50 = v49 + (v48 - v49) * v46;
                    v43.currentFields[v47] = v50;
                end;
            end;
        end;
        if v43.highlightState == v8.Highlight then
            assert(v43.duration ~= nil, "duration is nil");
            if v43.duration <= 0 then
                v40:_startHighlightState(v42, v8.FadeOut, 2.5, v10, true);
            end;
        end;
        if v43.duration then
            v43.duration = v43.duration - v41;
        end;
    end;
    local v51 = v18(v40.impressionsTag);
    for v52, v53 in pairs(v51) do
        if v53 ~= nil then
            if v40.originalInstances[v53] == nil then
                v40.originalInstances[v53] = {};
                for v54, _ in pairs(v9) do
                    v40.originalInstances[v53][v54] = v53[v54];
                end;
            end;
            local v56 = v40.customKeyMapper(v52);
            local v57 = v40.highlightedInstances[v56];
            if v57 == nil then
                v57 = {
                    highlightState = v8.None, 
                    currentFields = {}
                };
                assert(v40.originalInstances[v53], "self.originalInstances[instance] is nil");
                for v58, v59 in pairs(v40.originalInstances[v53]) do
                    v57.currentFields[v58] = v59;
                end;
                v40.highlightedInstances[v56] = v57;
            end;
            assert(v57 ~= nil, "stateData is nil");
            if v57.currentFields then
                for v60, v61 in pairs(v57.currentFields) do
                    v53[v60] = v61;
                end;
            end;
        end;
    end;
end;
v11._highlightImpression = function(v62, v63) --[[ Line: 260 ]] --[[ Name: _highlightImpression ]]
    -- upvalues: v8 (copy), v3 (copy), v9 (copy)
    if v62.highlightedInstances[v63] ~= nil and v62.highlightedInstances[v63].highlightState ~= v8.None then
        return;
    else
        local v64 = v3.Dictionary.join(v9, {
            BackgroundColor3 = v62.highlightColor, 
            BorderColor3 = v62.highlightColor
        });
        v62:_startHighlightState(v63, v8.Highlight, 1, v64, false);
        return;
    end;
end;
v11._clearImpression = function(v65, v66) --[[ Line: 275 ]] --[[ Name: _clearImpression ]]
    v65.highlightedInstances[v66] = nil;
end;
v11.onSendImpressions = function(v67, v68) --[[ Line: 279 ]] --[[ Name: onSendImpressions ]]
    -- upvalues: v5 (copy)
    if not v5 then
        return;
    elseif not v67.impressionsTag or v68 == nil or #v68 <= 0 then
        return;
    else
        for _, v70 in ipairs(v68) do
            v67:_highlightImpression((v67.customKeyMapper(v70)));
        end;
        return;
    end;
end;
v11.onClearImpressions = function(v71, v72) --[[ Line: 294 ]] --[[ Name: onClearImpressions ]]
    -- upvalues: v5 (copy)
    if not v5 then
        return;
    elseif not v71.impressionsTag or v72 == nil or #v72 <= 0 then
        return;
    else
        for _, v74 in ipairs(v72) do
            v71:_clearImpression((v71.customKeyMapper(v74)));
        end;
        return;
    end;
end;
v11.onClearAllImpressions = function(v75) --[[ Line: 309 ]] --[[ Name: onClearAllImpressions ]]
    -- upvalues: v5 (copy)
    if not v5 then
        return;
    elseif not v75.impressionsTag then
        return;
    else
        for v76, v77 in pairs(v75.originalInstances) do
            for v78, v79 in pairs(v77) do
                v76[v78] = v79;
            end;
        end;
        v75.highlightedInstances = {};
        v75.originalInstances = {};
        return;
    end;
end;
v11.setCustomKeyMapper = function(v80, v81) --[[ Line: 329 ]] --[[ Name: setCustomKeyMapper ]]
    v80.customKeyMapper = v81 or function(v82) --[[ Line: 330 ]]
        return v82;
    end;
end;
v11.setImpressionsTag = function(v83, v84) --[[ Line: 335 ]] --[[ Name: setImpressionsTag ]]
    v83.impressionsTag = v84;
end;
return v11;