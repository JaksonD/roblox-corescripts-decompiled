local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_RoactFitComponents_0 = v1.RoactFitComponents;
local l_FitFrameOnAxis_0 = l_RoactFitComponents_0.FitFrameOnAxis;
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local v6 = Rect.new(10, 10, 11, 11);
local v7 = l_Roact_0.PureComponent:extend("ChatBubbleContainer");
v7.TAIL_WIDTH = 6;
v7.defaultProps = {
    isIncoming = false, 
    hasTail = false, 
    padding = 12, 
    LayoutOrder = 0, 
    isPending = false, 
    [l_Roact_0.Change.AbsoluteSize] = function() --[[ Line: 24 ]]

    end, 
    overrideImageColor = false
};
v7.init = function(v8) --[[ Line: 29 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy)
    local v9, v10 = l_Roact_0.createBinding(Vector2.new(0, 0));
    v8.bubbleSize = v9;
    v8.updateBubbleSize = v10;
end;
v7.render = function(v11) --[[ Line: 33 ]] --[[ Name: render ]]
    -- upvalues: l_UIBlox_0 (copy), l_Roact_0 (copy), l_FitFrameOnAxis_0 (copy), v6 (copy), l_RoactFitComponents_0 (copy)
    return l_UIBlox_0.Style.withStyle(function(v12) --[[ Line: 34 ]]
        -- upvalues: v11 (copy), l_Roact_0 (ref), l_FitFrameOnAxis_0 (ref), v6 (ref), l_RoactFitComponents_0 (ref)
        local v13 = v11.props[l_Roact_0.Children] or {};
        local l_hasTail_0 = v11.props.hasTail;
        local l_isIncoming_0 = v11.props.isIncoming;
        local l_isPending_0 = v11.props.isPending;
        local v17 = nil;
        v17 = if l_isIncoming_0 then v12.Theme.UIDefault else if l_isPending_0 then v12.Theme.UIMuted else v12.Theme.UIEmphasis;
        local l_Color_0 = v17.Color;
        local l_Transparency_0 = v17.Transparency;
        if v11.props.overrideImageColor then
            l_Color_0 = nil;
            if not l_isPending_0 then
                l_Transparency_0 = nil;
            end;
        end;
        local v20 = "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self2.png";
        if l_hasTail_0 then
            v20 = l_isIncoming_0 and "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble.png" or "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self.png";
        end;
        local v21 = l_isIncoming_0 and UDim2.new(0, v11.TAIL_WIDTH, 0, 0) or UDim2.new(1, -v11.TAIL_WIDTH, 0, 0);
        local v22 = l_isIncoming_0 and "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-tip.png" or "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self-tip.png";
        local v23 = l_isIncoming_0 and UDim2.new(0, 0, 0, 0) or UDim2.new(1, 0, 0, 0);
        return l_Roact_0.createElement("Frame", {
            Size = v11.bubbleSize:map(function(v24) --[[ Line: 69 ]]
                -- upvalues: v11 (ref)
                return UDim2.new(0, v24.X + v11.TAIL_WIDTH, 0, v24.Y);
            end), 
            LayoutOrder = v11.props.LayoutOrder, 
            BackgroundTransparency = 1
        }, {
            bubble = l_Roact_0.createElement(l_FitFrameOnAxis_0, {
                AnchorPoint = l_isIncoming_0 and Vector2.new(0, 0) or Vector2.new(1, 0), 
                axis = l_FitFrameOnAxis_0.Axis.Both, 
                BackgroundTransparency = 1, 
                ImageColor3 = l_Color_0, 
                ImageSet = {
                    Image = v20, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = v6
                }, 
                ImageTransparency = l_Transparency_0, 
                margin = l_RoactFitComponents_0.Rect.square(v11.props.padding), 
                Position = v21, 
                [l_Roact_0.Change.AbsoluteSize] = function(v25) --[[ Line: 88 ]]
                    -- upvalues: v11 (ref), l_Roact_0 (ref)
                    v11.updateBubbleSize(v25.AbsoluteSize);
                    v11.props[l_Roact_0.Change.AbsoluteSize](v25);
                end
            }, v13), 
            tail = l_Roact_0.createElement("ImageLabel", {
                AnchorPoint = l_isIncoming_0 and Vector2.new(0, 0) or Vector2.new(1, 0), 
                Size = UDim2.new(0, v11.TAIL_WIDTH, 0, v11.TAIL_WIDTH), 
                BackgroundTransparency = 1, 
                ImageColor3 = l_Color_0, 
                Position = v23, 
                Image = v22, 
                ImageTransparency = l_Transparency_0, 
                Visible = l_hasTail_0
            })
        });
    end);
end;
return v7;