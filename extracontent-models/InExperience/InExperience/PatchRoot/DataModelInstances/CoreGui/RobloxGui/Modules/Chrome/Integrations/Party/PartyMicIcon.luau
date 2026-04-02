local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_CorePackages_0.Workspace.Packages.CrossExperienceVoice);
local v7 = require(l_CorePackages_0.Workspace.Packages.VoiceChat);
local l_useParticipant_0 = v6.Hooks.useParticipant;
local l_useIsVoiceConnected_0 = v6.Hooks.useIsVoiceConnected;
local l_useIsActiveParticipant_0 = v6.Hooks.useIsActiveParticipant;
local l_useIsParticipantMuted_0 = v6.Hooks.useIsParticipantMuted;
local l_Parent_0 = script.Parent.Parent.Parent;
local l_UnibarStyle_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).UnibarStyle;
local l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 = require(l_Parent_0.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local v16 = game:DefineFastInt("PartyMicVoiceIndicatorFrameBuffer", 3);
local function v22(v17, v18, v19, v20, v21) --[[ Line: 28 ]] --[[ Name: getLoadingIndicatorIcon ]]
    -- upvalues: v7 (copy)
    if not v19 or not v17 or v18 then
        return v7.Utils.GetIcon("Muted", "MicLight");
    elseif v20 then
        return v7.Utils.GetIcon("Unmuted", "MicLight", v21);
    else
        return v7.Utils.GetIcon("Unmuted0", "MicLight");
    end;
end;
PartyMicIcon = function(v23) --[[ Line: 44 ]] --[[ Name: PartyMicIcon ]]
    -- upvalues: l_Players_0 (copy), l_useIsVoiceConnected_0 (copy), l_useParticipant_0 (copy), l_useIsActiveParticipant_0 (copy), v4 (copy), l_useIsParticipantMuted_0 (copy), l_HttpService_0 (copy), l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), l_UnibarStyle_0 (copy), v16 (copy), l_RunService_0 (copy), v22 (copy), l_ImageSetLabel_0 (copy)
    local v24 = l_Players_0 and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or -1;
    local v25 = l_useIsVoiceConnected_0();
    local v26 = l_useParticipant_0(v24);
    local v27 = l_useIsActiveParticipant_0(v24);
    local v28 = v4.useRef(v27);
    local v29 = l_useIsParticipantMuted_0(v24) == true;
    local v30 = v4.useRef(0);
    local v31, v32 = v4.useState(0);
    local v33 = v4.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: l_HttpService_0 (ref)
        return l_HttpService_0:GenerateGUID();
    end, {});
    local _ = nil;
    local v35 = nil;
    v35 = if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then l_UnibarStyle_0.use().ICON_SIZE else 36;
    v4.useEffect(function() --[[ Line: 66 ]]
        -- upvalues: v26 (copy), v23 (copy)
        if v26 then
            v23.isLocalPlayerMutedSignal:fire(v26.isMuted);
        end;
    end, {
        v26
    });
    v4.useEffect(function() --[[ Line: 72 ]]
        -- upvalues: v23 (copy), v25 (copy)
        v23.isVoiceConnectedSignal:fire(v25);
    end, {
        v25
    });
    local v36 = v4.useCallback(function() --[[ Line: 76 ]]
        -- upvalues: v28 (copy), v30 (copy), v16 (ref), v32 (copy)
        if v28.current then
            if v30.current > v16 then
                v32(math.random());
                v30.current = 0;
                return;
            else
                v30.current = v30.current + 1;
            end;
        end;
    end, {});
    v4.useEffect(function() --[[ Line: 87 ]]
        -- upvalues: v28 (copy), v27 (copy)
        v28.current = v27;
    end, {
        v27
    });
    v4.useEffect(function() --[[ Line: 91 ]]
        -- upvalues: l_RunService_0 (ref), v33 (copy), v36 (copy)
        l_RunService_0:BindToRenderStep(v33, 1, v36);
        return function() --[[ Line: 94 ]]
            -- upvalues: l_RunService_0 (ref), v33 (ref)
            l_RunService_0:UnbindFromRenderStep(v33);
        end;
    end, {});
    local v37 = v4.useMemo(function() --[[ Line: 99 ]]
        -- upvalues: v22 (ref), v26 (copy), v29 (copy), v25 (copy), v27 (copy), v31 (copy)
        return v22(v26, v29, v25, v27, v31);
    end, {
        v26, 
        v29, 
        v25, 
        v27, 
        v31
    });
    return v4.createElement("Frame", {
        Size = UDim2.new(0, v35, 0, v35), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }, {
        UICorner = v4.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        }), 
        Icon = v4.createElement(l_ImageSetLabel_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromOffset(v35, v35), 
            BackgroundTransparency = 1, 
            Image = v37
        }, {
            v4.createElement("UICorner", {
                Name = "Corner", 
                CornerRadius = UDim.new(1, 0)
            })
        })
    });
end;
return PartyMicIcon;