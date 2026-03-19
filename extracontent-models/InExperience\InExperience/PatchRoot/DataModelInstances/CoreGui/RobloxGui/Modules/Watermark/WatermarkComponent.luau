local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local _ = require(l_CorePackages_0.Packages.RoactRodux);
local _ = require(l_CorePackages_0.Packages.UIBlox).App.ImageSet.Images;
local v6 = v3.PureComponent:extend("WatermarkComponent");
local l_PolicyService_0 = game:GetService("PolicyService");
v6.init = function(v8) --[[ Line: 17 ]] --[[ Name: init ]]
    -- upvalues: l_RunService_0 (copy), l_PolicyService_0 (copy)
    local function v9() --[[ Line: 18 ]] --[[ Name: UpdateWatermarkVisibility ]]
        -- upvalues: v8 (copy), l_RunService_0 (ref), l_PolicyService_0 (ref)
        v8:setState({
            watermarkVisible = not l_RunService_0:IsStudio() and l_PolicyService_0.IsLuobuServer == Enum.TriStateBoolean.True and l_PolicyService_0.LuobuWhitelisted == Enum.TriStateBoolean.False
        });
    end;
    l_PolicyService_0:GetPropertyChangedSignal("IsLuobuServer"):connect(function() --[[ Line: 26 ]]
        -- upvalues: v9 (copy)
        v9();
    end);
    l_PolicyService_0:GetPropertyChangedSignal("LuobuWhitelisted"):connect(function() --[[ Line: 30 ]]
        -- upvalues: v9 (copy)
        v9();
    end);
    v8:setState({
        absoluteSize = Vector2.new(0, 0), 
        watermarkVisible = false
    });
    v8.onAbsoluteSizeChange = function(v10) --[[ Line: 39 ]]
        -- upvalues: v8 (copy)
        v8:setState({
            absoluteSize = v10.AbsoluteSize
        });
    end;
    v9();
end;
v6.render = function(v11) --[[ Line: 48 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy)
    local function _() --[[ Line: 49 ]] --[[ Name: CalculateRotatedFrameWidth ]]
        -- upvalues: v11 (copy)
        return v11.state.absoluteSize.X * 0.9681476403781077 + v11.state.absoluteSize.Y * 0.25038000405444144;
    end;
    local function _() --[[ Line: 54 ]] --[[ Name: CalculateRotatedFrameHeight ]]
        -- upvalues: v11 (copy)
        return v11.state.absoluteSize.Y * 0.9681476403781077 + v11.state.absoluteSize.X * 0.25038000405444144;
    end;
    local function v19() --[[ Line: 59 ]] --[[ Name: CreateGridItems ]]
        -- upvalues: v11 (copy), v3 (ref)
        local v14 = math.ceil((v11.state.absoluteSize.X * 0.9681476403781077 + v11.state.absoluteSize.Y * 0.25038000405444144) / 450);
        local v15 = math.ceil((v11.state.absoluteSize.Y * 0.9681476403781077 + v11.state.absoluteSize.X * 0.25038000405444144) / 450);
        local v16 = {};
        for v17 = 0, v15 - 1 do
            for v18 = 0, v14 - 1 do
                table.insert(v16, v3.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    TextTransparency = 0.75, 
                    Text = "\228\187\133\231\148\168\228\186\142\230\181\139\232\175\149\239\188\140\n\233\157\158\230\173\163\229\188\143\229\143\145\232\161\168\227\128\130", 
                    TextSize = 30, 
                    TextColor3 = Color3.new(1, 1, 1), 
                    Size = UDim2.new(0, 225, 0, 225), 
                    Position = UDim2.new(0, v18 * 450, 0, v17 * 450)
                }));
                table.insert(v16, v3.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    TextTransparency = 0.91, 
                    Text = "\228\187\133\231\148\168\228\186\142\230\181\139\232\175\149\239\188\140\n\233\157\158\230\173\163\229\188\143\229\143\145\232\161\168\227\128\130", 
                    TextSize = 30, 
                    TextColor3 = Color3.new(0, 0, 0), 
                    Size = UDim2.new(0, 225, 0, 225), 
                    Position = UDim2.new(0, v18 * 450 + 1, 0, v17 * 450 + 1)
                }));
                table.insert(v16, v3.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    TextTransparency = 0.75, 
                    Text = "\228\187\133\231\148\168\228\186\142\230\181\139\232\175\149\239\188\140\n\233\157\158\230\173\163\229\188\143\229\143\145\232\161\168\227\128\130", 
                    TextSize = 30, 
                    TextColor3 = Color3.new(1, 1, 1), 
                    Size = UDim2.new(0, 225, 0, 225), 
                    Position = UDim2.new(0, v18 * 450 + 225, 0, v17 * 450 + 225)
                }));
                table.insert(v16, v3.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    TextTransparency = 0.91, 
                    Text = "\228\187\133\231\148\168\228\186\142\230\181\139\232\175\149\239\188\140\n\233\157\158\230\173\163\229\188\143\229\143\145\232\161\168\227\128\130", 
                    TextSize = 30, 
                    TextColor3 = Color3.new(0, 0, 0), 
                    Size = UDim2.new(0, 225, 0, 225), 
                    Position = UDim2.new(0, v18 * 450 + 226, 0, v17 * 450 + 226)
                }));
            end;
        end;
        return v16;
    end;
    return v11.state.watermarkVisible and v3.createElement("ScreenGui", {
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        AutoLocalize = false, 
        DisplayOrder = 10, 
        [v3.Change.AbsoluteSize] = v11.onAbsoluteSizeChange
    }, {
        FullScreenFrame = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v11.state.absoluteSize.X * 0.9681476403781077 + v11.state.absoluteSize.Y * 0.25038000405444144, 0, v11.state.absoluteSize.Y * 0.9681476403781077 + v11.state.absoluteSize.X * 0.25038000405444144), 
            Position = UDim2.new(0, (v11.state.absoluteSize.X - (v11.state.absoluteSize.X * 0.9681476403781077 + v11.state.absoluteSize.Y * 0.25038000405444144)) * 0.5, 0, (v11.state.absoluteSize.Y - (v11.state.absoluteSize.Y * 0.9681476403781077 + v11.state.absoluteSize.X * 0.25038000405444144)) * 0.5), 
            Rotation = 14.5
        }, (v19()))
    }) or nil;
end;
return v6;