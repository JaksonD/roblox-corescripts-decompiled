local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppCommonLib);
local v3 = require(l_Parent_0.AvatarExperienceCommon);
local l_Constants_0 = v3.Constants;
local v5 = require(l_script_FirstAncestor_0.Constants);
local v6 = require(l_Parent_0.Signals);
local l_debounce_0 = v3.Utils.debounce;
local v8 = require(l_script_FirstAncestor_0.Utils.getBreakpointFromRowWidth);
local v9 = require(l_script_FirstAncestor_0.Components.ResultsList.WidgetListBreakPointEnum);
local l_LANDSCAPE_UI_WIDTH_PERCENTAGE_0 = l_Constants_0.LANDSCAPE_UI_WIDTH_PERCENTAGE;
local l_WIDGET_LIST_HORIZONTAL_MARGIN_0 = v5.WIDGET_LIST_HORIZONTAL_MARGIN;
local function v16() --[[ Line: 54 ]] --[[ Name: getInitialScreenSizeEstimate ]]
    -- upvalues: v2 (copy), v9 (copy), l_LANDSCAPE_UI_WIDTH_PERCENTAGE_0 (copy), l_WIDGET_LIST_HORIZONTAL_MARGIN_0 (copy), v8 (copy)
    if v2.isSpatial() then
        return v9.XSmall;
    else
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        if l_CurrentCamera_0 and l_CurrentCamera_0.ViewportSize then
            local l_ViewportSize_0 = l_CurrentCamera_0.ViewportSize;
            local v14 = l_ViewportSize_0.X > l_ViewportSize_0.Y;
            local v15 = nil;
            v15 = if v14 then l_ViewportSize_0.X * l_LANDSCAPE_UI_WIDTH_PERCENTAGE_0 - l_WIDGET_LIST_HORIZONTAL_MARGIN_0 * 2 - 10 else l_ViewportSize_0.X;
            return v8(v15);
        else
            return v9.Medium;
        end;
    end;
end;
return function() --[[ Line: 79 ]] --[[ Name: createAXMarketplaceWidgetStore ]]
    -- upvalues: v16 (copy), v6 (copy), l_debounce_0 (copy)
    local v17 = v16();
    local v18, v19 = v6.createSignal(v17);
    local v20, v21 = v6.createSignal(v17);
    local v23 = l_debounce_0(function(v22) --[[ Line: 86 ]]
        -- upvalues: v21 (copy)
        v21(v22);
    end, 0.8);
    return {
        getScreenSize = v18, 
        setScreenSize = function(v24) --[[ Line: 92 ]]
            -- upvalues: v19 (copy), v23 (copy)
            v19(v24);
            v23(v24);
        end, 
        getDebouncedScreenSize = v20
    };
end;