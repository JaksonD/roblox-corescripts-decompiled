local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utility.Flags);
local l_CoreGui_0 = require(l_script_FirstAncestor_0.Utility.Wrappers).Services.CoreGui;
local l_GuiService_0 = require(l_script_FirstAncestor_0.Utility.Wrappers).Services.GuiService;
local v5 = require(l_Parent_0.Dash);
local v6 = require(l_Parent_0.React);
local l_useRefCache_0 = require(l_Parent_0.ReactUtils).useRefCache;
local v8 = require(l_script_FirstAncestor_0.Utility.isPluginSecurity);
local v9 = require(script.Parent.Cursors.Cursor);
local v10 = require(script.Parent.CursorComponent);
local v11 = require(script.Parent.CursorContext);
local _ = require(l_script_FirstAncestor_0.Enums.CursorType);
local v13 = require(script.Parent.KeyUtilities);
local _ = require(l_script_FirstAncestor_0.Enums.ColorMode);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v16 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
return function(v17) --[[ Line: 29 ]] --[[ Name: CursorProvider ]]
    -- upvalues: v6 (copy), l_useRefCache_0 (copy), v16 (copy), v13 (copy), v5 (copy), v9 (copy), v10 (copy), v2 (copy), v8 (copy), l_CoreGui_0 (copy), l_GuiService_0 (copy), v11 (copy)
    local v18, v19 = v6.useState({});
    local v20 = v6.useRef(nil);
    local v21, v22 = v6.useState(nil);
    local v23 = l_useRefCache_0();
    local v24 = v16();
    local v28 = v6.useMemo(function() --[[ Line: 36 ]]
        -- upvalues: v23 (copy), v19 (copy), v13 (ref), v24 (copy), v5 (ref)
        return {
            refCache = v23, 
            setMountedCursors = v19, 
            getCursor = function(v25) --[[ Line: 40 ]] --[[ Name: getCursor ]]
                -- upvalues: v13 (ref), v24 (ref), v19 (ref), v5 (ref), v23 (ref)
                local v26 = v13.mapCursorToKey(v25, v24);
                v19(function(v27) --[[ Line: 43 ]]
                    -- upvalues: v26 (copy), v5 (ref)
                    if v27[v26] == nil then
                        return v5.union(v27, {
                            [v26] = true
                        });
                    else
                        return v27;
                    end;
                end);
                return v23[v26];
            end
        };
    end, {
        v23, 
        v19, 
        v24
    });
    local function v40() --[[ Line: 57 ]]
        -- upvalues: v18 (copy), v23 (copy), v21 (copy), v13 (ref), v6 (ref), v9 (ref), v10 (ref)
        local v29 = {};
        for v30, _ in v18 do
            local v32 = false;
            if v23[v30] ~= nil then
                v32 = false;
                if v21 ~= nil then
                    v32 = v23[v30].current == v21;
                end;
            end;
            local v33 = string.split(v30, " ");
            if #v33 == 2 then
                local v34, v35 = v13.decodeCursorTypeKey(v33);
                v29[v30] = v6.createElement(v9, {
                    ref = v23[v30], 
                    isVisible = v32, 
                    cursorType = v34, 
                    colorMode = v35
                });
            else
                local v36, v37, v38, v39 = v13.decodeKey(v33);
                v29[v30] = v6.createElement(v10, {
                    ref = v23[v30], 
                    isVisible = v32, 
                    cornerRadius = v36, 
                    offset = v37, 
                    borderWidth = v38, 
                    colorMode = v39
                });
            end;
        end;
        return v29;
    end;
    v6.useEffect(function() --[[ Line: 94 ]]
        -- upvalues: v20 (copy), v2 (ref), v8 (ref), l_CoreGui_0 (ref), l_GuiService_0 (ref), v22 (copy)
        if v20.current == nil or if v2.FoundationAllowMockDataModel then not game:IsAncestorOf(v20.current) else not v20.current:IsDescendantOf(game) then
            return;
        else
            local v41 = v8() and v20.current:IsDescendantOf(l_CoreGui_0);
            local function v42() --[[ Line: 108 ]] --[[ Name: setUpSelectionImageObjectConnection ]]
                -- upvalues: v41 (copy), l_GuiService_0 (ref), v22 (ref)
                if v41 then
                    return l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 113 ]]
                        -- upvalues: l_GuiService_0 (ref), v22 (ref)
                        if l_GuiService_0.SelectedCoreObject == nil then
                            v22(nil);
                            return;
                        else
                            v22(l_GuiService_0.SelectedCoreObject.SelectionImageObject);
                            return;
                        end;
                    end);
                else
                    return l_GuiService_0:GetPropertyChangedSignal("SelectedObject"):Connect(function() --[[ Line: 121 ]]
                        -- upvalues: l_GuiService_0 (ref), v22 (ref)
                        if l_GuiService_0.SelectedObject == nil then
                            v22(nil);
                            return;
                        else
                            v22(l_GuiService_0.SelectedObject.SelectionImageObject);
                            return;
                        end;
                    end);
                end;
            end;
            local v43 = v42();
            local v44 = v20.current.AncestryChanged:Connect(function() --[[ Line: 132 ]]
                -- upvalues: v43 (ref), v42 (copy)
                v43:Disconnect();
                v43 = v42();
            end);
            return function() --[[ Line: 142 ]]
                -- upvalues: v43 (ref), v44 (copy)
                v43:Disconnect();
                v44:Disconnect();
            end;
        end;
    end, {});
    return v6.createElement(v11.Provider, {
        value = v28
    }, {
        Children = v6.createElement(v6.Fragment, {}, v17.children), 
        FoundationCursorContainer = v6.createElement("Frame", {
            Size = UDim2.new(0, 0, 0, 0), 
            Visible = false, 
            ref = v20
        }, (v40()))
    });
end;