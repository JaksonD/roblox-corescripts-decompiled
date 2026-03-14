local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_withSelectionCursorProvider_0 = v4.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local v7 = require(l_RobloxGui_0.Modules.VoiceChat.Logger)(script.Name);
local v8 = require(l_CorePackages_0.Packages.Roact);
local v9 = require(l_CorePackages_0.Packages.ReactIs);
local v10 = require(l_CorePackages_0.Packages.RoactRodux);
local v11 = require(l_CorePackages_0.Packages.t);
local v12 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v14 = v8.PureComponent:extend("VoiceIndicator");
v14.validateProps = v11.strictInterface({
    onClicked = v11.optional(v11.callback), 
    userId = v11.string, 
    hideOnError = v11.optional(v11.boolean), 
    size = v11.optional(v11.UDim2), 
    iconStyle = v11.optional(v11.union(v11.literal("MicDark"), v11.literal("MicLight"), v11.literal("SpeakerDark"), v11.literal("SpeakerLight"))), 
    iconTransparency = v11.optional(v11.union(v11.number, v11.table)), 
    voiceState = v11.string
});
v14.defaultProps = {};
v14.getIcon = function(_, v16) --[[ Line: 47 ]] --[[ Name: getIcon ]]
    return "rbxasset://textures/ui/VoiceChat/" .. v16 .. ".png";
end;
v14.init = function(v17) --[[ Line: 51 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy), l_HttpService_0 (copy), l_RunService_0 (copy), v12 (copy), l_default_0 (copy)
    local v18, v19 = v8.createBinding(0);
    v17.level = v18;
    v17.updateLevel = v19;
    v18, v19 = v8.createBinding(v17.props.voiceState);
    v17.voiceState = v18;
    v17.updateVoiceState = v19;
    v17.renderStepName = l_HttpService_0:GenerateGUID();
    l_RunService_0:BindToRenderStep(v17.renderStepName, 1, function() --[[ Line: 58 ]]
        -- upvalues: v17 (copy)
        v17.updateLevel(math.random());
    end);
    v17.levelIcon = v8.joinBindings({
        v17.voiceState, 
        v17.level
    }):map(function(v20) --[[ Line: 62 ]]
        -- upvalues: v12 (ref), l_default_0 (ref), v17 (copy)
        local v21 = v20[1];
        local v22 = v20[2];
        if v21 == v12.VOICE_STATE.MUTED or v21 == v12.VOICE_STATE.LOCAL_MUTED then
            return l_default_0:GetIcon("Muted", v17.props.iconStyle);
        elseif v21 == v12.VOICE_STATE.CONNECTING then
            return l_default_0:GetIcon("Connecting", v17.props.iconStyle);
        elseif v21 == v12.VOICE_STATE.INACTIVE then
            return l_default_0:GetIcon("Unmuted0", v17.props.iconStyle);
        elseif v21 == v12.VOICE_STATE.TALKING then
            local v23 = math.floor(v22 * 5 + 0.5) * 20;
            return l_default_0:GetIcon("Unmuted" .. tostring(v23), v17.props.iconStyle);
        else
            return l_default_0:GetIcon("Error", v17.props.iconStyle);
        end;
    end);
end;
v14.renderWithSelectionCursor = function(v24, v25) --[[ Line: 82 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: v12 (copy), v9 (copy), v8 (copy), l_CursorKind_0 (copy)
    local v26 = true;
    if v24.props.voiceState ~= v12.VOICE_STATE.ERROR then
        v26 = v24.props.voiceState == v12.VOICE_STATE.HIDDEN;
    end;
    if v24.props.hideOnError and (not v24.props.voiceState or v26) then
        return nil;
    else
        local v27 = v24.props.voiceState == v12.VOICE_STATE.LOCAL_MUTED and 0.5 or 0;
        if v24.props.iconTransparency then
            local l_v27_0 = v27;
            v27 = if v9.isBinding(v24.props.iconTransparency) then v24.props.iconTransparency:map(function(v29) --[[ Line: 94 ]]
                -- upvalues: l_v27_0 (copy)
                return 1 - (1 - v29) * (1 - l_v27_0);
            end) else 1 - (1 - v24.props.iconTransparency) * (1 - l_v27_0);
        end;
        return v8.createElement("ImageButton", {
            Size = v24.props.size or UDim2.fromOffset(28, 28), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Image = v24.levelIcon, 
            ImageTransparency = v27, 
            SelectionImageObject = v25(l_CursorKind_0.RoundedRectNoInset), 
            [v8.Event.Activated] = v24.props.onClicked
        });
    end;
end;
v14.render = function(v30) --[[ Line: 113 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v31) --[[ Line: 114 ]]
        -- upvalues: v30 (copy)
        return v30:renderWithSelectionCursor(v31);
    end);
end;
v14.didUpdate = function(v32, v33, _) --[[ Line: 119 ]] --[[ Name: didUpdate ]]
    -- upvalues: v7 (copy)
    v7:trace("Voice state updated to {} for ...{}", v32.props.voiceState, (string.sub(tostring(v32.props.userId), -4)));
    if v33.voiceState ~= v32.props.voiceState then
        v32.updateVoiceState(v32.props.voiceState);
    end;
end;
v14.willUnmount = function(v35) --[[ Line: 126 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_RunService_0 (copy)
    pcall(function() --[[ Line: 127 ]]
        -- upvalues: l_RunService_0 (ref), v35 (copy)
        l_RunService_0:UnbindFromRenderStep(v35.renderStepName);
    end);
end;
return v10.connect(function(v36, v37) --[[ Line: 132 ]] --[[ Name: mapStateToProps ]]
    return {
        voiceState = v36.voiceState[v37.userId]
    };
end)(v14);