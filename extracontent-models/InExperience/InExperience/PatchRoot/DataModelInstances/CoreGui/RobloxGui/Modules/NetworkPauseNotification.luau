local v0 = UDim2.new(1.1, 0, 1.1, 0);
local v1 = UDim2.new(0.9, 0, 0.9, 0);
local l_TweenService_0 = game:GetService("TweenService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v5 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v7 = TweenInfo.new(0.15, Enum.EasingStyle.Sine);
local v8 = TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true);
local v9 = game:DefineFastFlag("LocalizeGameplayPaused", false);
local function v10() --[[ Line: 23 ]] --[[ Name: build ]]
    -- upvalues: l_Create_0 (copy), v1 (copy), l_AppFonts_0 (copy), v9 (copy), v5 (copy)
    return l_Create_0("ImageLabel")({
        Name = "NetworkPause", 
        Image = "rbxasset://textures/ui/PurchasePrompt/LoadingBG.png", 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(8, 8, 12, 12), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        ImageColor3 = Color3.fromRGB(122, 122, 122), 
        ImageTransparency = 0, 
        BackgroundTransparency = 1; 
        l_Create_0("UISizeConstraint")({
            MaxSize = Vector2.new(312, 251)
        }), 
        l_Create_0("UIPadding")({
            PaddingTop = UDim.new(0, 24), 
            PaddingLeft = UDim.new(0, 24), 
            PaddingRight = UDim.new(0, 24), 
            PaddingBottom = UDim.new(0, 24)
        }), 
        l_Create_0("Frame")({
            Name = "Accent", 
            BorderSizePixel = 0, 
            BackgroundColor3 = Color3.fromRGB(66, 66, 66), 
            Size = UDim2.new(1, 0, 0, 1), 
            Position = UDim2.new(0, 0, 0, 88), 
            BackgroundTransparency = 0
        }), 
        l_Create_0("Frame")({
            Name = "Upper", 
            Size = UDim2.new(1, 0, 0, 88), 
            BackgroundTransparency = 1; 
            l_Create_0("Frame")({
                Name = "IconContainer", 
                Size = UDim2.new(0, 40, 0, 37), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, 0), 
                BackgroundTransparency = 1; 
                l_Create_0("ImageLabel")({
                    Name = "Icon", 
                    BackgroundTransparency = 1, 
                    Image = "rbxasset://textures/ui/NetworkPause/no connection.png", 
                    Size = v1, 
                    Position = UDim2.new(0.5, 0, 0.88, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.88), 
                    ImageTransparency = 0
                })
            }), 
            l_Create_0("TextLabel")({
                Name = "Label", 
                Font = l_AppFonts_0.default:getBold(), 
                Text = v9 and v5:FormatByKey("InGame.GameplayPaused.Title") or "Gameplay Paused", 
                TextSize = 22, 
                TextWrapped = true, 
                Size = UDim2.new(1, 0, 0, 22), 
                Position = UDim2.new(0, 0, 0, 54), 
                BackgroundTransparency = 1, 
                TextColor3 = Color3.fromRGB(255, 255, 255), 
                TextTransparency = 0
            })
        }), 
        l_Create_0("TextLabel")({
            Name = "Lower", 
            Font = l_AppFonts_0.default:getDefault(), 
            Text = v9 and v5:FormatByKey("InGame.GameplayPaused.Body") or "Gameplay has been paused: please wait while the game content loads.", 
            TextColor3 = Color3.fromRGB(190, 190, 190), 
            TextSize = 18, 
            TextWrapped = true, 
            Position = UDim2.new(0, 0, 0, 89), 
            Size = UDim2.new(1, 0, 1, -89), 
            BackgroundTransparency = 1, 
            TextTransparency = 0
        })
    });
end;
local v11 = {};
v11.__index = v11;
v11.new = function() --[[ Line: 122 ]] --[[ Name: new ]]
    -- upvalues: v11 (copy), v10 (copy), l_TweenService_0 (copy), v7 (copy), v8 (copy), v0 (copy)
    local v12 = setmetatable({}, v11);
    local v13 = v10();
    local v14 = l_TweenService_0:Create(v13, v7, {
        ImageTransparency = 0
    });
    local v15 = l_TweenService_0:Create(v13, v7, {
        ImageTransparency = 1
    });
    local v16 = l_TweenService_0:Create(v13.Upper.IconContainer.Icon, v8, {
        Size = v0, 
        ImageTransparency = 0.75
    });
    v12.__gui = v13;
    v12.__guiParent = nil;
    v12.__show = false;
    v12.__animations = {
        show = v14, 
        hide = v15, 
        pulse = v16
    };
    return v12;
end;
v11.Show = function(v17) --[[ Line: 146 ]] --[[ Name: Show ]]
    -- upvalues: v1 (copy)
    v17.__gui.Upper.IconContainer.Icon.Size = v1;
    v17.__gui.Upper.IconContainer.Icon.ImageTransparency = 0;
    v17.__show = true;
    v17.__gui.Parent = v17.__guiParent;
    v17.__animations.pulse:Play();
end;
v11.Hide = function(v18) --[[ Line: 154 ]] --[[ Name: Hide ]]
    v18.__show = false;
    v18.__gui.Parent = nil;
    v18.__animations.pulse:Cancel();
end;
v11.SetParent = function(v19, v20) --[[ Line: 160 ]] --[[ Name: SetParent ]]
    v19.__guiParent = v20;
    if v19.__show then
        v19.__gui.Parent = v20;
    end;
end;
return v11;