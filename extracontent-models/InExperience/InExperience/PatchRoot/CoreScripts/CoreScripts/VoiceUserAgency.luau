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
local v17 = require(l_CorePackages_0.Packages.BuilderIcons);
local _ = v17.Migration;
local v19 = require(l_Modules_0.Flags.GetFFlagVoiceUserAgencyEnableIXP);
local v20 = require(l_Modules_0.Flags.GetFStringVoiceUserAgencyIXPLayerName);
local l_FFlagManuallyMigrateDeprecatedIconUsage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagManuallyMigrateDeprecatedIconUsage;
local v22 = game:DefineFastInt("VoiceUserAgencyAlertInitTimeOffset", 5);
local v23 = game:DefineFastInt("VoiceUserAgencyAlertStartTimeOffset", 3);
local v24 = game:DefineFastInt("VoiceUserAgencyAlertTimerDuration", 7);
local v25 = game:DefineFastFlag("VoiceUserAgencyAddMuteDecisionAnalytics", false);
local v26 = game:DefineFastFlag("VoiceUserAgencyAdjustDescriptionText", false);
local v27 = v13:FormatByKey("Feature.SettingsHub.Prompt.VoiceUserAgency.Remember");
local v28 = tostring(game.PlaceId);
local l_UserId_0 = l_Players_0.LocalPlayer.UserId;
local function v34() --[[ Line: 48 ]] --[[ Name: getAppStorageTable ]]
    -- upvalues: l_AppStorageService_0 (copy), l_HttpService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 49 ]]
        -- upvalues: l_AppStorageService_0 (ref)
        return l_AppStorageService_0:GetItem("VoiceUserAgencyPlaceIds");
    end);
    if l_status_0 then
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 53 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_0 (copy)
            return l_HttpService_0:JSONDecode(l_result_0);
        end);
        if l_status_1 then
            return l_result_1;
        end;
    end;
    return {};
end;
local v35 = false;
local _ = function() --[[ Line: 64 ]] --[[ Name: resetHistory ]]
    -- upvalues: v35 (ref), v34 (copy), v28 (copy), l_AppStorageService_0 (copy), l_HttpService_0 (copy), v12 (copy)
    if v35 then
        return;
    else
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 68 ]]
            -- upvalues: v34 (ref), v28 (ref), l_AppStorageService_0 (ref), l_HttpService_0 (ref), v35 (ref)
            local v36 = v34();
            for v37, _ in v36 do
                if v37 == v28 then
                    v36[v37] = nil;
                    l_AppStorageService_0:SetItem("VoiceUserAgencyPlaceIds", l_HttpService_0:JSONEncode(v36));
                    l_AppStorageService_0:Flush();
                    v35 = true;
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
local function v53() --[[ Line: 85 ]] --[[ Name: bindResetHistory ]]
    -- upvalues: l_default_0 (copy), v35 (ref), v34 (copy), v28 (copy), l_AppStorageService_0 (copy), l_HttpService_0 (copy), v12 (copy)
    l_default_0.muteAllChanged.Event:Connect(function(_) --[[ Line: 87 ]]
        -- upvalues: v35 (ref), v34 (ref), v28 (ref), l_AppStorageService_0 (ref), l_HttpService_0 (ref), v12 (ref)
        if v35 then
            return;
        else
            local l_status_3, l_result_3 = pcall(function() --[[ Line: 68 ]]
                -- upvalues: v34 (ref), v28 (ref), l_AppStorageService_0 (ref), l_HttpService_0 (ref), v35 (ref)
                local v43 = v34();
                for v44, _ in v43 do
                    if v44 == v28 then
                        v43[v44] = nil;
                        l_AppStorageService_0:SetItem("VoiceUserAgencyPlaceIds", l_HttpService_0:JSONEncode(v43));
                        l_AppStorageService_0:Flush();
                        v35 = true;
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
    l_default_0.mutedNonFriends.Event:Connect(function() --[[ Line: 90 ]]
        -- upvalues: v35 (ref), v34 (ref), v28 (ref), l_AppStorageService_0 (ref), l_HttpService_0 (ref), v12 (ref)
        if v35 then
            return;
        else
            local l_status_4, l_result_4 = pcall(function() --[[ Line: 68 ]]
                -- upvalues: v34 (ref), v28 (ref), l_AppStorageService_0 (ref), l_HttpService_0 (ref), v35 (ref)
                local v48 = v34();
                for v49, _ in v48 do
                    if v49 == v28 then
                        v48[v49] = nil;
                        l_AppStorageService_0:SetItem("VoiceUserAgencyPlaceIds", l_HttpService_0:JSONEncode(v48));
                        l_AppStorageService_0:Flush();
                        v35 = true;
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
local function v58(v54, v55, v56) --[[ Line: 95 ]] --[[ Name: removeUserAgencyPrompt ]]
    -- upvalues: v34 (copy), v28 (copy), l_AppStorageService_0 (copy), l_HttpService_0 (copy), v25 (copy), l_RbxAnalyticsService_0 (copy), l_UserId_0 (copy), l_default_0 (copy), v53 (copy)
    v54:Destroy();
    if v55 then
        local v57 = v34();
        v57[v28] = v56;
        l_AppStorageService_0:SetItem("VoiceUserAgencyPlaceIds", l_HttpService_0:JSONEncode(v57));
        l_AppStorageService_0:Flush();
    end;
    if v25 then
        l_RbxAnalyticsService_0:SendEventDeferred("client", "voiceChat", "SelectJoinWithVoice", {
            userId = l_UserId_0, 
            voiceSessionId = l_default_0:getService():GetSessionId(), 
            voiceExperienceId = l_default_0:getService():GetVoiceExperienceId(), 
            isMuteAll = v56, 
            isRememberSetting = v55
        });
    end;
    l_default_0:FireUserAgencySelectedEvent(v56);
    v53();
end;
local function v80() --[[ Line: 120 ]] --[[ Name: showUserAgencyPrompt ]]
    -- upvalues: v19 (copy), l_IXPServiceWrapper_0 (copy), v20 (copy), v34 (copy), v28 (copy), v12 (copy), l_default_0 (copy), v15 (copy), v53 (copy), l_RbxAnalyticsService_0 (copy), l_UserId_0 (copy), l_CoreGui_0 (copy), l_Create_0 (copy), l_AppFonts_0 (copy), v13 (copy), v58 (copy), v24 (copy), l_TweenService_0 (copy), l_FFlagManuallyMigrateDeprecatedIconUsage_0 (copy), v17 (copy), l_Images_0 (copy), v27 (copy), l_TextService_0 (copy), v26 (copy), v23 (copy)
    local v59 = false;
    local v60 = false;
    if v19() then
        local l_status_5, l_result_5 = pcall(function() --[[ Line: 126 ]]
            -- upvalues: l_IXPServiceWrapper_0 (ref), v20 (ref)
            return l_IXPServiceWrapper_0:GetLayerData(v20());
        end);
        if not l_status_5 then
            return;
        elseif not l_result_5 then
            return;
        elseif not l_result_5.VoiceUserAgencyEnabled then
            return;
        end;
    end;
    local l_status_6, l_result_6 = pcall(function() --[[ Line: 145 ]]
        -- upvalues: v34 (ref), v28 (ref)
        local v63 = v34();
        for v64, v65 in pairs(v63) do
            if v64 == v28 and v65 ~= nil then
                return v65;
            end;
        end;
    end);
    if not l_status_6 then
        v12:trace(l_result_6);
        return;
    elseif l_result_6 ~= nil then
        l_default_0:MuteAll(l_result_6, v15.VOICE_CONTEXT_TYPE.USER_AGENCY);
        l_default_0:FireUserAgencySelectedEvent(l_result_6);
        v53();
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
        local v69 = l_Create_0("TextButton")({
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
        v69.Activated:Connect(function() --[[ Line: 200 ]]
            -- upvalues: v59 (ref), l_default_0 (ref), v15 (ref), v58 (ref), l_ScreenGui_0 (copy), v60 (ref)
            v59 = true;
            l_default_0:MuteAll(v59, v15.VOICE_CONTEXT_TYPE.USER_AGENCY);
            v58(l_ScreenGui_0, v60, v59);
        end);
        local v70 = l_Create_0("TextButton")({
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
        v70.Activated:Connect(function() --[[ Line: 221 ]]
            -- upvalues: v59 (ref), l_default_0 (ref), v15 (ref), v58 (ref), l_ScreenGui_0 (copy), v60 (ref)
            v59 = false;
            l_default_0:MuteAll(v59, v15.VOICE_CONTEXT_TYPE.USER_AGENCY);
            v58(l_ScreenGui_0, v60, v59);
        end);
        local v71 = l_Create_0("Frame")({
            Name = "TimerBar", 
            BorderSizePixel = 0, 
            Size = UDim2.new(0, 0, 1, 0), 
            BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
            BackgroundTransparency = 0
        });
        local v72 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v73 = TweenInfo.new(v24, Enum.EasingStyle.Sine);
        local v74 = l_TweenService_0:Create(v71, v73, v72);
        v74.Completed:Connect(function(v75) --[[ Line: 238 ]]
            -- upvalues: v58 (ref), l_ScreenGui_0 (copy), v60 (ref), v59 (ref)
            if v75 == Enum.PlaybackState.Completed then
                v58(l_ScreenGui_0, v60, v59);
            end;
        end);
        local v76 = if l_FFlagManuallyMigrateDeprecatedIconUsage_0 then l_Create_0("TextLabel")({
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Text = v17.Migration["icons/status/success_small"].name, 
            FontFace = v17.Font[v17.Migration["icons/status/success_small"].variant]
        }) else l_Create_0("ImageLabel")({
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Image = l_Images_0["icons/status/success_small"].Image, 
            ImageRectOffset = l_Images_0["icons/status/success_small"].ImageRectOffset, 
            ImageRectSize = l_Images_0["icons/status/success_small"].ImageRectSize
        });
        local v77 = l_Create_0("ImageButton")({
            Size = UDim2.new(0, 14, 0, 14), 
            BackgroundTransparency = 1, 
            Image = l_Images_0["squircles/hollow"].Image, 
            ImageRectOffset = l_Images_0["squircles/hollow"].ImageRectOffset, 
            ImageRectSize = l_Images_0["squircles/hollow"].ImageRectSize
        });
        v76.Visible = false;
        v76.Parent = v77;
        v77.Activated:Connect(function() --[[ Line: 267 ]]
            -- upvalues: v76 (copy), v60 (ref), v74 (copy), l_RbxAnalyticsService_0 (ref), l_UserId_0 (ref), l_default_0 (ref)
            v76.Visible = not v76.Visible;
            v60 = v76.Visible;
            v74:Pause();
            l_RbxAnalyticsService_0:SendEventDeferred("client", "voiceChat", "RememberJoinWithVoice", {
                userId = l_UserId_0, 
                voiceSessionId = l_default_0:getService():GetSessionId(), 
                voiceExperienceId = l_default_0:getService():GetVoiceExperienceId(), 
                shouldRememberStatus = v60
            });
        end);
        local v78 = l_Create_0("TextLabel")({
            Name = "CheckboxTextLabel", 
            Font = l_AppFonts_0.default:getDefault(), 
            Text = v27, 
            TextColor3 = Color3.fromRGB(190, 190, 190), 
            TextSize = 16, 
            TextWrapped = true, 
            Size = UDim2.new(0, 350, 0, 24), 
            BackgroundTransparency = 1, 
            TextTransparency = 0, 
            LayoutOrder = 2
        });
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v27, 16, l_AppFonts_0.default:getDefault(), Vector2.new(350, 24));
        v78.Size = UDim2.new(0, l_l_TextService_0_TextSize_0.X + 10, 0, 24);
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
                Text = v26 and v13:FormatByKey("Feature.SettingsHub.Prompt.VoiceUserAgency.JoinUnmuted.Description") or v13:FormatByKey("Feature.SettingsHub.VoiceUserAgency.JoinUnmuted.Description"), 
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
                v71
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
                v70, 
                v69
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
                v77, 
                v78
            })
        }).Parent = l_ScreenGui_0;
        task.delay(v23, function() --[[ Line: 408 ]]
            -- upvalues: l_RbxAnalyticsService_0 (ref), l_UserId_0 (ref), l_default_0 (ref), v74 (copy)
            l_RbxAnalyticsService_0:SendEventDeferred("client", "voiceChat", "ShowJoinWithVoice", {
                userId = l_UserId_0, 
                voiceSessionId = l_default_0:getService():GetSessionId(), 
                voiceExperienceId = l_default_0:getService():GetVoiceExperienceId()
            });
            v74:Play();
        end);
        return;
    end;
end;
task.delay(v22, function() --[[ Line: 421 ]]
    -- upvalues: l_default_0 (copy), v80 (copy), v12 (copy)
    l_default_0:asyncInit():andThen(function() --[[ Line: 423 ]]
        -- upvalues: v80 (ref)
        v80();
    end):catch(function() --[[ Line: 426 ]]
        -- upvalues: v12 (ref)
        v12:trace("VoiceChatServiceManager did not initialize for VoiceUserAgency");
    end);
end);