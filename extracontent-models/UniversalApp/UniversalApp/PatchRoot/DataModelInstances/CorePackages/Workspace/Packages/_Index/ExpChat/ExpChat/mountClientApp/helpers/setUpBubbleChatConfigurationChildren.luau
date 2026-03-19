local l_TextChatService_0 = game:GetService("TextChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v3 = require(l_Actions_0.BubbleChatSettingsChanged);
local v4 = require(l_Actions_0.BubbleChatChildSettingChanged);
local v5 = require(l_Actions_0.BubbleChatChildRemoved);
local v6 = require(l_script_FirstAncestor_0.Config);
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v8 = require(l_Flags_0.getSetUpBubbleChatConfigurationChildProperties);
local l_DefaultBubbleChatChildrenCustomizationProperties_0 = v6.DefaultBubbleChatChildrenCustomizationProperties;
local v10 = {
    "ImageLabel", 
    "UIGradient", 
    "UICorner", 
    "UIPadding"
};
local function v16(v11) --[[ Line: 17 ]] --[[ Name: getSettingsFromInstance ]]
    -- upvalues: l_DefaultBubbleChatChildrenCustomizationProperties_0 (copy)
    local v12 = l_DefaultBubbleChatChildrenCustomizationProperties_0[v11.ClassName];
    local v13 = {};
    for v14, _ in pairs(v12) do
        if v11[v14] ~= nil then
            v13[v14] = v11[v14];
        end;
    end;
    return v13;
end;
local function v23(v17, v18) --[[ Line: 31 ]] --[[ Name: connectPropertyChangedSignalsToInstance ]]
    -- upvalues: l_DefaultBubbleChatChildrenCustomizationProperties_0 (copy), v4 (copy)
    local v19 = l_DefaultBubbleChatChildrenCustomizationProperties_0[v18.ClassName];
    local v20 = {};
    for v21, _ in pairs(v19) do
        if v18[v21] ~= nil then
            table.insert(v20, (v18:GetPropertyChangedSignal(v21):Connect(function() --[[ Line: 37 ]]
                -- upvalues: v17 (copy), v4 (ref), v18 (copy), v21 (copy)
                v17:dispatch(v4(v18.ClassName, v21, v18[v21]));
            end)));
        end;
    end;
    return v20;
end;
local _ = function(v24) --[[ Line: 47 ]] --[[ Name: disconnectPropertyChangedSignalsToInstance ]]
    if v24 then
        for _, v26 in ipairs(v24) do
            v26:Disconnect();
        end;
    end;
end;
local _ = function(v28) --[[ Line: 55 ]] --[[ Name: isValidBubbleChatChild ]]
    -- upvalues: v10 (copy)
    for _, v30 in ipairs(v10) do
        if v30 == v28.ClassName then
            return true;
        end;
    end;
    return false;
end;
return function(v32) --[[ Line: 65 ]]
    -- upvalues: l_TextChatService_0 (copy), v8 (copy), l_DefaultBubbleChatChildrenCustomizationProperties_0 (copy), v16 (copy), v23 (copy), v10 (copy), v5 (copy), v3 (copy)
    local l_BubbleChatConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("BubbleChatConfiguration");
    if l_BubbleChatConfiguration_0 == nil or v8() == false then
        return l_DefaultBubbleChatChildrenCustomizationProperties_0;
    else
        local v34 = {};
        local v35 = {};
        assert(l_BubbleChatConfiguration_0 ~= nil, "BubbleChatConfiguration cannot be nil.");
        local l_ImageLabel_0 = l_BubbleChatConfiguration_0:FindFirstChildOfClass("ImageLabel");
        local l_UIGradient_0 = l_BubbleChatConfiguration_0:FindFirstChildOfClass("UIGradient");
        local l_UICorner_0 = l_BubbleChatConfiguration_0:FindFirstChildOfClass("UICorner");
        local l_UIPadding_0 = l_BubbleChatConfiguration_0:FindFirstChildOfClass("UIPadding");
        for _, v41 in ipairs({
            l_ImageLabel_0, 
            l_UIGradient_0, 
            l_UICorner_0, 
            l_UIPadding_0
        }) do
            if v41 then
                local v42 = v16(v41);
                v34[v41.ClassName] = v42;
                local v43 = v23(v32, v41);
                v35[v41.ClassName] = v43;
            end;
        end;
        l_BubbleChatConfiguration_0.ChildRemoved:Connect(function(v44) --[[ Line: 95 ]]
            -- upvalues: v10 (ref), v35 (copy), v32 (copy), v5 (ref), l_BubbleChatConfiguration_0 (copy), v16 (ref), v3 (ref), v23 (ref)
            local v45 = false;
            local v46;
            for _, v48 in ipairs(v10) do
                if v48 == v44.ClassName then
                    v46 = true;
                    v45 = true;
                end;
                if v45 then
                    break;
                end;
            end;
            if not v45 then
                v46 = false;
            end;
            v45 = false;
            if v46 then
                v46 = v35[v44.ClassName];
                if v46 then
                    for _, v50 in ipairs(v46) do
                        v50:Disconnect();
                    end;
                end;
                v35[v44.ClassName] = nil;
                v32:dispatch(v5(v44.ClassName));
                v46 = l_BubbleChatConfiguration_0:FindFirstChildOfClass(v44.ClassName);
                if v46 then
                    local v51 = v16(v46);
                    v32:dispatch(v3(v44.ClassName, v51));
                    local v52 = v23(v32, v46);
                    v35[v46.ClassName] = v52;
                end;
            end;
        end);
        l_BubbleChatConfiguration_0.ChildAdded:Connect(function(v53) --[[ Line: 112 ]]
            -- upvalues: v10 (ref), v32 (copy), v16 (ref), v3 (ref), v23 (ref), v35 (copy)
            local v54 = false;
            local v55;
            for _, v57 in ipairs(v10) do
                if v57 == v53.ClassName then
                    v55 = true;
                    v54 = true;
                end;
                if v54 then
                    break;
                end;
            end;
            if not v54 then
                v55 = false;
            end;
            v54 = false;
            if v55 and v32:getState().BubbleChatSettings[v53.ClassName] == nil then
                v55 = v16(v53);
                v32:dispatch(v3(v53.ClassName, v55));
                local v58 = v23(v32, v53);
                v35[v53.ClassName] = v58;
            end;
        end);
        return v34;
    end;
end;