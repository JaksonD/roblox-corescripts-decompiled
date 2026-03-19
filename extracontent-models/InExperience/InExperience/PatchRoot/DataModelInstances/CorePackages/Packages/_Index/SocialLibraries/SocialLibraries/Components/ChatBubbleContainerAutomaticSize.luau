local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local l_Object_0 = v1.LuauPolyfill.Object;
local v5 = Rect.new(10, 10, 11, 11);
local v7 = {
    isIncoming = false, 
    hasTail = false, 
    padding = 12, 
    LayoutOrder = 0, 
    isPending = false, 
    [l_React_0.Change.AbsoluteSize] = function(_) --[[ Line: 21 ]]

    end, 
    overrideImageColor = false
};
return function(v8) --[[ Line: 26 ]] --[[ Name: ChatBubbleContainer ]]
    -- upvalues: l_React_0 (copy), v7 (copy), l_UIBlox_0 (copy), v5 (copy), l_Object_0 (copy)
    local v9, v10 = l_React_0.useState(0);
    local v11 = v8[l_React_0.Change.AbsoluteSize] or v7[l_React_0.Change.AbsoluteSize];
    return l_UIBlox_0.Style.withStyle(function(v12) --[[ Line: 30 ]]
        -- upvalues: v8 (copy), v7 (ref), l_React_0 (ref), v9 (copy), v5 (ref), v11 (copy), l_Object_0 (ref), v10 (copy)
        local v13 = v8.children or {};
        local v14 = v8.hasTail or v7.hasTail;
        local v15 = v8.isIncoming or v7.isIncoming;
        local v16 = v8.isPending or v7.isPending;
        local v17 = nil;
        v17 = if v15 then v12.Theme.UIDefault else if v16 then v12.Theme.UIMuted else v12.Theme.UIEmphasis;
        local l_Color_0 = v17.Color;
        local l_Transparency_0 = v17.Transparency;
        if v8.overrideImageColor or v7.overrideImageColor then
            l_Color_0 = nil;
            if not v16 then
                l_Transparency_0 = nil;
            end;
        end;
        local v20 = "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self2.png";
        if v14 then
            v20 = v15 and "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble.png" or "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self.png";
        end;
        local v21 = v15 and UDim2.new(0, 6, 0, 0) or UDim2.new(1, -6, 0, 0);
        local v22 = v15 and "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-tip.png" or "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self-tip.png";
        local v23 = v15 and UDim2.new(0, 0, 0, 0) or UDim2.new(1, 0, 0, 0);
        local v24 = UDim.new(0, v8.padding or v7.padding);
        return l_React_0.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Size = UDim2.new(0, v9 + 6, 0, 0), 
            LayoutOrder = v8.LayoutOrder or v7.LayoutOrder, 
            BackgroundTransparency = 1
        }, {
            bubble = l_React_0.createElement("ImageLabel", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Size = UDim2.new(0, v9, 0, 0), 
                AnchorPoint = v15 and Vector2.new(0, 0) or Vector2.new(1, 0), 
                BackgroundTransparency = 1, 
                ImageColor3 = l_Color_0, 
                Image = v20, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v5, 
                ImageTransparency = l_Transparency_0, 
                Position = v21, 
                [l_React_0.Change.AbsoluteSize] = function(v25) --[[ Line: 82 ]]
                    -- upvalues: v11 (ref)
                    v11(v25);
                end
            }, l_Object_0.assign(table.clone(v13), {
                ["$margin"] = l_React_0.createElement("UIPadding", {
                    PaddingBottom = v24, 
                    PaddingTop = v24, 
                    PaddingRight = v24, 
                    PaddingLeft = v24
                }), 
                ["$layout"] = l_React_0.createElement("UIListLayout", {
                    [l_React_0.Change.AbsoluteContentSize] = function(v26) --[[ Line: 93 ]]
                        -- upvalues: v10 (ref), v24 (copy)
                        v10(v26.AbsoluteContentSize.X + v24.Offset * 2);
                    end
                })
            })), 
            tail = l_React_0.createElement("ImageLabel", {
                AnchorPoint = v15 and Vector2.new(0, 0) or Vector2.new(1, 0), 
                Size = UDim2.new(0, 6, 0, 6), 
                BackgroundTransparency = 1, 
                ImageColor3 = l_Color_0, 
                Position = v23, 
                Image = v22, 
                ImageTransparency = l_Transparency_0, 
                Visible = v14
            })
        });
    end);
end;