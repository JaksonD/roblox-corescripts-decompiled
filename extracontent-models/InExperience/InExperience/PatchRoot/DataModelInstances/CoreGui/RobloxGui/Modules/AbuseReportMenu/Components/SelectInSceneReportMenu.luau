local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local l_StyledTextLabel_0 = v2.App.Text.StyledTextLabel;
local l_Button_0 = v2.App.Button.Button;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v2.App.Button.Enum.StandardButtonSize;
local l_useStyle_0 = v2.Core.Style.useStyle;
local v8 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v9 = require(l_CorePackages_0.Packages.Cryo);
local l_HighlightModeVariants_0 = require(l_CorePackages_0.Workspace.Packages.InGameAssetReporting).HighlightModeVariants;
local l_FFlagHighlightModePreciseSelectionEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagHighlightModePreciseSelectionEnabled;
local v12 = nil;
if l_FFlagHighlightModePreciseSelectionEnabled_0 then
    local l_LocalizationService_0 = game:GetService("LocalizationService");
    v12 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization.new(l_LocalizationService_0.RobloxLocaleId);
end;
local function v23(v14, v15) --[[ Line: 30 ]]
    -- upvalues: v8 (copy), l_HighlightModeVariants_0 (copy), v12 (ref), v9 (copy), v1 (copy), l_StyledTextLabel_0 (copy)
    local v16 = {
        v8:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription1"), 
        v8:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription2"), 
        v8:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription3")
    };
    if v14 ~= l_HighlightModeVariants_0.Default then
        v16 = {
            v12:Format("Feature.ReportAbuse.Label.SelectInSceneDescriptionPrecise1"), 
            v8:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription2"), 
            v8:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription3")
        };
    end;
    local v19 = v9.List.map(v16, function(v17, v18) --[[ Line: 45 ]]
        -- upvalues: v1 (ref), l_StyledTextLabel_0 (ref), v15 (copy)
        return v1.createElement(l_StyledTextLabel_0, {
            text = "\226\128\162 " .. v17, 
            fontStyle = v15.Font.Body, 
            colorStyle = v15.Theme.TextEmphasis, 
            layoutOrder = v18, 
            automaticSize = Enum.AutomaticSize.XY
        });
    end);
    local v20 = {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 30)
        })
    };
    for v21, v22 in ipairs(v19) do
        v20["Subheading" .. v21] = v22;
    end;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Position = UDim2.new(0.5, 0, 0, 0), 
        AnchorPoint = Vector2.new(0.5, 0), 
        LayoutOrder = 1
    }, v20);
end;
return function(v24) --[[ Line: 73 ]] --[[ Name: SelectInSceneReportMenu ]]
    -- upvalues: l_useStyle_0 (copy), v1 (copy), l_StyledTextLabel_0 (copy), v8 (copy), v23 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_StandardButtonSize_0 (copy)
    local v25 = l_useStyle_0();
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0)
    }, {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 30)
        }), 
        Padding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 15)
        }), 
        Title = v1.createElement(l_StyledTextLabel_0, {
            text = v8:FormatByKey("Feature.ReportAbuse.Heading.ReportUsingSelectInScene"), 
            fontStyle = v25.Font.Header1, 
            colorStyle = v25.Theme.TextEmphasis, 
            layoutOrder = 0, 
            automaticSize = Enum.AutomaticSize.XY
        }), 
        SubheadingFrame = if v24.variant then v23(v24.variant, v25) else v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Position = UDim2.new(0.5, 0, 0, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            LayoutOrder = 1
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 30)
            }), 
            Subheading1 = v1.createElement(l_StyledTextLabel_0, {
                text = "\226\128\162 " .. v8:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription1"), 
                fontStyle = v25.Font.Body, 
                colorStyle = v25.Theme.TextEmphasis, 
                layoutOrder = 0, 
                automaticSize = Enum.AutomaticSize.XY
            }), 
            Subheading2 = v1.createElement(l_StyledTextLabel_0, {
                text = "\226\128\162 " .. v8:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription2"), 
                fontStyle = v25.Font.Body, 
                colorStyle = v25.Theme.TextEmphasis, 
                layoutOrder = 1, 
                automaticSize = Enum.AutomaticSize.XY
            }), 
            Subheading3 = v1.createElement(l_StyledTextLabel_0, {
                text = "\226\128\162 " .. v8:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription3"), 
                fontStyle = v25.Font.Body, 
                colorStyle = v25.Theme.TextEmphasis, 
                layoutOrder = 2, 
                automaticSize = Enum.AutomaticSize.XY
            })
        }), 
        EnterSelectInSceneButton = v1.createElement(l_Button_0, {
            text = v8:FormatByKey("Feature.ReportAbuse.Action.EnterSceneReporting"), 
            buttonType = l_ButtonType_0.PrimarySystem, 
            standardSize = l_StandardButtonSize_0.Small, 
            layoutOrder = 2, 
            position = UDim2.new(0.5, 0, 0, 0), 
            anchorPoint = Vector2.new(0.5, 0), 
            fitContent = true, 
            onActivated = function() --[[ Line: 144 ]] --[[ Name: onActivated ]]
                -- upvalues: v24 (copy)
                local l_SafetyService_0 = game:GetService("SafetyService");
                local l_ExperienceStateCaptureService_0 = game:GetService("ExperienceStateCaptureService");
                if game:GetEngineFeature("ExperienceStateCaptureIsInBackground") then
                    local v28 = nil;
                    do
                        local l_v28_0 = v28;
                        l_v28_0 = l_ExperienceStateCaptureService_0:GetPropertyChangedSignal("IsInBackground"):Connect(function() --[[ Line: 151 ]]
                            -- upvalues: l_v28_0 (ref), l_ExperienceStateCaptureService_0 (copy), v24 (ref)
                            if not l_v28_0.Connected then
                                return;
                            else
                                if not l_ExperienceStateCaptureService_0.IsInBackground then
                                    v24.hideReportTab();
                                    l_v28_0:Disconnect();
                                end;
                                return;
                            end;
                        end);
                    end;
                end;
                l_SafetyService_0.IsCaptureModeForReport = true;
                l_ExperienceStateCaptureService_0:ToggleCaptureMode();
            end
        })
    });
end;