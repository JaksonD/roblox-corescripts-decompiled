local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.RoactRodux);
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v6 = require(l_Parent_0.t);
local v7 = require(l_Parent_0.tutils);
local v8 = require(l_Parent_0.ArgCheck);
local v9 = require(l_Parent_0.UIBlox);
local l_withStyle_0 = v9.Style.withStyle;
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local v12 = require(l_script_FirstAncestor_0.Components.FitChildren);
local v13 = require(l_script_FirstAncestor_0.Components.FitTextLabel);
local l_ImageSetLabel_0 = v9.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_Parent_0.RobloxAppAssets).GetImageData;
local v16 = require(l_script_FirstAncestor_0.Components.Logger);
local v17 = require(l_script_FirstAncestor_0.Enums.IssueCondition);
local v18 = require(l_script_FirstAncestor_0.Enums.InputValidity);
local v19 = v2.createBinding(0);
local v20 = v6.interface({
    validateFunction = v6.callback, 
    getIssueMessageList = v6.callback, 
    getDefaultIssues = v6.callback
});
local v21 = v2.PureComponent:extend("IssueTracker");
local v22 = require(l_Parent_0.SharedFlags);
local l_FFlagSignUpTrackFailedRequest_0 = v22.FFlagSignUpTrackFailedRequest;
local l_FFlagLuaEnableIssueTrackerSorting_0 = v22.FFlagLuaEnableIssueTrackerSorting;
v21.init = function(v25) --[[ Line: 51 ]] --[[ Name: init ]]
    -- upvalues: v20 (copy), v17 (copy), v18 (copy), v2 (copy), l_FFlagSignUpTrackFailedRequest_0 (copy), v16 (copy), v7 (copy)
    local l_validator_0 = v25.props.validator;
    assert(v20(l_validator_0));
    local v27 = l_validator_0.getIssueMessageList();
    local v28 = l_validator_0.getDefaultIssues();
    local v29 = {};
    for v30 in pairs(v27) do
        local v31 = false;
        if v28[v30] ~= v17.Hidden then
            v31 = true;
        end;
        v29[v30] = v31;
    end;
    v25.state = {
        listOfIssuesOnDisplay = v29, 
        issueMessageList = v27, 
        issueCondition = v28, 
        inputValidity = v18.Unvalidated
    };
    v25.isMounted = false;
    v25.containerRef = v2.createRef();
    v25.validateText = function() --[[ Line: 78 ]]
        -- upvalues: v25 (copy), v20 (ref), l_validator_0 (copy), v18 (ref), l_FFlagSignUpTrackFailedRequest_0 (ref), v16 (ref)
        local l_networking_0 = v25.props.networking;
        local l_textToValidate_0 = v25.props.textToValidate;
        local l_validate_0 = v25.props.validate;
        local l_validatorAdditionalProps_0 = v25.props.validatorAdditionalProps;
        local l_issueCondition_0 = v25.state.issueCondition;
        assert(v20(l_validator_0));
        l_validate_0(l_networking_0, l_validator_0.validateFunction, l_textToValidate_0, l_issueCondition_0, l_validatorAdditionalProps_0):andThen(function(v37) --[[ Line: 91 ]]
            -- upvalues: v25 (ref), v18 (ref), l_FFlagSignUpTrackFailedRequest_0 (ref)
            spawn(function() --[[ Line: 92 ]]
                -- upvalues: v25 (ref), v18 (ref), v37 (copy), l_FFlagSignUpTrackFailedRequest_0 (ref)
                local l_onTextValidated_0 = v25.props.onTextValidated;
                local l_textToValidate_1 = v25.props.textToValidate;
                local l_Invalid_0 = v18.Invalid;
                if v25.isMounted and v37.Input == l_textToValidate_1 then
                    if l_textToValidate_1 == "" then
                        l_Invalid_0 = v18.Unvalidated;
                    elseif v37.InputValid then
                        l_Invalid_0 = v18.Valid;
                    end;
                    if l_onTextValidated_0 then
                        if l_FFlagSignUpTrackFailedRequest_0 then
                            l_onTextValidated_0(v37.Input, l_Invalid_0, v37.hasRequestFailed);
                        else
                            l_onTextValidated_0(v37.Input, l_Invalid_0);
                        end;
                    end;
                    v25:setState({
                        issueCondition = v37.IssueCondition, 
                        inputValidity = l_Invalid_0
                    });
                    if v25.props.updateIssueCondition then
                        v25.props.updateIssueCondition(v37.IssueCondition);
                    end;
                end;
            end);
        end, function(v41) --[[ Line: 124 ]]
            -- upvalues: v16 (ref), v25 (ref), v18 (ref)
            v16:warning(string.format("Input issueTracker error: %s", (tostring(v41))));
            v25:setState({
                inputValidity = v18.Unvalidated
            });
        end);
    end;
    v25.updateListOfIssuesOnDisplay = function() --[[ Line: 134 ]]
        -- upvalues: v25 (copy), v17 (ref), v7 (ref)
        local l_height_0 = v25.props.height;
        local l_issueMessageList_0 = v25.state.issueMessageList;
        local l_issueCondition_1 = v25.state.issueCondition;
        local v45 = 0;
        local v46 = {};
        local v47 = {};
        local v48 = {};
        local v49 = {};
        local v50 = v25.containerRef.current and v25.containerRef.current:GetChildren() or {};
        for _, v52 in pairs(v50) do
            if v52:IsA("GuiObject") then
                v49[v52.Name] = v52.AbsoluteSize.Y;
            end;
        end;
        for v53 in pairs(l_issueMessageList_0) do
            v46[v53] = false;
            local v54 = l_issueCondition_1[v53] == v17.Problematic;
            if l_issueCondition_1[v53] ~= v17.Hidden then
                local v55 = v49[v53] or 0;
                table.insert(v47, v53);
                v45 = v45 + v55;
                if not v54 then
                    table.insert(v48, #v47);
                end;
            end;
        end;
        v45 = v45 + (#v47 - 1) * 5;
        if l_height_0 then
            for v56 = #v48, 1, -1 do
                if l_height_0 < v45 then
                    local v57 = v48[v56];
                    v45 = v45 - (v49[v47[v57]] or 0) - 5;
                    table.remove(v47, v57);
                else
                    break;
                end;
            end;
            for v58 = #v47, 1, -1 do
                if l_height_0 < v45 then
                    v45 = v45 - (v49[v47[v58]] or 0) - 5;
                    table.remove(v47, v58);
                else
                    break;
                end;
            end;
        end;
        for _, v60 in pairs(v47) do
            v46[v60] = true;
        end;
        spawn(function() --[[ Line: 210 ]]
            -- upvalues: v25 (ref), v7 (ref), v46 (copy)
            if v25.isMounted and not v7.shallowEqual(v46, v25.state.listOfIssuesOnDisplay) then
                v25:setState({
                    listOfIssuesOnDisplay = v46
                });
            end;
        end);
    end;
end;
v21.didMount = function(v61) --[[ Line: 222 ]] --[[ Name: didMount ]]
    v61.isMounted = true;
    v61.updateListOfIssuesOnDisplay();
end;
v21.willUnmount = function(v62) --[[ Line: 227 ]] --[[ Name: willUnmount ]]
    v62.isMounted = false;
end;
v21.didUpdate = function(v63, v64, _) --[[ Line: 231 ]] --[[ Name: didUpdate ]]
    -- upvalues: v8 (copy), v7 (copy), l_FFlagSignUpTrackFailedRequest_0 (copy)
    local l_validator_1 = v63.props.validator;
    local l_validatorAdditionalProps_1 = v63.props.validatorAdditionalProps;
    local l_textToValidate_2 = v63.props.textToValidate;
    if l_validator_1 ~= v64.validator then
        v8.assert(l_validator_1 == v64.validator, "IssueTracker expects the validator to never change");
    end;
    if l_textToValidate_2 ~= v64.textToValidate or not v7.shallowEqual(l_validatorAdditionalProps_1, v64.validatorAdditionalProps) then
        spawn(function() --[[ Line: 244 ]]
            -- upvalues: l_FFlagSignUpTrackFailedRequest_0 (ref), v63 (copy), l_textToValidate_2 (copy)
            if l_FFlagSignUpTrackFailedRequest_0 then
                task.wait(if v63.props.debounceTime then v63.props.debounceTime else 0.3);
            else
                wait(0.3);
            end;
            if v63.props.textToValidate == l_textToValidate_2 then
                v63.validateText();
            end;
        end);
    end;
    v63.updateListOfIssuesOnDisplay();
end;
v21.render = function(v69) --[[ Line: 260 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v19 (copy), v2 (copy), l_FFlagLuaEnableIssueTrackerSorting_0 (copy), v17 (copy), l_withLocalization_0 (copy), v18 (copy), v12 (copy), l_ImageSetLabel_0 (copy), l_GetImageData_0 (copy), v13 (copy)
    local l_height_1 = v69.props.height;
    local l_issueMessageList_1 = v69.state.issueMessageList;
    local l_issueCondition_2 = v69.state.issueCondition;
    local l_listOfIssuesOnDisplay_0 = v69.state.listOfIssuesOnDisplay;
    return l_withStyle_0(function(v74) --[[ Line: 268 ]]
        -- upvalues: v69 (copy), v19 (ref), v2 (ref), l_issueMessageList_1 (copy), l_FFlagLuaEnableIssueTrackerSorting_0 (ref), l_issueCondition_2 (copy), v17 (ref), l_withLocalization_0 (ref), v18 (ref), v12 (ref), l_listOfIssuesOnDisplay_0 (copy), l_ImageSetLabel_0 (ref), l_GetImageData_0 (ref), v13 (ref), l_height_1 (copy)
        local l_Font_0 = v74.Font.CaptionBody.Font;
        local v76 = v74.Font.BaseSize * v74.Font.CaptionBody.RelativeSize;
        local l_contentTransparency_0 = v69.props.contentTransparency;
        local v78 = v69.props.checkmarkTransparency or v19;
        if not l_contentTransparency_0 then
            local l_Transparency_0 = v74.Theme.TextDefault.Transparency;
            if l_Transparency_0 ~= v69.textDefaultTransparency then
                v69.textDefaultTransparency = l_Transparency_0;
                v69.textDefaultTransparencyBinding = v2.createBinding(l_Transparency_0);
            end;
            l_contentTransparency_0 = v69.textDefaultTransparencyBinding;
        end;
        local v80 = v2.joinBindings({
            content = l_contentTransparency_0, 
            checkmark = v78
        });
        local v81 = {};
        for v82 in pairs(l_issueMessageList_1) do
            table.insert(v81, v82);
        end;
        if l_FFlagLuaEnableIssueTrackerSorting_0 and v69.props.sortProblematicIssues then
            table.sort(v81, function(v83, v84) --[[ Line: 294 ]]
                -- upvalues: l_issueCondition_2 (ref), v17 (ref)
                if l_issueCondition_2[v83] == v17.Problematic and l_issueCondition_2[v84] ~= v17.Problematic then
                    return true;
                else
                    return false;
                end;
            end);
        end;
        if l_FFlagLuaEnableIssueTrackerSorting_0 then
            return l_withLocalization_0(l_issueMessageList_1)(function(v85) --[[ Line: 307 ]]
                -- upvalues: v2 (ref), v69 (ref), v81 (copy), l_issueCondition_2 (ref), v17 (ref), v18 (ref), v12 (ref), l_listOfIssuesOnDisplay_0 (ref), l_ImageSetLabel_0 (ref), l_GetImageData_0 (ref), v74 (copy), v80 (copy), v13 (ref), l_Font_0 (copy), v76 (copy), l_contentTransparency_0 (ref), l_height_1 (ref), v78 (copy)
                local v86 = {
                    v2.createElement("UIListLayout", {
                        Padding = UDim.new(0, 5), 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        [v2.Change.AbsoluteContentSize] = v69.updateListOfIssuesOnDisplay
                    })
                };
                for v87, v88 in ipairs(v81) do
                    local v89 = l_issueCondition_2[v88] == v17.Problematic;
                    local v90 = v89 and v69.state.inputValidity ~= v18.Unvalidated;
                    v86[v88] = v2.createElement(v12.FitFrame, {
                        Size = UDim2.new(1, 0, 0, 0), 
                        fitAxis = v12.FitAxis.Height, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = v87, 
                        Visible = l_listOfIssuesOnDisplay_0[v88]
                    }, {
                        List = v2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            Padding = UDim.new(0, 7), 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        CheckHolder = v2.createElement("Frame", {
                            Size = UDim2.new(0, 12, 0, 12), 
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1
                        }, {
                            CheckMark = v2.createElement(l_ImageSetLabel_0, {
                                BackgroundTransparency = 1, 
                                Image = if v89 then l_GetImageData_0("LuaApp/icons/navigation/close") or "LuaApp/icons/navigation/close" else l_GetImageData_0("LuaApp/icons/progress_small") or "LuaApp/icons/progress_small", 
                                ImageColor3 = v90 and v74.Theme.Alert.Color or v74.Theme.TextDefault.Color, 
                                ImageTransparency = v80:map(function(v91) --[[ Line: 344 ]]
                                    return (v91.content - 1) * (1 - v91.checkmark) + 1;
                                end), 
                                Size = UDim2.new(1, 0, 1, 0), 
                                Position = UDim2.new(0.5, 0, 0.65, 0), 
                                AnchorPoint = Vector2.new(0.5, 0.5)
                            })
                        }), 
                        IssueLabel = v2.createElement(v13, {
                            LayoutOrder = 2, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            fitAxis = v12.FitAxis.Height, 
                            BackgroundTransparency = 1, 
                            Text = v85[v88], 
                            TextWrapped = true, 
                            Font = l_Font_0, 
                            TextSize = v76, 
                            TextColor3 = v90 and v74.Theme.Alert.Color or v74.Theme.TextDefault.Color, 
                            TextTransparency = l_contentTransparency_0, 
                            TextXAlignment = Enum.TextXAlignment.Left
                        })
                    });
                end;
                if l_height_1 then
                    return v2.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, l_height_1), 
                        BackgroundTransparency = 1, 
                        [v2.Ref] = v69.containerRef, 
                        Position = v78:map(function(v92) --[[ Line: 374 ]]
                            return UDim2.new(0, 19 * -v92, 0, 0);
                        end)
                    }, v86);
                else
                    return v2.createElement(v12.FitFrame, {
                        Size = UDim2.new(1, 0, 0, 0), 
                        fitAxis = v12.FitAxis.Height, 
                        BackgroundTransparency = 1, 
                        [v2.Ref] = v69.containerRef, 
                        Position = v78:map(function(v93) --[[ Line: 384 ]]
                            return UDim2.new(0, 19 * -v93, 0, 0);
                        end)
                    }, v86);
                end;
            end);
        else
            return l_withLocalization_0(l_issueMessageList_1)(function(v94) --[[ Line: 392 ]]
                -- upvalues: v2 (ref), v69 (ref), l_issueMessageList_1 (ref), l_issueCondition_2 (ref), v17 (ref), v18 (ref), v12 (ref), l_listOfIssuesOnDisplay_0 (ref), l_ImageSetLabel_0 (ref), l_GetImageData_0 (ref), v74 (copy), v80 (copy), v13 (ref), l_Font_0 (copy), v76 (copy), l_contentTransparency_0 (ref), l_height_1 (ref), v78 (copy)
                local v95 = {
                    v2.createElement("UIListLayout", {
                        Padding = UDim.new(0, 5), 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        [v2.Change.AbsoluteContentSize] = v69.updateListOfIssuesOnDisplay
                    })
                };
                for v96, v97 in pairs(l_issueMessageList_1) do
                    local v98 = l_issueCondition_2[v96] == v17.Problematic;
                    local v99 = v98 and v69.state.inputValidity ~= v18.Unvalidated;
                    v95[v96] = v2.createElement(v12.FitFrame, {
                        Size = UDim2.new(1, 0, 0, 0), 
                        fitAxis = v12.FitAxis.Height, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = string.byte(v97, #v97), 
                        Visible = l_listOfIssuesOnDisplay_0[v96]
                    }, {
                        List = v2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            Padding = UDim.new(0, 7), 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        CheckHolder = v2.createElement("Frame", {
                            Size = UDim2.new(0, 12, 0, 12), 
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1
                        }, {
                            CheckMark = v2.createElement(l_ImageSetLabel_0, {
                                BackgroundTransparency = 1, 
                                Image = if v98 then l_GetImageData_0("LuaApp/icons/navigation/close") or "LuaApp/icons/navigation/close" else l_GetImageData_0("LuaApp/icons/progress_small") or "LuaApp/icons/progress_small", 
                                ImageColor3 = v99 and v74.Theme.Alert.Color or v74.Theme.TextDefault.Color, 
                                ImageTransparency = v80:map(function(v100) --[[ Line: 429 ]]
                                    return (v100.content - 1) * (1 - v100.checkmark) + 1;
                                end), 
                                Size = UDim2.new(1, 0, 1, 0), 
                                Position = UDim2.new(0.5, 0, 0.65, 0), 
                                AnchorPoint = Vector2.new(0.5, 0.5)
                            })
                        }), 
                        IssueLabel = v2.createElement(v13, {
                            LayoutOrder = 2, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            fitAxis = v12.FitAxis.Height, 
                            BackgroundTransparency = 1, 
                            Text = v94[v96], 
                            TextWrapped = true, 
                            Font = l_Font_0, 
                            TextSize = v76, 
                            TextColor3 = v99 and v74.Theme.Alert.Color or v74.Theme.TextDefault.Color, 
                            TextTransparency = l_contentTransparency_0, 
                            TextXAlignment = Enum.TextXAlignment.Left
                        })
                    });
                end;
                if l_height_1 then
                    return v2.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, l_height_1), 
                        BackgroundTransparency = 1, 
                        [v2.Ref] = v69.containerRef, 
                        Position = v78:map(function(v101) --[[ Line: 459 ]]
                            return UDim2.new(0, 19 * -v101, 0, 0);
                        end)
                    }, v95);
                else
                    return v2.createElement(v12.FitFrame, {
                        Size = UDim2.new(1, 0, 0, 0), 
                        fitAxis = v12.FitAxis.Height, 
                        BackgroundTransparency = 1, 
                        [v2.Ref] = v69.containerRef, 
                        Position = v78:map(function(v102) --[[ Line: 469 ]]
                            return UDim2.new(0, 19 * -v102, 0, 0);
                        end)
                    }, v95);
                end;
            end);
        end;
    end);
end;
v21 = v3.connect(nil, function(v103) --[[ Line: 478 ]]
    return {
        validate = function(v104, v105, v106, v107, v108) --[[ Line: 480 ]] --[[ Name: validate ]]
            -- upvalues: v103 (copy)
            return v103(v105(v104, v106, v107, v108));
        end
    };
end)(v21);
return (l_RoactServices_0.connect({
    networking = l_RoactNetworking_0
})(v21));