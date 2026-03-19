local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_Parent_0.Foundation);
local l_View_0 = v3.View;
local l_ScrollView_0 = v3.ScrollView;
local l_ScrollBarVisibility_0 = v3.Enums.ScrollBarVisibility;
local l_useLayerCollector_0 = require(l_Parent_0.UIBlox).Core.Layout.LayerCollector.useLayerCollector;
return (v2.forwardRef(function(v8, v9) --[[ Line: 21 ]]
    -- upvalues: v2 (copy), l_useLayerCollector_0 (copy), l_View_0 (copy), l_ScrollView_0 (copy), l_ScrollBarVisibility_0 (copy)
    local v10 = v2.useRef(nil);
    local v11, v12 = v2.useState(Vector2.zero);
    local v13, v14 = v2.useState(Vector2.zero);
    local v15, v16 = v2.useState(true);
    local v17, v18 = v2.useState(false);
    local l_absoluteSize_0 = l_useLayerCollector_0().absoluteSize;
    v2.useLayoutEffect(function() --[[ Line: 30 ]]
        -- upvalues: v10 (copy), v12 (copy), v14 (copy)
        if v10.current then
            v12(v10.current.AbsoluteCanvasSize);
            v14(v10.current.AbsoluteWindowSize);
            local v20 = v10.current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function() --[[ Line: 37 ]]
                -- upvalues: v12 (ref), v10 (ref)
                v12(v10.current.AbsoluteCanvasSize);
            end);
            local v21 = v10.current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() --[[ Line: 42 ]]
                -- upvalues: v14 (ref), v10 (ref)
                v14(v10.current.AbsoluteWindowSize);
            end);
            return function() --[[ Line: 46 ]]
                -- upvalues: v20 (copy), v21 (copy)
                v20:Disconnect();
                v21:Disconnect();
            end;
        else
            return function() --[[ Line: 51 ]]

            end;
        end;
    end, {
        v10.current, 
        l_absoluteSize_0
    });
    v2.useEffect(function() --[[ Line: 54 ]]
        -- upvalues: v10 (copy), v11 (copy), v13 (copy), v16 (copy), v18 (copy)
        if v10.current then
            local v23 = v10.current:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 56 ]]
                -- upvalues: v10 (ref), v11 (ref), v13 (ref), v16 (ref), v18 (ref)
                local l_CanvasPosition_0 = v10.current.CanvasPosition;
                if v11.Y == v13.Y then
                    v16(true);
                    v18(true);
                    return;
                elseif l_CanvasPosition_0.Y <= 0 then
                    v16(true);
                    return;
                elseif l_CanvasPosition_0.Y >= v11.Y - v13.Y then
                    v18(true);
                    return;
                else
                    v16(false);
                    v18(false);
                    return;
                end;
            end);
            return function() --[[ Line: 71 ]]
                -- upvalues: v23 (copy)
                v23:Disconnect();
            end;
        else
            return function() --[[ Line: 75 ]]

            end;
        end;
    end, {
        v10.current, 
        l_absoluteSize_0, 
        v11, 
        v13
    });
    return v2.createElement(l_View_0, {
        tag = "size-full"
    }, {
        TopGradient = v2.createElement(l_View_0, {
            Size = UDim2.new(1, -15, 0, v8.gradientHeight), 
            tag = not v15 and "bg-surface-300" or nil, 
            ZIndex = 2
        }, {
            UIGradient = v2.createElement("UIGradient", {
                Rotation = 90, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0), 
                    NumberSequenceKeypoint.new(1, 1)
                })
            })
        }), 
        BottomGradient = v2.createElement(l_View_0, {
            Position = UDim2.new(0, 0, 1, -v8.gradientHeight), 
            Size = UDim2.new(1, -15, 0, v8.gradientHeight), 
            tag = not v17 and "bg-surface-300" or nil, 
            ZIndex = 2
        }, {
            UIGradient = v2.createElement("UIGradient", {
                Rotation = 270, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0), 
                    NumberSequenceKeypoint.new(1, 1)
                })
            })
        }), 
        ScrollView = v2.createElement(l_ScrollView_0, {
            Size = v8.Size or UDim2.new(1, 0, 1, 0), 
            ZIndex = v8.ZIndex, 
            scroll = {
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                CanvasSize = UDim2.fromOffset(0, 0), 
                scrollBarVisibility = l_ScrollBarVisibility_0.Always, 
                ScrollingDirection = Enum.ScrollingDirection.Y
            }, 
            scrollingFrameRef = v10, 
            ref = v9
        }, v8.children)
    });
end));