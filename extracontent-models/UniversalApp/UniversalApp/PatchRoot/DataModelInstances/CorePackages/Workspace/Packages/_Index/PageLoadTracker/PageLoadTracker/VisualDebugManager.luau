local l_TweenService_0 = game:GetService("TweenService");
local v1 = require(script.Parent.PageLoadConfig);
local v2 = {};
v2.__index = v2;
local function v6() --[[ Line: 8 ]] --[[ Name: getRandomHighlightColor ]]
    local v3 = math.random() * 0.6 + 0.4;
    local v4 = math.random() * 0.6 + 0.4;
    local v5 = math.random() * 0.6 + 0.4;
    return Color3.new(v3, v4, v5);
end;
v2.new = function() --[[ Line: 15 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v7 = {
        originalProperties = {}
    };
    setmetatable(v7, v2);
    return v7;
end;
v2.highlightComponent = function(v8, v9) --[[ Line: 30 ]] --[[ Name: highlightComponent ]]
    -- upvalues: v1 (copy), v6 (copy), l_TweenService_0 (copy)
    if v8.originalProperties[v9] then
        return;
    elseif v9.BackgroundColor3 == v1.VISUAL_DEBUG.HIGHLIGHT_COLOR then
        return;
    else
        local l_BackgroundColor3_0 = v9.BackgroundColor3;
        local l_BackgroundTransparency_0 = v9.BackgroundTransparency;
        local l_BorderColor3_0 = v9.BorderColor3;
        local l_BorderSizePixel_0 = v9.BorderSizePixel;
        v8.originalProperties[v9] = {
            backgroundColor = l_BackgroundColor3_0, 
            backgroundTransparency = l_BackgroundTransparency_0, 
            borderColor = l_BorderColor3_0, 
            borderSize = l_BorderSizePixel_0
        };
        v9.BackgroundColor3 = v1.VISUAL_DEBUG.HIGHLIGHT_COLOR or v6();
        if l_BackgroundTransparency_0 >= 0.95 then
            v9.BackgroundTransparency = 0.5;
        else
            v9.BackgroundTransparency = math.max(0.3, l_BackgroundTransparency_0 - v1.VISUAL_DEBUG.TRANSPARENCY_REDUCTION);
        end;
        v9.BorderColor3 = v1.VISUAL_DEBUG.BORDER_COLOR;
        v9.BorderSizePixel = math.max(v1.VISUAL_DEBUG.MIN_BORDER_SIZE, l_BorderSizePixel_0);
        task.delay(v1.VISUAL_DEBUG.HIGHLIGHT_DURATION, function() --[[ Line: 61 ]]
            -- upvalues: v9 (copy), v8 (copy), v1 (ref), l_TweenService_0 (ref)
            if v9.Parent and v8.originalProperties[v9] then
                local v14 = v8.originalProperties[v9];
                local v15 = TweenInfo.new(v1.VISUAL_DEBUG.FADE_DURATION, Enum.EasingStyle.Quart, Enum.EasingDirection.Out);
                local v16 = l_TweenService_0:Create(v9, v15, {
                    BackgroundColor3 = v1.VISUAL_DEBUG.END_COLOR, 
                    BackgroundTransparency = v14.backgroundTransparency * 0.9, 
                    BorderSizePixel = v14.borderSize
                });
                v16.Completed:Connect(function() --[[ Line: 76 ]]
                    -- upvalues: v8 (ref), v9 (ref)
                    v8.originalProperties[v9] = nil;
                end);
                v16:Play();
            end;
        end);
        return;
    end;
end;
v2.clearAllHighlights = function(v17) --[[ Line: 85 ]] --[[ Name: clearAllHighlights ]]
    for v18, v19 in v17.originalProperties do
        if v18.Parent then
            v18.BackgroundColor3 = v19.backgroundColor;
            v18.BackgroundTransparency = v19.backgroundTransparency;
            v18.BorderColor3 = v19.borderColor;
            v18.BorderSizePixel = v19.borderSize;
        end;
    end;
    v17.originalProperties = {};
end;
v2.destroy = function(v20) --[[ Line: 97 ]] --[[ Name: destroy ]]
    v20:clearAllHighlights();
end;
return v2;