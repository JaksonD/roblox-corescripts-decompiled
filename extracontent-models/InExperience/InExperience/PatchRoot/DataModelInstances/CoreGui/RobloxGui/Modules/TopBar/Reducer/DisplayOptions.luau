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
    local v11 = require(l_Actions_0.SetInputType);
    local v12 = require(l_Actions_0.SetInspectMenuOpen);
    local v13 = require(l_Actions_0.SetGamepadMenuOpen);
    local v14 = require(l_Actions_0.SetGamepadNavigationDialogOpen);
    local v15 = require(script.Parent.Parent.Flags.GetFFlagRemoveTopBarInputTypeRodux)();
    local v16 = require(script.Parent.Parent.Flags.FFlagGamepadNavigationDialogABTest);
    local v17 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon);
    local l_FFlagTopBarSignalizeMenuOpen_0 = v17.Flags.FFlagTopBarSignalizeMenuOpen;
    local l_FFlagTopBarSignalizeKeepOutAreas_0 = v17.Flags.FFlagTopBarSignalizeKeepOutAreas;
    local l_FFlagTopBarSignalizeScreenSize_0 = v17.Flags.FFlagTopBarSignalizeScreenSize;
    local l_InputType_0 = require(l_Parent_0.Constants).InputType;
    local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
    local v23 = {
        menuOpen = false, 
        inspectMenuOpen = false, 
        topbarEnabled = true, 
        isSmallTouchDevice = false, 
        screenSize = Vector2.new(0, 0), 
        inputType = if v15 then nil else l_InputType_0.MouseAndKeyBoard, 
        isGamepadMenuOpen = false, 
        isGamepadNavigationDialogOpen = not v16 and nil, 
        keepOutAreas = {}
    };
    return (v1.createReducer(v23, {
        [l_FFlagTopBarSignalizeMenuOpen_0 and "" or v5.name] = if l_FFlagTopBarSignalizeMenuOpen_0 then nil else function(v24, v25) --[[ Line: 54 ]]
            -- upvalues: v2 (copy)
            local l_isGamepadMenuOpen_0 = v24.isGamepadMenuOpen;
            if not v24.menuOpen and v25.menuOpen then
                l_isGamepadMenuOpen_0 = false;
            end;
            return v2.Dictionary.join(v24, {
                menuOpen = v25.menuOpen, 
                isGamepadMenuOpen = l_isGamepadMenuOpen_0
            });
        end, 
        [v6.name] = function(v27, v28) --[[ Line: 67 ]]
            -- upvalues: v2 (copy)
            return v2.Dictionary.join(v27, {
                topbarEnabled = v28.enabled
            });
        end, 
        [v7.name] = function(v29, v30) --[[ Line: 73 ]]
            -- upvalues: v2 (copy)
            return v2.Dictionary.join(v29, {
                isSmallTouchDevice = v30.isSmallTouchDevice
            });
        end, 
        [l_FFlagTopBarSignalizeScreenSize_0 and "" or v8.name] = if l_FFlagTopBarSignalizeScreenSize_0 then nil else function(v31, v32) --[[ Line: 79 ]]
            -- upvalues: v2 (copy)
            return v2.Dictionary.join(v31, {
                screenSize = v32.screenSize
            });
        end, 
        [v11.name] = not v15 and function(v33, v34) --[[ Line: 86 ]]
            -- upvalues: v2 (copy)
            return v2.Dictionary.join(v33, {
                inputType = v34.inputType
            });
        end or nil, 
        [l_FFlagTopBarSignalizeMenuOpen_0 and "" or v12.name] = if l_FFlagTopBarSignalizeMenuOpen_0 then nil else function(v35, v36) --[[ Line: 93 ]]
            -- upvalues: v2 (copy)
            return v2.Dictionary.join(v35, {
                inspectMenuOpen = v36.inspectMenuOpen
            });
        end, 
        [v13.name] = function(v37, v38) --[[ Line: 99 ]]
            -- upvalues: v2 (copy), v16 (copy)
            return v2.Dictionary.join(v37, {
                isGamepadMenuOpen = v38.open, 
                isGamepadNavigationDialogOpen = not v16 and nil
            });
        end, 
        [v14.name] = v16 and function(v39, v40) --[[ Line: 107 ]]
            -- upvalues: v2 (copy)
            return v2.Dictionary.join(v39, {
                isGamepadNavigationDialogOpen = v40.open
            });
        end or nil, 
        [l_FFlagTopBarSignalizeKeepOutAreas_0 and "" or v9.name] = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else function(v41, v42) --[[ Line: 114 ]]
            -- upvalues: v2 (copy)
            local v43 = table.clone(v41.keepOutAreas);
            v43[v42.id] = {
                size = v42.size, 
                position = v42.position
            };
            return v2.Dictionary.join(v41, {
                keepOutAreas = v43
            });
        end, 
        [l_FFlagTopBarSignalizeKeepOutAreas_0 and "" or v10.name] = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else function(v44, v45) --[[ Line: 126 ]]
            -- upvalues: v2 (copy)
            local v46 = table.clone(v44.keepOutAreas);
            v46[v45.id] = nil;
            return v2.Dictionary.join(v44, {
                keepOutAreas = v46
            });
        end
    }));
end;