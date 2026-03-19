local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Components.Text);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Utility.Localization.Translator);
local v5 = require(l_script_FirstAncestor_0.Enums.StateLayerAffordance);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v7 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v8 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v9 = require(l_script_FirstAncestor_0.Enums.ControlState);
local v10 = require(l_script_FirstAncestor_0.Enums.InputLabelSize);
local function _(v11, v12) --[[ Line: 41 ]] --[[ Name: labelText ]]
    -- upvalues: v3 (copy), v4 (copy)
    if v12 == nil or v12 == v3.None then
        return v11;
    elseif v12 then
        return v11 .. "*";
    else
        return (v4:FormatByKey("CommonUI.Controls.Input.Optional", {
            inputLabel = v11
        }));
    end;
end;
local v14 = {
    size = v10.Medium, 
    testId = "--foundation-input-label"
};
return v3.memo(v3.forwardRef(function(v15, v16) --[[ Line: 56 ]] --[[ Name: InputLabel ]]
    -- upvalues: v8 (copy), v14 (copy), v3 (copy), v9 (copy), v2 (copy), v7 (copy), v4 (copy), v5 (copy), v10 (copy)
    local v17 = v8(v15, v14);
    local v19 = v3.useMemo(function() --[[ Line: 58 ]]
        -- upvalues: v17 (copy), v9 (ref)
        if v17.onHover ~= nil then
            return function(v18) --[[ Line: 60 ]]
                -- upvalues: v17 (ref), v9 (ref)
                v17.onHover(v18 == v9.Hover);
            end;
        else
            return nil;
        end;
    end, {
        v17.onHover
    });
    local l_createElement_0 = v3.createElement;
    local l_v2_0 = v2;
    local l_v7_0 = v7;
    local l_v17_0 = v17;
    local v24 = {};
    local l_Text_0 = v17.Text;
    local l_isRequired_0 = v17.isRequired;
    v24.Text = if not (l_isRequired_0 ~= nil) or l_isRequired_0 == v3.None then l_Text_0 else if l_isRequired_0 then l_Text_0 .. "*" else v4:FormatByKey("CommonUI.Controls.Input.Optional", {
        inputLabel = l_Text_0
    });
    v24.RichText = v17.RichText;
    v24.selection = {
        Selectable = false
    };
    v24.onActivated = v17.onActivated;
    v24.onStateChanged = v19;
    v24.stateLayer = {
        affordance = v5.None
    };
    v24.textStyle = v17.textStyle;
    v24.tag = {
        ["size-0 auto-xy content-default text-align-x-left text-align-y-top text-wrap"] = true, 
        ["text-title-small"] = v17.size == v10.Small, 
        ["text-title-medium"] = v17.size == v10.Medium, 
        ["text-title-large"] = v17.size == v10.Large
    };
    v24.ref = v16;
    return l_createElement_0(l_v2_0, l_v7_0(l_v17_0, v24));
end));