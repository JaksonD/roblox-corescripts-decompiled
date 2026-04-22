local l_CoreGui_0 = game:GetService("CoreGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceSideSheet");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Display);
local v4 = require(l_Parent_0.Drawer);
local v5 = require(l_Parent_0.Foundation);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.ReactRoblox);
local _ = require(l_Parent_0.Signals);
local v9 = require(l_Parent_0.SignalsReact);
local l_Divider_0 = v5.Divider;
local l_DrawerContainer_0 = v4.DrawerContainer;
local v12 = require(l_script_FirstAncestor_0.Components.ExperienceDetailsRow);
local v13 = require(l_script_FirstAncestor_0.Components.VerticalList);
local l_View_0 = v5.View;
local v15 = require(l_script_FirstAncestor_0.Analytics.SidesheetAnalytics);
local l_useDrawerShouldMount_0 = v4.Hooks.useDrawerShouldMount;
local l_useTokens_0 = v5.Hooks.useTokens;
local l_useStyleSheet_0 = v5.Hooks.useStyleSheet;
local v19 = require(l_script_FirstAncestor_0.Hooks.useBackgroundStyle);
local v20 = require(l_script_FirstAncestor_0.Stores.GetIntegrationsStore);
local v21 = require(l_script_FirstAncestor_0.Utils.wrapWithProviders);
local v22 = require(l_script_FirstAncestor_0.Flags);
local v23 = require(l_Parent_0.SharedFlags);
local l_FFlagMountUnmountSideSheet_0 = v22.FFlagMountUnmountSideSheet;
local l_FFlagEnableDrawerColorStyle_0 = v23.FFlagEnableDrawerColorStyle;
local l_FFlagEnableSafePadding_0 = v23.FFlagEnableSafePadding;
local l_FFlagAddIGMToSideSheet_0 = v23.FFlagAddIGMToSideSheet;
local v28 = {};
local function v30(v29) --[[ Line: 55 ]] --[[ Name: getDeviceSafePadding ]]
    -- upvalues: v3 (copy)
    return v3.GetDisplayStore(v29).getDeviceSafePadding(v29);
end;
local v31 = nil;
local v32 = nil;
if l_FFlagAddIGMToSideSheet_0 then
    v31 = function(v33) --[[ Line: 62 ]]
        -- upvalues: v20 (copy)
        return v20(v33).getVerticalIntegrations(v33);
    end;
    v32 = function(v34) --[[ Line: 66 ]]
        -- upvalues: v20 (copy)
        return v20(v34).getPageIntegrations(v34);
    end;
end;
local v35 = nil;
local function v43() --[[ Line: 72 ]] --[[ Name: SideSheetContent ]]
    -- upvalues: l_useTokens_0 (copy), l_useStyleSheet_0 (copy), v19 (copy), l_FFlagEnableSafePadding_0 (copy), v9 (copy), v30 (copy), l_FFlagMountUnmountSideSheet_0 (copy), l_useDrawerShouldMount_0 (copy), v6 (copy), v15 (copy), l_DrawerContainer_0 (copy), l_FFlagEnableDrawerColorStyle_0 (copy), l_View_0 (copy), v12 (copy), v13 (copy), l_FFlagAddIGMToSideSheet_0 (copy), v31 (ref), l_Divider_0 (copy), v32 (ref)
    local v36 = l_useTokens_0();
    local v37 = l_useStyleSheet_0();
    local v38 = v19();
    local v39 = nil;
    if l_FFlagEnableSafePadding_0 then
        v39 = v9.useSignalState(v30);
    end;
    local v40 = not l_FFlagMountUnmountSideSheet_0 or l_useDrawerShouldMount_0();
    local v42 = v6.useCallback(function(v41) --[[ Line: 82 ]]
        -- upvalues: v15 (ref)
        v15.logSidesheetClosed(v41.source);
    end, {});
    if not v40 then
        return nil;
    else
        return v6.createElement(l_DrawerContainer_0, {
            displayOrder = 12, 
            menuWidth = 300 - v36.Padding.XLarge, 
            leftOffset = if l_FFlagEnableSafePadding_0 then v39.left + v36.Padding.XLarge else v36.Padding.XLarge, 
            topOffset = if l_FFlagEnableSafePadding_0 then v39.top else nil, 
            bottomOffset = if l_FFlagEnableSafePadding_0 then v39.bottom else nil, 
            backgroundStyle = if l_FFlagEnableDrawerColorStyle_0 then v38 else nil, 
            backgroundColor = if not l_FFlagEnableDrawerColorStyle_0 then v36.Color.OverMedia.OverMedia_0.Color3 else nil, 
            backgroundTransparency = not l_FFlagEnableDrawerColorStyle_0 and 0 or nil, 
            onDrawerClosedAnalytics = v42
        }, {
            FoundationStyleLink = v6.createElement("StyleLink", {
                StyleSheet = v37
            }), 
            Content = v6.createElement(l_View_0, {
                tag = "col size-full auto-y"
            }, {
                ExperienceDetailsRow = v6.createElement(v12, {
                    layoutOrder = 0
                }), 
                VerticalList = v6.createElement(v13, {
                    layoutOrder = 1, 
                    integrationsGetter = if l_FFlagAddIGMToSideSheet_0 then v31 else nil
                }), 
                PageDivider = if l_FFlagAddIGMToSideSheet_0 then v6.createElement(l_View_0, {
                    tag = "size-full-0 auto-y padding-right-xlarge", 
                    LayoutOrder = 2
                }, {
                    Divider = v6.createElement(l_Divider_0)
                }) else nil, 
                PageList = if l_FFlagAddIGMToSideSheet_0 then v6.createElement(v13, {
                    layoutOrder = 3, 
                    integrationsGetter = v32
                }) else nil
            })
        });
    end;
end;
v28.createSideSheet = function(v44) --[[ Line: 134 ]] --[[ Name: createSideSheet ]]
    -- upvalues: v35 (ref), l_CoreGui_0 (copy), v21 (copy), v6 (copy), v43 (copy), v7 (copy)
    if not v35 then
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "InExperienceSideSheet";
        l_Folder_0.Parent = l_CoreGui_0;
        local v46 = v21({
            SideSheetContent = v6.createElement(v43)
        }, v44);
        v35 = v7.createRoot(l_Folder_0);
        v35:render(v46);
    end;
    return v35;
end;
return v28;