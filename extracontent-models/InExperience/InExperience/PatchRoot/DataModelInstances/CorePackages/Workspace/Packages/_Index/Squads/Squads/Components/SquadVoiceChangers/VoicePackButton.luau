local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v3.React;
local l_Cryo_0 = v3.Cryo;
local l_useTokens_0 = v2.Hooks.useTokens;
local v7 = {
    voicePackName = "", 
    LayoutOrder = 1, 
    isSelected = false, 
    onActivated = function() --[[ Line: 28 ]] --[[ Name: onActivated ]]

    end, 
    isVoiceChangerActive = false
};
return function(v8) --[[ Line: 32 ]] --[[ Name: VoicePackButton ]]
    -- upvalues: l_Cryo_0 (copy), v7 (copy), l_useTokens_0 (copy), l_React_0 (copy), v2 (copy)
    local v9 = l_Cryo_0.Dictionary.join(v7, v8);
    local l_Size_0 = l_useTokens_0().Size;
    local l_Size_1000_0 = l_Size_0.Size_1000;
    local l_Size_600_0 = l_Size_0.Size_600;
    local l_Size_400_0 = l_Size_0.Size_400;
    return l_React_0.createElement(v2.View, {
        tag = "size-full-0 auto-y radius-medium row align-x-left align-y-center gap-large padding-x-large padding-y-xsmall", 
        LayoutOrder = v9.LayoutOrder, 
        onActivated = v9.onActivated
    }, {
        Label = l_React_0.createElement(v2.Text, {
            tag = "auto-xy fill text-align-x-left text-label-medium content-emphasis text-truncate-end text-no-wrap", 
            LayoutOrder = 1, 
            Text = v9.voicePackName
        }), 
        RadioButtonContainer = l_React_0.createElement(v2.View, {
            Size = UDim2.new(0, 0, 0, l_Size_1000_0), 
            tag = "auto-x row align-x-right align-y-center", 
            LayoutOrder = 2
        }, {
            DefaultIcon = l_React_0.createElement(v2.Image, {
                tag = "bg-action-subtle content-emphasis anchor-center-center position-center-center", 
                Image = "component_assets/circle_24_stroke_1", 
                Size = UDim2.new(0, l_Size_600_0, 0, l_Size_600_0)
            }, {
                SelectedIcon = v9.isSelected and l_React_0.createElement(v2.Image, {
                    tag = "bg-action-subtle content-emphasis anchor-center-center position-center-center", 
                    Image = "component_assets/circle_16", 
                    Size = UDim2.new(0, l_Size_400_0, 0, l_Size_400_0)
                })
            })
        })
    });
end;