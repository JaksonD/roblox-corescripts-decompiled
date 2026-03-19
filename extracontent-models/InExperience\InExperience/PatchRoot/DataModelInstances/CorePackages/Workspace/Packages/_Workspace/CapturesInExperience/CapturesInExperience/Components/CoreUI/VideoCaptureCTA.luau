local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local v3 = require(l_Parent_1.Localization);
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.UIBlox);
local v6 = require(l_Parent_0.Analytics.useAnalytics);
local l_useLocalization_0 = v3.Hooks.useLocalization;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_Button_0 = v5.App.Button.Button;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local v11 = require(l_Parent_0.Analytics.EventNames);
local v12 = game:DefineFastFlag("CapturesAddLegacyVideoRecordingLogging_v2", false);
return function(v13) --[[ Line: 32 ]]
    -- upvalues: v6 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v4 (copy), v12 (copy), v11 (copy), l_CoreGui_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local v14 = v6();
    local v15 = l_useStyle_0();
    local v16 = l_useLocalization_0({
        videoCTATitle = "Feature.Captures.Title.VideoCTA", 
        videoEducationalText = "Feature.Captures.Label.VideoEducationalText", 
        startRecording = "Feature.Captures.Control.StartRecordingVideo", 
        stopRecording = "Feature.Captures.Control.StopRecordingVideo"
    });
    local v17, v18 = v4.useState(false);
    local v19 = v4.useRef(nil);
    v4.useEffect(function() --[[ Line: 46 ]]
        -- upvalues: v12 (ref), v19 (copy), v14 (copy), v11 (ref), v18 (copy)
        local v20 = nil;
        local l_FirstChild_0 = settings():FindFirstChild("Game Options");
        if l_FirstChild_0 then
            v20 = l_FirstChild_0.VideoRecordingChangeRequest:connect(function(v22) --[[ Line: 50 ]]
                -- upvalues: v12 (ref), v19 (ref), v14 (ref), v11 (ref), v18 (ref)
                if v12 then
                    if v22 then
                        v19.current = os.clock();
                        v14.fireEvent(v11.CapturesLegacyVideoRecordBeginSignalFired);
                    else
                        if v19.current then
                            local v23 = os.clock() - v19.current;
                            v14.fireEvent(v11.CapturesLegacyVideoRecordingDuration, {
                                statValue = v23
                            });
                        end;
                        v14.fireEvent(v11.CapturesLegacyVideoRecordEndSignalFired);
                    end;
                end;
                v18(v22);
            end);
        end;
        return function() --[[ Line: 70 ]]
            -- upvalues: v20 (ref)
            if v20 then
                v20:disconnect();
            end;
        end;
    end, {
        v14.fireEvent
    });
    local v24 = v4.useCallback(function() --[[ Line: 77 ]]
        -- upvalues: v17 (copy), v13 (copy), v14 (copy), v11 (ref), l_CoreGui_0 (ref)
        if not v17 then
            v13.closeSettingsMenu();
            v14.fireEvent(v11.CapturesMigratedLegacyVideoRecordActivated);
        else
            v14.fireEvent(v11.CapturesMigratedLegacyVideoRecordDeactivated);
        end;
        l_CoreGui_0:ToggleRecording();
    end, {
        v14.fireEvent, 
        v17, 
        v13.closeSettingsMenu
    });
    local l_Color_0 = v15.Theme.BackgroundDefault.Color;
    local l_Transparency_0 = v15.Theme.BackgroundDefault.Transparency;
    local l_Color_1 = v15.Theme.TextDefault.Color;
    local l_Font_0 = v15.Font.CaptionBody.Font;
    local v29 = v15.Font.BaseSize * v15.Font.CaptionBody.RelativeSize;
    local l_Color_2 = v15.Theme.TextEmphasis.Color;
    local l_Font_1 = v15.Font.Header2.Font;
    local v32 = v15.Font.BaseSize * v15.Font.Header2.RelativeSize;
    return v4.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor3 = l_Color_0, 
        BackgroundTransparency = l_Transparency_0, 
        BorderSizePixel = 0, 
        LayoutOrder = 3, 
        Size = UDim2.fromScale(1, 0)
    }, {
        TextFrame = v4.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(0.7, 0)
        }, {
            Layout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            Title = v4.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = l_Font_1, 
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, 30), 
                Text = v16.videoCTATitle, 
                TextColor3 = l_Color_2, 
                TextSize = v32, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            EducationalLabel = v4.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = l_Font_0, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 40), 
                Text = v16.videoEducationalText, 
                TextColor3 = l_Color_1, 
                TextSize = v29, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        }), 
        CapturesToggleFrame = v4.createElement("Frame", {
            AnchorPoint = Vector2.new(1, 0.5), 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(1, 0.5), 
            Size = UDim2.fromOffset(224, 44)
        }, {
            RecordButton = v4.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.Secondary, 
                onActivated = v24, 
                size = UDim2.fromScale(1, 1), 
                text = if v17 then v16.stopRecording else v16.startRecording
            })
        })
    });
end;