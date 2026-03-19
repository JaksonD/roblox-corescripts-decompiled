local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.Actions.SetScreenSize);
local v5 = require(script.Parent.EventConnection);
local v6 = v1.PureComponent:extend("ScreenSizeConnector");
v6.init = function(v7) --[[ Line: 15 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v7.state = {
        layerCollector = nil
    };
    v7.folderRef = v1.createRef();
end;
v6.render = function(v8) --[[ Line: 23 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v5 (copy)
    if v8.state.layerCollector then
        local l_AbsoluteSize_0 = v8.state.layerCollector.AbsoluteSize;
        v8.props.setScreenSize(l_AbsoluteSize_0.X, l_AbsoluteSize_0.Y);
        return v1.createElement(v5, {
            event = v8.state.layerCollector:GetPropertyChangedSignal("AbsoluteSize"), 
            callback = function() --[[ Line: 29 ]] --[[ Name: callback ]]
                -- upvalues: l_AbsoluteSize_0 (ref), v8 (copy)
                l_AbsoluteSize_0 = v8.state.layerCollector.AbsoluteSize;
                v8.props.setScreenSize(l_AbsoluteSize_0.X, l_AbsoluteSize_0.Y);
            end
        });
    else
        return v1.createElement("Folder", {
            [v1.Ref] = v8.folderRef
        });
    end;
end;
v6.watchFolderAncestery = function(v10) --[[ Line: 41 ]] --[[ Name: watchFolderAncestery ]]
    if v10.folderRef.current and v10.ancesteryConnection == nil then
        local l_FirstAncestorWhichIsA_0 = v10.folderRef.current:FindFirstAncestorWhichIsA("LayerCollector");
        do
            local l_l_FirstAncestorWhichIsA_0_0 = l_FirstAncestorWhichIsA_0;
            if l_l_FirstAncestorWhichIsA_0_0 then
                v10:setState({
                    layerCollector = l_l_FirstAncestorWhichIsA_0_0
                });
            else
                v10.ancesteryConnection = v10.folderRef.current.AncestryChanged:Connect(function() --[[ Line: 49 ]]
                    -- upvalues: v10 (copy), l_l_FirstAncestorWhichIsA_0_0 (ref)
                    if v10.folderRef.current then
                        l_l_FirstAncestorWhichIsA_0_0 = v10.folderRef.current:FindFirstAncestorWhichIsA("LayerCollector");
                        if l_l_FirstAncestorWhichIsA_0_0 then
                            v10:setState({
                                layerCollector = l_l_FirstAncestorWhichIsA_0_0
                            });
                        end;
                    end;
                end);
            end;
        end;
    end;
end;
v6.didMount = function(v13) --[[ Line: 63 ]] --[[ Name: didMount ]]
    v13:watchFolderAncestery();
end;
v6.didUpdate = function(v14) --[[ Line: 67 ]] --[[ Name: didUpdate ]]
    if not v14.state.layerCollector then
        v14:watchFolderAncestery();
        return;
    else
        if v14.ancesteryConnection then
            v14.ancesteryConnection:Disconnect();
            v14.ancesteryConnection = nil;
        end;
        return;
    end;
end;
v6.willUnmount = function(v15) --[[ Line: 76 ]] --[[ Name: willUnmount ]]
    if v15.ancesteryConnection then
        v15.ancesteryConnection:Disconnect();
        v15.ancesteryConnection = nil;
    end;
end;
return v2.connect(nil, function(v16) --[[ Line: 83 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v4 (copy)
    return {
        setScreenSize = function(v17, v18) --[[ Line: 85 ]] --[[ Name: setScreenSize ]]
            -- upvalues: v16 (copy), v4 (ref)
            return v16(v4(v17, v18));
        end
    };
end)(v6);