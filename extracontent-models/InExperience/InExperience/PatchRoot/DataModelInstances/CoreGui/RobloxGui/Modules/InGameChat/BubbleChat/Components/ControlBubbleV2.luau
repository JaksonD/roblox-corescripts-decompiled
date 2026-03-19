local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v5.App.ImageSet.Images;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 16 ]]
    -- upvalues: v5 (copy)
    return v5.Core.ImageSet.ImageSetLabel;
end);
local v9 = l_status_0 and l_result_0 or v5.Core.ImageSet.ImageSetLabel;
local v10 = require(script.Parent.Parent.Helpers.getVoiceIndicatorAssetName);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v12 = require(l_Modules_0.Flags.getFFlagEnableShimmeringIconLegacyChatService);
local v13 = 0.6;
local v14 = Vector2.new(-1, 0);
if game:DefineFastFlag("EnableDarkerShimmerTransparencyLegacyChatService", false) then
    v13 = 0.4;
end;
local function v18(v15) --[[ Line: 49 ]] --[[ Name: createTweenShimmeringEffect ]]
    -- upvalues: l_TweenService_0 (copy)
    local v16 = TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out, -1);
    local v17 = {
        Offset = Vector2.new(1, 0)
    };
    return (l_TweenService_0:Create(v15:getValue(), v16, v17));
end;
return function(v19) --[[ Line: 57 ]]
    -- upvalues: v4 (copy), v12 (copy), l_RunService_0 (copy), v18 (copy), v14 (copy), v10 (copy), v9 (copy), l_Images_0 (copy), v13 (ref)
    local v20, v21 = v4.useState(0);
    local v22 = v4.useRef(nil);
    local v23 = v4.useRef(nil);
    if v12() then
        v22 = v4.useRef(nil);
        v23 = v4.useRef(nil);
        v4.useEffect(function() --[[ Line: 65 ]]
            -- upvalues: v22 (ref), v23 (ref)
            if v22.current then
                local l_FirstChildWhichIsA_0 = v22.current:FindFirstChildWhichIsA("UIGradient", true);
                if l_FirstChildWhichIsA_0 then
                    v23.current = l_FirstChildWhichIsA_0;
                end;
            end;
        end, {
            v22
        });
    end;
    v4.useEffect(function() --[[ Line: 75 ]]
        -- upvalues: v19 (copy), l_RunService_0 (ref), v21 (copy), v12 (ref), v23 (ref), v18 (ref), v14 (ref)
        if v19.voiceState and v19.voiceState == "Talking" and v19.renderStepName then
            l_RunService_0:BindToRenderStep(v19.renderStepName, 1, function() --[[ Line: 77 ]]
                -- upvalues: v21 (ref)
                v21(math.random());
            end);
            return function() --[[ Line: 81 ]]
                -- upvalues: l_RunService_0 (ref), v19 (ref)
                l_RunService_0:UnbindFromRenderStep(v19.renderStepName);
            end;
        elseif v12() and v19.voiceState and v19.voiceState == "Connecting" and v23 then
            local v25 = v18(v23);
            v25:Play();
            return function() --[[ Line: 93 ]]
                -- upvalues: v25 (copy), v23 (ref), v14 (ref)
                v25:Cancel();
                if v23 and v23.current then
                    v23.current.Offset = v14;
                end;
            end;
        else
            return function() --[[ Line: 101 ]]
                -- upvalues: v19 (ref), l_RunService_0 (ref)
                if v19.renderStepName then
                    l_RunService_0:UnbindFromRenderStep(v19.renderStepName);
                end;
            end;
        end;
    end, {
        v19.voiceState
    });
    local v26 = v19.iconAssetName or v10(v19.voiceState, v20, v19.iconStyle);
    return v4.createElement("ImageButton", {
        AnchorPoint = Vector2.new(0.5, 1), 
        Size = v19.controlBubbleSize, 
        LayoutOrder = v19.LayoutOrder, 
        BorderSizePixel = 0, 
        Transparency = 1, 
        ZIndex = 2, 
        [v4.Event.Activated] = v19.onActivated, 
        BackgroundTransparency = 1, 
        ref = v12() and v22
    }, {
        UICorner = v4.createElement("UICorner", {
            CornerRadius = UDim.new(0, v19.cornerRadiusOffset)
        }), 
        Contents = v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, v19.cornerRadiusOffset)
            }), 
            Icon = v4.createElement(v9, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = v19.iconSize, 
                BackgroundTransparency = 1, 
                ImageTransparency = v19.iconTransparency, 
                BorderSizePixel = 0, 
                Image = l_Images_0[v26]
            }, {
                ShimmerGradient = v12() and v4.createElement("UIGradient", {
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.new(v13, v13, v13)), 
                        ColorSequenceKeypoint.new(0.5, Color3.new(0.8, 0.8, 0.8)), 
                        ColorSequenceKeypoint.new(1, Color3.new(v13, v13, v13))
                    }), 
                    Enabled = v19.voiceState == "Connecting", 
                    Rotation = -45, 
                    Offset = v14
                })
            })
        })
    });
end;