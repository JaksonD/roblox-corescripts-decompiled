local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_Components_0 = l_script_FirstAncestor_0.Components;
local v4 = require(l_Components_0.HintText);
local v5 = require(l_Components_0.InputLabel);
local _ = require(l_Components_0.Types);
local v7 = require(l_Components_0.View);
local v8 = require(l_script_FirstAncestor_0.Utility.Flags);
local v9 = require(l_script_FirstAncestor_0.Utility.useScaledValue);
local v10 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v11 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v12 = require(l_script_FirstAncestor_0.Constants);
local v13 = require(l_script_FirstAncestor_0.Enums.InputLabelSize);
local v14 = {
    width = if v8.FoundationInputFieldTokenBasedWidth then nil else UDim.new(0, 400), 
    size = v13.Small, 
    testId = "--foundation-input-field"
};
return v2.memo(v2.forwardRef(function(v15, v16) --[[ Line: 47 ]] --[[ Name: InputField ]]
    -- upvalues: v8 (copy), v14 (copy), v11 (copy), v9 (copy), v12 (copy), v2 (copy), v7 (copy), v10 (copy), v5 (copy), v4 (copy)
    if v8.FoundationInputFieldTokenBasedWidth then
        v14.width = nil;
    else
        v14.width = UDim.new(0, 400);
    end;
    local v17 = v11(v15, v14);
    local v18 = nil;
    v18 = if v8.FoundationInputFieldTokenBasedWidth then v9(v12.DEFAULT_INPUT_FIELD_WIDTH_PIXELS) else 400;
    local v19 = v2.useRef(nil);
    local v20 = v2.useCallback(function() --[[ Line: 65 ]]
        -- upvalues: v19 (copy)
        if v19.current and not v19.current.getIsFocused() then
            v19.current.focus();
        end;
    end, {});
    local v22 = v2.useCallback(function(v21) --[[ Line: 71 ]]
        -- upvalues: v19 (copy)
        if v19.current then
            v19.current.setHover(v21);
        end;
    end, {});
    v2.useImperativeHandle(v17.textBoxRef, function() --[[ Line: 77 ]]
        -- upvalues: v19 (copy)
        if not v19.current then
            return nil;
        else
            return {
                focus = v19.current.focus, 
                releaseFocus = v19.current.releaseFocus, 
                getIsFocused = v19.current.getIsFocused, 
                getCursorPosition = v19.current.getCursorPosition, 
                getSelectionStart = v19.current.getSelectionStart, 
                setCursorPosition = v19.current.setCursorPosition, 
                setSelectionStart = v19.current.setSelectionStart
            };
        end;
    end, {});
    return v2.createElement(v7, v10(v17, {
        Size = if not v8.FoundationInputFieldTokenBasedWidth or v17.width then UDim2.new(v17.width, UDim.new(0, 0)) else UDim2.fromOffset(v18, 0), 
        tag = "col gap-small auto-y", 
        ref = v16
    }), {
        Label = if #v17.label > 0 then v2.createElement(v5, {
            Text = v17.label, 
            size = v17.size, 
            isRequired = v17.isRequired, 
            onActivated = v20, 
            onHover = v22, 
            LayoutOrder = 1, 
            testId = ("%*--label"):format(v17.testId)
        }) else nil, 
        InputWrapper = v2.createElement(v7, {
            tag = "size-full-0 auto-y", 
            LayoutOrder = 2, 
            testId = ("%*--input-wrapper"):format(v17.testId)
        }, {
            Input = v17.input(v19)
        }), 
        Hint = if v17.hint then v2.createElement(v4, {
            text = v17.hint, 
            hasError = v17.hasError, 
            LayoutOrder = 3, 
            testId = ("%*--hint"):format(v17.testId)
        }) else nil
    });
end));