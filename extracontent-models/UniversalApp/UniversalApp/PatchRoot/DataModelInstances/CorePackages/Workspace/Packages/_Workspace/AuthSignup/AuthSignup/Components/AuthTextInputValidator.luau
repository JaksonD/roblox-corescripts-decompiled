local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthSignup");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v6 = require(l_Parent_0.UIBlox);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_StyledTextLabel_0 = v6.App.Text.StyledTextLabel;
local v10 = require(l_Parent_0.Foundation);
local l_TextInput_0 = v10.TextInput;
local l_Text_0 = v10.Text;
local l_useTokens_0 = v10.Hooks.useTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v15 = require(l_Parent_0.AuthCommon);
local l_InputValidity_0 = v15.Enums.InputValidity;
local l_IssueCondition_0 = v15.Enums.IssueCondition;
local l_UIConstants_0 = v15.Common.UIConstants;
local v19 = require(l_script_FirstAncestor_0.Util.debounce);
local v20 = require(l_Parent_0.SharedFlags);
local l_GetFFlagEnableMultiPageSignupV2Updates_0 = v20.GetFFlagEnableMultiPageSignupV2Updates;
local l_GetFFlagEnableLuafiedRecoveryFlow_0 = v20.GetFFlagEnableLuafiedRecoveryFlow;
return function(v23) --[[ Line: 67 ]] --[[ Name: AuthTextInputValidator ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useTokens_0 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useStyle_0 (copy), v2 (copy), l_InputValidity_0 (copy), v19 (copy), l_GetFFlagEnableLuafiedRecoveryFlow_0 (copy), l_IssueCondition_0 (copy), l_GetFFlagEnableMultiPageSignupV2Updates_0 (copy), l_UIConstants_0 (copy), l_useLocalization_0 (copy), l_Text_0 (copy), l_StyledTextLabel_0 (copy), l_TextInput_0 (copy)
    local v24 = l_useDesignTokens_0();
    local v25 = l_useTokens_0();
    local v26 = l_useDispatch_0();
    local v27 = l_useRoactService_0(l_RoactNetworking_0);
    local v28 = l_useStyle_0();
    local v29, v30 = v2.useState("");
    local v31, v32 = v2.useState("");
    local v33, v34 = v2.useState(v23.validator.getDefaultIssues());
    local v35, v36 = v2.useState(true);
    local v37, v38 = v2.useState(l_InputValidity_0.Unvalidated);
    local v39, v40 = v2.useState(nil);
    local v41, v42 = v2.useState(false);
    local v44 = v2.useCallback(v19(function(v43) --[[ Line: 86 ]]
        -- upvalues: v32 (copy)
        v32(v43);
    end, v23.debounceTime or 0.5), {
        v32
    });
    v2.useEffect(function() --[[ Line: 91 ]]
        -- upvalues: v31 (copy), v29 (copy), v44 (copy)
        if v31 ~= v29 then
            v44(v29);
        end;
    end, {
        v29
    });
    local v45 = {
        v31
    };
    if l_GetFFlagEnableLuafiedRecoveryFlow_0() then
        local l_validationDependencies_0 = v23.validationDependencies;
        if l_validationDependencies_0 then
            for v47 = 1, #l_validationDependencies_0 do
                v45[#v45 + 1] = l_validationDependencies_0[v47];
            end;
        end;
    end;
    v2.useEffect(function() --[[ Line: 107 ]]
        -- upvalues: v31 (copy), v38 (copy), l_InputValidity_0 (ref), v34 (copy), v23 (copy), v26 (copy), v27 (copy), v33 (copy), v29 (copy), v30 (copy)
        if #v31 == 0 then
            v38(l_InputValidity_0.Unvalidated);
            v34(v23.validator.getDefaultIssues());
            return;
        else
            v26(v23.validator.validateFunction(v27, v31, v33, v23.validatorAdditionalProps)):andThen(function(v48) --[[ Line: 116 ]]
                -- upvalues: l_InputValidity_0 (ref), v29 (ref), v23 (ref), v34 (ref), v38 (ref), v30 (ref)
                local v49 = if v48.InputValid then l_InputValidity_0.Valid else l_InputValidity_0.Invalid;
                if v29 == v48.Input and v23.onTextChanged then
                    v23.onTextChanged(v48.Input, v49);
                end;
                v34(v48.IssueCondition);
                v38(v49);
                v30(v48.Input);
            end);
            return;
        end;
    end, v45);
    v2.useEffect(function() --[[ Line: 130 ]]
        -- upvalues: v37 (copy), l_InputValidity_0 (ref), v40 (copy), v23 (copy), v33 (copy), l_IssueCondition_0 (ref)
        if v37 ~= l_InputValidity_0.Invalid then
            v40(nil);
            return;
        else
            local v50 = nil;
            if v23.validatorIssuePriorityList then
                for _, v52 in ipairs(v23.validatorIssuePriorityList) do
                    if v33[v52] == l_IssueCondition_0.Problematic then
                        v50 = v52;
                        break;
                    end;
                end;
            else
                for v53, v54 in pairs(v33) do
                    if v54 == l_IssueCondition_0.Problematic then
                        v50 = v53;
                        break;
                    end;
                end;
            end;
            if v50 == nil then
                v40(nil);
                return;
            else
                if v23.onErrorShown then
                    v23.onErrorShown(v50);
                end;
                if v23.validatorIssueMessageList then
                    v40(v23.validatorIssueMessageList[v50]);
                    return;
                else
                    v40(v23.validator.getIssueMessageList()[v50]);
                    return;
                end;
            end;
        end;
    end, {
        v37
    });
    v2.useEffect(function() --[[ Line: 171 ]]
        -- upvalues: l_GetFFlagEnableMultiPageSignupV2Updates_0 (ref), v41 (copy), v23 (copy), v42 (copy)
        if l_GetFFlagEnableMultiPageSignupV2Updates_0() and v41 then
            local l_textBoxRef_0 = v23.textBoxRef;
            if l_textBoxRef_0.current and l_textBoxRef_0.current.focus then
                l_textBoxRef_0.current.focus();
            end;
            v42(false);
        end;
    end, {
        v41
    });
    local function v57(v56) --[[ Line: 184 ]]
        -- upvalues: v23 (copy), l_InputValidity_0 (ref), v38 (copy), v30 (copy)
        v23.onTextChanged(v56, l_InputValidity_0.Unvalidated);
        v38(l_InputValidity_0.Unvalidated);
        v30(v56);
    end;
    local function _() --[[ Line: 190 ]] --[[ Name: getTextInputType ]]
        -- upvalues: v23 (copy), v35 (copy)
        if v23.textInputType == Enum.TextInputType.Password then
            if v35 then
                return Enum.TextInputType.Password;
            else
                return Enum.TextInputType.PasswordShown;
            end;
        else
            return v23.textInputType;
        end;
    end;
    local function v59() --[[ Line: 200 ]] --[[ Name: getShowPasswordIconButton ]]
        -- upvalues: v23 (copy), v35 (copy), l_UIConstants_0 (ref), v36 (copy), l_GetFFlagEnableMultiPageSignupV2Updates_0 (ref), v42 (copy)
        if v23.textInputType == Enum.TextInputType.Password then
            if v35 then
                return l_UIConstants_0.HIDE_PASSWORD_ICON, function() --[[ Line: 204 ]]
                    -- upvalues: v36 (ref), l_GetFFlagEnableMultiPageSignupV2Updates_0 (ref), v42 (ref)
                    v36(false);
                    if l_GetFFlagEnableMultiPageSignupV2Updates_0() then
                        v42(true);
                    end;
                end;
            else
                return l_UIConstants_0.SHOW_PASSWORD_ICON, function() --[[ Line: 212 ]]
                    -- upvalues: v36 (ref), l_GetFFlagEnableMultiPageSignupV2Updates_0 (ref), v42 (ref)
                    v36(true);
                    if l_GetFFlagEnableMultiPageSignupV2Updates_0() then
                        v42(true);
                    end;
                end;
            end;
        else
            return nil, nil;
        end;
    end;
    local v60 = l_useLocalization_0({
        errorText = v39
    });
    local v61, v62 = v59();
    local v63 = if v37 == l_InputValidity_0.Invalid and l_GetFFlagEnableLuafiedRecoveryFlow_0() and v23.useFoundationTextForIssue then v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v25.Size.Size_200), 
        BackgroundTransparency = 1
    }, {
        IssuePadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v23.foundationIssueTextPadding or 0)
        }), 
        IssueText = v2.createElement(l_Text_0, {
            Text = v60.errorText or "", 
            fontStyle = v25.Typography.CaptionSmall, 
            textStyle = v25.Color.System.Alert, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    }) else if v37 == l_InputValidity_0.Invalid then v2.createElement(l_StyledTextLabel_0, {
        text = v60.errorText or "", 
        fontStyle = v28.Font.BodySmall, 
        colorStyle = v28.Theme.Alert, 
        automaticSize = Enum.AutomaticSize.XY, 
        textWrapped = true
    }) else nil;
    local l_Space_50_0 = v24.Global.Space_50;
    if l_GetFFlagEnableLuafiedRecoveryFlow_0() then
        l_Space_50_0 = v23.customPadding or v24.Global.Space_50;
    end;
    local l_createElement_0 = v2.createElement;
    local v66 = "Frame";
    local v67 = {
        LayoutOrder = v23.layoutOrder, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    };
    local v68 = {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, l_Space_50_0), 
            HorizontalFlex = Enum.UIFlexAlignment.Fill
        })
    };
    local l_createElement_1 = v2.createElement;
    local l_l_TextInput_0_0 = l_TextInput_0;
    local v71 = {
        LayoutOrder = 1, 
        textInputType = if v23.textInputType == Enum.TextInputType.Password then if v35 then Enum.TextInputType.Password else Enum.TextInputType.PasswordShown else v23.textInputType, 
        width = UDim.new(1, 0), 
        text = v23.initialText or "", 
        placeholder = v23.placeholder, 
        onChanged = v57, 
        iconTrailing = if l_GetFFlagEnableLuafiedRecoveryFlow_0() and v23.hideIconButton then nil else if v61 then {
            name = v61, 
            onActivated = v62
        } else nil, 
        label = ""
    };
    local v72 = false;
    if v37 == l_InputValidity_0.Invalid then
        v72 = #v29 > 0;
    end;
    v71.hasError = v72;
    v71.textBoxRef = v23.textBoxRef;
    v71.size = v23.size;
    v68.TextInputBox = l_createElement_1(l_l_TextInput_0_0, v71);
    v68.IssueWrapper = v2.createElement("Frame", {
        LayoutOrder = 3, 
        Size = UDim2.new(1, 0, 0, l_GetFFlagEnableLuafiedRecoveryFlow_0() and v23.issueHeight or v24.Global.Space_200), 
        BackgroundTransparency = 1
    }, {
        Issue = v63
    });
    return l_createElement_0(v66, v67, v68);
end;