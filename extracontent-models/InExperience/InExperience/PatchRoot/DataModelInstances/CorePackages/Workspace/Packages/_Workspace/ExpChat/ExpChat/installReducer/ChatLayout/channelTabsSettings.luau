local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v4 = require(l_script_FirstAncestor_0.Config);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v6 = require(l_Actions_0.ConfigurationObjectsLoaded);
local v7 = require(l_Actions_0.ChannelTabsSettingsChanged);
local v8 = {
    BackgroundTransparency = v4.ChannelTabsSettings.BackgroundTransparency, 
    BackgroundColor3 = v4.ChannelTabsSettings.BackgroundColor3, 
    HoverBackgroundColor3 = v4.ChannelTabsSettings.HoverBackgroundColor3, 
    FontFace = v4.ChannelTabsSettings.FontFace, 
    TextSize = v4.ChannelTabsSettings.TextSize, 
    TextColor3 = v4.ChannelTabsSettings.TextColor3, 
    SelectedTabTextColor3 = v4.ChannelTabsSettings.SelectedTabTextColor3, 
    TextStrokeColor3 = v4.ChannelTabsSettings.TextStrokeColor3, 
    TextStrokeTransparency = v4.ChannelTabsSettings.TextStrokeTransparency
};
return v2.createReducer(v8, {
    [v6.name] = function(v9, v10) --[[ Line: 25 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v9, v10.channelTabsSettings);
    end, 
    [v7.name] = function(v11, v12) --[[ Line: 29 ]]
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