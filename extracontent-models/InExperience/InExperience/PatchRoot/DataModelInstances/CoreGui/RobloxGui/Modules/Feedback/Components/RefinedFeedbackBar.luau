local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local l_ExperienceStateCaptureService_0 = game:GetService("ExperienceStateCaptureService");
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Thunks.ShowHelpModalThunk);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v6 = require(script.Parent.FeedbackBarHint);
local v7 = require(l_CorePackages_0.Packages.Roact);
local v8 = require(l_CorePackages_0.Packages.RoactRodux);
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local v10 = require(l_CorePackages_0.Packages.t);
local v11 = require(l_CorePackages_0.Packages.Cryo);
local l_withStyle_0 = v9.Core.Style.withStyle;
local l_ButtonStack_0 = v9.App.Button.ButtonStack;
local l_ButtonType_0 = v9.App.Button.Enum.ButtonType;
local v15 = v7.PureComponent:extend("RefinedFeedbackBar");
local function v16(...) --[[ Line: 41 ]] --[[ Name: GetTextSize ]]
    -- upvalues: l_TextService_0 (copy)
    return l_TextService_0:GetTextSize(...) + Vector2.new(2, 2);
end;
local v17 = v10.strictInterface({
    text = v10.string
});
v15.validateProps = v10.strictInterface({
    leftHint = v17
});
v15.init = function(v18) --[[ Line: 55 ]] --[[ Name: init ]]
    -- upvalues: l_ExperienceStateCaptureService_0 (copy)
    v18.state = {
        barWidth = 0, 
        hintStringsConcat = nil, 
        requiredSpace = nil, 
        hintRatios = nil
    };
    v18.onExitFeedbackMode = function() --[[ Line: 63 ]]
        -- upvalues: l_ExperienceStateCaptureService_0 (ref)
        l_ExperienceStateCaptureService_0:ToggleCaptureMode();
    end;
    v18.openHelpModal = function() --[[ Line: 67 ]]
        -- upvalues: v18 (copy)
        v18.props.showHelpModal(true);
    end;
end;
v15.calculateHintRatios = function(v19) --[[ Line: 73 ]] --[[ Name: calculateHintRatios ]]
    -- upvalues: v11 (copy), v16 (copy)
    local v20 = 84;
    local v21 = "";
    local v22 = {};
    local v23 = 0;
    local v24 = v11.List.join({
        v19
    }, {});
    for _, v26 in ipairs(v24) do
        v22[v26.text] = v16(v26.text, 17, 2, Vector2.new(10000, 10000)).X;
        v23 = v23 + v22[v26.text];
        v20 = v20 + 36 + 8;
        v21 = v21 .. v26.text;
    end;
    for v27, v28 in pairs(v22) do
        v22[v27] = v28 / v23;
    end;
    return v22, v20 + math.max(#v24 - 2, 0) * 40, v21;
end;
v15.getDerivedStateFromProps = function(v29) --[[ Line: 105 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v15 (copy)
    local v30, v31, v32 = v15.calculateHintRatios(v29.leftHint);
    return {
        hintRatios = v30, 
        requiredSpace = v31, 
        hintStringsConcat = v32
    };
end;
v15.calculateHintSize = function(v33, v34, v35) --[[ Line: 116 ]] --[[ Name: calculateHintSize ]]
    -- upvalues: v16 (copy)
    local v36 = v34 - v33.state.requiredSpace;
    local v37 = v35.Header2.RelativeSize * v35.BaseSize;
    local v38 = v35.Header2.RelativeMinSize * v35.BaseSize;
    local l_X_0 = v16(v33.state.hintStringsConcat, v38, v35.Header2.Font, Vector2.new(10000, 10000)).X;
    if l_X_0 <= v36 then
        local l_X_1 = v16(v33.state.hintStringsConcat, v37, v35.Header2.Font, Vector2.new(10000, 10000)).X;
        local v41 = (v37 - v38) / (l_X_1 - l_X_0);
        local v42 = v37 - v41 * l_X_1;
        return nil, (math.clamp(v36 * v41 + v42, v38, v37));
    else
        local v43 = {};
        for v44, v45 in pairs(v33.state.hintRatios) do
            v43[v44] = v45 * v36;
        end;
        return v43;
    end;
end;
v15.render = function(v46) --[[ Line: 155 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v7 (copy), v6 (copy), l_withLocalization_0 (copy), l_ButtonStack_0 (copy), l_ButtonType_0 (copy)
    return l_withStyle_0(function(v47) --[[ Line: 156 ]]
        -- upvalues: v7 (ref), v6 (ref), v46 (copy), l_withLocalization_0 (ref), l_ButtonStack_0 (ref), l_ButtonType_0 (ref)
        local l_Theme_0 = v47.Theme;
        local function v50(v49) --[[ Line: 158 ]] --[[ Name: makeHint ]]
            -- upvalues: v7 (ref), v6 (ref)
            return v7.createElement(v6, v49);
        end;
        return v7.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = l_Theme_0.BackgroundUIContrast.Transparency, 
            BackgroundColor3 = l_Theme_0.BackgroundUIContrast.Color, 
            Size = UDim2.new(1, 0, 0, 72), 
            Position = UDim2.fromScale(0, 1), 
            AnchorPoint = Vector2.new(0, 1), 
            [v7.Change.AbsoluteSize] = function(v51) --[[ Line: 169 ]]
                -- upvalues: v46 (ref)
                v46:setState({
                    barWidth = v51.AbsoluteSize.X
                });
            end, 
            [v7.Event.AncestryChanged] = function(v52) --[[ Line: 174 ]]
                -- upvalues: v46 (ref)
                v46:setState({
                    barWidth = v52.AbsoluteSize.X
                });
            end
        }, {
            Padding = v7.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 24), 
                PaddingRight = UDim.new(0, 24)
            }), 
            LeftFrame = v7.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(0.5, 1)
            }, {
                v7.createElement("UIListLayout", {
                    key = "Layout", 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 40)
                }), 
                v50(v46.props.leftHint)
            }), 
            RightFrame = v7.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(0.35, 1), 
                Position = UDim2.fromScale(1, 0), 
                AnchorPoint = Vector2.new(1, 0)
            }, {
                Layout = v7.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 40)
                }), 
                Buttons = l_withLocalization_0({
                    helpButtonText = "CoreScripts.Feedback.FeedbackBar.HelpButton", 
                    exitFeedbackButtonText = "CoreScripts.Feedback.FeedbackBar.ExitFeedbackButton"
                })(function(v53) --[[ Line: 217 ]]
                    -- upvalues: v7 (ref), l_ButtonStack_0 (ref), l_ButtonType_0 (ref), v46 (ref)
                    return v7.createElement(l_ButtonStack_0, {
                        buttonHeight = 50, 
                        buttons = {
                            {
                                buttonType = l_ButtonType_0.Secondary, 
                                props = {
                                    onActivated = v46.openHelpModal, 
                                    text = v53.helpButtonText
                                }
                            }, 
                            {
                                buttonType = l_ButtonType_0.PrimarySystem, 
                                props = {
                                    isDisabled = false, 
                                    onActivated = v46.onExitFeedbackMode, 
                                    text = v53.exitFeedbackButtonText
                                }
                            }
                        }, 
                        forcedFillDirection = Enum.FillDirection.Horizontal
                    });
                end)
            })
        });
    end);
end;
return v8.connect(function() --[[ Line: 245 ]]
    return {};
end, function(v54) --[[ Line: 247 ]]
    -- upvalues: v4 (copy)
    return {
        showHelpModal = function(v55) --[[ Line: 249 ]] --[[ Name: showHelpModal ]]
            -- upvalues: v54 (copy), v4 (ref)
            v54(v4(v55));
        end
    };
end)(v15);