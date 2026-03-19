local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_TextService_0 = game:GetService("TextService");
local l_TweenService_0 = game:GetService("TweenService");
local l_Images_0 = require(l_CorePackages_0.Packages.InGameMenuDependencies).UIBlox.App.ImageSet.Images;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
local v12 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local v13 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_default_0 = require(l_Modules_0.VoiceChat.VoiceChatServiceManager).default;
local v15 = require(l_Modules_0.VoiceChat.Constants);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v17 = require(l_Modules_0.Flags.GetFFlagVoiceUserAgencyEnableIXP);
local v18 = require(l_Modules_0.Flags.GetFStringVoiceUserAgencyIXPLayerName);
local v19 = game:DefineFastInt("VoiceUserAgencyAlertInitTimeOffset", 5);
local v20 = game:DefineFastInt("VoiceUserAgencyAlertStartTimeOffset", 3);
local v21 = game:DefineFastInt("VoiceUserAgencyAlertTimerDuration", 7);
local v22 = game:DefineFastFlag("VoiceUserAgencyAddMuteDecisionAnalytics", false);
local v23 = game:DefineFastFlag("VoiceUserAgencyAdjustDescriptionText", false);
local v24 = v13:FormatByKey("Feature.SettingsHub.Prompt.VoiceUserAgency.Remember");
local v25 = tostring(game.PlaceId);
local l_UserId_0 = l_Players_0.LocalPlayer.UserId;
local function v31() --[[ Line: 44 ]] --[[ Name: getAppStorageTable ]]
    -- upvalues: l_AppStorageService_0 (copy), l_HttpService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 45 ]]
        -- upvalues: l_AppStorageService_0 (ref)
        return l_AppStorageService_0:GetItem("VoiceUserAgencyPlaceIds");
    end);
    if l_status_0 then
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 49 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_0 (copy)
            return l_HttpService_0:JSONDecode(l_result_0);
        end);
        if l_status_1 then
            return l_result_1;
        end;
    end;
    return {};
end;
local v32 = false;
local _ = function() --[[ Line: 60 ]] --[[ Name: resetHistory ]]
    -- upvalues: v32 (ref), v31 (copy), v25 (copy), l_AppStorageService_0 (copy), l_HttpService_0 (copy), v12 (copy)
    if v32 then
        return;
    else
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 64 ]]
            -- upvalues: v31 (ref), v25 (ref), l_AppStorageService_0 (ref), l_HttpService_0 (ref), v32 (ref)
            local v33 = v31();
            for v34, _ in v33 do
                if v34 == v25 then
                    v33[v34] = nil;
                    l_AppStorageService_0:SetItem("VoiceUserAgencyPlaceIds", l_HttpService_0:JSONEncode(v33));
                    l_AppStorageService_0:Flush();
                    v32 = true;
                    return;
                end;
            end;
        end);
        if not l_status_2 then
            v12:trace(l_result_2);
        end;
        return;
    end;
end;
local function v50() --[[ Line: 81 ]] --[[ Name: bindResetHistory ]]
    -- upvalues: l_default_0 (copy), v32 (ref), v31 (copy), v25 (copy), l_AppStorageService_0 (copy), l_HttpService_0 (copy), v12 (copy)
    l_default_0.muteAllChanged.Event:Connect(function(_) --[[ Line: 83 ]]
        -- upvalues: v32 (ref), v31 (ref), v25 (ref), l_AppStorageService_0 (ref), l_HttpService_0 (ref), v12 (ref)
        if v32 then
            return;
        else
            local l_status_3, l_result_3 = pcall(function() --[[ Line: 64 ]]
                -- upvalues: v31 (ref), v25 (ref), l_AppStorageService_0 (ref), l_HttpService_0 (ref), v32 (ref)
                local v40 = v31();
                for v41, _ in v40 do
                    if v41 == v25 then
                        v40[v41] = nil;
                        l_AppStorageService_0:SetItem("VoiceUserAgencyPlaceIds", l_HttpService_0:JSONEncode(v40));
                        l_AppStorageService_0:Flush();
                        v32 = true;
                        return;
                    end;
                end;
            end);
            if not l_status_3 then
                v12:trace(l_result_3);
            end;
            return;
        end;
    end);
    l_default_0.mutedNonFriends.Event:Connect(function() --[[ Line: 86 ]]
        -- upvalues: v32 (ref), v31 (ref), v25 (ref), l_AppStorageService_0 (ref), l_HttpService_0 (ref), v12 (ref)
        if v32 then
            return;
        else
            local l_status_4, l_result_4 = pcall(function() --[[ Line: 64 ]]
                -- upvalues: v31 (ref), v25 (ref), l_AppStorageService_0 (ref), l_HttpService_0 (ref), v32 (ref)
                local v45 = v31();
                for v46, _ in v45 do
                    if v46 == v25 then
                        v45[v46] = nil;
                        l_AppStorageService_0:SetItem("VoiceUserAgencyPlaceIds", l_HttpService_0:JSONEncode(v45));
                        l_AppStorageService_0:Flush();
                        v32 = true;
                        return;
                    end;
                end;
            end);
            if not l_status_4 then
                v12:trace(l_result_4);
            end;
            return;
        end;
    end);
end;
local function v55(v51, v52, v53) --[[ Line: 91 ]] --[[ Name: removeUserAgencyPrompt ]]
    -- upvalues: v31 (copy), v25 (copy), l_AppStorageService_0 (copy), l_HttpService_0 (copy), v22 (copy), l_RbxAnalyticsService_0 (copy), l_UserId_0 (copy), l_default_0 (copy), v50 (copy)
    v51:Destroy();
    if v52 then
        local v54 = v31();
        v54[v25] = v53;
        l_AppStorageService_0:SetItem("VoiceUserAgencyPlaceIds", l_HttpService_0:JSONEncode(v54));
        l_AppStorageService_0:Flush();
    end;
    if v22 then
        l_RbxAnalyticsService_0:SendEventDeferred("client", "voiceChat", "SelectJoinWithVoice", {
            userId = l_UserId_0, 
            voiceSessionId = l_default_0:getService():GetSessionId(), 
            voiceExperienceId = l_default_0:getService():GetVoiceExperienceId(), 
            isMuteAll = v53, 
            isRememberSetting = v52
        });
    end;
    l_default_0:FireUserAgencySelectedEvent(v53);
    v50();
end;
local function v77() --[[ Line: 116 ]] --[[ Name: showUserAgencyPrompt ]]
    -- upvalues: v17 (copy), l_IXPServiceWrapper_0 (copy), v18 (copy), v31 (copy), v25 (copy), v12 (copy), l_default_0 (copy), v15 (copy), v50 (copy), l_RbxAnalyticsService_0 (copy), l_UserId_0 (copy), l_CoreGui_0 (copy), l_Create_0 (copy), l_AppFonts_0 (copy), v13 (copy), v55 (copy), v21 (copy), l_TweenService_0 (copy), l_Images_0 (copy), v24 (copy), l_TextService_0 (copy), v23 (copy), v20 (copy)
    local v56 = false;
    local v57 = false;
    if v17() then
        local l_status_5, l_result_5 = pcall(function() --[[ Line: 122 ]]
            -- upvalues: l_IXPServiceWrapper_0 (ref), v18 (ref)
            return l_IXPServiceWrapper_0:GetLayerData(v18());
        end);
        if not l_status_5 then
            return;
        elseif not l_result_5 then
            return;
        elseif not l_result_5.VoiceUserAgencyEnabled then
            return;
        end;
    end;
    local l_status_6, l_result_6 = pcall(function() --[[ Line: 141 ]]
        -- upvalues: v31 (ref), v25 (ref)
        local v60 = v31();
        for v61, v62 in pairs(v60) do
            if v61 == v25 and v62 ~= nil then
                return v62;
            end;
        end;
    end);
    if not l_status_6 then
        v12:trace(l_result_6);
        return;
    elseif l_result_6 ~= nil then
        l_default_0:MuteAll(l_result_6, v15.VOICE_CONTEXT_TYPE.USER_AGENCY);
        l_default_0:FireUserAgencySelectedEvent(l_result_6);
        v50();
        l_RbxAnalyticsService_0:SendEventDeferred("client", "voiceChat", "JoinWithVoice", {
            userId = l_UserId_0, 
            voiceSessionId = l_default_0:getService():GetSessionId(), 
            voiceExperienceId = l_default_0:getService():GetVoiceExperienceId(), 
            isMutedAll = l_result_6
        });
        return;
    else
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.Name = "VoiceUserAgency";
        l_ScreenGui_0.ResetOnSpawn = false;
        l_ScreenGui_0.DisplayOrder = -1;
        l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
        l_ScreenGui_0.Parent = l_CoreGui_0;
        local v66 = l_Create_0("TextButton")({
            Name = "MuteAllButton", 
            BorderSizePixel = 0, 
            Size = UDim2.new(0.5, -6, 0, 36), 
            Font = l_AppFonts_0.default:getDefault(), 
            Text = v13:FormatByKey("Feature.SettingsHub.Prompt.VoiceUserAgency.JoinMuted"), 
            TextSize = 16, 
            BackgroundColor3 = Color3.fromRGB(57, 59, 61), 
            TextColor3 = Color3.fromRGB(178, 178, 178), 
            LayoutOrder = 1; 
            l_Create_0("UICorner")({
                CornerRadius = UDim.new(0, 8)
            }), 
            l_Create_0("UIStroke")({
                Thickness = 1, 
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                Color = Color3.fromRGB(178, 178, 178)
            })
        });
        v66.Activated:Connect(function() --[[ Line: 196 ]]
            -- upvalues: v56 (ref), l_default_0 (ref), v15 (ref), v55 (ref), l_ScreenGui_0 (copy), v57 (ref)
            v56 = true;
            l_default_0:MuteAll(v56, v15.VOICE_CONTEXT_TYPE.USER_AGENCY);
            v55(l_ScreenGui_0, v57, v56);
        end);
        local v67 = l_Create_0("TextButton")({
            Name = "UnmuteAllButton", 
            BorderSizePixel = 0, 
            Size = UDim2.new(0.5, -6, 0, 36), 
            Font = l_AppFonts_0.default:getDefault(), 
            Text = v13:FormatByKey("Feature.SettingsHub.Prompt.VoiceUserAgency.JoinUnmuted"), 
            TextSize = 16, 
            BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
            TextColor3 = Color3.fromRGB(57, 59, 61), 
            LayoutOrder = 2; 
            l_Create_0("UICorner")({
                CornerRadius = UDim.new(0, 8)
            })
        });
        v67.Activated:Connect(function() --[[ Line: 217 ]]
            -- upvalues: v56 (ref), l_default_0 (ref), v15 (ref), v55 (ref), l_ScreenGui_0 (copy), v57 (ref)
            v56 = false;
            l_default_0:MuteAll(v56, v15.VOICE_CONTEXT_TYPE.USER_AGENCY);
            v55(l_ScreenGui_0, v57, v56);
        end);
        local v68 = l_Create_0("Frame")({
            Name = "TimerBar", 
            BorderSizePixel = 0, 
            Size = UDim2.new(0, 0, 1, 0), 
            BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
            BackgroundTransparency = 0
        });
        local v69 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v70 = TweenInfo.new(v21, Enum.EasingStyle.Sine);
        local v71 = l_TweenService_0:Create(v68, v70, v69);
        v71.Completed:Connect(function(v72) --[[ Line: 234 ]]
            -- upvalues: v55 (ref), l_ScreenGui_0 (copy), v57 (ref), v56 (ref)
            if v72 == Enum.PlaybackState.Completed then
                v55(l_ScreenGui_0, v57, v56);
            end;
        end);
        local v73 = l_Create_0("ImageLabel")({
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Image = l_Images_0["icons/status/success_small"].Image, 
            ImageRectOffset = l_Images_0["icons/status/success_small"].ImageRectOffset, 
            ImageRectSize = l_Images_0["icons/status/success_small"].ImageRectSize
        });
        local v74 = l_Create_0("ImageButton")({
            Size = UDim2.new(0, 14, 0, 14), 
            BackgroundTransparency = 1, 
            Image = l_Images_0["squircles/hollow"].Image, 
            ImageRectOffset = l_Images_0["squircles/hollow"].ImageRectOffset, 
            ImageRectSize = l_Images_0["squircles/hollow"].ImageRectSize
        });
        v73.Visible = false;
        v73.Parent = v74;
        v74.Activated:Connect(function() --[[ Line: 256 ]]
            -- upvalues: v73 (copy), v57 (ref), v71 (copy), l_RbxAnalyticsService_0 (ref), l_UserId_0 (ref), l_default_0 (ref)
            v73.Visible = not v73.Visible;
            v57 = v73.Visible;
            v71:Pause();
            l_RbxAnalyticsService_0:SendEventDeferred("client", "voiceChat", "RememberJoinWithVoice", {
                userId = l_UserId_0, 
                voiceSessionId = l_default_0:getService():GetSessionId(), 
                voiceExperienceId = l_default_0:getService():GetVoiceExperienceId(), 
                shouldRememberStatus = v57
            });
        end);
        local v75 = l_Create_0("TextLabel")({
            Name = "CheckboxTextLabel", 
            Font = l_AppFonts_0.default:getDefault(), 
            Text = v24, 
            TextColor3 = Color3.fromRGB(190, 190, 190), 
            TextSize = 16, 
            TextWrapped = true, 
            Size = UDim2.new(0, 350, 0, 24), 
            BackgroundTransparency = 1, 
            TextTransparency = 0, 
            LayoutOrder = 2
        });
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v24, 16, l_AppFonts_0.default:getDefault(), Vector2.new(350, 24));
        v75.Size = UDim2.new(0, l_l_TextService_0_TextSize_0.X + 10, 0, 24);
        l_Create_0("Frame")({
            Name = "VoiceUserAgencyFrame", 
            AnchorPoint = Vector2.new(0.5, 0), 
            Size = UDim2.new(0.9, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0, 4), 
            BackgroundColor3 = Color3.fromRGB(57, 59, 61), 
            BorderSizePixel = 0; 
            l_Create_0("UICorner")({
                CornerRadius = UDim.new(0, 8)
            }), 
            l_Create_0("UISizeConstraint")({
                MaxSize = Vector2.new(400, 216)
            }), 
            l_Create_0("UIPadding")({
                PaddingTop = UDim.new(0, 24), 
                PaddingLeft = UDim.new(0, 24), 
                PaddingRight = UDim.new(0, 24), 
                PaddingBottom = UDim.new(0, 24)
            }), 
            l_Create_0("UIListLayout")({
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            l_Create_0("TextLabel")({
                Name = "Title", 
                Font = l_AppFonts_0.default:getBold(), 
                Text = v13:FormatByKey("Feature.SettingsHub.Prompt.VoiceUserAgency.JoinUnmuted.Title"), 
                TextSize = 20, 
                TextWrapped = true, 
                Size = UDim2.new(1, 0, 0, 22), 
                BackgroundTransparency = 1, 
                TextColor3 = Color3.fromRGB(255, 255, 255), 
                TextTransparency = 0, 
                LayoutOrder = 1
            }), 
            l_Create_0("TextLabel")({
                Name = "Lower", 
                Font = l_AppFonts_0.default:getDefault(), 
                Text = v23 and v13:FormatByKey("Feature.SettingsHub.Prompt.VoiceUserAgency.JoinUnmuted.Description") or v13:FormatByKey("Feature.SettingsHub.VoiceUserAgency.JoinUnmuted.Description"), 
                TextColor3 = Color3.fromRGB(190, 190, 190), 
                TextSize = 16, 
                TextWrapped = true, 
                Size = UDim2.new(1, 0, 0, 60), 
                BackgroundTransparency = 1, 
                TextTransparency = 0, 
                LayoutOrder = 2
            }), 
            l_Create_0("Frame")({
                Name = "TimerFrame", 
                BorderSizePixel = 0, 
                BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
                Size = UDim2.new(1, 48, 0, 3), 
                BackgroundTransparency = 0, 
                LayoutOrder = 3; 
                v68
            }), 
            l_Create_0("Frame")({
                Name = "ButtonsContainer", 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 62), 
                BackgroundTransparency = 1, 
                LayoutOrder = 4; 
                l_Create_0("UIListLayout")({
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 12)
                }), 
                v67, 
                v66
            }), 
            l_Create_0("Frame")({
                Name = "CheckboxContainer", 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 28), 
                BackgroundTransparency = 1, 
                LayoutOrder = 5; 
                l_Create_0("UIListLayout")({
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 8)
                }), 
                v74, 
                v75
            })
        }).Parent = l_ScreenGui_0;
        task.delay(v20, function() --[[ Line: 397 ]]
            -- upvalues: l_RbxAnalyticsService_0 (ref), l_UserId_0 (ref), l_default_0 (ref), v71 (copy)
            l_RbxAnalyticsService_0:SendEventDeferred("client", "voiceChat", "ShowJoinWithVoice", {
                userId = l_UserId_0, 
                voiceSessionId = l_default_0:getService():GetSessionId(), 
                voiceExperienceId = l_default_0:getService():GetVoiceExperienceId()
            });
            v71:Play();
        end);
        return;
    end;
end;
task.delay(v19, function() --[[ Line: 410 ]]
    -- upvalues: l_default_0 (copy), v77 (copy), v12 (copy)
    l_default_0:asyncInit():andThen(function() --[[ Line: 412 ]]
        -- upvalues: v77 (ref)
        v77();
    end):catch(function() --[[ Line: 415 ]]
        -- upvalues: v12 (ref)
        v12:trace("VoiceChatServiceManager did not initialize for VoiceUserAgency");
    end);
end);