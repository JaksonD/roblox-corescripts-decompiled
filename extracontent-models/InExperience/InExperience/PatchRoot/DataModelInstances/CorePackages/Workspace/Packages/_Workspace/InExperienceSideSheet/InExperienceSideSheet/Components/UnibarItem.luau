local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceSideSheet");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local l_View_0 = v2.View;
local v5 = require(script.Parent.IconHost);
local v6 = require(l_script_FirstAncestor_0.Analytics.AnalyticsConstants);
local v7 = require(l_script_FirstAncestor_0.Analytics.SidesheetAnalytics);
local v8 = require(l_script_FirstAncestor_0.Utils.toggleSideSheet);
return v3.memo(function(v9) --[[ Line: 24 ]] --[[ Name: UnibarItem ]]
    -- upvalues: v3 (copy), v8 (copy), v7 (copy), v6 (copy), l_View_0 (copy), v5 (copy)
    local v10 = v3.useCallback(function() --[[ Line: 25 ]]
        -- upvalues: v9 (copy), v8 (ref), v7 (ref), v6 (ref)
        v9.onActivated();
        v8(false);
        v7.logSidesheetClosed(v6.Source.ItemSelected);
    end, {
        v9.onActivated
    });
    return v3.createElement(l_View_0, {
        tag = "auto-xy", 
        LayoutOrder = v9.layoutOrder
    }, {
        IconHost = v3.createElement(v5, {
            icon = v9.icon, 
            notification = v9.notification
        }), 
        ActivationOverlay = v3.createElement(l_View_0, {
            tag = "size-full radius-circle", 
            ZIndex = 10, 
            onActivated = v10
        })
    });
end);