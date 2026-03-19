local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_Progress_0 = v3.Progress;
local l_ProgressShape_0 = v3.Enums.ProgressShape;
local l_usePageNavigation_0 = require(l_script_FirstAncestor_0.Contexts.PageNavigationContext).usePageNavigation;
local l_FFlagEnableNapDedicatedPage_0 = require(l_Parent_0.SharedFlags).FFlagEnableNapDedicatedPage;
return v2.memo(function() --[[ Line: 19 ]] --[[ Name: HeaderProgressBar ]]
    -- upvalues: l_usePageNavigation_0 (copy), l_FFlagEnableNapDedicatedPage_0 (copy), v2 (copy), l_Progress_0 (copy), l_ProgressShape_0 (copy)
    local v8 = l_usePageNavigation_0().getProgress();
    if l_FFlagEnableNapDedicatedPage_0 then
        return v8 > 0 and v2.createElement(l_Progress_0, {
            value = v8, 
            shape = l_ProgressShape_0.Bar, 
            testId = "header-progress-bar"
        }) or nil;
    else
        return v2.createElement(l_Progress_0, {
            value = v8, 
            shape = l_ProgressShape_0.Bar, 
            testId = "header-progress-bar"
        });
    end;
end);