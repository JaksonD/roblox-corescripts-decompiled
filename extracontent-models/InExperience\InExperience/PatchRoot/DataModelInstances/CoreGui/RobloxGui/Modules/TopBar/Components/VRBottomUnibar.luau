local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Foundation);
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.VrSpatialUi);
local l_PanelType_0 = v3.Constants.PanelType;
local l_Panel3DInSpatialUI_0 = v3.Panel3DInSpatialUI;
local l_Parent_0 = script.Parent.Parent.Parent;
local v7 = require(l_Parent_0.Chrome.ChromeShared.Unibar);
local v8 = require(l_Parent_0.TopBar.Components.Presentation.MenuIcon);
local v9 = require(l_Parent_0.TopBar.ComponentsV2.MenuIcon);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v11 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon);
local l_FFlagTopBarSignalizeKeepOutAreas_0 = v11.Flags.FFlagTopBarSignalizeKeepOutAreas;
local l_FFlagTopBarRefactor_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceTopBar).Flags.FFlagTopBarRefactor;
local function v18(v14) --[[ Line: 27 ]] --[[ Name: MenuIconWrapper ]]
    -- upvalues: l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), v11 (copy), l_useSelector_0 (copy), l_FFlagTopBarRefactor_0 (copy), v2 (copy), v9 (copy), v8 (copy)
    local v15 = nil;
    if l_FFlagTopBarSignalizeKeepOutAreas_0 then
        v15 = v11.Stores.GetKeepOutAreasStore(false);
    end;
    local v17 = l_useSelector_0(function(v16) --[[ Line: 33 ]]
        if v16 and v16.displayOptions then
            return v16.displayOptions.menuOpen;
        else
            return false;
        end;
    end) and 1.5 or 1;
    if l_FFlagTopBarRefactor_0 then
        return (v2.createElement(v9, {
            showBadgeOver12 = v14.showBadgeOver12
        }));
    else
        return (v2.createElement(v8, {
            layout = v14.layout, 
            iconScale = v17, 
            showBadgeOver12 = v14.showBadgeOver12, 
            onAreaChanged = if l_FFlagTopBarSignalizeKeepOutAreas_0 then v15.setKeepOutArea else nil
        }));
    end;
end;
return v2.memo(function(v19) --[[ Line: 49 ]] --[[ Name: VRBottomUnibar ]]
    -- upvalues: l_Panel3DInSpatialUI_0 (copy), v2 (copy), l_PanelType_0 (copy), l_FFlagTopBarRefactor_0 (copy), v1 (copy), v18 (copy), v7 (copy)
    if not l_Panel3DInSpatialUI_0 then
        return nil;
    else
        return v2.createElement(l_Panel3DInSpatialUI_0, {
            panelType = l_PanelType_0.BottomBar, 
            renderFunction = function() --[[ Line: 55 ]] --[[ Name: renderFunction ]]
                -- upvalues: v2 (ref), l_FFlagTopBarRefactor_0 (ref), v1 (ref), v18 (ref), v19 (copy), v7 (ref)
                return v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = if l_FFlagTopBarRefactor_0 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 1, 0), 
                    AutomaticSize = if l_FFlagTopBarRefactor_0 then Enum.AutomaticSize.Y else nil
                }, {
                    ListLayout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, 8)
                    }), 
                    MenuIconFrame = if l_FFlagTopBarRefactor_0 then v2.createElement(v1.View, {
                        Size = UDim2.new(0, 0, 1, 0), 
                        AutomaticSize = Enum.AutomaticSize.X, 
                        aspectRatio = {
                            AspectRatio = 1, 
                            AspectType = Enum.AspectType.ScaleWithParentSize, 
                            DominantAxis = Enum.DominantAxis.Height
                        }
                    }, {
                        MenuIcon = v2.createElement(v18, {
                            layout = 1, 
                            showBadgeOver12 = v19.showBadgeOver12
                        })
                    }) else v2.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Size = UDim2.new(0, 0, 1, 0), 
                        AutomaticSize = Enum.AutomaticSize.X
                    }, {
                        MenuIcon = v2.createElement(v18, {
                            layout = 1, 
                            showBadgeOver12 = v19.showBadgeOver12
                        })
                    }), 
                    UnibarFrame = v2.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Size = UDim2.new(0, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.XY
                    }, {
                        Unibar = v2.createElement(v7, {
                            layoutOrder = 1, 
                            onAreaChanged = function() --[[ Line: 102 ]] --[[ Name: onAreaChanged ]]

                            end, 
                            onMinWidthChanged = function() --[[ Line: 103 ]] --[[ Name: onMinWidthChanged ]]

                            end
                        })
                    })
                });
            end, 
            requireCanvasGroup = true
        });
    end;
end);