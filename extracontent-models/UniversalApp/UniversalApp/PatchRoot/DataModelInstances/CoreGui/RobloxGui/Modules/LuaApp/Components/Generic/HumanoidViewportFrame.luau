local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_Modules_0.LuaApp.Util.rebuildJoints);
local v7 = require(l_Modules_0.LuaApp.Components.Generic.AvatarViewportFrame);
local v8 = v5.interface({
    humanoidDescription = v5.optional(v5.instanceIsA("HumanoidDescription")), 
    loadRigType = v5.optional(v5.enum(Enum.HumanoidRigType)), 
    Size = v5.optional(v5.UDim2), 
    Position = v5.optional(v5.UDim2)
});
local v9 = v4.PureComponent:extend("HumanoidViewportFrame");
v9.defaultProps = {
    loadRigType = Enum.HumanoidRigType.R15
};
v9.init = function(v10) --[[ Line: 36 ]] --[[ Name: init ]]
    v10.state = {
        modelRef = nil
    };
    v10.isMounted = false;
end;
v9.updateHumanoid = function(v11) --[[ Line: 44 ]] --[[ Name: updateHumanoid ]]
    -- upvalues: l_Players_0 (copy), v6 (copy)
    if v11.state.modelRef ~= nil then
        v11.state.modelRef.value:Destroy();
        if v11.isMounted then
            v11:setState({
                modelRef = nil
            });
        end;
    end;
    local l_humanoidDescription_0 = v11.props.humanoidDescription;
    local l_loadRigType_0 = v11.props.loadRigType;
    if l_humanoidDescription_0 == nil then
        return;
    else
        coroutine.wrap(function() --[[ Line: 65 ]]
            -- upvalues: l_Players_0 (ref), l_humanoidDescription_0 (copy), l_loadRigType_0 (copy), v6 (ref), v11 (copy)
            local v14 = nil;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 68 ]]
                -- upvalues: v14 (ref), l_Players_0 (ref), l_humanoidDescription_0 (ref), l_loadRigType_0 (ref)
                if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                    v14 = l_Players_0:CreateHumanoidModelFromDescriptionAsync(l_humanoidDescription_0, l_loadRigType_0);
                    return;
                else
                    v14 = l_Players_0:CreateHumanoidModelFromDescription(l_humanoidDescription_0, l_loadRigType_0);
                    return;
                end;
            end);
            if not l_status_0 then
                warn(string.format("Cannot load model from humanoidDescription, reason: %s", (tostring(l_result_0))));
                return;
            else
                v14.Name = "Model";
                v6(v14);
                if v11.isMounted then
                    v11:setState({
                        modelRef = {
                            value = v14
                        }
                    });
                end;
                return;
            end;
        end)();
        return;
    end;
end;
v9.didMount = function(v17) --[[ Line: 97 ]] --[[ Name: didMount ]]
    v17.isMounted = true;
    v17:updateHumanoid();
end;
v9.willUnmount = function(v18) --[[ Line: 103 ]] --[[ Name: willUnmount ]]
    v18.isMounted = false;
    if v18.state.modelRef ~= nil then
        v18.state.modelRef.value:Destroy();
    end;
end;
v9.didUpdate = function(v19, v20) --[[ Line: 113 ]] --[[ Name: didUpdate ]]
    if v20.humanoidDescription ~= v19.props.humanoidDescription or v20.loadRigType ~= v19.props.loadRigType then
        v19:updateHumanoid();
    end;
end;
v9.render = function(v21) --[[ Line: 122 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v3 (copy), v4 (copy), v7 (copy)
    assert(v8(v21.props));
    local l_modelRef_0 = v21.state.modelRef;
    local v23 = v3.Dictionary.join(v21.props, {
        modelRef = l_modelRef_0, 
        humanoidDescription = v3.None, 
        loadRigType = v3.None
    });
    return v4.createElement(v7, v23);
end;
return v9;