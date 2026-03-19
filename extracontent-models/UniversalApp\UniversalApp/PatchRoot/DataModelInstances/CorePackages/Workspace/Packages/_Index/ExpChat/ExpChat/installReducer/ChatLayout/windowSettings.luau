local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v4 = require(l_script_FirstAncestor_0.Config);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v6 = require(l_Actions_0.ConfigurationObjectsLoaded);
local v7 = require(l_Actions_0.ChatWindowSettingsChanged);
local v8 = {
    Font = v4.ChatWindowFont, 
    TextColor3 = v4.ChatWindowTextColor3, 
    TextSize = v4.ChatWindowTextSize, 
    TextStrokeColor3 = v4.ChatWindowTextStrokeColor, 
    TextStrokeTransparency = v4.ChatWindowTextStrokeTransparency, 
    BackgroundColor3 = v4.ChatWindowBackgroundColor3, 
    BackgroundTransparency = v4.ChatWindowBackgroundTransparency, 
    HeightScale = 1, 
    WidthScale = 1, 
    SpatialPanelTextSize = v4.ChatWindowSpatialPanelTextSize
};
return v2.createReducer(v8, {
    [v6.name] = function(v9, v10) --[[ Line: 26 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v9, v10.chatWindowSettings);
    end, 
    [v7.name] = function(v11, v12) --[[ Line: 30 ]]
        -- upvalues: l_Dictionary_0 (copy)
        if not v11[v12.property] then
            return v11;
        else
            return l_Dictionary_0.join(v11, {
                [v12.property] = v12.value
            });
        end;
    end
});