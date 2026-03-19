local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.SharedFlags);
local v7 = require(script.Parent.withSignalsData);
local v8 = require(l_Parent_0.UIBlox);
local l_Images_0 = v8.App.ImageSet.Images;
local l_ImageSetLabel_0 = v8.Core.ImageSet.ImageSetLabel;
local l_Image_0 = require(l_Parent_0.Foundation).Image;
local v12 = 0.6;
local v13 = Vector2.new(-1, 0);
local v14 = game:DefineFastFlag("EnableChatMicPerfBinding", false);
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatMicBubbleSingleImage);
local v16 = game:DefineFastFlag("EnableDarkerShimmerTransparency", false);
local v17 = game:DefineFastInt("ExpChatMicActivityHeartbeatIncrement", 3);
if v16 then
    v12 = 0.4;
end;
local v18 = require(l_script_FirstAncestor_0.Flags.GetFFlagExpChatEnableVoiceReverseNudge);
local l_GetFFlagExpChatUseVoiceParticipantsStore_0 = v6.GetFFlagExpChatUseVoiceParticipantsStore;
local l_Helpers_0 = l_script_FirstAncestor_0.BubbleChat.Helpers;
local v21 = require(l_Helpers_0.getVoiceIndicatorAssetName);
local function v25(v22) --[[ Line: 53 ]] --[[ Name: createTweenShimmeringEffect ]]
    -- upvalues: l_TweenService_0 (copy)
    local v23 = TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out, -1);
    local v24 = {
        Offset = Vector2.new(1, 0)
    };
    return (l_TweenService_0:Create(v22:getValue(), v23, v24));
end;
local function v49(v26) --[[ Line: 61 ]] --[[ Name: ControlBubble ]]
    -- upvalues: v15 (copy), v5 (copy), v21 (copy), l_Image_0 (copy), v14 (copy), l_ImageSetLabel_0 (copy), l_RunService_0 (copy), v17 (copy), v25 (copy), v13 (copy), l_GetFFlagExpChatUseVoiceParticipantsStore_0 (copy), v18 (copy), l_Images_0 (copy), l_GuiService_0 (copy), v12 (ref)
    local v27 = nil;
    local v28 = nil;
    local v29 = nil;
    local v30 = nil;
    if v15 then
        local v31, v32 = v5.useBinding(0);
        v27 = v31;
        v28 = v32;
        v29 = v26.iconAssetName or v21(v26.voiceState, 1, v26.iconStyle, false);
        v30 = l_Image_0;
    elseif v14 then
        local v33, v34 = v5.useBinding(0);
        v27 = v33;
        v28 = v34;
        v29 = v27:map(function(v35) --[[ Line: 70 ]]
            -- upvalues: v26 (copy), v21 (ref)
            return v26.iconAssetName or v21(v26.voiceState, v35, v26.iconStyle, false);
        end);
        v30 = l_Image_0;
    else
        local v36, v37 = v5.useState(0);
        v27 = v36;
        v28 = v37;
        v30 = l_ImageSetLabel_0;
    end;
    local v38 = v5.useRef(0);
    local v39 = v5.useRef(nil);
    local v40 = v5.useRef(nil);
    v39 = v5.useRef(nil);
    v40 = v5.useRef(nil);
    v5.useEffect(function() --[[ Line: 88 ]]
        -- upvalues: v39 (ref), v40 (ref)
        if v39.current then
            local l_FirstChildWhichIsA_0 = v39.current:FindFirstChildWhichIsA("UIGradient", true);
            if l_FirstChildWhichIsA_0 then
                v40.current = l_FirstChildWhichIsA_0;
            end;
        end;
    end, {
        v39
    });
    v5.useEffect(function() --[[ Line: 97 ]]
        -- upvalues: v26 (copy), l_RunService_0 (ref), v38 (copy), v17 (ref), v28 (ref), v40 (ref), v25 (ref), v13 (ref)
        local v42 = nil;
        if v26.voiceState and v26.voiceState == "Talking" then
            v42 = l_RunService_0.PostSimulation:Connect(function() --[[ Line: 100 ]]
                -- upvalues: v38 (ref), v17 (ref), v28 (ref)
                v38.current = ((v38.current or 0) + 1) % v17;
                if v38.current == 0 then
                    v28(math.random());
                end;
            end);
            return function() --[[ Line: 109 ]]
                -- upvalues: v42 (ref)
                if v42 then
                    v42:Disconnect();
                    v42 = nil;
                end;
            end;
        elseif v26.voiceState and v26.voiceState == "Connecting" and v40 then
            local v43 = v25(v40);
            v43:Play();
            return function() --[[ Line: 119 ]]
                -- upvalues: v43 (copy), v40 (ref), v13 (ref)
                v43:Cancel();
                if v40 and v40.current then
                    v40.current.Offset = v13;
                end;
            end;
        else
            return function() --[[ Line: 128 ]]
                -- upvalues: v42 (ref)
                if v42 then
                    v42:Disconnect();
                    v42 = nil;
                end;
            end;
        end;
    end, {
        v26.voiceState
    });
    local v44 = nil;
    local v45 = nil;
    if l_GetFFlagExpChatUseVoiceParticipantsStore_0() then
        v45 = v5.useRef(v26.voiceState);
        v5.useEffect(function() --[[ Line: 141 ]]
            -- upvalues: v45 (ref), v26 (copy)
            v45.current = v26.voiceState;
        end, {
            v26.voiceState
        });
        v44 = v5.useCallback(function(v46) --[[ Line: 145 ]]
            -- upvalues: v26 (copy), v45 (ref)
            if v26.onActivated then
                v26.onActivated(v46, v45.current);
            end;
        end, {
            v26.onActivated
        });
    end;
    if not v14 and not v15 then
        local v47 = v26.iconAssetName or v21(v26.voiceState, v27, v26.iconStyle, false);
        if v18() then
            v47 = v26.iconAssetName or v21(v26.voiceState, v27, v26.iconStyle, v26.isUserToxic);
        end;
        v29 = l_Images_0[v47];
    end;
    return v5.createElement("ImageButton", {
        AnchorPoint = Vector2.new(0.5, 1), 
        Interactable = not l_GuiService_0:IsTenFootInterface() and nil, 
        Selectable = not l_GuiService_0:IsTenFootInterface() and nil, 
        Size = v26.controlBubbleSize, 
        LayoutOrder = v26.LayoutOrder, 
        BorderSizePixel = 0, 
        Transparency = 1, 
        ZIndex = 2, 
        [v5.Event.Activated] = if l_GetFFlagExpChatUseVoiceParticipantsStore_0() then v44 else v26.onActivated, 
        BackgroundTransparency = 1, 
        ref = v39
    }, {
        UICorner = v5.createElement("UICorner", {
            CornerRadius = UDim.new(0, v26.cornerRadiusOffset)
        }), 
        Contents = v5.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            UICorner = v5.createElement("UICorner", {
                CornerRadius = UDim.new(0, v26.cornerRadiusOffset)
            }), 
            Icon = v5.createElement(v30, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = v26.iconSize, 
                BackgroundTransparency = 1, 
                ImageTransparency = v26.iconTransparency, 
                BorderSizePixel = 0, 
                Image = v29
            }, {
                ShimmerGradient = v5.createElement("UIGradient", {
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.new(v12, v12, v12)), 
                        ColorSequenceKeypoint.new(0.5, Color3.new(0.8, 0.8, 0.8)), 
                        ColorSequenceKeypoint.new(1, Color3.new(v12, v12, v12))
                    }), 
                    Enabled = v26.voiceState == "Connecting", 
                    Rotation = -45, 
                    Offset = v13
                }), 
                ActivityGradient = v15 and v5.createElement("UIGradient", {
                    Color = v27:map(function(v48) --[[ Line: 213 ]]
                        return ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), 
                            ColorSequenceKeypoint.new(v48 * 0.5, Color3.new(1, 1, 1)), 
                            ColorSequenceKeypoint.new(v48 * 0.5 + 1.0E-6, Color3.new(0, 0, 0)), 
                            ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
                        });
                    end), 
                    Transparency = NumberSequence.new(0), 
                    Enabled = v26.voiceState ~= "Connecting", 
                    Rotation = 0
                })
            })
        })
    });
end;
if l_GetFFlagExpChatUseVoiceParticipantsStore_0() then
    return v5.memo(v7(v49));
else
    return v5.memo(v49);
end;