local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.ReactIs);
local v5 = require(l_script_FirstAncestor_0.Utility.Flags);
local v6 = require(l_script_FirstAncestor_0.Components.Interactable);
local v7 = require(l_script_FirstAncestor_0.Utility.GuiObjectChildren);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v9 = require(l_script_FirstAncestor_0.Utility.indexBindable);
local v10 = require(l_script_FirstAncestor_0.Utility.useDefaultTags);
local v11 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v12 = require(l_script_FirstAncestor_0.Utility.withGuiObjectProps);
local v13 = require(l_script_FirstAncestor_0.Providers.Style.useStyleTags);
local v14 = require(script.Parent.FontScales);
local v15 = {
    AutoLocalize = false, 
    AutoButtonColor = false, 
    BorderSizePixel = 0, 
    isDisabled = false
};
return v3.memo(v3.forwardRef(function(v16, v17) --[[ Line: 52 ]] --[[ Name: Text ]]
    -- upvalues: v11 (copy), v15 (copy), v10 (copy), v13 (copy), v3 (copy), v4 (copy), v14 (copy), v12 (copy), v9 (copy), v5 (copy), v6 (copy), v7 (copy), v2 (copy)
    local v18 = v11(v16, v15);
    local v19 = true;
    if v18.onStateChanged == nil then
        v19 = true;
        if v18.onActivated == nil then
            v19 = v18.onSecondaryActivated ~= nil;
        end;
    end;
    local v20 = v18.backgroundStyle ~= nil and "gui-object-defaults text-defaults text-size-defaults text-color-defaults x-default-transparency" or "gui-object-defaults text-defaults text-size-defaults text-color-defaults";
    local v21 = v10(v18.tag, v20);
    local v22 = v13(v21);
    local v24 = v3.useMemo(function() --[[ Line: 62 ]]
        -- upvalues: v18 (copy), v4 (ref)
        local v23 = if v18.fontStyle ~= nil then v18.fontStyle.Font else nil;
        if typeof(v23) == "table" and not v4.isBinding(v23) then
            return Font.new(v23.Family, v23.Weight, v23.Style);
        elseif typeof(v23) == "EnumItem" then
            return Font.fromEnum(v23);
        else
            return v23;
        end;
    end, {
        v18.fontStyle
    });
    local v27 = v3.useMemo(function() --[[ Line: 76 ]]
        -- upvalues: v18 (copy), v24 (copy), v4 (ref), v14 (ref)
        if v18.fontStyle == nil or v18.fontStyle.LineHeight == nil or v18.fontStyle.FontSize == nil or v24 == nil then
            return 0;
        else
            local _ = nil;
            local v26 = v14[if v4.isBinding(v24) then v24:getValue().Family else v24.Family];
            if v26 == nil then
                return 0;
            else
                return (v18.fontStyle.FontSize / v26 * (v18.fontStyle.LineHeight * v26) - v18.fontStyle.FontSize) / 2;
            end;
        end;
    end, {
        v24, 
        v18.fontStyle
    });
    if v18.padding == nil and v27 ~= 0 then
        v18.padding = Vector2.new(0, v27);
    end;
    local v28 = v19 and "TextButton" or "TextLabel";
    local v29 = v12(v18, {
        AutoButtonColor = if v28 == "TextButton" then v18.AutoButtonColor else nil, 
        FontFace = v24, 
        LineHeight = if v18.fontStyle ~= nil then v18.fontStyle.LineHeight else nil, 
        RichText = v18.RichText, 
        Text = v18.Text, 
        TextColor3 = if v18.textStyle then v9(v18.textStyle, "Color3") else nil, 
        TextTransparency = if v18.textStyle then v9(v18.textStyle, "Transparency") else nil, 
        TextDirection = v18.TextDirection, 
        TextScaled = v18.TextScaled, 
        TextSize = if v18.fontStyle ~= nil then v18.fontStyle.FontSize else nil, 
        TextTruncate = v18.TextTruncate, 
        TextWrapped = v18.TextWrapped, 
        TextXAlignment = v18.TextXAlignment, 
        TextYAlignment = v18.TextYAlignment, 
        ref = v17, 
        [v3.Tag] = v22
    });
    if v5.FoundationBuildingBlocksRemoveDashUnion then
        local l_v28_0 = v28;
        if v19 then
            l_v28_0 = v6;
            v29.component = v28;
            v29.onActivated = v18.onActivated;
            v29.onSecondaryActivated = v18.onSecondaryActivated;
            v29.onStateChanged = v18.onStateChanged;
            v29.stateLayer = v18.stateLayer;
            v29.isDisabled = v18.isDisabled;
            v29.cursor = v18.cursor;
        end;
        return v3.createElement(l_v28_0, v29, v7(v18));
    else
        local v31 = if v19 then v6 else v28;
        local v32 = {
            component = v28, 
            onActivated = v18.onActivated, 
            onSecondaryActivated = v18.onSecondaryActivated, 
            onStateChanged = v18.onStateChanged, 
            stateLayer = v18.stateLayer, 
            isDisabled = v18.isDisabled, 
            cursor = v18.cursor
        };
        local v33 = if v19 then v2.union(v29, v32) else v29;
        return v3.createElement(v31, v33, v7(v18));
    end;
end));