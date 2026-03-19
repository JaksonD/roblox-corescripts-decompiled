local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Roact);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v6 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v7 = Rect.new(8, 8, 9, 9);
local v8 = v4.Component:extend("LoadingBarWithTheme");
v8.init = function(v9) --[[ Line: 21 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy)
    v9.barRef = v4.createRef();
end;
v8.render = function(v10) --[[ Line: 25 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v4 (copy), v6 (copy), v7 (copy)
    local l_ZIndex_0 = v10.props.ZIndex;
    return l_withStyle_0(function(v12) --[[ Line: 28 ]]
        -- upvalues: v4 (ref), v6 (ref), v7 (ref), l_ZIndex_0 (copy), v10 (copy)
        return v4.createElement(v6, {
            Image = "LuaApp/buttons/buttonFill", 
            ImageColor3 = v12.Theme.SystemPrimaryDefault.Color, 
            ImageTransparency = v12.Theme.SystemPrimaryDefault.Transparency, 
            ScaleType = "Slice", 
            SliceCenter = v7, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ZIndex = l_ZIndex_0, 
            [v4.Ref] = v10.barRef
        });
    end);
end;
v8.didMount = function(v13) --[[ Line: 43 ]] --[[ Name: didMount ]]
    -- upvalues: l_RunService_0 (copy), l_Workspace_0 (copy)
    v13.connection = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 44 ]]
        -- upvalues: l_Workspace_0 (ref), v13 (copy)
        local l_DistributedGameTime_0 = l_Workspace_0.DistributedGameTime;
        local l_current_0 = v13.barRef.current;
        local v16 = (1 - math.cos(2 * l_DistributedGameTime_0 * 5.026548245743669)) * 7.5;
        l_current_0.Size = UDim2.new(0, v16 + 4, 0, 4);
        local v17 = math.cos(l_DistributedGameTime_0 * 5.026548245743669) * 40;
        l_current_0.Position = UDim2.new(0.5, v17 - v16 / 2 - 2, 0.5, 0);
    end);
end;
v8.willUnmount = function(v18) --[[ Line: 57 ]] --[[ Name: willUnmount ]]
    v18.connection:Disconnect();
end;
return v8;