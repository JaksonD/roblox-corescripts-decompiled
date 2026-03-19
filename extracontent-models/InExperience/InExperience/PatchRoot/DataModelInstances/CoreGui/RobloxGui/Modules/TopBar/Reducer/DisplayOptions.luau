local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local l_Parent_0 = script.Parent.Parent;
if require(l_Parent_0.Flags.FFlagTopBarDeprecateDisplayOptionsRodux) then
    return nil;
else
    local l_Actions_0 = l_Parent_0.Actions;
    local v5 = require(l_Actions_0.SetMenuOpen);
    local v6 = require(l_Actions_0.SetTopBarEnabled);
    local v7 = require(l_Actions_0.SetSmallTouchDevice);
    local v8 = require(l_Actions_0.SetScreenSize);
    local v9 = require(l_Actions_0.SetKeepOutArea);
    local v10 = require(l_Actions_0.RemoveKeepOutArea);
    local _ = require(l_Actions_0.SetInputType);
    local v12 = require(l_Actions_0.SetInspectMenuOpen);
    local v13 = require(l_Actions_0.SetGamepadMenuOpen);
    local v14 = require(l_Actions_0.SetGamepadNavigationDialogOpen);
    local v15 = require(script.Parent.Parent.Flags.FFlagGamepadNavigationDialogABTest);
    local v16 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon);
    local l_FFlagTopBarSignalizeMenuOpen_0 = v16.Flags.FFlagTopBarSignalizeMenuOpen;
    local l_FFlagTopBarSignalizeKeepOutAreas_0 = v16.Flags.FFlagTopBarSignalizeKeepOutAreas;
    local l_FFlagTopBarSignalizeScreenSize_0 = v16.Flags.FFlagTopBarSignalizeScreenSize;
    local _ = require(l_Parent_0.Constants).InputType;
    local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
    local v22 = {
        menuOpen = false, 
        inspectMenuOpen = false, 
        topbarEnabled = true, 
        isSmallTouchDevice = false, 
        screenSize = Vector2.new(0, 0), 
        isGamepadMenuOpen = false, 
        isGamepadNavigationDialogOpen = not v15 and nil, 
        keepOutAreas = {}
    };
    return (v1.createReducer(v22, {
        [l_FFlagTopBarSignalizeMenuOpen_0 and "" or v5.name] = if l_FFlagTopBarSignalizeMenuOpen_0 then nil else function(v23, v24) --[[ Line: 51 ]]
            -- upvalues: v2 (copy)
            local l_isGamepadMenuOpen_0 = v23.isGamepadMenuOpen;
            if not v23.menuOpen and v24.menuOpen then
                l_isGamepadMenuOpen_0 = false;
            end;
            return v2.Dictionary.join(v23, {
                menuOpen = v24.menuOpen, 
                isGamepadMenuOpen = l_isGamepadMenuOpen_0
            });
        end, 
        [v6.name] = function(v26, v27) --[[ Line: 64 ]]
            -- upvalues: v2 (copy)
            return v2.Dictionary.join(v26, {
                topbarEnabled = v27.enabled
            });
        end, 
        [v7.name] = function(v28, v29) --[[ Line: 70 ]]
            -- upvalues: v2 (copy)
            return v2.Dictionary.join(v28, {
                isSmallTouchDevice = v29.isSmallTouchDevice
            });
        end, 
        [l_FFlagTopBarSignalizeScreenSize_0 and "" or v8.name] = if l_FFlagTopBarSignalizeScreenSize_0 then nil else function(v30, v31) --[[ Line: 76 ]]
            -- upvalues: v2 (copy)
            return v2.Dictionary.join(v30, {
                screenSize = v31.screenSize
            });
        end, 
        [l_FFlagTopBarSignalizeMenuOpen_0 and "" or v12.name] = if l_FFlagTopBarSignalizeMenuOpen_0 then nil else function(v32, v33) --[[ Line: 82 ]]
            -- upvalues: v2 (copy)
            return v2.Dictionary.join(v32, {
                inspectMenuOpen = v33.inspectMenuOpen
            });
        end, 
        [v13.name] = function(v34, v35) --[[ Line: 88 ]]
            -- upvalues: v2 (copy), v15 (copy)
            return v2.Dictionary.join(v34, {
                isGamepadMenuOpen = v35.open, 
                isGamepadNavigationDialogOpen = not v15 and nil
            });
        end, 
        [v14.name] = v15 and function(v36, v37) --[[ Line: 96 ]]
            -- upvalues: v2 (copy)
            return v2.Dictionary.join(v36, {
                isGamepadNavigationDialogOpen = v37.open
            });
        end or nil, 
        [l_FFlagTopBarSignalizeKeepOutAreas_0 and "" or v9.name] = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else function(v38, v39) --[[ Line: 103 ]]
            -- upvalues: v2 (copy)
            local v40 = table.clone(v38.keepOutAreas);
            v40[v39.id] = {
                size = v39.size, 
                position = v39.position
            };
            return v2.Dictionary.join(v38, {
                keepOutAreas = v40
            });
        end, 
        [l_FFlagTopBarSignalizeKeepOutAreas_0 and "" or v10.name] = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else function(v41, v42) --[[ Line: 115 ]]
            -- upvalues: v2 (copy)
            local v43 = table.clone(v41.keepOutAreas);
            v43[v42.id] = nil;
            return v2.Dictionary.join(v41, {
                keepOutAreas = v43
            });
        end
    }));
end;