local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v1 = require(l_Parent_0.ExpChatShared).Logger:new("ExpChat/" .. script.Name);
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local v4 = require(l_Parent_0.UIBlox);
local l_withSelectionCursorProvider_0 = v4.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("BubbleChat");
local v8 = require(l_script_FirstAncestor_0.Helpers.getVoiceIndicatorIcon);
local v9 = require(l_Parent_0.Roact);
local v10 = require(l_Parent_0.RoactRodux);
local l_GetFFlagExpChatUseVoiceParticipantsStore_0 = require(l_Parent_0.SharedFlags).GetFFlagExpChatUseVoiceParticipantsStore;
local v12 = v9.PureComponent:extend("VoiceIndicator");
v12.defaultProps = {};
v12.init = function(v13) --[[ Line: 48 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy), l_HttpService_0 (copy), l_RunService_0 (copy), v8 (copy)
    local v14, v15 = v9.createBinding(0);
    v13.level = v14;
    v13.updateLevel = v15;
    v14, v15 = v9.createBinding(v13.props.voiceState);
    v13.voiceState = v14;
    v13.updateVoiceState = v15;
    v13.renderStepName = l_HttpService_0:GenerateGUID();
    l_RunService_0:BindToRenderStep(v13.renderStepName, 1, function() --[[ Line: 55 ]]
        -- upvalues: v13 (copy)
        v13.updateLevel(math.random());
    end);
    v13.levelIcon = v9.joinBindings({
        v13.voiceState, 
        v13.level
    }):map(function(v16) --[[ Line: 59 ]]
        -- upvalues: v8 (ref), v13 (copy)
        local v17 = v16[1];
        local v18 = v16[2];
        return v8(v13.props.getIcon, v17, v18, v13.props.iconStyle);
    end);
    v13.onClicked = function() --[[ Line: 66 ]]
        -- upvalues: v13 (copy)
        if v13.props.onClicked and v13.props.userId then
            v13.props.onClicked(v13.props.userId);
        end;
    end;
end;
v12.renderWithSelectionCursor = function(v19, v20) --[[ Line: 73 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: v9 (copy), l_CursorKind_0 (copy)
    local v21 = true;
    if v19.props.voiceState ~= "Error" then
        v21 = v19.props.voiceState == "Hidden";
    end;
    if v19.props.hideOnError and (not v19.props.voiceState or v21) then
        return nil;
    else
        local v22 = v19.props.voiceState == "LOCAL_MUTED" and 0.5 or 0;
        if v19.props.iconTransparency then
            local l_v22_0 = v22;
            v22 = if type(v19.props.iconTransparency) ~= "number" then v19.props.iconTransparency:map(function(v24) --[[ Line: 84 ]]
                -- upvalues: l_v22_0 (copy)
                return 1 - (1 - v24) * (1 - l_v22_0);
            end) else 1 - (1 - v19.props.iconTransparency) * (1 - l_v22_0);
        end;
        return v9.createElement("ImageButton", {
            Size = v19.props.size or UDim2.fromOffset(28, 28), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Image = v19.levelIcon, 
            ImageTransparency = v22, 
            SelectionImageObject = v20(l_CursorKind_0.RoundedRectNoInset), 
            [v9.Event.Activated] = v19.onClicked
        });
    end;
end;
v12.render = function(v25) --[[ Line: 103 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v26) --[[ Line: 104 ]]
        -- upvalues: v25 (copy)
        return v25:renderWithSelectionCursor(v26);
    end);
end;
v12.didUpdate = function(v27, v28, _) --[[ Line: 109 ]] --[[ Name: didUpdate ]]
    -- upvalues: v1 (copy)
    v1:trace("Voice state updated to {} for ...{}", v27.props.voiceState, (string.sub(tostring(v27.props.userId), -4)));
    if v28.voiceState ~= v27.props.voiceState then
        v27.updateVoiceState(v27.props.voiceState);
    end;
end;
v12.willUnmount = function(v30) --[[ Line: 121 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_RunService_0 (copy)
    pcall(function() --[[ Line: 122 ]]
        -- upvalues: l_RunService_0 (ref), v30 (copy)
        l_RunService_0:UnbindFromRenderStep(v30.renderStepName);
    end);
end;
local function v33(v31, v32) --[[ Line: 127 ]] --[[ Name: mapStateToProps ]]
    return {
        voiceState = v31.Voice.participants[v32.userId]
    };
end;
if l_GetFFlagExpChatUseVoiceParticipantsStore_0() then
    return v12;
else
    return v10.connect(v33)(v12);
end;