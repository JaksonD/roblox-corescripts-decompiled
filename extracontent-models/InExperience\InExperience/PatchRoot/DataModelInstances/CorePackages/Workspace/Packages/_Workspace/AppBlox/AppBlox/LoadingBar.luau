local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v3 = require(l_Parent_0.Roact);
local v4 = Rect.new(1, 0, 2, 3);
local v5 = v3.Component:extend("LoadingBar");
v5.init = function(v6) --[[ Line: 16 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v6.barRef = v3.createRef();
end;
v5.render = function(v7) --[[ Line: 20 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v4 (copy)
    local l_ZIndex_0 = v7.props.ZIndex;
    return v3.createElement("ImageLabel", {
        Image = "rbxasset://textures/ui/LuaApp/9-slice/gr-loading-indicator.png", 
        ScaleType = "Slice", 
        SliceCenter = v4, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ZIndex = l_ZIndex_0, 
        [v3.Ref] = v7.barRef
    });
end;
v5.didMount = function(v9) --[[ Line: 34 ]] --[[ Name: didMount ]]
    -- upvalues: l_RunService_0 (copy), l_Workspace_0 (copy)
    v9.connection = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 35 ]]
        -- upvalues: l_Workspace_0 (ref), v9 (copy)
        local l_DistributedGameTime_0 = l_Workspace_0.DistributedGameTime;
        local l_current_0 = v9.barRef.current;
        local v12 = (1 - math.cos(2 * l_DistributedGameTime_0 * 5.026548245743669)) * 7.5;
        l_current_0.Size = UDim2.new(0, v12 + 4, 0, 4);
        local v13 = math.cos(l_DistributedGameTime_0 * 5.026548245743669) * 40;
        l_current_0.Position = UDim2.new(0.5, v13 - v12 / 2 - 2, 0.5, 0);
    end);
end;
v5.willUnmount = function(v14) --[[ Line: 48 ]] --[[ Name: willUnmount ]]
    v14.connection:Disconnect();
end;
return v5;