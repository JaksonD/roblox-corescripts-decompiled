local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v5.Style.withStyle;
local v7 = require(l_Modules_0.LuaApp.withLocalization);
local v8 = require(l_Modules_0.LuaApp.FitChildren);
local v9 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local l_FitFrameHorizontal_0 = require(l_CorePackages_0.Packages.AvatarExperienceDeps).RoactFitComponents.FitFrameHorizontal;
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_Pillv2_0 = v5.App.Control.Pillv2;
local l_InputValidity_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Enums.InputValidity;
local l_ControlState_0 = v5.Core.Control.Enum.ControlState;
local v15 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v16 = require(l_Modules_0.LuaApp.Components.Authentication.RefreshButton);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v18 = v4.PureComponent:extend("SuggestionsFrame");
local v19 = require(l_Modules_0.LuaApp.Flags.GetFFlagUsernameSuggestionRefreshButtonEnabled);
local v20 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableSuggestionRefreshLoadingAnimation);
local v21 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableUsernameSuggestionBorder);
v18.init = function(v22) --[[ Line: 32 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v22.state = {
        showSuggestions = v22.props.showSuggestions or false, 
        didGenerate = false, 
        currentSuggestions = v22.props.prefilledSuggestions or {}, 
        lastUsernameInput = ""
    };
    v22.isMounted = false;
    v22.usernameSuggestionsShown = v22.props.usernameSuggestionsShown;
    v22.suggestUsername = function(v23) --[[ Line: 43 ]]
        -- upvalues: v22 (copy)
        v22.props.suggest.suggestUsernames(v22.props.networking, v23, v22.props.birthday, v22.props.context):andThen(function(v24) --[[ Line: 48 ]]
            -- upvalues: v22 (ref)
            if v24.shouldUpdateState then
                v22:setState({
                    didGenerate = v24.didGenerate, 
                    currentSuggestions = v24.suggestions
                });
            end;
        end);
    end;
    v22.refreshSuggestions = function(v25) --[[ Line: 59 ]]
        -- upvalues: v22 (copy)
        v22.props.suggest.suggestUsernames(v22.props.networking, v25, v22.props.birthday, v22.props.context):andThen(function(v26) --[[ Line: 65 ]]
            -- upvalues: v22 (ref)
            if v26.shouldUpdateState and v26.didGenerate then
                v22:setState({
                    didGenerate = v26.didGenerate, 
                    currentSuggestions = v26.suggestions
                });
            end;
        end);
    end;
    v22.suggestionsToString = function(v27) --[[ Line: 76 ]]
        return table.concat(v27, ",");
    end;
    v22.shouldSuggest = v22.props.shouldSuggest;
    v22.loadSuggestions = v22.props.loadSuggestions;
    v22.finishSuggestions = v22.props.finishSuggestions;
    v22.padding = {
        PaddingTop = UDim.new(0, 6), 
        PaddingBottom = UDim.new(0, 2)
    };
    if v22.props.padding then
        v22.padding = v3.Dictionary.join(v22.padding, v22.props.padding);
    end;
end;
v18.didMount = function(v28) --[[ Line: 96 ]] --[[ Name: didMount ]]
    v28.isMounted = true;
end;
v18.didUpdate = function(v29, _, _) --[[ Line: 100 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_InputValidity_0 (copy)
    if v29.isMounted then
        local v32 = v29.props.textBoxRef:getValue();
        if v32.Text ~= "" and v29.props.prefilledSuggestions ~= v29.state.currentSuggestions then
            if v29.props.usernameValid == l_InputValidity_0.Invalid then
                if v32.Text ~= v29.state.lastUsernameInput and v29.shouldSuggest() then
                    v29.suggestUsername(v32.Text);
                end;
                v29:setState({
                    lastUsernameInput = v32.Text
                });
            else
                v29:setState({
                    didGenerate = false, 
                    lastUsernameInput = ""
                });
            end;
            v29:setState({
                showSuggestions = v29.state.didGenerate
            });
            if v29.state.showSuggestions and v29.usernameSuggestionsShown then
                v29.usernameSuggestionsShown(v32.Text, v29.suggestionsToString(v29.state.currentSuggestions));
            end;
        end;
    end;
end;
pillPressed = function(v33) --[[ Line: 126 ]] --[[ Name: pillPressed ]]
    -- upvalues: l_ControlState_0 (copy)
    local v34 = true;
    if v33 ~= l_ControlState_0.Pressed then
        v34 = v33 == l_ControlState_0.SelectedPressed;
    end;
    return v34;
end;
suggestionPill = function(v35, v36, v37, v38, v39, v40) --[[ Line: 131 ]] --[[ Name: suggestionPill ]]
    -- upvalues: v20 (copy), v21 (copy), v4 (copy), l_Focusable_0 (copy), l_Pillv2_0 (copy)
    local v44 = {
        text = v35, 
        onStateChanged = function(_, v42) --[[ Line: 141 ]] --[[ Name: onStateChanged ]]
            -- upvalues: v37 (copy), v36 (copy), v38 (copy), v35 (copy), v39 (copy)
            if pillPressed(v42) then
                if v37 then
                    v37();
                end;
                local v43 = v36:getValue();
                if v38 then
                    v38(v43.Text, v35);
                end;
                v43.Text = v35;
                v39(v42);
            end;
        end, 
        onActivated = function() --[[ Line: 160 ]] --[[ Name: onActivated ]]

        end, 
        isLoading = v20() and v40 or false
    };
    if v21() then
        v44.hasBorder = true;
    end;
    return v4.createElement(l_Focusable_0[l_Pillv2_0], v44);
end;
getPills = function(v45, v46, v47, v48, v49, v50) --[[ Line: 170 ]] --[[ Name: getPills ]]
    local v51 = {};
    for _, v53 in pairs(v45) do
        v51[v53] = suggestionPill(v53, v46, v47, v48, v49, v50);
    end;
    return v51;
end;
v18.render = function(v54) --[[ Line: 199 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v7 (copy), l_TextService_0 (copy), v4 (copy), v8 (copy), v9 (copy), l_FitFrameHorizontal_0 (copy), v19 (copy), v16 (copy)
    if v54.isMounted and v54.props.textBoxRef:getValue().Text ~= v54.state.lastUsernameInput then
        v54:setState({
            showSuggestions = false
        });
    end;
    return l_withStyle_0(function(v55) --[[ Line: 208 ]]
        -- upvalues: v7 (ref), l_TextService_0 (ref), v54 (copy), v4 (ref), v8 (ref), v9 (ref), l_FitFrameHorizontal_0 (ref), v19 (ref), v16 (ref)
        return v7({
            tryText = "Authentication.SignUp.Description.Try"
        })(function(v56) --[[ Line: 211 ]]
            -- upvalues: v55 (copy), l_TextService_0 (ref), v54 (ref), v4 (ref), v8 (ref), v9 (ref), l_FitFrameHorizontal_0 (ref), v19 (ref), v16 (ref)
            local l_CaptionHeader_0 = v55.Font.CaptionHeader;
            local v58 = v55.Font.BaseSize * v55.Font.CaptionHeader.RelativeSize;
            local v59 = l_TextService_0:GetTextSize(v56.tryText, v58, l_CaptionHeader_0.Font, Vector2.new()).X + 12;
            return v54.state.showSuggestions and v4.createElement(v8.FitFrame, {
                Size = UDim2.new(1, 0, 0, 0), 
                LayoutOrder = v54.props.layoutOrder, 
                fitAxis = v8.FitAxis.Height, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                BackgroundColor3 = v55.Theme.BackgroundUIDefault.Color, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                padding = v4.createElement("UIPadding", v54.padding), 
                Title = v4.createElement(v9, {
                    Size = UDim2.new(1, 0, 0, 0), 
                    fitAxis = v8.FitAxis.Height, 
                    BackgroundTransparency = 1, 
                    Text = v56.tryText .. ":", 
                    TextWrapped = true, 
                    Font = l_CaptionHeader_0.Font, 
                    TextSize = v58, 
                    TextColor3 = v55.Theme.TextEmphasis.Color, 
                    TextTransparency = v55.Theme.TextEmphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                SuggestionButtons = v4.createElement(l_FitFrameHorizontal_0, {
                    Position = UDim2.new(0, v59, 0, -6), 
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    contentPadding = UDim.new(0, 6), 
                    BorderSizePixel = 0, 
                    AutomaticSize = Enum.AutomaticSize.XY
                }, getPills(v54.state.currentSuggestions, v54.props.textBoxRef, v54.props.updatePillClicked, v54.props.usernameSuggestionClicked, v54.props.updateSuggestionControlState, v54.props.loadingSuggestions)), 
                RefreshButtonFrame = v19() and v54.props.useRefreshButton and v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.XY
                }, {
                    UIListLayout = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Right
                    }), 
                    RefreshButton = v4.createElement(v16, {
                        onRefresh = function() --[[ Line: 278 ]] --[[ Name: onRefresh ]]
                            -- upvalues: v54 (ref)
                            v54.props.logRefreshButtonClicked();
                            local v60 = v54.props.textBoxRef:getValue();
                            v54.refreshSuggestions(v60.Text);
                        end, 
                        loadSuggestions = v54.loadSuggestions, 
                        finishSuggestions = v54.finishSuggestions
                    })
                })
            });
        end);
    end);
end;
return (l_RoactServices_0.connect({
    networking = v15
})(v18));