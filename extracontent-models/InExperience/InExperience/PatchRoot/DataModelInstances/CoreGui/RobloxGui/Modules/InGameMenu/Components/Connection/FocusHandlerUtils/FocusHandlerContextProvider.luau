local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Roact_0 = require(l_CorePackages_0.Packages.InGameMenuDependencies).Roact;
local v3 = require(script.Parent.FocusHandlerContext);
local v4 = l_Roact_0.PureComponent:extend("FocusHandlerContextProvider");
v4.init = function(v5) --[[ Line: 17 ]] --[[ Name: init ]]
    v5.state = {
        candidateHandlerId = nil, 
        currentHandlerId = nil
    };
    v5.previousSelections = {};
end;
v4.requestFocusForHandlerId = function(v6, v7) --[[ Line: 25 ]] --[[ Name: requestFocusForHandlerId ]]
    v6:setState(function(v8) --[[ Line: 26 ]]
        -- upvalues: v7 (copy)
        if v8.currentHandlerId == nil then
            return {
                currentHandlerId = v7
            };
        elseif v7 ~= v8.currentHandlerId then
            return {
                candidateHandlerId = v7
            };
        else
            return nil;
        end;
    end);
end;
v4.blurCurrentFocusHandler = function(v9, v10, v11) --[[ Line: 41 ]] --[[ Name: blurCurrentFocusHandler ]]
    -- upvalues: l_GuiService_0 (copy), l_Roact_0 (copy)
    v9:setState(function(v12) --[[ Line: 42 ]]
        -- upvalues: v10 (copy), v11 (copy), l_GuiService_0 (ref), v9 (copy), l_Roact_0 (ref)
        if v12.currentHandlerId == v10 then
            local v13 = nil;
            if not v11 then
                v13 = l_GuiService_0.SelectedCoreObject;
            end;
            v9.previousSelections[v10] = v13;
            local _ = nil;
            if v12.candidateHandlerId ~= nil then
                return {
                    currentHandlerId = v12.candidateHandlerId, 
                    candidateHandlerId = l_Roact_0.None
                };
            else
                return {
                    currentHandlerId = l_Roact_0.None
                };
            end;
        else
            return nil;
        end;
    end);
end;
v4.forgetLastSelectionForHandlerId = function(v15, v16) --[[ Line: 67 ]] --[[ Name: forgetLastSelectionForHandlerId ]]
    v15.previousSelections[v16] = nil;
end;
v4.render = function(v17) --[[ Line: 71 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v3 (copy)
    return l_Roact_0.createElement(v3.Provider, {
        value = {
            currentHandlerId = v17.state.currentHandlerId, 
            candidateHandlerId = v17.state.candidateHandlerId, 
            previousSelections = v17.previousSelections, 
            requestFocusForHandlerId = function(v18) --[[ Line: 77 ]] --[[ Name: requestFocusForHandlerId ]]
                -- upvalues: v17 (copy)
                v17:requestFocusForHandlerId(v18);
            end, 
            forgetLastSelectionForHandlerId = function(v19) --[[ Line: 80 ]] --[[ Name: forgetLastSelectionForHandlerId ]]
                -- upvalues: v17 (copy)
                v17:forgetLastSelectionForHandlerId(v19);
            end, 
            blurCurrentFocusHandler = function(v20, v21) --[[ Line: 83 ]] --[[ Name: blurCurrentFocusHandler ]]
                -- upvalues: v17 (copy)
                v17:blurCurrentFocusHandler(v20, v21);
            end
        }
    }, v17.props[l_Roact_0.Children]);
end;
return v4;