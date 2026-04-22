local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceSideSheet");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local v6 = require(l_script_FirstAncestor_0.Analytics.AnalyticsConstants);
local v7 = require(l_script_FirstAncestor_0.Analytics.SidesheetAnalytics);
local v8 = require(l_script_FirstAncestor_0.Utils.toggleSideSheet);
return v2.memo(function(v9) --[[ Line: 22 ]] --[[ Name: VerticalItem ]]
    -- upvalues: v2 (copy), v8 (copy), v7 (copy), v6 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v10 = v2.useCallback(function() --[[ Line: 23 ]]
        -- upvalues: v9 (copy), v8 (ref), v7 (ref), v6 (ref)
        v9.onActivated();
        v8(false);
        v7.logSidesheetClosed(v6.Source.ItemSelected);
    end, {
        v9.onActivated
    });
    return v2.createElement(l_View_0, {
        tag = "row align-y-center gap-small size-full-0 auto-y radius-medium", 
        LayoutOrder = v9.layoutOrder, 
        onActivated = v10
    }, {
        IconContainer = v2.createElement(l_View_0, {
            tag = "align-x-center align-y-center size-1000 auto-xy", 
            LayoutOrder = 1
        }, {
            Icon = v9.icon({
                visible = true
            })
        }), 
        Label = v2.createElement(l_Text_0, {
            LayoutOrder = 2, 
            Text = v9.label, 
            tag = "auto-xy padding-y-small text-title-medium text-align-x-left text-truncate-split content-emphasis"
        })
    });
end);