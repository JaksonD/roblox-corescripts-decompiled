local l_TweenService_0 = game:GetService("TweenService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.ExpChatShared);
local v4 = require(l_script_FirstAncestor_0.Config);
local v5 = require(l_Parent_0.React);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_script_FirstAncestor_1 = script:FindFirstAncestor("BubbleChat");
local v8 = require(l_script_FirstAncestor_1.Carat);
local l_AvatarChatUISettings_0 = v4.AvatarChatUISettings;
local l_Analytics_0 = v3.Analytics;
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local v13 = Color3.fromRGB(57, 59, 61);
local v14 = UDim2.new(0.07, 0, 0.01, 0);
local function v19(v15) --[[ Line: 36 ]] --[[ Name: createSizeChangeTween ]]
    -- upvalues: l_TweenService_0 (copy)
    local l_Scale_0 = v15.Size.X.Scale;
    local v17 = TweenInfo.new(math.random(20, 30) * 0.01, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, true);
    local v18 = {
        Size = UDim2.fromScale(l_Scale_0, math.random(2.5, 5) * 0.1)
    };
    return (l_TweenService_0:Create(v15, v17, v18));
end;
local function v21() --[[ Line: 51 ]] --[[ Name: getAnalyticsData ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy)
    local v20 = "";
    if l_game_EngineFeature_0 then
        v20 = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    return game.GameId, game.PlaceId, v20;
end;
return function(v22) --[[ Line: 59 ]] --[[ Name: LikelySpeakingBubble ]]
    -- upvalues: v5 (copy), l_AvatarChatUISettings_0 (copy), l_Analytics_0 (copy), v21 (copy), v19 (copy), v13 (copy), v14 (copy), l_Dictionary_0 (copy), v8 (copy)
    local v23 = v5.useRef(nil);
    local l_chatSettings_0 = v22.chatSettings;
    local l_SingleIconButtonSize_0 = l_AvatarChatUISettings_0.SingleIconButtonSize;
    local l_SingleIconCornerRadiusOffset_0 = l_AvatarChatUISettings_0.SingleIconCornerRadiusOffset;
    v5.useEffect(function() --[[ Line: 65 ]]
        -- upvalues: l_Analytics_0 (ref), v21 (ref)
        l_Analytics_0.FireLikelySpeakingBubbleAnalytics("shown", v21());
    end, {});
    v5.useEffect(function() --[[ Line: 69 ]]
        -- upvalues: v23 (copy), v19 (ref)
        local v27 = {};
        if v23.current then
            for _, v29 in (v23.current:GetChildren()) do
                if v29:IsA("Frame") then
                    local v30 = v19(v29);
                    table.insert(v27, v30);
                    v30:Play();
                end;
            end;
            return function() --[[ Line: 81 ]]
                -- upvalues: v27 (copy)
                for _, v32 in v27 do
                    if v32 then
                        v32:Cancel();
                    end;
                end;
            end;
        else
            return;
        end;
    end, {
        v23.current
    });
    local v35 = v5.useMemo(function() --[[ Line: 93 ]]
        -- upvalues: v5 (ref), l_SingleIconCornerRadiusOffset_0 (copy), v13 (ref), v14 (ref)
        local v33 = {
            UICorner = v5.createElement("UICorner", {
                CornerRadius = UDim.new(0, l_SingleIconCornerRadiusOffset_0)
            }), 
            UIListLayout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 2)
            })
        };
        for v34 = 1, 4 do
            v33["Line" .. v34] = v5.createElement("Frame", {
                BackgroundColor3 = v13, 
                Size = v14, 
                BorderSizePixel = 0, 
                ZIndex = 3, 
                LayoutOrder = v34
            }, {
                UICorner = v5.createElement("UICorner", {
                    CornerRadius = UDim.new(0, l_SingleIconCornerRadiusOffset_0)
                })
            });
        end;
        return v33;
    end, {});
    return v5.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 1), 
        Position = UDim2.new(0.5, 0, 1, -8), 
        Size = l_SingleIconButtonSize_0, 
        LayoutOrder = v22.LayoutOrder, 
        BackgroundTransparency = l_chatSettings_0.BackgroundTransparency, 
        BackgroundColor3 = l_chatSettings_0.BackgroundColor3
    }, {
        Scale = v5.createElement("UIScale", {
            Scale = not v22.isInsideMaximizeDistance and 0.75 or 1
        }), 
        UICorner = v5.createElement("UICorner", {
            CornerRadius = UDim.new(0, l_SingleIconCornerRadiusOffset_0)
        }), 
        Container = v5.createElement("ImageLabel", l_Dictionary_0.join({
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, l_chatSettings_0.ImageLabel), {
            UICorner = v5.createElement("UICorner", {
                CornerRadius = UDim.new(0, l_SingleIconCornerRadiusOffset_0)
            }), 
            LikelySpeakingBubble = v5.createElement("TextButton", {
                Size = l_SingleIconButtonSize_0, 
                BorderSizePixel = 0, 
                Transparency = 1, 
                TextTransparency = 1, 
                BackgroundTransparency = 1, 
                ZIndex = 2, 
                [v5.Event.Activated] = function() --[[ Line: 155 ]]
                    -- upvalues: l_Analytics_0 (ref), v21 (ref), v22 (copy)
                    l_Analytics_0.FireLikelySpeakingBubbleAnalytics("clicked", v21());
                    if v22.onActivated then
                        v22.onActivated();
                    end;
                end
            }, {
                UICorner = v5.createElement("UICorner", {
                    CornerRadius = UDim.new(0, l_SingleIconCornerRadiusOffset_0)
                }), 
                Contents = v5.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    BorderSizePixel = 0, 
                    Transparency = 1, 
                    BackgroundTransparency = 1, 
                    ref = v23, 
                    ZIndex = 2
                }, v35)
            })
        }), 
        Carat = l_chatSettings_0.TailVisible and v5.createElement(v8, {
            layoutOrder = 3, 
            chatSettings = l_chatSettings_0
        }), 
        BubbleGradient = l_chatSettings_0.UIGradient and v5.createElement("UIGradient", l_chatSettings_0.UIGradient)
    });
end;