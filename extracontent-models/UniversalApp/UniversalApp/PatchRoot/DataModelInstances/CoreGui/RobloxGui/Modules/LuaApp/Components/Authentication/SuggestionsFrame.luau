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
local l_Chip_0 = require(l_CorePackages_0.Packages.Foundation).Chip;
local l_InputValidity_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Enums.InputValidity;
local l_ControlState_0 = v5.Core.Control.Enum.ControlState;
local v16 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v17 = require(l_Modules_0.LuaApp.Components.Authentication.RefreshButton);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v19 = v4.PureComponent:extend("SuggestionsFrame");
local v20 = require(l_Modules_0.LuaApp.Flags.GetFFlagUsernameSuggestionRefreshButtonEnabled);
local v21 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableSuggestionRefreshLoadingAnimation);
local v22 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableUsernameSuggestionBorder);
local v23 = game:DefineFastFlag("UseChipForUsernameSuggestions", false);
v19.init = function(v24) --[[ Line: 36 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v24.state = {
        showSuggestions = v24.props.showSuggestions or false, 
        didGenerate = false, 
        currentSuggestions = v24.props.prefilledSuggestions or {}, 
        lastUsernameInput = ""
    };
    v24.isMounted = false;
    v24.usernameSuggestionsShown = v24.props.usernameSuggestionsShown;
    v24.suggestUsername = function(v25) --[[ Line: 47 ]]
        -- upvalues: v24 (copy)
        v24.props.suggest.suggestUsernames(v24.props.networking, v25, v24.props.birthday, v24.props.context):andThen(function(v26) --[[ Line: 52 ]]
            -- upvalues: v24 (ref)
            if v26.shouldUpdateState then
                v24:setState({
                    didGenerate = v26.didGenerate, 
                    currentSuggestions = v26.suggestions
                });
            end;
        end);
    end;
    v24.refreshSuggestions = function(v27) --[[ Line: 63 ]]
        -- upvalues: v24 (copy)
        v24.props.suggest.suggestUsernames(v24.props.networking, v27, v24.props.birthday, v24.props.context):andThen(function(v28) --[[ Line: 69 ]]
            -- upvalues: v24 (ref)
            if v28.shouldUpdateState and v28.didGenerate then
                v24:setState({
                    didGenerate = v28.didGenerate, 
                    currentSuggestions = v28.suggestions
                });
            end;
        end);
    end;
    v24.suggestionsToString = function(v29) --[[ Line: 80 ]]
        return table.concat(v29, ",");
    end;
    v24.shouldSuggest = v24.props.shouldSuggest;
    v24.loadSuggestions = v24.props.loadSuggestions;
    v24.finishSuggestions = v24.props.finishSuggestions;
    v24.padding = {
        PaddingTop = UDim.new(0, 6), 
        PaddingBottom = UDim.new(0, 2)
    };
    if v24.props.padding then
        v24.padding = v3.Dictionary.join(v24.padding, v24.props.padding);
    end;
end;
v19.didMount = function(v30) --[[ Line: 100 ]] --[[ Name: didMount ]]
    v30.isMounted = true;
end;
v19.didUpdate = function(v31, _, _) --[[ Line: 104 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_InputValidity_0 (copy)
    if v31.isMounted then
        local v34 = v31.props.textBoxRef:getValue();
        if v34.Text ~= "" and v31.props.prefilledSuggestions ~= v31.state.currentSuggestions then
            if v31.props.usernameValid == l_InputValidity_0.Invalid then
                if v34.Text ~= v31.state.lastUsernameInput and v31.shouldSuggest() then
                    v31.suggestUsername(v34.Text);
                end;
                v31:setState({
                    lastUsernameInput = v34.Text
                });
            else
                v31:setState({
                    didGenerate = false, 
                    lastUsernameInput = ""
                });
            end;
            v31:setState({
                showSuggestions = v31.state.didGenerate
            });
            if v31.state.showSuggestions and v31.usernameSuggestionsShown then
                v31.usernameSuggestionsShown(v34.Text, v31.suggestionsToString(v31.state.currentSuggestions));
            end;
        end;
    end;
end;
pillPressed = function(v35) --[[ Line: 130 ]] --[[ Name: pillPressed ]]
    -- upvalues: l_ControlState_0 (copy)
    local v36 = true;
    if v35 ~= l_ControlState_0.Pressed then
        v36 = v35 == l_ControlState_0.SelectedPressed;
    end;
    return v36;
end;
suggestionPill = function(v37, v38, v39, v40, v41, v42) --[[ Line: 135 ]] --[[ Name: suggestionPill ]]
    -- upvalues: v23 (copy), v4 (copy), l_Chip_0 (copy), l_ControlState_0 (copy), v21 (copy), v22 (copy), l_Focusable_0 (copy), l_Pillv2_0 (copy)
    if v23 then
        return v4.createElement(l_Chip_0, {
            text = v37, 
            onActivated = function() --[[ Line: 146 ]] --[[ Name: onActivated ]]
                -- upvalues: v39 (copy), v38 (copy), v40 (copy), v37 (copy), v41 (copy), l_ControlState_0 (ref)
                if v39 then
                    v39();
                end;
                local v43 = v38:getValue();
                if v40 then
                    v40(v43.Text, v37);
                end;
                v43.Text = v37;
                v41(l_ControlState_0.Pressed);
            end
        });
    else
        local v47 = {
            text = v37, 
            onStateChanged = function(_, v45) --[[ Line: 162 ]] --[[ Name: onStateChanged ]]
                -- upvalues: v39 (copy), v38 (copy), v40 (copy), v37 (copy), v41 (copy)
                if pillPressed(v45) then
                    if v39 then
                        v39();
                    end;
                    local v46 = v38:getValue();
                    if v40 then
                        v40(v46.Text, v37);
                    end;
                    v46.Text = v37;
                    v41(v45);
                end;
            end, 
            onActivated = function() --[[ Line: 181 ]] --[[ Name: onActivated ]]

            end, 
            isLoading = v21() and v42 or false
        };
        if v22() then
            v47.hasBorder = true;
        end;
        return v4.createElement(l_Focusable_0[l_Pillv2_0], v47);
    end;
end;
getPills = function(v48, v49, v50, v51, v52, v53) --[[ Line: 191 ]] --[[ Name: getPills ]]
    local v54 = {};
    for _, v56 in pairs(v48) do
        v54[v56] = suggestionPill(v56, v49, v50, v51, v52, v53);
    end;
    return v54;
end;
v19.render = function(v57) --[[ Line: 220 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v7 (copy), l_TextService_0 (copy), v4 (copy), v8 (copy), v9 (copy), l_FitFrameHorizontal_0 (copy), v20 (copy), v17 (copy)
    if v57.isMounted and v57.props.textBoxRef:getValue().Text ~= v57.state.lastUsernameInput then
        v57:setState({
            showSuggestions = false
        });
    end;
    return l_withStyle_0(function(v58) --[[ Line: 229 ]]
        -- upvalues: v7 (ref), l_TextService_0 (ref), v57 (copy), v4 (ref), v8 (ref), v9 (ref), l_FitFrameHorizontal_0 (ref), v20 (ref), v17 (ref)
        return v7({
            tryText = "Authentication.SignUp.Description.Try"
        })(function(v59) --[[ Line: 232 ]]
            -- upvalues: v58 (copy), l_TextService_0 (ref), v57 (ref), v4 (ref), v8 (ref), v9 (ref), l_FitFrameHorizontal_0 (ref), v20 (ref), v17 (ref)
            local l_CaptionHeader_0 = v58.Font.CaptionHeader;
            local v61 = v58.Font.BaseSize * v58.Font.CaptionHeader.RelativeSize;
            local v62 = l_TextService_0:GetTextSize(v59.tryText, v61, l_CaptionHeader_0.Font, Vector2.new()).X + 12;
            return v57.state.showSuggestions and v4.createElement(v8.FitFrame, {
                Size = UDim2.new(1, 0, 0, 0), 
                LayoutOrder = v57.props.layoutOrder, 
                fitAxis = v8.FitAxis.Height, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                BackgroundColor3 = v58.Theme.BackgroundUIDefault.Color, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                padding = v4.createElement("UIPadding", v57.padding), 
                Title = v4.createElement(v9, {
                    Size = UDim2.new(1, 0, 0, 0), 
                    fitAxis = v8.FitAxis.Height, 
                    BackgroundTransparency = 1, 
                    Text = v59.tryText .. ":", 
                    TextWrapped = true, 
                    Font = l_CaptionHeader_0.Font, 
                    TextSize = v61, 
                    TextColor3 = v58.Theme.TextEmphasis.Color, 
                    TextTransparency = v58.Theme.TextEmphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                SuggestionButtons = v4.createElement(l_FitFrameHorizontal_0, {
                    Position = UDim2.new(0, v62, 0, -6), 
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    contentPadding = UDim.new(0, 6), 
                    BorderSizePixel = 0, 
                    AutomaticSize = Enum.AutomaticSize.XY
                }, getPills(v57.state.currentSuggestions, v57.props.textBoxRef, v57.props.updatePillClicked, v57.props.usernameSuggestionClicked, v57.props.updateSuggestionControlState, v57.props.loadingSuggestions)), 
                RefreshButtonFrame = v20() and v57.props.useRefreshButton and v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.XY
                }, {
                    UIListLayout = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Right
                    }), 
                    RefreshButton = v4.createElement(v17, {
                        onRefresh = function() --[[ Line: 299 ]] --[[ Name: onRefresh ]]
                            -- upvalues: v57 (ref)
                            v57.props.logRefreshButtonClicked();
                            local v63 = v57.props.textBoxRef:getValue();
                            v57.refreshSuggestions(v63.Text);
                        end, 
                        loadSuggestions = v57.loadSuggestions, 
                        finishSuggestions = v57.finishSuggestions
                    })
                })
            });
        end);
    end);
end;
return (l_RoactServices_0.connect({
    networking = v16
})(v19));