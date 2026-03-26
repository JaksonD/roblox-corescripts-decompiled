local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script:FindFirstAncestor("InExperienceSideSheet").Parent;
local v2 = require(l_Parent_0.Drawer);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.ReactRoblox);
local l_DrawerContainer_0 = v2.DrawerContainer;
local l_useTokens_0 = v3.Hooks.useTokens;
local v8 = {};
local v9 = nil;
local function _(v10) --[[ Line: 27 ]] --[[ Name: wrapWithProviders ]]
    -- upvalues: v4 (copy), v3 (copy)
    return v4.createElement(v3.FoundationProvider, {
        theme = v3.Enums.Theme.Dark
    }, v10);
end;
local function v13() --[[ Line: 33 ]] --[[ Name: SideSheetContent ]]
    -- upvalues: l_useTokens_0 (copy), v4 (copy), l_DrawerContainer_0 (copy)
    local v12 = l_useTokens_0();
    return v4.createElement(l_DrawerContainer_0, {
        displayOrder = 12, 
        menuWidth = 300 - v12.Padding.Large, 
        leftOffset = v12.Padding.Large, 
        backgroundColor = v12.Color.OverMedia.OverMedia_0.Color3, 
        backgroundTransparency = 0, 
        onDrawerClosedAnalytics = nil
    });
end;
v8.createSideSheet = function() --[[ Line: 46 ]] --[[ Name: createSideSheet ]]
    -- upvalues: v9 (ref), l_CoreGui_0 (copy), v4 (copy), v13 (copy), v3 (copy), v5 (copy)
    if not v9 then
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "InExperienceSideSheet";
        l_Folder_0.Parent = l_CoreGui_0;
        local v15 = {
            SideSheetContent = v4.createElement(v13)
        };
        local v16 = v4.createElement(v3.FoundationProvider, {
            theme = v3.Enums.Theme.Dark
        }, v15);
        v9 = v5.createRoot(l_Folder_0);
        v9:render(v16);
    end;
    return v9;
end;
return v8;