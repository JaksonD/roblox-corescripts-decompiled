local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_Components_0 = l_script_FirstAncestor_0.Components;
local v4 = require(l_Components_0.HintText);
local v5 = require(l_Components_0.InputLabel);
local _ = require(l_Components_0.Types);
local v7 = require(l_Components_0.View);
local v8 = require(l_script_FirstAncestor_0.Utility.useScaledValue);
local v9 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v10 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v11 = require(l_script_FirstAncestor_0.Constants);
local v12 = {
    size = require(l_script_FirstAncestor_0.Enums.InputLabelSize).Small, 
    testId = "--foundation-input-field"
};
return v2.memo(v2.forwardRef(function(v13, v14) --[[ Line: 45 ]] --[[ Name: InputField ]]
    -- upvalues: v10 (copy), v12 (copy), v8 (copy), v11 (copy), v2 (copy), v7 (copy), v9 (copy), v5 (copy), v4 (copy)
    local v15 = v10(v13, v12);
    local v16 = v8(v11.DEFAULT_INPUT_FIELD_WIDTH_PIXELS);
    local v17 = v2.useRef(nil);
    local v18 = v2.useCallback(function() --[[ Line: 50 ]]
        -- upvalues: v17 (copy)
        if v17.current and not v17.current.getIsFocused() then
            v17.current.focus();
        end;
    end, {});
    local v20 = v2.useCallback(function(v19) --[[ Line: 56 ]]
        -- upvalues: v17 (copy)
        if v17.current then
            v17.current.setHover(v19);
        end;
    end, {});
    v2.useImperativeHandle(v15.textBoxRef, function() --[[ Line: 62 ]]
        -- upvalues: v17 (copy)
        if not v17.current then
            return nil;
        else
            return {
                focus = v17.current.focus, 
                releaseFocus = v17.current.releaseFocus, 
                getIsFocused = v17.current.getIsFocused, 
                getCursorPosition = v17.current.getCursorPosition, 
                getSelectionStart = v17.current.getSelectionStart, 
                setCursorPosition = v17.current.setCursorPosition, 
                setSelectionStart = v17.current.setSelectionStart
            };
        end;
    end, {});
    return v2.createElement(v7, v9(v15, {
        Size = if not v15.width then UDim2.fromOffset(v16, 0) else UDim2.new(v15.width, UDim.new(0, 0)), 
        tag = "col gap-small auto-y", 
        ref = v14
    }), {
        Label = if #v15.label > 0 then v2.createElement(v5, {
            Text = v15.label, 
            size = v15.size, 
            isRequired = v15.isRequired, 
            onActivated = v18, 
            onHover = v20, 
            LayoutOrder = 1, 
            testId = ("%*--label"):format(v15.testId)
        }) else nil, 
        InputWrapper = v2.createElement(v7, {
            tag = "size-full-0 auto-y", 
            LayoutOrder = 2, 
            testId = ("%*--input-wrapper"):format(v15.testId)
        }, {
            Input = v15.input(v17)
        }), 
        Hint = if v15.hint then v2.createElement(v4, {
            text = v15.hint, 
            hasError = v15.hasError, 
            LayoutOrder = 3, 
            testId = ("%*--hint"):format(v15.testId)
        }) else nil
    });
end));