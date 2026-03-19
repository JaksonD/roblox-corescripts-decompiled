local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Localization);
local v3 = require(l_Parent_1.React);
local l_useLocalization_0 = v2.Hooks.useLocalization;
local v5 = require(l_Parent_0.Analytics.EventNames);
local v6 = require(l_Parent_0.Components.Common.MenuButton);
local v7 = require(l_Parent_0.Analytics.useAnalytics);
return function(v8) --[[ Line: 19 ]]
    -- upvalues: v7 (copy), l_useLocalization_0 (copy), v3 (copy), v5 (copy), v6 (copy)
    local v9 = v7();
    local v10 = l_useLocalization_0({
        showMore = "Feature.Avatar.Action.ShowMore"
    });
    local v11 = v3.useCallback(function() --[[ Line: 25 ]]
        -- upvalues: v9 (copy), v5 (ref), v8 (copy)
        v9.fireEvent(v5.CapturesShowMoreInGameMenu);
        v8.onActivated();
    end, {
        v8.onActivated
    });
    return v3.createElement(v6, {
        buttonHeight = v8.buttonHeight, 
        LayoutOrder = v8.LayoutOrder, 
        onActivated = v11, 
        text = v10.showMore
    });
end;