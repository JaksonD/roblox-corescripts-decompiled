local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Players_0 = game:GetService("Players");
local v2 = nil;
local v3 = nil;
local v4 = nil;
local v5 = nil;
local l_BindableEvent_0 = Instance.new("BindableEvent");
local function v7() --[[ Line: 11 ]] --[[ Name: handlePlayerOrLocaleChanged ]]
    -- upvalues: v3 (ref), v4 (ref), l_BindableEvent_0 (copy)
    if v3 and v3.LocaleId ~= v4 then
        v4 = v3.LocaleId;
        l_BindableEvent_0:Fire(v4);
    end;
end;
local function _() --[[ Line: 18 ]] --[[ Name: reset ]]
    -- upvalues: v2 (ref), v3 (ref), v5 (ref)
    v2 = nil;
    v3 = nil;
    if v5 then
        v5:Disconnect();
        v5 = nil;
    end;
end;
local function _() --[[ Line: 28 ]] --[[ Name: getTranslator ]]
    -- upvalues: v2 (ref), v3 (ref), l_Players_0 (copy), l_LocalizationService_0 (copy), v4 (ref), l_BindableEvent_0 (copy), v5 (ref), v7 (copy)
    if not v2 then
        v3 = l_Players_0.LocalPlayer;
        if v3 then
            v2 = l_LocalizationService_0:GetTranslatorForPlayer(v3);
            if v3 and v3.LocaleId ~= v4 then
                v4 = v3.LocaleId;
                l_BindableEvent_0:Fire(v4);
            end;
            v5 = v3:GetPropertyChangedSignal("LocaleId"):Connect(v7);
        end;
    end;
    return v2;
end;
local v10 = {};
local function _(v11) --[[ Line: 43 ]] --[[ Name: unregisterGui ]]
    -- upvalues: v10 (copy)
    local v12 = v10[v11];
    if not v12 then
        return;
    else
        v12.connection:Disconnect();
        v10[v11] = nil;
        return;
    end;
end;
local _ = function(v14, v15) --[[ Line: 52 ]] --[[ Name: makeAncestryChangedHandler ]]
    -- upvalues: v10 (copy)
    return function(_, _) --[[ Line: 53 ]]
        -- upvalues: v14 (copy), v15 (copy), v10 (ref)
        if not game:IsAncestorOf(v14) then
            if v15.hasBeenAdded then
                local l_v14_0 = v14;
                local v19 = v10[l_v14_0];
                if not v19 then
                    return;
                else
                    v19.connection:Disconnect();
                    v10[l_v14_0] = nil;
                    return;
                end;
            end;
        else
            v15.hasBeenAdded = true;
        end;
    end;
end;
local function _(v21, v22, v23) --[[ Line: 64 ]] --[[ Name: updateRegistryInfo ]]
    v21.context = v22;
    v21.text = v23;
end;
local function v33(v25, v26, v27) --[[ Line: 69 ]] --[[ Name: makeRegistryInfo ]]
    -- upvalues: v10 (copy)
    local v28 = {
        hasBeenAdded = game:IsAncestorOf(v25), 
        context = v26, 
        text = v27
    };
    v28.connection = v25.AncestryChanged:Connect(function(_, _) --[[ Line: 53 ]]
        -- upvalues: v25 (copy), v28 (copy), v10 (ref)
        if not game:IsAncestorOf(v25) then
            if v28.hasBeenAdded then
                local l_v25_0 = v25;
                local v32 = v10[l_v25_0];
                if not v32 then
                    return;
                else
                    v32.connection:Disconnect();
                    v10[l_v25_0] = nil;
                    return;
                end;
            end;
        else
            v28.hasBeenAdded = true;
        end;
    end);
    return v28;
end;
local function _(v34, v35, v36) --[[ Line: 77 ]] --[[ Name: registerGui ]]
    -- upvalues: v10 (copy), v33 (copy)
    if v10[v34] == nil then
        v10[v34] = v33(v34, v35, v36);
        return;
    else
        local v37 = v10[v34];
        v37.context = v35;
        v37.text = v36;
        return;
    end;
end;
l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Connect(function() --[[ Line: 85 ]]
    -- upvalues: v2 (ref), v3 (ref), v5 (ref), l_Players_0 (copy), l_LocalizationService_0 (copy), v4 (ref), l_BindableEvent_0 (copy), v7 (copy)
    v2 = nil;
    v3 = nil;
    if v5 then
        v5:Disconnect();
        v5 = nil;
    end;
    if not v2 then
        v3 = l_Players_0.LocalPlayer;
        if v3 then
            v2 = l_LocalizationService_0:GetTranslatorForPlayer(v3);
            if v3 and v3.LocaleId ~= v4 then
                v4 = v3.LocaleId;
                l_BindableEvent_0:Fire(v4);
            end;
            v5 = v3:GetPropertyChangedSignal("LocaleId"):Connect(v7);
        end;
    end;
end);
local v43 = {
    LocaleChanged = l_BindableEvent_0.Event, 
    TranslateGameText = function(_, v40, v41) --[[ Line: 101 ]] --[[ Name: TranslateGameText ]]
        -- upvalues: v2 (ref), v3 (ref), l_Players_0 (copy), l_LocalizationService_0 (copy), v4 (ref), l_BindableEvent_0 (copy), v5 (ref), v7 (copy)
        if not v2 then
            v3 = l_Players_0.LocalPlayer;
            if v3 then
                v2 = l_LocalizationService_0:GetTranslatorForPlayer(v3);
                if v3 and v3.LocaleId ~= v4 then
                    v4 = v3.LocaleId;
                    l_BindableEvent_0:Fire(v4);
                end;
                v5 = v3:GetPropertyChangedSignal("LocaleId"):Connect(v7);
            end;
        end;
        local l_v2_0 = v2;
        if l_v2_0 then
            return l_v2_0:RobloxOnlyTranslate(v40, v41);
        else
            return v41;
        end;
    end
};
l_LocalizationService_0.AutoTranslateWillRun:Connect(function() --[[ Line: 110 ]] --[[ Name: retranslateAll ]]
    -- upvalues: v10 (copy), v43 (copy)
    for v44, v45 in pairs(v10) do
        v44.Text = v43:TranslateGameText(v45.context, v45.text);
    end;
end);
v43.TranslateAndRegister = function(v46, v47, v48, v49) --[[ Line: 118 ]] --[[ Name: TranslateAndRegister ]]
    -- upvalues: v10 (copy), v33 (copy)
    v47.Text = v46:TranslateGameText(v48, v49);
    if v10[v47] == nil then
        v10[v47] = v33(v47, v48, v49);
        return v49;
    else
        local v50 = v10[v47];
        v50.context = v48;
        v50.text = v49;
        return v49;
    end;
end;
return v43;