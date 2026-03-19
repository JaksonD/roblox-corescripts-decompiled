local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiGlobalNav");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.TenFootUiCommon);
local l_TenFootUiContext_0 = v4.TenFootUiContext;
local l_AppNotificationService_0 = require(l_Parent_0.RoactServiceTags).AppNotificationService;
local v7 = require(l_script_FirstAncestor_0.Analytics.makeGlobalNavAnalytics);
local l_GlobalNavDisplayOption_0 = v4.TenFootUiRNTypes.GlobalNavDisplayOption;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v10 = require(l_script_FirstAncestor_0.Components.GlobalNavContainer.useGlobalNavAnimation);
local l_getCurrentTabName_0 = require(l_Parent_0.NavigationRodux).Utils.getCurrentTabName;
local _ = require(l_script_FirstAncestor_0.Components.GlobalNav);
local l_FFlagFix10ftGlobalNavSelection_0 = require(l_Parent_0.SharedFlags).FFlagFix10ftGlobalNavSelection;
return function(v14, v15) --[[ Line: 18 ]] --[[ Name: useGlobalNavProps ]]
    -- upvalues: v2 (copy), l_TenFootUiContext_0 (copy), l_AppNotificationService_0 (copy), v7 (copy), l_getCurrentTabName_0 (copy), v3 (copy), l_useLocalization_0 (copy), v10 (copy), l_GlobalNavDisplayOption_0 (copy), l_FFlagFix10ftGlobalNavSelection_0 (copy)
    local v16 = v2.useContext(l_TenFootUiContext_0);
    assert(v16, "TenFootUiContext must be configured before using GlobalNav");
    local v17 = v16.useRoactService(l_AppNotificationService_0);
    local v18 = v16.useRoactService(v16.RoactAnalytics);
    local v19 = v7(v18, v16.buttonClick);
    local l_globalNavConfig_0 = v16.globalNavConfig;
    local v21 = l_getCurrentTabName_0(v14.state);
    local function v24(v22) --[[ Line: 30 ]]
        -- upvalues: v21 (copy), v16 (copy), v14 (copy), v17 (copy), v19 (copy)
        local l_page_0 = v22.page;
        if v21 == l_page_0 then
            v16.LuaAppEvents.ReloadPage:fire(l_page_0);
            return;
        else
            v14.navigate(l_page_0);
            if v22.actionType then
                v17:ActionTaken(v22.actionType);
            end;
            v19.ButtonActivated(l_page_0, v21);
            return;
        end;
    end;
    local v26 = v3.List.map(l_globalNavConfig_0.tabs, function(v25) --[[ Line: 47 ]]
        return v25.titleLocalizationKey;
    end);
    local v27 = l_useLocalization_0(v26);
    local v29 = v3.List.map(l_globalNavConfig_0.options, function(v28) --[[ Line: 52 ]]
        return v28.titleLocalizationKey;
    end);
    local v30 = l_useLocalization_0(v29);
    local v31 = nil;
    local v32 = nil;
    local l_v10_0 = v10;
    local v34 = true;
    if v15 ~= l_GlobalNavDisplayOption_0.ShowAll then
        v34 = v15 == l_GlobalNavDisplayOption_0.TabGroupOnly;
    end;
    l_v10_0 = l_v10_0(v34);
    v34 = v10;
    local v35 = true;
    if v15 ~= l_GlobalNavDisplayOption_0.ShowAll then
        v35 = v15 == l_GlobalNavDisplayOption_0.OptionGroupOnly;
    end;
    v34 = v34(v35);
    if l_v10_0.isVisible then
        v35 = v3.List.findWhere(l_globalNavConfig_0.tabs, function(v36, _) --[[ Line: 67 ]]
            -- upvalues: v21 (copy)
            return v36.page == v21;
        end);
        local v40 = v3.List.map(l_globalNavConfig_0.tabs, function(v38, v39) --[[ Line: 70 ]]
            -- upvalues: v27 (copy), v24 (copy), v21 (copy)
            return {
                title = v27[v39], 
                icon = v38.iconImage, 
                iconComponent = v38.iconComponent, 
                onActivated = function() --[[ Line: 75 ]] --[[ Name: onActivated ]]
                    -- upvalues: v24 (ref), v38 (copy)
                    v24(v38);
                end, 
                showRoundedBackground = v21 == v38.page
            };
        end);
        v31 = {
            selection = {
                v35
            }, 
            items = v40, 
            padding = {
                left = 0, 
                right = 0, 
                top = 0, 
                bottom = 0
            }
        };
    end;
    if v34.isVisible then
        v32 = {
            items = v3.List.map(l_globalNavConfig_0.options, function(v41, v42) --[[ Line: 89 ]]
                -- upvalues: v30 (copy), v24 (copy)
                return {
                    label = v30[v42], 
                    icon = v41.iconComponent or v41.icon, 
                    onActivated = function() --[[ Line: 93 ]] --[[ Name: onActivated ]]
                        -- upvalues: v24 (ref), v41 (copy)
                        v24(v41);
                    end
                };
            end)
        };
    end;
    return {
        tabGroupProps = v31, 
        optionGroupProps = v32, 
        animationProps = {
            tabGroupTransparency = l_v10_0.transparency, 
            tabGroupRef = l_v10_0.ref, 
            optionGroupTransparency = v34.transparency, 
            optionGroupRef = v34.ref
        }, 
        SelectionGroup = l_FFlagFix10ftGlobalNavSelection_0 and true or nil, 
        SelectionBehaviorLeft = if l_FFlagFix10ftGlobalNavSelection_0 then Enum.SelectionBehavior.Stop else nil, 
        SelectionBehaviorRight = if l_FFlagFix10ftGlobalNavSelection_0 then Enum.SelectionBehavior.Stop else nil, 
        SelectionBehaviorUp = if l_FFlagFix10ftGlobalNavSelection_0 then Enum.SelectionBehavior.Stop else nil
    };
end;