local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_VRService_0 = game:GetService("VRService");
local l_GamepadService_0 = game:GetService("GamepadService");
local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local v6 = require(l_CorePackages_0.Packages.Roact);
local v7 = require(l_CorePackages_0.Packages.RoactRodux);
local v8 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.withStyle;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local _ = require(l_RobloxGui_0.Modules.TenFootInterface);
local _ = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
local _ = require(l_RobloxGui_0.Modules.InGameMenuConstants);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v15 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v18 = v6.PureComponent:extend("MenuIcon");
local v19 = require(l_RobloxGui_0.Modules.Flags.GetFStringVoiceBetaBadgeLearnMore);
local v20 = require(l_RobloxGui_0.Modules.Flags.GetFFlagBetaBadgeLearnMoreLinkFormview);
local l_Parent_0 = script.Parent.Parent.Parent;
local v22 = require(l_Parent_0.Actions.SetKeepOutArea);
local v23 = require(l_Parent_0.Actions.RemoveKeepOutArea);
local v24 = require(l_Parent_0.Constants);
local v25 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon);
local l_FFlagTopBarSignalizeKeepOutAreas_0 = v25.Flags.FFlagTopBarSignalizeKeepOutAreas;
local l_Chrome_0 = l_Parent_0.Parent.Chrome;
local _ = if require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled() then require(l_Chrome_0.Service) else nil;
v18.validateProps = v8.strictInterface({
    layoutOrder = v8.integer, 
    Analytics = v8.table, 
    setKeepOutArea = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else v8.optional(v8.callback), 
    removeKeepOutArea = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else v8.optional(v8.callback)
});
local v29 = {
    FullScreen = 0, 
    FormSheet = 2
};
local v30 = UDim2.fromOffset(31, 11);
local v31 = UDim.new(0, 12);
local v32 = UDim2.fromOffset(330, 185);
local v33 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local function v34() --[[ Line: 62 ]]

end;
openWebview = function(v35) --[[ Line: 67 ]] --[[ Name: openWebview ]]
    -- upvalues: l_HttpService_0 (copy), v20 (copy), v29 (copy), v15 (copy), l_GuiService_0 (copy)
    local v36 = l_HttpService_0:JSONEncode({
        title = game:GetEngineFeature("SetWebViewTitle") and "Help Center" or nil, 
        presentationStyle = if v20() then v29.FormSheet else nil, 
        visible = true, 
        url = v35
    });
    v15:debug("Opening Webview with payload {}", v36);
    l_GuiService_0:BroadcastNotification(v36, 20);
end;
v18.init = function(v37) --[[ Line: 80 ]] --[[ Name: init ]]
    -- upvalues: v6 (copy), l_VRService_0 (copy), l_GamepadService_0 (copy), l_default_0 (copy), v34 (copy), v19 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), v25 (copy)
    v37.buttonRef = v6.createRef();
    v37:setState({
        vrShowMenuIcon = l_VRService_0.VREnabled and l_GamepadService_0.GamepadCursorEnabled, 
        voiceChatServiceConnected = false, 
        showPopup = false
    });
    if game:GetEngineFeature("VoiceChatSupported") then
        l_default_0:asyncInit():andThen(function() --[[ Line: 91 ]]
            -- upvalues: v37 (copy)
            v37:setState({
                voiceChatServiceConnected = true
            });
        end):catch(v34);
    end;
    v37.menuIconActivated = function() --[[ Line: 99 ]]
        -- upvalues: v37 (copy)
        v37:setState({
            showPopup = not v37.state.showPopup
        });
        v37.props.Analytics.EventStream:setRBXEvent("voiceChat", not v37.state.showPopup and "openBetaBadge" or "closeBetaBadge");
    end;
    v37.learnMore = function() --[[ Line: 109 ]]
        -- upvalues: v19 (ref), v37 (copy)
        local v38 = v19();
        openWebview(v38);
        v37.props.Analytics.EventStream:setRBXEvent("voiceChat", "clickBetaBadgeLearnMore");
    end;
    if l_FFlagTopBarSignalizeKeepOutAreas_0 then
        v37.keepOutAreasStore = v25.Stores.GetKeepOutAreasStore(false);
    end;
end;
v18.render = function(v39) --[[ Line: 121 ]] --[[ Name: render ]]
    -- upvalues: l_VRService_0 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), v24 (copy), l_withStyle_0 (copy), v6 (copy), v32 (copy), v33 (copy), v31 (copy), v30 (copy), l_AppFonts_0 (copy), l_GamepadService_0 (copy), l_ExternalEventConnection_0 (copy)
    local v40 = (not l_VRService_0.VREnabled or v39.state.vrShowMenuIcon) and v39.state.voiceChatServiceConnected;
    local function v44(v41) --[[ Line: 124 ]]
        -- upvalues: v40 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (ref), v39 (copy), v24 (ref)
        if v40 and v41 then
            local v42 = Vector2.new(v41.AbsolutePosition.X - 2, v41.AbsolutePosition.Y - 2);
            local v43 = Vector2.new(v41.AbsoluteSize.X + 4, v41.AbsoluteSize.Y + 4);
            if l_FFlagTopBarSignalizeKeepOutAreas_0 then
                v39.keepOutAreasStore.setKeepOutArea(v24.VoiceBetaBadgeKeepOutAreaId, v42, v43);
                return;
            else
                v39.props.setKeepOutArea(v24.VoiceBetaBadgeKeepOutAreaId, v42, v43);
                return;
            end;
        elseif l_FFlagTopBarSignalizeKeepOutAreas_0 then
            v39.keepOutAreasStore.removeKeepOutArea(v24.VoiceBetaBadgeKeepOutAreaId);
            return;
        else
            v39.props.removeKeepOutArea(v24.VoiceBetaBadgeKeepOutAreaId);
            return;
        end;
    end;
    if v39.buttonRef.current then
        v44(v39.buttonRef.current);
    end;
    return l_withStyle_0(function(v45) --[[ Line: 148 ]]
        -- upvalues: v6 (ref), v40 (copy), v39 (copy), v32 (ref), v33 (ref), v31 (ref), v44 (copy), v30 (ref), l_AppFonts_0 (ref), l_GamepadService_0 (ref), l_ExternalEventConnection_0 (ref), l_VRService_0 (ref)
        local l_Footer_0 = v45.Font.Footer;
        local l_Font_0 = l_Footer_0.Font;
        local v48 = v45.Font.BaseSize * l_Footer_0.RelativeSize;
        local l_BackgroundUIContrast_0 = v45.Theme.BackgroundUIContrast;
        local l_TextEmphasis_0 = v45.Theme.TextEmphasis;
        local l_TextLink_0 = v45.Theme.TextLink;
        local v52 = Color3.fromRGB(238, 206, 83);
        return v6.createFragment({
            PopupWrapper = v6.createElement("Frame", {
                Visible = v40 and v39.state.showPopup, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v39.props.layoutOrder + 1
            }, {
                Popup = v6.createElement("Frame", {
                    Size = v32, 
                    Position = UDim2.fromOffset(0, 10), 
                    BackgroundTransparency = l_BackgroundUIContrast_0.Transparency, 
                    BackgroundColor3 = l_BackgroundUIContrast_0.Color
                }, {
                    Layout = v6.createElement("UIListLayout", {
                        Padding = UDim.new(0, 8), 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Popup = v6.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 0
                    }, {
                        Layout = v6.createElement("UIListLayout", {
                            Padding = UDim.new(0, 0), 
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        Starter = v6.createElement("TextLabel", {
                            Text = v33:FormatByKey("InGame.CommonUI.Badge.Popup.HeaderList"), 
                            TextSize = v48, 
                            Font = l_Font_0, 
                            LayoutOrder = 0, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextColor3 = l_TextEmphasis_0.Color, 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            BackgroundTransparency = 1
                        }), 
                        FirstBullet = v6.createElement("TextLabel", {
                            Text = "\226\128\162 " .. v33:FormatByKey("InGame.CommonUI.Badge.Popup.VoiceChatBullet"), 
                            TextSize = v48, 
                            Font = l_Font_0, 
                            LayoutOrder = 2, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextColor3 = l_TextEmphasis_0.Color, 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            BackgroundTransparency = 1
                        })
                    }), 
                    Text = v6.createElement("TextLabel", {
                        Text = v33:FormatByKey("InGame.CommonUI.Badge.Popup.DisclaimerText2"), 
                        TextSize = v48, 
                        Font = l_Font_0, 
                        LayoutOrder = 0, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor3 = l_TextEmphasis_0.Color, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        TextWrapped = true, 
                        BackgroundTransparency = 1
                    }), 
                    LearnMoreLink = v6.createElement("TextButton", {
                        Text = v33:FormatByKey("InGame.CommonUI.Badge.Popup.LearnMoreLink"), 
                        TextSize = v48, 
                        Font = l_Font_0, 
                        LayoutOrder = 1, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor3 = l_TextLink_0.Color, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        [v6.Event.Activated] = v39.learnMore
                    }), 
                    UICorner = v6.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    }), 
                    UIPadding = v6.createElement("UIPadding", {
                        PaddingLeft = v31, 
                        PaddingRight = v31, 
                        PaddingBottom = v31, 
                        PaddingTop = v31
                    })
                })
            }), 
            Button = v6.createElement("Frame", {
                Visible = v40, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v39.props.layoutOrder, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(0, 1), 
                [v6.Change.AbsoluteSize] = v44, 
                [v6.Change.AbsolutePosition] = v44, 
                [v6.Ref] = v39.buttonRef
            }, {
                Layout = v6.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                ActualButton = v6.createElement("Frame", {
                    Visible = v40, 
                    BackgroundTransparency = 0, 
                    Size = v30, 
                    BackgroundColor3 = v52
                }, {
                    Button = v6.createElement("TextButton", {
                        Text = v33:FormatByKey("InGame.CommonUI.Badge.BadgeText"), 
                        Font = l_AppFonts_0.default:getBold(), 
                        TextSize = 8, 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Size = v30, 
                        TextColor3 = l_BackgroundUIContrast_0.Color, 
                        [v6.Event.Activated] = v39.menuIconActivated
                    }), 
                    UICorner = v6.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 3)
                    }), 
                    UIStroke = v6.createElement("UIStroke", {
                        Thickness = 2, 
                        Color = l_TextEmphasis_0.Color
                    }), 
                    VREnabledListener = l_GamepadService_0 and v6.createElement(l_ExternalEventConnection_0, {
                        event = l_GamepadService_0:GetPropertyChangedSignal("GamepadCursorEnabled"), 
                        callback = function() --[[ Line: 282 ]]
                            -- upvalues: v39 (ref), l_VRService_0 (ref), l_GamepadService_0 (ref)
                            v39:setState({
                                vrShowMenuIcon = l_VRService_0.VREnabled and l_GamepadService_0.GamepadCursorEnabled
                            });
                        end or nil
                    })
                })
            })
        });
    end);
end;
local function v58(v53) --[[ Line: 294 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), v22 (copy), v23 (copy)
    if l_FFlagTopBarSignalizeKeepOutAreas_0 then
        return {};
    else
        return {
            setKeepOutArea = function(v54, v55, v56) --[[ Line: 299 ]] --[[ Name: setKeepOutArea ]]
                -- upvalues: v53 (copy), v22 (ref)
                return v53(v22(v54, v55, v56));
            end, 
            removeKeepOutArea = function(v57) --[[ Line: 302 ]] --[[ Name: removeKeepOutArea ]]
                -- upvalues: v53 (copy), v23 (ref)
                return v53(v23(v57));
            end
        };
    end;
end;
if l_FFlagTopBarSignalizeKeepOutAreas_0 then
    return v18;
else
    return v7.UNSTABLE_connect2(nil, v58)(v18);
end;