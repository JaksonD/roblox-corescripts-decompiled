local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_TweenService_0 = game:GetService("TweenService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v6 = require(l_CorePackages_0.Packages.Roact);
local v7 = require(l_CorePackages_0.Packages.React);
local v8 = require(l_CorePackages_0.Packages.ReactIs);
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local l_useSelectionCursor_0 = v9.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v9.App.SelectionImage.CursorKind;
local v12 = require(l_RobloxGui_0.Modules.VoiceChat.Hooks.useVoiceState);
local v13 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v15 = game:DefineFastFlag("VoiceIndicatorPerformanceOptimizations", false);
local v16 = game:DefineFastInt("MicTalkingUpdateFrequency", 3);
local v17 = UDim2.fromOffset(28, 28);
local function _(v18) --[[ Line: 31 ]] --[[ Name: useJoinBinding ]]
    -- upvalues: v7 (copy), v6 (copy)
    return v7.useMemo(function() --[[ Line: 32 ]]
        -- upvalues: v6 (ref), v18 (copy)
        return v6.joinBindings(v18);
    end, {});
end;
local function _(v20, v21) --[[ Line: 37 ]] --[[ Name: mapLevelToIcon ]]
    -- upvalues: v13 (copy), l_default_0 (copy)
    return function(v22) --[[ Line: 39 ]]
        -- upvalues: v13 (ref), l_default_0 (ref), v20 (copy), v21 (copy)
        local v23 = v22[1];
        local v24 = v22[2];
        if v23 == v13.VOICE_STATE.MUTED or v23 == v13.VOICE_STATE.LOCAL_MUTED then
            return l_default_0:GetIcon("Muted", v20);
        elseif v23 == v13.VOICE_STATE.CONNECTING or v23 == v13.VOICE_STATE.HIDDEN then
            if v21 and v20 == "MicLight" then
                return l_default_0:GetIcon("Connecting", "MicDark");
            else
                return l_default_0:GetIcon("Connecting", v20);
            end;
        elseif v23 == v13.VOICE_STATE.INACTIVE then
            return l_default_0:GetIcon("Unmuted0", v20);
        elseif v23 == v13.VOICE_STATE.TALKING then
            local v25 = math.floor(0.5 + 5 * v24) * 20;
            return l_default_0:GetIcon("Unmuted" .. tostring(v25), v20);
        else
            return l_default_0:GetIcon("Error", v20);
        end;
    end;
end;
local v27 = {
    [v13.VOICE_STATE.ERROR] = true, 
    [v13.VOICE_STATE.HIDDEN] = true
};
local function v28() --[[ Line: 66 ]] --[[ Name: GenerateGUID ]]
    -- upvalues: l_HttpService_0 (copy)
    return l_HttpService_0:GenerateGUID();
end;
local function v32(v29) --[[ Line: 82 ]] --[[ Name: createTweenShimmeringEffect ]]
    -- upvalues: l_TweenService_0 (copy)
    local v30 = TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out, -1);
    local v31 = {
        Offset = Vector2.new(1, 0)
    };
    return (l_TweenService_0:Create(v29:getValue(), v30, v31));
end;
return function(v33) --[[ Line: 90 ]] --[[ Name: VoiceIndicator ]]
    -- upvalues: v12 (copy), v7 (copy), v6 (copy), v28 (copy), v13 (copy), v32 (copy), v15 (copy), l_RunService_0 (copy), v16 (copy), v27 (copy), v8 (copy), l_default_0 (copy), v17 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy)
    local v34 = v12(v33.userId, v33.disable or false);
    local v35, v36 = v7.useBinding(0);
    local v37 = v33.selectable == nil or v33.selectable;
    local v38, v39 = v7.useBinding(v34);
    local v40 = {
        v38, 
        v35
    };
    local l_v40_0 = v40 --[[ copy: 8 -> 16 ]];
    local v42 = v7.useMemo(function() --[[ Line: 32 ]]
        -- upvalues: v6 (ref), l_v40_0 (copy)
        return v6.joinBindings(l_v40_0);
    end, {});
    v40 = v7.useRef(v28()).current or "";
    v39(v34);
    local v43 = v34 == v13.VOICE_STATE.TALKING;
    local v44 = v34 == v13.VOICE_STATE.CONNECTING;
    local v45 = v33.showConnectingShimmer == true;
    local v46 = v7.useRef(nil);
    v7.useEffect(function() --[[ Line: 104 ]]
        -- upvalues: v45 (copy), v44 (copy), v46 (copy), v32 (ref)
        if v45 and v44 and v46.current then
            local v47 = v32(v46);
            v47:Play();
            return function() --[[ Line: 109 ]]
                -- upvalues: v47 (copy)
                v47:Cancel();
            end;
        else
            return function() --[[ Line: 113 ]]

            end;
        end;
    end, {
        v44, 
        v45
    });
    if v15 then
        local v48 = v7.useRef(false);
        v48.current = v34 == v13.VOICE_STATE.TALKING;
        local l_v48_0 = v48 --[[ copy: 13 -> 18 ]];
        v7.useEffect(function() --[[ Line: 120 ]]
            -- upvalues: l_RunService_0 (ref), l_v48_0 (copy), v16 (ref), v36 (copy)
            local v50 = 0;
            l_RunService_0:BindToRenderStep("VoiceIndicatorUpdate", 1, function() --[[ Line: 123 ]]
                -- upvalues: l_v48_0 (ref), v50 (ref), v16 (ref), v36 (ref)
                if not l_v48_0.current then
                    return;
                else
                    v50 = v50 + 1;
                    if v16 <= v50 then
                        v50 = 0;
                        v36(math.random());
                    end;
                    return;
                end;
            end);
            return function() --[[ Line: 135 ]]
                -- upvalues: l_RunService_0 (ref)
                l_RunService_0:UnbindFromRenderStep("VoiceIndicatorUpdate");
            end;
        end, {});
    else
        v7.useEffect(function() --[[ Line: 140 ]]
            -- upvalues: v43 (copy), l_RunService_0 (ref), v40 (copy), v36 (copy)
            if v43 then
                l_RunService_0:BindToRenderStep(v40, 1, function() --[[ Line: 142 ]]
                    -- upvalues: v36 (ref)
                    v36(math.random());
                end);
            end;
            return function() --[[ Line: 146 ]]
                -- upvalues: v43 (ref), l_RunService_0 (ref), v40 (ref)
                if v43 then
                    l_RunService_0:UnbindFromRenderStep(v40);
                end;
            end;
        end, {
            v43
        });
    end;
    local v51 = not (v33.hideOnError and (not v34 or v27[v34]));
    local v52 = v34 == v13.VOICE_STATE.LOCAL_MUTED and 0.5 or 0;
    if v33.iconTransparency then
        local l_v52_0 = v52;
        local l_l_v52_0_0 = l_v52_0 --[[ copy: 15 -> 17 ]];
        v52 = if v8.isBinding(v33.iconTransparency) then v33.iconTransparency:map(function(v55) --[[ Line: 160 ]]
            -- upvalues: l_l_v52_0_0 (copy)
            return 1 - (1 - v55) * (1 - l_l_v52_0_0);
        end) else 1 - (1 - v33.iconTransparency) * (1 - l_v52_0);
    end;
    local v63 = v7.useMemo(function() --[[ Line: 168 ]]
        -- upvalues: v42 (copy), v33 (copy), v45 (copy), v13 (ref), l_default_0 (ref)
        local l_v42_0 = v42;
        local l_iconStyle_0 = v33.iconStyle;
        local l_v45_0 = v45;
        return l_v42_0:map(function(v59) --[[ Line: 39 ]]
            -- upvalues: v13 (ref), l_default_0 (ref), l_iconStyle_0 (copy), l_v45_0 (copy)
            local v60 = v59[1];
            local v61 = v59[2];
            if v60 == v13.VOICE_STATE.MUTED or v60 == v13.VOICE_STATE.LOCAL_MUTED then
                return l_default_0:GetIcon("Muted", l_iconStyle_0);
            elseif v60 == v13.VOICE_STATE.CONNECTING or v60 == v13.VOICE_STATE.HIDDEN then
                if l_v45_0 and l_iconStyle_0 == "MicLight" then
                    return l_default_0:GetIcon("Connecting", "MicDark");
                else
                    return l_default_0:GetIcon("Connecting", l_iconStyle_0);
                end;
            elseif v60 == v13.VOICE_STATE.INACTIVE then
                return l_default_0:GetIcon("Unmuted0", l_iconStyle_0);
            elseif v60 == v13.VOICE_STATE.TALKING then
                local v62 = math.floor(0.5 + 5 * v61) * 20;
                return l_default_0:GetIcon("Unmuted" .. tostring(v62), l_iconStyle_0);
            else
                return l_default_0:GetIcon("Error", l_iconStyle_0);
            end;
        end);
    end, {
        v33.iconStyle
    });
    return v6.createElement("ImageButton", {
        Size = v33.size or v17, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Image = v63, 
        ImageTransparency = v52, 
        Selectable = v37, 
        SelectionImageObject = l_useSelectionCursor_0(l_CursorKind_0.RoundedRectNoInset), 
        Visible = v51, 
        [v6.Event.Activated] = v33.onClicked
    }, {
        ShimmerGradient = if v45 then v6.createElement("UIGradient", {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new(0.6, 0.6, 0.6)), 
                ColorSequenceKeypoint.new(0.5, Color3.new(0.8, 0.8, 0.8)), 
                ColorSequenceKeypoint.new(1, Color3.new(0.6, 0.6, 0.6))
            }), 
            Enabled = v44, 
            Rotation = -45, 
            Offset = Vector2.new(-1, 0), 
            [v6.Ref] = v46
        }) else nil
    });
end;