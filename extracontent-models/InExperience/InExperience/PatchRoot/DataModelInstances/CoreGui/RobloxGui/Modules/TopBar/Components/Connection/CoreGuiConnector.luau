local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_Modules_0 = l_RobloxGui_0.Modules;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent.Parent;
local v8 = require(l_Parent_0.Actions.UpdateCoreGuiEnabled);
local v9 = require(l_Parent_0.Parent.Common.EventConnection);
local v10 = require(l_Modules_0.Flags.FFlagMountCoreGuiBackpack);
if require(l_Parent_0.Flags.FFlagTopBarDeprecateCoreGuiRodux) then
    return nil;
else
    local l_FFlagTopBarSignalizeHealthBar_0 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeHealthBar;
    local v12 = v4.PureComponent:extend("CoreGuiConnector");
    v12.validateProps = v6.strictInterface({
        updateCoreGuiEnabled = v6.callback
    });
    v12.didMount = function(v13) --[[ Line: 37 ]] --[[ Name: didMount ]]
        -- upvalues: v10 (copy), l_FFlagTopBarSignalizeHealthBar_0 (copy), l_StarterGui_0 (copy)
        local l_EnumItems_0 = Enum.CoreGuiType:GetEnumItems();
        for _, v16 in ipairs(l_EnumItems_0) do
            if (not v10 or v16 ~= Enum.CoreGuiType.Backpack) and (not l_FFlagTopBarSignalizeHealthBar_0 or v16 ~= Enum.CoreGuiType.Health) and v16 ~= Enum.CoreGuiType.All then
                v13.props.updateCoreGuiEnabled(v16, l_StarterGui_0:GetCoreGuiEnabled(v16));
            end;
        end;
    end;
    v12.render = function(v17) --[[ Line: 50 ]] --[[ Name: render ]]
        -- upvalues: v4 (copy), v9 (copy), l_StarterGui_0 (copy), v10 (copy)
        return v4.createFragment({
            CoreGuiChangedConnection = v4.createElement(v9, {
                event = l_StarterGui_0.CoreGuiChangedSignal, 
                callback = function(v18, v19) --[[ Line: 54 ]] --[[ Name: callback ]]
                    -- upvalues: v10 (ref), v17 (copy)
                    if v10 then
                        if v18 ~= Enum.CoreGuiType.Backpack then
                            v17.props.updateCoreGuiEnabled(v18, v19);
                            return;
                        end;
                    else
                        v17.props.updateCoreGuiEnabled(v18, v19);
                    end;
                end
            })
        });
    end;
    return v5.UNSTABLE_connect2(nil, function(v20) --[[ Line: 68 ]] --[[ Name: mapDispatchToProps ]]
        -- upvalues: v8 (copy)
        return {
            updateCoreGuiEnabled = function(v21, v22) --[[ Line: 70 ]] --[[ Name: updateCoreGuiEnabled ]]
                -- upvalues: v20 (copy), v8 (ref)
                return v20(v8(v21, v22));
            end
        };
    end)(v12);
end;