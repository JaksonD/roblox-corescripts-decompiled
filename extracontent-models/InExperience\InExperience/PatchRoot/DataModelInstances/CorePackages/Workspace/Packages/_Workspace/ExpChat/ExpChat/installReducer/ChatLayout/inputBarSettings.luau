local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v4 = require(l_script_FirstAncestor_0.Config);
local l_None_0 = require(l_Parent_0.llama).None;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v7 = require(l_Actions_0.ConfigurationObjectsLoaded);
local v8 = require(l_Actions_0.ChatInputBarSettingsChanged);
local v9 = {
    BackgroundTransparency = v4.ChatInputBarBackgroundTransparency, 
    BackgroundColor3 = v4.ChatInputBarBackgroundColor, 
    TextSize = v4.ChatInputBarTextSize, 
    TextColor3 = v4.ChatInputBarTextColor3, 
    SpatialPanelTextSize = v4.ChatInputBarSpatialPanelTextSize, 
    TextStrokeColor3 = v4.ChatInputBarTextStrokeColor, 
    TextStrokeTransparency = v4.ChatInputBarTextStrokeTransparency, 
    FontFace = v4.ChatInputBarFontFace, 
    PlaceholderColor3 = v4.ChatInputBarPlaceholderColor, 
    KeyboardKeyCode = v4.ChatInputBarDefaultFocusKeyCode, 
    AutocompleteEnabled = v4.ChatInputBarDefaultAutocompleteEnabled
};
return v2.createReducer(v9, {
    [v7.name] = function(v10, v11) --[[ Line: 28 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v10, v11.chatInputBarSettings);
    end, 
    [v8.name] = function(v12, v13) --[[ Line: 32 ]]
        -- upvalues: l_None_0 (copy), l_Dictionary_0 (copy)
        local l_value_0 = v13.value;
        if v12[v13.property] == nil and v13.property ~= "TextBox" then
            return v12;
        else
            l_value_0 = if v13.property == "TextBox" and v13.value == nil then l_None_0 else v13.value;
            return l_Dictionary_0.join(v12, {
                [v13.property] = l_value_0
            });
        end;
    end
});