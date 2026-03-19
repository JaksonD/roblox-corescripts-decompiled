local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(script.Parent.LayerCollectorContext);
local l_GuiService_0 = game:GetService("GuiService");
local v4 = v1.PureComponent:extend("LayerCollectorProvider");
v4.init = function(v5) --[[ Line: 11 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v5.rootRef = v1.createRef();
    v5.state = {
        absoluteSize = Vector2.new(0, 0), 
        insets = {
            top = 0, 
            left = 0, 
            bottom = 0, 
            right = 0
        }
    };
end;
v4.watchLayerCollector = function(v6, v7) --[[ Line: 24 ]] --[[ Name: watchLayerCollector ]]
    -- upvalues: l_GuiService_0 (copy)
    local l_AbsoluteSize_0 = v7.AbsoluteSize;
    local v9 = Vector2.new(0, 0);
    local v10 = Vector2.new(0, 0);
    if v7:IsA("ScreenGui") then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 30 ]]
            -- upvalues: v7 (copy)
            return v7.IgnoreGuiInset;
        end);
        if l_status_0 and l_result_0 then
            local l_l_GuiService_0_GuiInset_0, v14 = l_GuiService_0:GetGuiInset();
            v9 = l_l_GuiService_0_GuiInset_0;
            v10 = v14;
        end;
    end;
    v6:setState({
        absoluteSize = l_AbsoluteSize_0, 
        insets = {
            top = v9.Y, 
            left = v9.X, 
            bottom = v10.Y, 
            right = v10.X
        }
    });
    v6.absoluteSizeConnection = v7:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 48 ]]
        -- upvalues: l_AbsoluteSize_0 (ref), v7 (copy), v6 (copy), v9 (ref), v10 (ref)
        l_AbsoluteSize_0 = v7.AbsoluteSize;
        v6:setState({
            absoluteSize = l_AbsoluteSize_0, 
            insets = {
                top = v9.Y, 
                left = v9.X, 
                bottom = v10.Y, 
                right = v10.X
            }
        });
    end);
end;
v4.didMount = function(v15) --[[ Line: 64 ]] --[[ Name: didMount ]]
    local l_current_0 = v15.rootRef.current;
    local l_l_current_0_FirstAncestorWhichIsA_0 = l_current_0:FindFirstAncestorWhichIsA("LayerCollector");
    if l_l_current_0_FirstAncestorWhichIsA_0 == nil then
        v15.ancestryConnection = l_current_0.AncestryChanged:Connect(function() --[[ Line: 69 ]]
            -- upvalues: l_l_current_0_FirstAncestorWhichIsA_0 (ref), l_current_0 (copy), v15 (copy)
            l_l_current_0_FirstAncestorWhichIsA_0 = l_current_0:FindFirstAncestorWhichIsA("LayerCollector");
            if l_l_current_0_FirstAncestorWhichIsA_0 ~= nil then
                v15.ancestryConnection:Disconnect();
                v15.ancestryConnection = nil;
                v15:watchLayerCollector(l_l_current_0_FirstAncestorWhichIsA_0);
            end;
        end);
    else
        v15:watchLayerCollector(l_l_current_0_FirstAncestorWhichIsA_0);
    end;
end;
v4.render = function(v18) --[[ Line: 82 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.createElement(v2.Provider, {
        value = {
            absoluteSize = v18.state.absoluteSize, 
            insets = v18.state.insets
        }
    }, {
        LayerCollectorChildRef = v1.createElement("Frame", {
            Visible = false, 
            [v1.Ref] = v18.rootRef
        }), 
        Children = v1.createFragment(v18.props[v1.Children])
    });
end;
return v4;