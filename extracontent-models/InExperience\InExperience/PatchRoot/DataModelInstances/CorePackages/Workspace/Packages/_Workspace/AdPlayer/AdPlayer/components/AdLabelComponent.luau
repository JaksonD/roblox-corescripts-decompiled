local l_script_FirstAncestor_0 = script:FindFirstAncestor("AdPlayer");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_Text_0 = v3.Text;
local l_View_0 = v3.View;
local l_Image_0 = v3.Image;
local l_StateLayerAffordance_0 = v3.Enums.StateLayerAffordance;
local v8 = require(l_script_FirstAncestor_0.Flags);
return function(v9) --[[ Line: 17 ]]
    -- upvalues: v2 (copy), l_View_0 (copy), v8 (copy), l_Text_0 (copy), l_Image_0 (copy), l_StateLayerAffordance_0 (copy)
    local l_Visible_0 = v9.Visible;
    local l_Image_1 = v9.Image;
    return v2.createElement(l_View_0, {
        tag = v8.GetEnableLuaRewardTimerUI() and "size-900-500 row align-x-center align-y-center gap-xsmall" or "position-center-left anchor-center-left size-900-500 row align-x-center align-y-center gap-xsmall"
    }, {
        adText = v2.createElement(l_Text_0, {
            tag = "size-400 content-emphasis text-body-small", 
            Text = "Ad", 
            TextScaled = true, 
            Visible = l_Visible_0
        }), 
        icon = v2.createElement(l_Image_0, {
            tag = "size-300", 
            Image = l_Image_1, 
            LayoutOrder = 2, 
            onActivated = v9.handleToggleAdsModal, 
            Visible = l_Visible_0, 
            stateLayer = {
                affordance = l_StateLayerAffordance_0.None
            }
        })
    });
end;