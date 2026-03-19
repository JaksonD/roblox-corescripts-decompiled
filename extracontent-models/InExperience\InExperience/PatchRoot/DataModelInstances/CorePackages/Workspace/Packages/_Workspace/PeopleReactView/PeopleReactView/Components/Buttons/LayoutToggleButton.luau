local l_Parent_0 = script:FindFirstAncestor("PeopleReactView").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_IconName_0 = v2.Enums.IconName;
local l_InputSize_0 = v2.Enums.InputSize;
local l_Icon_0 = v2.Icon;
local l_View_0 = v2.View;
local l_GameSettings_0 = UserSettings().GameSettings;
return v1.memo(function(v8) --[[ Line: 20 ]] --[[ Name: LayoutToggleButton ]]
    -- upvalues: v1 (copy), l_GameSettings_0 (copy), l_View_0 (copy), l_Icon_0 (copy), l_IconName_0 (copy), l_InputSize_0 (copy)
    local v10 = v1.useCallback(function(v9) --[[ Line: 21 ]]
        -- upvalues: l_GameSettings_0 (ref), v8 (copy)
        return function() --[[ Line: 22 ]]
            -- upvalues: l_GameSettings_0 (ref), v9 (copy), v8 (ref)
            l_GameSettings_0.PeoplePageLayout = v9;
            v8.setLayout(v9);
        end;
    end, {});
    return v1.createElement(l_View_0, {
        tag = "row auto-xy bg-shift-100 radius-medium gap-xxsmall padding-xsmall", 
        LayoutOrder = v8.LayoutOrder
    }, {
        CardLayoutButton = v1.createElement(l_View_0, {
            tag = {
                ["row align-x-center align-y-center size-1000-1000 radius-medium"] = true, 
                ["bg-shift-300"] = v8.layout == Enum.PeoplePageLayout.Card
            }, 
            LayoutOrder = 1, 
            onActivated = v10(Enum.PeoplePageLayout.Card)
        }, {
            Icon = v1.createElement(l_Icon_0, {
                name = l_IconName_0.Grid, 
                size = l_InputSize_0.Medium
            })
        }), 
        ListLayoutButton = v1.createElement(l_View_0, {
            tag = {
                ["row align-x-center align-y-center size-1000-1000 radius-medium"] = true, 
                ["bg-shift-300"] = v8.layout == Enum.PeoplePageLayout.List
            }, 
            LayoutOrder = 2, 
            onActivated = v10(Enum.PeoplePageLayout.List)
        }, {
            Icon = v1.createElement(l_Icon_0, {
                name = l_IconName_0.ListBulleted, 
                size = l_InputSize_0.Medium
            })
        })
    });
end);