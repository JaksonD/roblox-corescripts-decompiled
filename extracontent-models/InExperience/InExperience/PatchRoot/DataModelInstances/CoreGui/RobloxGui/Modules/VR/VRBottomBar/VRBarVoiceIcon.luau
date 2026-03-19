local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_RobloxGui_0.Modules.VoiceChat.Hooks.useVoiceState);
local v7 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v9 = UDim2.fromOffset(36, 36);
local function _(v10) --[[ Line: 16 ]] --[[ Name: useJoinBinding ]]
    -- upvalues: v5 (copy), v4 (copy)
    return v5.useMemo(function() --[[ Line: 17 ]]
        -- upvalues: v4 (ref), v10 (copy)
        return v4.joinBindings(v10);
    end, {});
end;
local function _(v12) --[[ Line: 22 ]] --[[ Name: mapLevelToIcon ]]
    -- upvalues: v7 (copy), l_default_0 (copy)
    return function(v13) --[[ Line: 24 ]]
        -- upvalues: v7 (ref), l_default_0 (ref), v12 (copy)
        local v14 = v13[1];
        local v15 = v13[2];
        if v14 == v7.VOICE_STATE.MUTED or v14 == v7.VOICE_STATE.LOCAL_MUTED then
            return l_default_0:GetIcon("Muted", v12);
        elseif v14 == v7.VOICE_STATE.CONNECTING then
            return l_default_0:GetIcon("Connecting", v12);
        elseif v14 == v7.VOICE_STATE.INACTIVE then
            return l_default_0:GetIcon("Unmuted0", v12);
        elseif v14 == v7.VOICE_STATE.TALKING then
            local v16 = math.floor(0.5 + 5 * v15) * 20;
            return l_default_0:GetIcon("Unmuted" .. tostring(v16), v12);
        else
            return l_default_0:GetIcon("Error", v12);
        end;
    end;
end;
local function v18() --[[ Line: 42 ]] --[[ Name: GenerateGUID ]]
    -- upvalues: l_HttpService_0 (copy)
    return l_HttpService_0:GenerateGUID();
end;
return function(v19) --[[ Line: 55 ]] --[[ Name: VRBarVoiceIcon ]]
    -- upvalues: v6 (copy), v5 (copy), v4 (copy), v18 (copy), v7 (copy), l_RunService_0 (copy), l_default_0 (copy), v9 (copy)
    local v20 = v6(v19.userId, v19.disable or false);
    local v21, v22 = v5.useBinding(0);
    local v23, v24 = v5.useBinding(v20);
    local v25 = {
        v23, 
        v21
    };
    local l_v25_0 = v25 --[[ copy: 7 -> 10 ]];
    local v27 = v5.useMemo(function() --[[ Line: 17 ]]
        -- upvalues: v4 (ref), l_v25_0 (copy)
        return v4.joinBindings(l_v25_0);
    end, {});
    v25 = v5.useRef(v18()).current or "";
    v24(v20);
    local v28 = v20 == v7.VOICE_STATE.TALKING;
    v5.useEffect(function() --[[ Line: 65 ]]
        -- upvalues: v28 (copy), l_RunService_0 (ref), v25 (copy), v22 (copy)
        if v28 then
            l_RunService_0:BindToRenderStep(v25, 1, function() --[[ Line: 67 ]]
                -- upvalues: v22 (ref)
                v22(math.random());
            end);
        end;
        return function() --[[ Line: 71 ]]
            -- upvalues: v28 (ref), l_RunService_0 (ref), v25 (ref)
            if v28 then
                l_RunService_0:UnbindFromRenderStep(v25);
            end;
        end;
    end, {
        v28
    });
    local v35 = v5.useMemo(function() --[[ Line: 78 ]]
        -- upvalues: v27 (copy), v19 (copy), v7 (ref), l_default_0 (ref)
        local l_v27_0 = v27;
        local l_iconStyle_0 = v19.iconStyle;
        return l_v27_0:map(function(v31) --[[ Line: 24 ]]
            -- upvalues: v7 (ref), l_default_0 (ref), l_iconStyle_0 (copy)
            local v32 = v31[1];
            local v33 = v31[2];
            if v32 == v7.VOICE_STATE.MUTED or v32 == v7.VOICE_STATE.LOCAL_MUTED then
                return l_default_0:GetIcon("Muted", l_iconStyle_0);
            elseif v32 == v7.VOICE_STATE.CONNECTING then
                return l_default_0:GetIcon("Connecting", l_iconStyle_0);
            elseif v32 == v7.VOICE_STATE.INACTIVE then
                return l_default_0:GetIcon("Unmuted0", l_iconStyle_0);
            elseif v32 == v7.VOICE_STATE.TALKING then
                local v34 = math.floor(0.5 + 5 * v33) * 20;
                return l_default_0:GetIcon("Unmuted" .. tostring(v34), l_iconStyle_0);
            else
                return l_default_0:GetIcon("Error", l_iconStyle_0);
            end;
        end);
    end, {
        v19.iconStyle
    });
    return v4.createElement("ImageLabel", {
        BackgroundTransparency = v19.BackgroundTransparency or 1, 
        Image = v35, 
        ImageColor3 = v19.ImageColor3, 
        ImageTransparency = v19.ImageTransparency, 
        Position = v19.Position, 
        Size = v19.Size or v9, 
        [v4.Children] = v19[v4.Children]
    });
end;