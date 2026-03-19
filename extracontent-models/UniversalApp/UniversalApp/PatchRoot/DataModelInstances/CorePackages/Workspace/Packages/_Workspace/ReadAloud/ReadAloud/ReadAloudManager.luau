local l_Parent_0 = script.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local l_SoundService_0 = game:GetService("SoundService");
local v5 = require(l_Parent_0.getCoreGuiAtPosition);
local v6 = require(l_Parent_0.TTSHandler);
local v7 = require(l_Parent_0.TTSHandlerState);
local v8 = require(l_Parent_0.TextUtility);
local v9 = require(l_Parent_0.Properties);
local v10 = require(l_Parent_0.highlightCoreGui);
local v11 = require(l_Parent_0.CreateLogger);
local v12 = require(l_Parent_0.getFFlagReadAloudDebugPrintouts)();
local v13 = if v12 then v11(script.Name) else nil;
local v14 = nil;
local v15 = {};
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = -1;
local v20 = {
    [Enum.UserInputType.MouseButton2] = true
};
local function _(v21) --[[ Line: 58 ]] --[[ Name: shouldInputTriggerTTS ]]
    -- upvalues: v20 (copy)
    if v20[v21.UserInputType] then
        return true;
    else
        return false;
    end;
end;
TriggerTTS = function(v23) --[[ Line: 63 ]] --[[ Name: TriggerTTS ]]
    -- upvalues: v20 (copy), v10 (copy), v17 (ref), v16 (ref), v18 (ref), v12 (copy), v13 (copy), v7 (copy), v19 (ref), v8 (copy)
    return function(v24, _) --[[ Line: 64 ]]
        -- upvalues: v20 (ref), v10 (ref), v23 (copy), v17 (ref), v16 (ref), v18 (ref), v12 (ref), v13 (ref), v7 (ref), v19 (ref), v8 (ref)
        if not (v20[v24.UserInputType] and true or false) then
            v10.highlight(v23, v17);
            return;
        else
            if v17 and v16 then
                if v18 == v17 then
                    if v12 then
                        v13:debug("Clicked previously read object------------------------");
                    end;
                    if v16.State == v7.Playing then
                        v16:Pause();
                        return;
                    elseif v16.State == v7.Idle or v16.State == v7.Paused then
                        v16:Play();
                        return;
                    elseif v16.State == v7.Loading then
                        v13:info("TTSHandler is loading, blocked input");
                        return;
                    end;
                else
                    if v12 then
                        v13:debug("Clicked new text------------------------");
                    end;
                    v19 = os.clock();
                    v18 = v17;
                    local v26 = v8.retrieveDescendantText(v17);
                    v16:SetText(v26);
                    v16:Play();
                end;
            end;
            return;
        end;
    end;
end;
local function _(v27) --[[ Line: 105 ]] --[[ Name: connectMouseOver ]]
    -- upvalues: l_RunService_0 (copy), v19 (ref), v9 (copy), l_UserInputService_0 (copy), v5 (copy), l_GuiService_0 (copy), v17 (ref), v10 (copy)
    l_RunService_0:BindToRenderStep("ReadAloudHighlight", Enum.RenderPriority.Input.Value + 1, function() --[[ Line: 109 ]]
        -- upvalues: v19 (ref), v9 (ref), l_UserInputService_0 (ref), v5 (ref), l_GuiService_0 (ref), v17 (ref), v10 (ref), v27 (copy)
        if os.clock() - v19 > v9.ReadAloudLoadCooldown and (l_UserInputService_0:GetLastInputType() == Enum.UserInputType.MouseMovement or l_UserInputService_0:GetLastInputType() == Enum.UserInputType.MouseWheel) then
            local v28 = v5(l_UserInputService_0:GetMouseLocation() - l_GuiService_0:GetGuiInset());
            if v28 ~= v17 then
                v17 = v28;
            end;
        else
            v17 = nil;
        end;
        v10.highlight(v27, v17);
    end);
end;
local function _() --[[ Line: 131 ]] --[[ Name: disconnectMouseOver ]]
    -- upvalues: l_RunService_0 (copy)
    l_RunService_0:UnbindFromRenderStep("ReadAloudHighlight");
end;
v15.Enable = function() --[[ Line: 136 ]] --[[ Name: Enable ]]
    -- upvalues: v16 (ref), v13 (copy), v10 (copy), v14 (ref), l_UserInputService_0 (copy), v6 (copy), l_SoundService_0 (copy), l_RunService_0 (copy), v19 (ref), v9 (copy), v5 (copy), l_GuiService_0 (copy), v17 (ref)
    if v16 then
        v13:warning("Attempted to enable Read Aloud, but it's already enabled!");
        return;
    else
        local v31 = v10.setUpHighlight();
        v14 = l_UserInputService_0.InputBegan:Connect(TriggerTTS(v31));
        v16 = v6.new();
        l_SoundService_0:SetSoundEnabled(true);
        l_RunService_0:BindToRenderStep("ReadAloudHighlight", Enum.RenderPriority.Input.Value + 1, function() --[[ Line: 109 ]]
            -- upvalues: v19 (ref), v9 (ref), l_UserInputService_0 (ref), v5 (ref), l_GuiService_0 (ref), v17 (ref), v10 (ref), v31 (copy)
            if os.clock() - v19 > v9.ReadAloudLoadCooldown and (l_UserInputService_0:GetLastInputType() == Enum.UserInputType.MouseMovement or l_UserInputService_0:GetLastInputType() == Enum.UserInputType.MouseWheel) then
                local v32 = v5(l_UserInputService_0:GetMouseLocation() - l_GuiService_0:GetGuiInset());
                if v32 ~= v17 then
                    v17 = v32;
                end;
            else
                v17 = nil;
            end;
            v10.highlight(v31, v17);
        end);
        return;
    end;
end;
v15.Disable = function() --[[ Line: 151 ]] --[[ Name: Disable ]]
    -- upvalues: v16 (ref), v13 (copy), v14 (ref), l_RunService_0 (copy), v10 (copy)
    if not v16 then
        v13:warning("Attempted to disable Read Aloud, but it's already disabled!");
        return;
    else
        if v14 then
            v14:Disconnect();
        end;
        v14 = nil;
        v16:CleanUp();
        v16 = nil;
        l_RunService_0:UnbindFromRenderStep("ReadAloudHighlight");
        v10.cleanUpHighlight();
        return;
    end;
end;
v15.ReadSystemTextFromKey = function(v33) --[[ Line: 167 ]] --[[ Name: ReadSystemTextFromKey ]]
    -- upvalues: v16 (ref), v13 (copy), v12 (copy)
    if not v16 then
        v13:warning("Tried to read text, but Read Aloud is not enabled!");
        return;
    else
        if v12 then
            v13:debug((("Requesting system TTS for key \"%*\""):format(v33)));
        end;
        v16:ReadSystemTextFromKey(v33);
        return;
    end;
end;
return v15;