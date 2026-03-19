local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.Foundation);
local l_Text_0 = require(l_script_FirstAncestor_0.Parent.AppCommonLib).Text;
local v4 = require(l_script_FirstAncestor_0.Hooks.useAnimation);
local l_Text_1 = v2.Text;
local l_useTokens_0 = v2.Hooks.useTokens;
return function(v7) --[[ Line: 22 ]] --[[ Name: DescriptionExpander ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_Text_0 (copy), v4 (copy), l_Text_1 (copy)
    local v8 = l_useTokens_0();
    local l_BodyLarge_0 = v8.Typography.BodyLarge;
    local v10, v11 = v1.useState(0);
    local function _(v12, v13) --[[ Line: 27 ]] --[[ Name: updateDescriptionHeight ]]
        -- upvalues: l_Text_0 (ref), l_BodyLarge_0 (copy), v11 (copy)
        local v14 = l_Text_0.GetTextHeight(v13, l_BodyLarge_0.Font, l_BodyLarge_0.FontSize, v12);
        v11(v14);
    end;
    local v20 = v1.useCallback(function(v16) --[[ Line: 32 ]]
        -- upvalues: v7 (copy), l_Text_0 (ref), l_BodyLarge_0 (copy), v11 (copy)
        local l_X_0 = v16.AbsoluteSize.X;
        local l_description_0 = v7.description;
        local v19 = l_Text_0.GetTextHeight(l_description_0, l_BodyLarge_0.Font, l_BodyLarge_0.FontSize, l_X_0);
        v11(v19);
    end, {
        v7.description
    });
    v1.useEffect(function() --[[ Line: 36 ]]
        -- upvalues: v7 (copy), l_Text_0 (ref), l_BodyLarge_0 (copy), v11 (copy)
        local l_width_0 = v7.width;
        local l_description_1 = v7.description;
        local v23 = l_Text_0.GetTextHeight(l_description_1, l_BodyLarge_0.Font, l_BodyLarge_0.FontSize, l_width_0);
        v11(v23);
    end, {
        v7.description, 
        v7.width
    });
    local v24 = v7.isExpanded and math.min(v10, v7.maxHeight) or math.min(v10, 40);
    local v25, v26 = v1.useState(v24);
    v4({
        startOffset = v25, 
        endOffset = v24, 
        duration = 0.1, 
        easingStyle = "quadratic", 
        setAnimationOffset = v26
    });
    local v27 = v1.createElement("ScrollingFrame", {
        ZIndex = 2, 
        Size = UDim2.new(1, 0, 0, v24), 
        CanvasSize = UDim2.new(0, 0, 0, v10 + 2), 
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ScrollingDirection = Enum.ScrollingDirection.Y, 
        ScrollingEnabled = v7.maxHeight + 10 < v10, 
        ScrollBarThickness = 0
    }, {
        Text = v1.createElement(l_Text_1, {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Text = v7.description, 
            TextTruncate = Enum.TextTruncate.None, 
            RichText = true, 
            textStyle = v8.Color.Content.Emphasis, 
            fontStyle = {
                Font = l_BodyLarge_0.Font, 
                FontSize = l_BodyLarge_0.FontSize, 
                LineHeight = 1
            }, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true
        })
    });
    local v28 = v1.createElement("TextButton", {
        ZIndex = 2, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v24), 
        Position = UDim2.fromScale(0, 0), 
        Text = "", 
        Active = v10 > 50, 
        AutoButtonColor = false, 
        AutomaticSize = Enum.AutomaticSize.None, 
        [v1.Event.Activated] = function() --[[ Line: 89 ]]
            -- upvalues: v7 (copy)
            v7.setIsExpanded(true);
        end
    }, {
        Text = v1.createElement(l_Text_1, {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Text = v7.description, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            RichText = true, 
            textStyle = v8.Color.Content.Emphasis, 
            fontStyle = {
                Font = l_BodyLarge_0.Font, 
                FontSize = l_BodyLarge_0.FontSize, 
                LineHeight = 1
            }, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true
        })
    });
    return v1.createElement("Frame", {
        LayoutOrder = v7.layoutOrder, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v25), 
        [v1.Change.AbsoluteSize] = function(v29) --[[ Line: 115 ]]
            -- upvalues: v20 (copy)
            v20(v29);
        end
    }, {
        Description = if v7.isExpanded then v27 else v28
    });
end;