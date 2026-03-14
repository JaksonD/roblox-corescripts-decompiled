local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.Config);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local v3 = {};
    for v4, _ in pairs(v1.DefaultBubbleChatMessagePropertiesInstanceSettings) do
        v3[v4] = v2[v4];
    end;
    local l_ImageLabel_0 = v2:FindFirstChildOfClass("ImageLabel");
    if l_ImageLabel_0 then
        local v7 = {};
        for v8, _ in pairs(v1.DefaultBubbleChatChildrenCustomizationProperties.ImageLabel) do
            v7[v8] = l_ImageLabel_0[v8];
        end;
        v3.ImageLabel = v7;
    end;
    local l_UIGradient_0 = v2:FindFirstChildOfClass("UIGradient");
    if l_UIGradient_0 then
        local v11 = {};
        for v12, _ in pairs(v1.DefaultBubbleChatChildrenCustomizationProperties.UIGradient) do
            v11[v12] = l_UIGradient_0[v12];
        end;
        v3.UIGradient = v11;
    end;
    local l_UICorner_0 = v2:FindFirstChildOfClass("UICorner");
    if l_UICorner_0 then
        local v15 = {};
        for v16, _ in pairs(v1.DefaultBubbleChatChildrenCustomizationProperties.UICorner) do
            v15[v16] = l_UICorner_0[v16];
        end;
        v3.UICorner = v15;
    end;
    local l_UIPadding_0 = v2:FindFirstChildOfClass("UIPadding");
    if l_UIPadding_0 then
        local v19 = {};
        for v20, _ in pairs(v1.DefaultBubbleChatChildrenCustomizationProperties.UIPadding) do
            v19[v20] = l_UIPadding_0[v20];
        end;
        v3.UIPadding = v19;
    end;
    return v3;
end;