local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local v2 = require(l_Parent_0.UserAgreementUtils);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_withLocalization_0 = v1.Localization.withLocalization;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Checkbox_0 = l_UIBlox_0.App.InputButton.Checkbox;
local l_t_0 = v1.t;
local l_FitFrame_0 = v1.FitFrame;
local v10 = require(script.Parent.UserAgreementsListItem);
local l_FFlagEnableModularizedUserAgreementsList_0 = v1.SharedFlags.FFlagEnableModularizedUserAgreementsList;
local l_GetFFlagVngTOSRevisedEnabled_0 = v1.SharedFlags.GetFFlagVngTOSRevisedEnabled;
local v13 = game:DefineFastFlag("AgreementItemsOrderFixEnabled", false);
local v14 = {
    REQUIRED = "REQUIRED", 
    OPTIONAL = "OPTIONAL"
};
local v15 = l_Roact_0.PureComponent:extend("UserAgreementsList");
v15.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.optional(l_t_0.integer), 
    agreements = l_t_0.array(l_t_0.strictInterface({
        id = l_t_0.string, 
        agreementType = l_t_0.string, 
        clientType = l_t_0.string, 
        displayUrl = l_t_0.string, 
        regulationType = l_t_0.string
    })), 
    checkBoxStates = l_t_0.optional(l_t_0.map(l_t_0.string, l_t_0.boolean)), 
    setCheckBoxStates = l_t_0.optional(l_t_0.callback), 
    separateRequiredOptional = l_t_0.optional(l_t_0.boolean), 
    margin = l_t_0.optional(l_t_0.strictInterface({
        top = l_t_0.integer, 
        right = l_t_0.integer, 
        bottom = l_t_0.integer, 
        left = l_t_0.integer
    })), 
    verticalSpaceOffset = l_t_0.optional(l_t_0.integer), 
    isAgreeAllChecked = l_t_0.optional(l_t_0.boolean), 
    useScrollableFrame = l_t_0.optional(l_t_0.boolean)
});
v15.defaultProps = {
    margin = l_FitFrame_0.Rect.square(0)
};
shouldCreateRowsForAgreementType = function(v16, v17) --[[ Line: 52 ]] --[[ Name: shouldCreateRowsForAgreementType ]]
    -- upvalues: v14 (copy)
    local l_agreementType_0 = v16.agreementType;
    local v19 = string.find(l_agreementType_0:lower(), "optional");
    if tostring(v17) == tostring(v14.REQUIRED) and not v19 or tostring(v17) == tostring(v14.OPTIONAL) and v19 then
        return true;
    else
        return false;
    end;
end;
updateTable = function(v20, v21, v22) --[[ Line: 67 ]] --[[ Name: updateTable ]]
    local v23 = table.clone(v20);
    v23[v21] = v22;
    return v23;
end;
v15.getListItemsWithCheckBoxes = function(v24, _, v26, v27, v28, v29, v30) --[[ Line: 75 ]] --[[ Name: getListItemsWithCheckBoxes ]]
    -- upvalues: v2 (copy), l_Roact_0 (copy), l_Checkbox_0 (copy), v10 (copy), l_GetFFlagVngTOSRevisedEnabled_0 (copy), l_FitFrame_0 (copy)
    local l_agreements_0 = v24.props.agreements;
    local v32 = {};
    local v33 = {};
    for _, v35 in pairs(l_agreements_0) do
        local l_agreementType_1 = v35.agreementType;
        if v2.CheckAgreementTypeExists(l_agreementType_1) then
            table.insert(v32, v35);
        else
            table.insert(v33, v35);
        end;
    end;
    local v37 = {
        v32, 
        v33
    };
    local v38 = {
        true, 
        false
    };
    local v39 = {};
    for v40, v41 in ipairs(v37) do
        for _, v43 in pairs(v41) do
            local v44 = v38[v40];
            local v45 = v29[v43.id];
            if shouldCreateRowsForAgreementType(v43, v27) then
                v26 = v26 + 1;
                v39["Item." .. v43.id] = l_Roact_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    LayoutOrder = v26
                }, {
                    Layout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    CheckboxFrame = l_Roact_0.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, v28.Global.Size_600, 1, 0), 
                        LayoutOrder = 1
                    }, {
                        Padding = l_Roact_0.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, v28.Global.Size_300), 
                            PaddingTop = UDim.new(0, v28.Global.Size_150)
                        }), 
                        Checkbox = l_Roact_0.createElement(l_Checkbox_0, {
                            Size = UDim2.new(1, 0, 1, 0), 
                            text = "", 
                            isSelected = v45, 
                            onActivated = function() --[[ Line: 133 ]] --[[ Name: onActivated ]]
                                -- upvalues: v45 (copy), v29 (copy), v43 (copy), v30 (copy)
                                local v46 = not v45;
                                local v47 = updateTable(v29, v43.id, v46);
                                v30(v47, v43.id, v46);
                            end
                        })
                    }), 
                    AgreementRow = l_Roact_0.createElement(v10, {
                        LayoutOrder = v26, 
                        Size = if not l_GetFFlagVngTOSRevisedEnabled_0() then UDim2.new(1, 0, 0, 55) else nil, 
                        minHeight = l_GetFFlagVngTOSRevisedEnabled_0() and 55 or nil, 
                        agreement = v43, 
                        agreementTypeExists = v44, 
                        margin = l_FitFrame_0.Rect.quad(0, v28.Global.Size_300, 0, v28.Global.Size_200), 
                        hideLink = true, 
                        checkBoxPresent = true
                    })
                });
            end;
        end;
    end;
    return v39;
end;
getTableCount = function(v48) --[[ Line: 161 ]] --[[ Name: getTableCount ]]
    local v49 = 0;
    for _ in pairs(v48) do
        v49 = v49 + 1;
    end;
    return v49;
end;
setLayoutOrder = function(v51, v52) --[[ Line: 170 ]] --[[ Name: setLayoutOrder ]]
    assert(type(v52) == "number", "Expected 'start' to be a number");
    local v53 = 0;
    local v54 = {};
    for _, v56 in pairs(v51) do
        for v57, _ in pairs(v56.props) do
            if v57 == "LayoutOrder" then
                v53 = v53 + 1;
                v56.props.LayoutOrder = v52 + v53;
                table.insert(v54, v56);
            end;
        end;
    end;
    return v54;
end;
v15.getListItems = function(v59, _) --[[ Line: 189 ]] --[[ Name: getListItems ]]
    -- upvalues: v2 (copy), v13 (copy), l_Roact_0 (copy), v10 (copy), l_GetFFlagVngTOSRevisedEnabled_0 (copy), l_FitFrame_0 (copy)
    local l_margin_0 = v59.props.margin;
    local l_agreements_1 = v59.props.agreements;
    local v63 = {};
    local v64 = {};
    for _, v66 in ipairs(l_agreements_1) do
        local l_agreementType_2 = v66.agreementType;
        if v2.CheckAgreementTypeExists(l_agreementType_2) then
            table.insert(v63, v66);
        else
            table.insert(v64, v66);
        end;
    end;
    local v68 = {
        v63, 
        v64
    };
    local v69 = {
        true, 
        false
    };
    local v70 = 0;
    local v71 = {};
    for v72, v73 in ipairs(v68) do
        for _, v75 in ipairs(v73) do
            local v76 = v69[v72];
            v70 = v70 + 1;
            if v13 then
                table.insert(v71, (l_Roact_0.createElement(v10, {
                    LayoutOrder = v70, 
                    Size = if not l_GetFFlagVngTOSRevisedEnabled_0() then UDim2.new(1, 0, 0, 55) else nil, 
                    minHeight = l_GetFFlagVngTOSRevisedEnabled_0() and 55 or nil, 
                    agreement = v75, 
                    agreementTypeExists = v76, 
                    margin = l_FitFrame_0.Rect.quad(0, l_margin_0.right, 0, l_margin_0.left)
                })));
            else
                v71["Item." .. v75.id] = l_Roact_0.createElement(v10, {
                    LayoutOrder = v70, 
                    Size = if not l_GetFFlagVngTOSRevisedEnabled_0() then UDim2.new(1, 0, 0, 55) else nil, 
                    minHeight = l_GetFFlagVngTOSRevisedEnabled_0() and 55 or nil, 
                    agreement = v75, 
                    agreementTypeExists = v76, 
                    margin = l_FitFrame_0.Rect.quad(0, l_margin_0.right, 0, l_margin_0.left)
                });
            end;
        end;
    end;
    return v71;
end;
v15.checkBoxPropsExist = function(v77) --[[ Line: 240 ]] --[[ Name: checkBoxPropsExist ]]
    local v78 = false;
    if v77.props.checkBoxStates ~= nil then
        v78 = false;
        if v77.props.setCheckBoxStates ~= nil then
            v78 = v77.props.isAgreeAllChecked ~= nil;
        end;
    end;
    return v78;
end;
v15.shouldReturnScrollableFrame = function(v79) --[[ Line: 246 ]] --[[ Name: shouldReturnScrollableFrame ]]
    -- upvalues: l_FFlagEnableModularizedUserAgreementsList_0 (copy)
    local v80 = v79.props.useScrollableFrame or false;
    return l_FFlagEnableModularizedUserAgreementsList_0 and v80;
end;
v15.render = function(v81) --[[ Line: 251 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_Roact_0 (copy), l_FitFrame_0 (copy), v14 (copy), l_withLocalization_0 (copy)
    return l_withStyle_0(function(v82) --[[ Line: 252 ]]
        -- upvalues: v81 (copy), l_Roact_0 (ref), l_FitFrame_0 (ref), v14 (ref), l_withLocalization_0 (ref)
        local l_Theme_0 = v82.Theme;
        local l_Font_0 = v82.Font;
        local l_LayoutOrder_0 = v81.props.LayoutOrder;
        local l_margin_1 = v81.props.margin;
        local v87 = v81:getListItems(l_Theme_0);
        if not v81:shouldReturnScrollableFrame() then
            return l_Roact_0.createElement(l_FitFrame_0.FitFrameVertical, {
                LayoutOrder = l_LayoutOrder_0, 
                BackgroundTransparency = 1, 
                width = UDim.new(1, 0), 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                margin = l_FitFrame_0.Rect.quad(l_margin_1.top, 0, l_margin_1.bottom, 0)
            }, v87);
        else
            local v88 = v81.props.separateRequiredOptional or false;
            local v89 = v81.props.verticalSpaceOffset or 0;
            local l_Tokens_0 = v82.Tokens;
            local v91 = {
                required = "CommonUI.UserAgreements.Popup.Agreement.Required", 
                optional = "CommonUI.UserAgreements.Popup.Agreement.Optional"
            };
            local v92 = {};
            local v93 = {};
            if v81:checkBoxPropsExist() then
                v92 = v81:getListItemsWithCheckBoxes(l_Theme_0, 0, v14.REQUIRED, l_Tokens_0, v81.props.checkBoxStates, v81.props.setCheckBoxStates);
                v93 = v81:getListItemsWithCheckBoxes(l_Theme_0, getTableCount(v87), v14.OPTIONAL, l_Tokens_0, v81.props.checkBoxStates, v81.props.setCheckBoxStates);
            else
                v92 = v81:getListItems(l_Theme_0);
            end;
            v92 = setLayoutOrder(v92, 1);
            v93 = setLayoutOrder(v93, getTableCount(v87) + 4);
            return l_withLocalization_0(v91)(function(v94) --[[ Line: 311 ]]
                -- upvalues: l_Roact_0 (ref), l_LayoutOrder_0 (copy), v89 (copy), v88 (copy), l_Tokens_0 (copy), v82 (copy), l_Font_0 (copy), v92 (ref), v87 (copy), v93 (ref)
                return l_Roact_0.createElement("ScrollingFrame", {
                    LayoutOrder = l_LayoutOrder_0, 
                    Size = UDim2.new(1, 0, 1, -v89), 
                    BackgroundTransparency = 1, 
                    ScrollingEnabled = true, 
                    BorderSizePixel = 0, 
                    CanvasSize = UDim2.new(1, 0, 1, 0), 
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    ScrollBarThickness = 2
                }, {
                    UIListLayout = l_Roact_0.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    RequiredTitleText = v88 and l_Roact_0.createElement("Frame", {
                        LayoutOrder = 0, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1
                    }, {
                        Padding = l_Roact_0.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, l_Tokens_0.Global.Size_300), 
                            PaddingTop = UDim.new(0, l_Tokens_0.Global.Size_100), 
                            PaddingBottom = UDim.new(0, l_Tokens_0.Global.Size_100)
                        }), 
                        TextLabel = l_Roact_0.createElement("TextLabel", {
                            BackgroundTransparency = 1, 
                            Text = v94.required, 
                            TextSize = l_Tokens_0.Global.FontSize_200, 
                            TextColor3 = l_Tokens_0.Semantic.Color.Text.Emphasis.Color3, 
                            TextTransparency = v82.Theme.TextDefault.Transparency, 
                            Font = l_Font_0.Header1.Font, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            TextWrapped = true, 
                            Size = UDim2.new(1, 0, 0, 0)
                        })
                    }), 
                    ItemsRequired = l_Roact_0.createFragment(v92), 
                    OptionalTitleText = v88 and l_Roact_0.createElement("Frame", {
                        LayoutOrder = getTableCount(v87) + 2, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1
                    }, {
                        Padding = l_Roact_0.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, l_Tokens_0.Global.Size_300), 
                            PaddingTop = UDim.new(0, l_Tokens_0.Global.Size_100), 
                            PaddingBottom = UDim.new(0, l_Tokens_0.Global.Size_100)
                        }), 
                        TextLabel = l_Roact_0.createElement("TextLabel", {
                            BackgroundTransparency = 1, 
                            Text = v94.optional, 
                            TextSize = l_Tokens_0.Global.FontSize_200, 
                            TextColor3 = l_Tokens_0.Semantic.Color.Text.Emphasis.Color3, 
                            TextTransparency = v82.Theme.TextDefault.Transparency, 
                            Font = l_Font_0.Header1.Font, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            TextWrapped = true, 
                            Size = UDim2.new(1, 0, 0, 0)
                        })
                    }), 
                    OptionalItems = v88 and l_Roact_0.createFragment(v93)
                });
            end);
        end;
    end);
end;
return v15;