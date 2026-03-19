local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.RoactGamepad);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(script.Parent.CursorKind);
local v5 = require(script.Parent.SelectionImageContext);
local v6 = require(script.Parent.OnRootedListener);
local l_GuiService_0 = game:GetService("GuiService");
local l_CoreGui_0 = game:GetService("CoreGui");
local v9 = v1.PureComponent:extend("SelectionCursorProvider");
v9.init = function(v10) --[[ Line: 16 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v2 (copy), v4 (copy), v3 (copy), l_CoreGui_0 (copy), l_GuiService_0 (copy)
    v10.ref = v1.createRef();
    v10.refs = v2.createRefCache();
    v10.state = {
        mountedCursors = {}, 
        currentSelection = nil, 
        currentCoreSelection = nil
    };
    v10.getSelectionCursor = function(v11) --[[ Line: 25 ]]
        -- upvalues: v4 (ref), v10 (copy), v3 (ref)
        assert(v4.isEnumValue(v11), ("Invalid arg #1: expected a CursorKind enum variant, got %s"):format((tostring(v11))));
        warn("UIBlox's SelectionCursor is deprecated and should not be used anymore.");
        if v10.state.mountedCursors[v11] == nil then
            v10:setState(function(v12) --[[ Line: 33 ]]
                -- upvalues: v3 (ref), v11 (copy)
                return {
                    mountedCursors = v3.Dictionary.join(v12.mountedCursors, {
                        [v11] = true
                    })
                };
            end);
        end;
        return v10.refs[v11];
    end;
    v10.initSelectionChangedListener = function(v13) --[[ Line: 49 ]]
        -- upvalues: v10 (copy), l_CoreGui_0 (ref), l_GuiService_0 (ref)
        if v13 == nil then
            return;
        else
            if v10.coreSelectionListener ~= nil then
                v10.coreSelectionListener:Disconnect();
                v10.coreSelectionListener = nil;
            end;
            if v10.selectionListener ~= nil then
                v10.selectionListener:Disconnect();
                v10.selectionListener = nil;
            end;
            if v13:IsDescendantOf(l_CoreGui_0) then
                v10.coreSelectionListener = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 66 ]]
                    -- upvalues: v10 (ref), l_GuiService_0 (ref)
                    if v10.state.currentCoreSelection == nil or l_GuiService_0.SelectedCoreObject == nil or v10.state.currentCoreSelection.SelectionImageObject ~= l_GuiService_0.SelectedCoreObject.SelectionImageObject then
                        v10:setState({
                            currentCoreSelection = l_GuiService_0.SelectedCoreObject
                        });
                    end;
                end);
                return;
            else
                v10.selectionListener = l_GuiService_0:GetPropertyChangedSignal("SelectedObject"):Connect(function() --[[ Line: 79 ]]
                    -- upvalues: v10 (ref), l_GuiService_0 (ref)
                    if v10.state.currentSelection == nil or l_GuiService_0.SelectedObject == nil or v10.state.currentSelection.SelectionImageObject ~= l_GuiService_0.SelectedObject.SelectionImageObject then
                        v10:setState({
                            currentSelection = l_GuiService_0.SelectedObject
                        });
                    end;
                end);
                return;
            end;
        end;
    end;
end;
v9.didMount = function(v14) --[[ Line: 93 ]] --[[ Name: didMount ]]
    v14.initSelectionChangedListener(v14.ref:getValue());
end;
v9.willUnmount = function(v15) --[[ Line: 97 ]] --[[ Name: willUnmount ]]
    if v15.coreSelectionListener ~= nil then
        v15.coreSelectionListener:Disconnect();
        v15.coreSelectionListener = nil;
    end;
    if v15.selectionListener ~= nil then
        v15.selectionListener:Disconnect();
        v15.selectionListener = nil;
    end;
end;
v9.render = function(v16) --[[ Line: 109 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v5 (copy), v6 (copy)
    local v17 = {};
    for v18, _ in pairs(v16.state.mountedCursors) do
        local v20 = v18.rawValue();
        local v21 = tostring(v20);
        local v22 = false;
        if v16.refs[v18] ~= nil and (v16.state.currentSelection ~= nil and v16.refs[v18].current == v16.state.currentSelection.SelectionImageObject or v16.state.currentCoreSelection ~= nil and v16.refs[v18].current == v16.state.currentCoreSelection.SelectionImageObject) then
            v22 = true;
        end;
        v17[v21] = v1.createElement(v20, {
            isVisible = v22, 
            cursorRef = v16.refs[v18]
        });
    end;
    return v1.createElement(v5.Provider, {
        value = v16.getSelectionCursor
    }, {
        CursorContainer = v1.createElement("Frame", {
            Size = UDim2.new(0, 0, 0, 0), 
            Visible = false
        }, v17), 
        OnRootedListener = v1.createElement(v6, {
            onRooted = v16.initSelectionChangedListener
        }), 
        Children = v1.createFragment(v16.props[v1.Children])
    });
end;
return v9;