local l_ExperienceStateRecordingService_0 = game:GetService("ExperienceStateRecordingService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Parent_0 = script.Parent;
local v4 = require(l_Parent_0.ButtonAssets);
local v5 = require(l_Parent_0.CreateButtonsTime);
return {
    setupControl = function(v6) --[[ Line: 12 ]] --[[ Name: setupControl ]]
        -- upvalues: v4 (copy), l_ExperienceStateRecordingService_0 (copy), v5 (copy), l_ReplicatedStorage_0 (copy), l_UserInputService_0 (copy)
        v6.connections = {};
        v6.SetPlaying = function() --[[ Line: 15 ]] --[[ Name: SetPlaying ]]
            -- upvalues: v6 (copy), v4 (ref), l_ExperienceStateRecordingService_0 (ref)
            v6.state.Playing = true;
            v6.PlayButton.Image = v4.PauseButton;
            l_ExperienceStateRecordingService_0:SetPlaybackMode(Enum.ExperienceStateRecordingPlaybackMode.Playing);
        end;
        v6.SetPaused = function() --[[ Line: 22 ]] --[[ Name: SetPaused ]]
            -- upvalues: v6 (copy), v4 (ref), l_ExperienceStateRecordingService_0 (ref)
            v6.state.Playing = false;
            v6.PlayButton.Image = v4.PlayButton;
            l_ExperienceStateRecordingService_0:SetPlaybackMode(Enum.ExperienceStateRecordingPlaybackMode.Stopped);
        end;
        v6.ControlButtons = function(v7) --[[ Line: 29 ]] --[[ Name: ControlButtons ]]
            -- upvalues: v6 (copy), v5 (ref), l_ReplicatedStorage_0 (ref), l_ExperienceStateRecordingService_0 (ref)
            v6.StopButton.ImageColor3 = v5.regularColor;
            v6.StopButton:SetAttribute("useHoverColor", true);
            v6.ReverseButton.ImageColor3 = v5.regularColor;
            v6.ReverseButton:SetAttribute("useHoverColor", true);
            v6.state.Reversing = false;
            if v7 ~= v6.PlayButton then
                v6.PlayButton.ImageColor3 = v5.regularColor;
            end;
            if v7 == v6.PlayButton then
                if v6.state.Playing then
                    v6.SetPaused();
                    return;
                else
                    v6.SetPlaying();
                    return;
                end;
            elseif v7 == v6.StopButton then
                v6.StopButton:SetAttribute("useHoverColor", false);
                v6.StopButton.ImageColor3 = v5.clickColor;
                v6.LoadingOverlay.Visible = true;
                v6.LoadingLabel.Text = "Returning To Replay Browser";
                v6.state.Loading = true;
                l_ReplicatedStorage_0:WaitForChild("TeleportRequest"):FireServer();
                return;
            else
                if v7 == v6.ReverseButton then
                    v6.state.Reversing = true;
                    v6.SetPaused();
                    v6.ReverseButton:SetAttribute("useHoverColor", false);
                    v6.ReverseButton.ImageColor3 = v5.clickColor;
                    l_ExperienceStateRecordingService_0:SetPlaybackMode(Enum.ExperienceStateRecordingPlaybackMode.Rewinding);
                end;
                return;
            end;
        end;
        v6.connections.PlayListener = v6.PlayButton.MouseButton1Click:Connect(function() --[[ Line: 64 ]]
            -- upvalues: v6 (copy)
            v6.ControlButtons(v6.PlayButton);
        end);
        v6.connections.StopListener = v6.StopButton.MouseButton1Click:Connect(function() --[[ Line: 69 ]]
            -- upvalues: v6 (copy)
            v6.ControlButtons(v6.StopButton);
        end);
        v6.connections.ReverseListener = v6.ReverseButton.MouseButton1Click:Connect(function() --[[ Line: 74 ]]
            -- upvalues: v6 (copy)
            v6.ControlButtons(v6.ReverseButton);
        end);
        l_UserInputService_0.InputBegan:Connect(function(v8, _) --[[ Line: 79 ]]
            -- upvalues: v6 (copy)
            if v8.KeyCode == Enum.KeyCode.Space then
                v6.ControlButtons(v6.PlayButton);
                return;
            elseif v8.KeyCode == Enum.KeyCode.R then
                v6.ControlButtons(v6.ReverseButton);
                return;
            else
                if v8.KeyCode == Enum.KeyCode.X then
                    v6.ControlButtons(v6.StopButton);
                end;
                return;
            end;
        end);
    end
};