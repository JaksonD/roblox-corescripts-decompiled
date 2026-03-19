local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_TextArea_0 = v3.TextArea;
local v7 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v8 = require(l_script_FirstAncestor_0.Common.Constants);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
return function(v10) --[[ Line: 23 ]]
    -- upvalues: l_useLocalization_0 (copy), v7 (copy), v2 (copy), v8 (copy), l_View_0 (copy), l_Text_0 (copy), l_TextArea_0 (copy)
    local v11 = l_useLocalization_0({
        AboutModalCaption = v7.AboutModalCaption, 
        AboutPlaceholder = v7.AboutPlaceholder, 
        PinLocked = v7.PinLocked, 
        ThrottleError = v7.TooManyAttemptsTryAgainLater
    });
    local v12, v13 = v2.useState(v10.bioText);
    local v14, v15 = v2.useState(string.len(v10.bioText) >= 1000);
    local function _(v16) --[[ Line: 34 ]] --[[ Name: textChanged ]]
        -- upvalues: v13 (copy), v15 (copy), v10 (copy)
        local v17 = string.len(v16);
        v13(v16);
        v15(v17 > 1000);
        if v10.onDataChange then
            v10.onDataChange((string.sub(v16, 1, 1000)));
        end;
    end;
    local v19 = if v10.errorCode == v8.DescriptionErrorCodes.PinLocked then v11.PinLocked else v11.ThrottleError;
    return v2.createElement(l_View_0, {
        tag = "col size-full-0 auto-y gap-large"
    }, {
        Caption = v2.createElement(l_Text_0, {
            tag = "text-body-medium text-wrap size-full-0 auto-y text-align-x-left", 
            Text = v11.AboutModalCaption
        }), 
        BioTextArea = v2.createElement(l_TextArea_0, {
            text = v12, 
            width = UDim.new(1, 0), 
            onChanged = function(v20) --[[ Line: 60 ]] --[[ Name: onChanged ]]
                -- upvalues: v13 (copy), v15 (copy), v10 (copy)
                local v21 = string.len(v20);
                v13(v20);
                v15(v21 > 1000);
                if v10.onDataChange then
                    v10.onDataChange((string.sub(v20, 1, 1000)));
                end;
            end, 
            hint = if v10.errorCode then v19 else string.format("%d/%d", string.len(v12), 1000), 
            placeholder = v11.AboutPlaceholder, 
            label = "", 
            hasError = v14 or v10.errorCode ~= nil, 
            numLines = 4, 
            textBoxRef = v10.textBoxRef
        })
    });
end;