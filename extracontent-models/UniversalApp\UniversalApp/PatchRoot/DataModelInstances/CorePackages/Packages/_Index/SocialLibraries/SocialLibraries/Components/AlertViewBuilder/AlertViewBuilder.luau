local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_Cryo_0 = v1.Cryo;
local l_UIBlox_0 = v1.UIBlox;
local l_Text_0 = v1.Text;
local l_Components_0 = l_script_FirstAncestor_0.Components;
local v7 = require(l_Components_0.AlertView.AlertViewLabel);
local v8 = require(l_Components_0.AlertView.AlertViewTextbox);
local v9 = require(l_Components_0.AlertView.AlertViewSoakArea);
local v10 = require(script.Parent.Parent.FitFrameVertical);
local l_InteractiveAlert_0 = l_UIBlox_0.App.Dialog.Alert.InteractiveAlert;
local l_CheckboxList_0 = l_UIBlox_0.App.InputButton.CheckboxList;
local v13 = l_Roact_0.Component:extend("AlertViewBuilder");
v13.defaultProps = {
    bodyText = "", 
    buttons = {}, 
    checkboxes = {}, 
    textboxes = {}, 
    displayTextbox = false, 
    onActivated = function() --[[ Line: 79 ]] --[[ Name: onActivated ]]

    end, 
    onModalClose = function() --[[ Line: 80 ]] --[[ Name: onModalClose ]]

    end, 
    onModalStayOpen = function() --[[ Line: 81 ]] --[[ Name: onModalStayOpen ]]

    end, 
    onModalOpen = function() --[[ Line: 82 ]] --[[ Name: onModalOpen ]]

    end, 
    title = "", 
    checkboxHeight = 50, 
    childComponentWidth = 220, 
    screenSize = Vector2.new(0, 0), 
    soakAreaColor3 = Color3.fromRGB(255, 0, 255), 
    soakAreaTransparency = 0.5, 
    inputLengthExceeded = nil
};
v13.init = function(v14) --[[ Line: 95 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy), l_Text_0 (copy)
    local v15 = {};
    local v16 = 0;
    local v17 = 0;
    for v18, _ in pairs(v14.props.checkboxes) do
        v15[v18] = false;
        v16 = v16 + 1;
    end;
    v14.refs = {};
    for v20, _ in pairs(v14.props.textboxes) do
        v14.refs[v20] = l_Roact_0.createRef();
        v17 = v17 + 1;
    end;
    v14.state = {
        checkboxStatuses = v15, 
        numCheckboxes = v16, 
        numTextboxes = v17
    };
    v14.calcTextboxTextHeight = function(v22, v23) --[[ Line: 112 ]]
        -- upvalues: l_Text_0 (ref), v14 (copy)
        local v24 = v22.Font.Body.RelativeSize * v22.Font.BaseSize;
        local l_Font_0 = v22.Font.Body.Font;
        local v26 = 0;
        if v23 and v23 ~= "" then
            v26 = l_Text_0.GetTextHeight(v23, l_Font_0, v24, v14.props.childComponentWidth);
        end;
        return v26;
    end;
end;
v13.didMount = function(v27) --[[ Line: 124 ]] --[[ Name: didMount ]]
    if type(v27.props.onModalOpen) == "function" then
        v27.props.onModalOpen();
    end;
end;
v13.reset = function(v28) --[[ Line: 130 ]] --[[ Name: reset ]]
    for _, v30 in pairs(v28.refs) do
        if v30.current then
            v30.current.Text = "";
        end;
    end;
    local v31 = {};
    for v32, _ in pairs(v28.state.checkboxStatuses) do
        v31[v32] = false;
    end;
    v28:setState({
        checkboxStatuses = v31
    });
end;
v13.makeButtonTable = function(v34) --[[ Line: 145 ]] --[[ Name: makeButtonTable ]]
    -- upvalues: l_Cryo_0 (copy)
    local v35 = {
        buttons = {}
    };
    for v36, v37 in ipairs(v34.props.buttons) do
        table.insert(v35.buttons, {});
        local v41 = l_Cryo_0.Dictionary.join(v37, {
            props = l_Cryo_0.Dictionary.join(v37.props, {
                layoutOrder = v36, 
                onActivated = function() --[[ Line: 154 ]] --[[ Name: onActivated ]]
                    -- upvalues: v34 (copy), v37 (copy)
                    v34.props.onActivated();
                    local v38 = {};
                    for v39, v40 in pairs(v34.refs) do
                        v38[v39] = v40.current and v40.current.Text or "";
                    end;
                    if not v37.props.onActivated(v38, v34.state.checkboxStatuses) then
                        v34:reset();
                        v34:setState({
                            displayingModal = false
                        });
                        v34.props.onModalClose();
                        return;
                    else
                        v34.props.onModalStayOpen();
                        return;
                    end;
                end
            })
        });
        v35.buttons[v36] = v41;
    end;
    return v35;
end;
v13.makeTextboxList = function(v42, v43) --[[ Line: 179 ]] --[[ Name: makeTextboxList ]]
    -- upvalues: l_Roact_0 (copy), v10 (copy), v8 (copy), v7 (copy)
    local v44 = {};
    local l_Color_0 = v43.Theme.TextDefault.Color;
    if v42.props.inputLengthExceeded then
        l_Color_0 = v43.Theme.Alert.Color;
    end;
    for v46, v47 in pairs(v42.props.textboxes) do
        local v48 = v42.calcTextboxTextHeight(v43, v47.belowText);
        local v49 = v42.calcTextboxTextHeight(v43, v47.warningText);
        v44[v46] = l_Roact_0.createElement(v10, {
            width = UDim.new(1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = v47.LayoutOrder
        }, {
            [v46] = l_Roact_0.createElement(v8, {
                onTextChanged = v47.onTextChanged, 
                PlaceholderText = v47.PlaceholderText, 
                Text = v47.Text, 
                LayoutOrder = 1, 
                [l_Roact_0.Ref] = v42.refs[v46]
            }), 
            [v46 .. " Below Text"] = v47.belowText and v47.belowText ~= "" and l_Roact_0.createElement(v7, {
                BackgroundTransparency = 1, 
                Text = v47.belowText, 
                LayoutOrder = 2, 
                TextXAlignment = v47.belowTextAlignment or Enum.TextXAlignment.Left, 
                Size = UDim2.new(1, 0, 0, v48), 
                TextColor3 = l_Color_0
            }) or nil, 
            [v46 .. " Warning Text"] = v47.warningText and v47.warningText ~= "" and l_Roact_0.createElement(v7, {
                BackgroundTransparency = 1, 
                Text = v47.warningText, 
                LayoutOrder = 3, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Size = UDim2.new(1, 0, 0, v49), 
                TextColor3 = v43.Theme.Alert.Color
            }) or nil
        });
    end;
    return v44;
end;
v13.makeCheckboxList = function(v50) --[[ Line: 232 ]] --[[ Name: makeCheckboxList ]]
    -- upvalues: l_Roact_0 (copy), l_CheckboxList_0 (copy), l_Cryo_0 (copy)
    return l_Roact_0.createElement(l_CheckboxList_0, {
        checkboxes = v50.props.checkboxes, 
        atMost = v50.state.numCheckboxes + 1, 
        elementSize = UDim2.new(0, v50.props.childComponentWidth, 0, v50.props.checkboxHeight), 
        onActivated = function(v51) --[[ Line: 237 ]] --[[ Name: onActivated ]]
            -- upvalues: v50 (copy), l_Cryo_0 (ref)
            v50:setState({
                checkboxStatuses = l_Cryo_0.Dictionary.join(v50.state.checkboxStatuses, v51)
            });
        end
    });
end;
v13.makeMiddleContent = function(v52, v53) --[[ Line: 245 ]] --[[ Name: makeMiddleContent ]]
    -- upvalues: l_Roact_0 (copy), v10 (copy)
    local v54 = v52:makeTextboxList(v53);
    local v55 = v52:makeCheckboxList();
    local v56 = v52.state.numCheckboxes * v52.props.checkboxHeight;
    if v52.state.numTextboxes == 0 and v52.state.numCheckboxes == 0 then
        return nil;
    else
        return function() --[[ Line: 256 ]]
            -- upvalues: l_Roact_0 (ref), v10 (ref), v54 (copy), v56 (copy), v55 (copy)
            return l_Roact_0.createElement(v10, {
                width = UDim.new(1, 0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                Textboxes = l_Roact_0.createElement(v10, {
                    width = UDim.new(1, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, v54), 
                Checkboxes = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v56), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }, v55)
            });
        end;
    end;
end;
v13.render = function(v57) --[[ Line: 277 ]] --[[ Name: render ]]
    -- upvalues: l_UIBlox_0 (copy), l_Roact_0 (copy), v9 (copy), l_InteractiveAlert_0 (copy)
    assert(v57.props.displayTextbox or not v57.props.mandatoryInput);
    return l_UIBlox_0.Style.withStyle(function(v58) --[[ Line: 280 ]]
        -- upvalues: v57 (copy), l_Roact_0 (ref), v9 (ref), l_InteractiveAlert_0 (ref)
        local v59 = v57:makeButtonTable();
        local v60 = v57:makeMiddleContent(v58);
        local v61 = v57.props.bodyText ~= "" and v57.props.bodyText or nil;
        return l_Roact_0.createElement(v9, {
            BackgroundColor3 = v57.props.soakAreaColor3, 
            BackgroundTransparency = v57.props.soakAreaTransparency, 
            Visible = v57.state.displayingModal
        }, {
            alertView = l_Roact_0.createElement(l_InteractiveAlert_0, {
                title = v57.props.title, 
                bodyText = v61, 
                middleContent = v60, 
                buttonStackInfo = v59, 
                screenSize = v57.props.screenSize
            })
        });
    end);
end;
return v13;