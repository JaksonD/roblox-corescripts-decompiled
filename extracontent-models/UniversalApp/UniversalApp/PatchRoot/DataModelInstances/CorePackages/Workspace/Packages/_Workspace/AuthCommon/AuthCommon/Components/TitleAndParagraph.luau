local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.RoactRodux);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local v6 = require(l_Parent_0.ArgCheck);
local v7 = require(l_script_FirstAncestor_0.Components.FitChildren);
local v8 = require(l_script_FirstAncestor_0.Components.FitTextLabel);
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local v10 = v2.PureComponent:extend("TitleAndParagraph");
local v11 = require(l_script_FirstAncestor_0.Components.RegisterAuditContent);
local l_GetFFlagEnableAuditForSinglePageSignUp_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableAuditForSinglePageSignUp;
v10.defaultProps = {
    layoutOrder = 0, 
    textXAlignment = Enum.TextXAlignment.Left, 
    paragraphTextKeys = {}, 
    paragraphTextArgs = {}
};
v10.init = function(v13) --[[ Line: 34 ]] --[[ Name: init ]]
    v13.parametersCache = {};
end;
v10.getCachedParameters = function(v14, v15, v16) --[[ Line: 39 ]] --[[ Name: getCachedParameters ]]
    if type(v16) ~= "table" then
        return nil;
    else
        local v17 = v14.parametersCache[v15];
        if v17 then
            return v17;
        else
            local v18 = {};
            for v19, v20 in pairs(v16) do
                if type(v19) == "string" then
                    v18[v19] = tostring(v20);
                end;
            end;
            v14.parametersCache[v15] = v18;
            return v18;
        end;
    end;
end;
local function _(v21) --[[ Line: 66 ]]
    return "paragraphText" .. tostring(v21);
end;
v10.render = function(v23) --[[ Line: 70 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), l_GetFFlagEnableAuditForSinglePageSignUp_0 (copy), l_withLocalization_0 (copy), l_withStyle_0 (copy), l_FormFactor_0 (copy), v2 (copy), v8 (copy), v7 (copy), v11 (copy)
    local l_formFactor_0 = v23.props.formFactor;
    local l_layoutOrder_0 = v23.props.layoutOrder;
    local l_titleTextKey_0 = v23.props.titleTextKey;
    local l_paragraphTextKeys_0 = v23.props.paragraphTextKeys;
    local l_width_0 = v23.props.width;
    local l_textXAlignment_0 = v23.props.textXAlignment;
    v6.isType(l_paragraphTextKeys_0, "table", "TitleAndParagraph expects paragraphTextKeys to be a table.");
    local v30 = UDim2.new(1, 0, 0, 0);
    if l_width_0 then
        v30 = UDim2.new(0, l_width_0, 0, 0);
    end;
    local v31 = {
        titleText = l_titleTextKey_0
    };
    for v32, v33 in ipairs(l_paragraphTextKeys_0) do
        v31["paragraphText" .. tostring(v32)] = v33;
    end;
    if l_GetFFlagEnableAuditForSinglePageSignUp_0() and v23.props.enableAuditContentCapture then
        v31.verificationLinkingTextTemplate = "Authentication.SignUp.Description.VerificationLinkingText.VariableButtonName";
    end;
    return l_withLocalization_0(v31)(function(v34) --[[ Line: 99 ]]
        -- upvalues: l_withStyle_0 (ref), l_formFactor_0 (copy), l_FormFactor_0 (ref), v2 (ref), v8 (ref), l_textXAlignment_0 (copy), v7 (ref), l_paragraphTextKeys_0 (copy), l_GetFFlagEnableAuditForSinglePageSignUp_0 (ref), v23 (copy), v11 (ref), l_layoutOrder_0 (copy), v30 (ref)
        return l_withStyle_0(function(v35) --[[ Line: 100 ]]
            -- upvalues: l_formFactor_0 (ref), l_FormFactor_0 (ref), v2 (ref), v34 (copy), v8 (ref), l_textXAlignment_0 (ref), v7 (ref), l_paragraphTextKeys_0 (ref), l_GetFFlagEnableAuditForSinglePageSignUp_0 (ref), v23 (ref), v11 (ref), l_layoutOrder_0 (ref), v30 (ref)
            local v36 = v35.Font.BaseSize * v35.Font.Title.RelativeSize;
            local l_Font_0 = v35.Font.Title.Font;
            local v38 = 12;
            local v39 = v35.Font.BaseSize * v35.Font.Body.RelativeSize;
            local l_Font_1 = v35.Font.Body.Font;
            if l_formFactor_0 == l_FormFactor_0.COMPACT then
                v36 = v35.Font.BaseSize * v35.Font.Title.RelativeMinSize;
                v38 = 5;
                v39 = v35.Font.BaseSize * v35.Font.Body.RelativeMinSize;
            end;
            local v41 = 0;
            local v42 = {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v38)
                }), 
                Title = v34.titleText and v2.createElement(v8, {
                    LayoutOrder = v41, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    TextXAlignment = l_textXAlignment_0, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    Text = v34.titleText, 
                    TextSize = v36, 
                    Font = l_Font_0, 
                    TextColor3 = v35.Theme.SystemPrimaryDefault.Color, 
                    TextTransparency = v35.Theme.SystemPrimaryDefault.Transparency, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    fitAxis = v7.FitAxis.Height, 
                    TextWrapped = true
                })
            };
            for v43, v44 in ipairs(l_paragraphTextKeys_0) do
                v41 = v41 + 1;
                local v45 = "paragraphText" .. tostring(v43);
                local v46 = v34[v45];
                v42[v45] = v2.createElement(v8, {
                    LayoutOrder = v41, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    TextXAlignment = l_textXAlignment_0, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    Text = v46, 
                    TextSize = v39, 
                    Font = l_Font_1, 
                    TextColor3 = v35.Theme.TextDefault.Color, 
                    TextTransparency = v35.Theme.TextDefault.Transparency, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    fitAxis = v7.FitAxis.Height, 
                    TextWrapped = true
                });
                if l_GetFFlagEnableAuditForSinglePageSignUp_0() and v23.props.enableAuditContentCapture and v11 and v46 then
                    local v47 = "AuditContent_" .. v45;
                    local v48 = if type(v44) == "table" then v44[1] else v44;
                    local v49 = if type(v44) == "table" then v34.verificationLinkingTextTemplate else v46;
                    v42[v47] = v2.createElement(v11, {
                        translationKey = v48, 
                        translatedSourceString = v49, 
                        parameters = v23:getCachedParameters(v47, v44)
                    });
                end;
            end;
            return v2.createElement(v7.FitFrame, {
                LayoutOrder = l_layoutOrder_0, 
                Size = v30, 
                fitAxis = v7.FitAxis.Height, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, v42);
        end);
    end);
end;
return (v3.connect(function(v50, _) --[[ Line: 195 ]]
    return {
        formFactor = v50.FormFactor
    };
end)(v10));