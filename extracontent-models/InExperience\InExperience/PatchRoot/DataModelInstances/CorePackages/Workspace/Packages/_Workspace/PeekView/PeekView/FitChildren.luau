local l_Parent_0 = script:FindFirstAncestor("PeekView").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.Roact);
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local l_Symbol_0 = require(l_Parent_0.AppCommonLib).Symbol;
local v5 = {
    FitAxis = {
        Width = l_Symbol_0.named("Width"), 
        Height = l_Symbol_0.named("Height"), 
        Both = l_Symbol_0.named("Both")
    }
};
v5.wrap = function(v6) --[[ Line: 23 ]] --[[ Name: wrap ]]
    -- upvalues: v2 (copy), v5 (copy), l_Immutable_0 (copy), v1 (copy)
    local v7 = v2.PureComponent:extend(("FitChildren(%s)"):format((tostring(v6))));
    v7.disconnectSignals = function(v8) --[[ Line: 26 ]] --[[ Name: disconnectSignals ]]
        for _, v10 in ipairs(v8.signals) do
            v10:Disconnect();
        end;
    end;
    v7.resize = function(v11) --[[ Line: 32 ]] --[[ Name: resize ]]
        -- upvalues: v5 (ref)
        local v12 = v11.props.fitFields or if v11.props.fitAxis then {
            Size = v11.props.fitAxis
        } else {
            Size = v5.FitAxis.Both
        };
        v11:disconnectSignals();
        v11.signals = {};
        local l_current_0 = v11.ref.current;
        if l_current_0 == nil then
            return;
        else
            local l_UIGridStyleLayout_0 = l_current_0:FindFirstChildWhichIsA("UIGridStyleLayout");
            if l_UIGridStyleLayout_0 then
                local function v16() --[[ Line: 59 ]] --[[ Name: update ]]
                    -- upvalues: l_UIGridStyleLayout_0 (copy), v11 (copy), v12 (ref)
                    local l_AbsoluteContentSize_0 = l_UIGridStyleLayout_0.AbsoluteContentSize;
                    v11:applyFit(v12, l_AbsoluteContentSize_0.x, l_AbsoluteContentSize_0.y);
                end;
                local v17 = l_UIGridStyleLayout_0:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(v16);
                table.insert(v11.signals, v17);
                local l_AbsoluteContentSize_1 = l_UIGridStyleLayout_0.AbsoluteContentSize;
                v11:applyFit(v12, l_AbsoluteContentSize_1.x, l_AbsoluteContentSize_1.y);
            else
                v11:resizeFromChildren(v12);
                local l_l_current_0_Children_0 = l_current_0:GetChildren();
                for _, v21 in ipairs(l_l_current_0_Children_0) do
                    if v21:IsA("GuiBase2d") then
                        local v22 = v21:GetPropertyChangedSignal("Size"):Connect(function() --[[ Line: 73 ]]
                            -- upvalues: v11 (copy), v12 (ref)
                            v11:resizeFromChildren(v12);
                        end);
                        table.insert(v11.signals, v22);
                        local v23 = v21:GetPropertyChangedSignal("Position"):Connect(function() --[[ Line: 77 ]]
                            -- upvalues: v11 (copy), v12 (ref)
                            v11:resizeFromChildren(v12);
                        end);
                        table.insert(v11.signals, v23);
                    end;
                end;
            end;
            return;
        end;
    end;
    v7.resizeFromChildren = function(v24, v25) --[[ Line: 86 ]] --[[ Name: resizeFromChildren ]]
        local l_current_1 = v24.ref.current;
        if l_current_1 == nil then
            return;
        else
            local l_AbsolutePosition_0 = l_current_1.AbsolutePosition;
            local l_l_current_1_Children_0 = l_current_1:GetChildren();
            local v29 = 0;
            local v30 = 0;
            for _, v32 in ipairs(l_l_current_1_Children_0) do
                if v32:IsA("GuiBase2d") then
                    local l_AbsoluteSize_0 = v32.AbsoluteSize;
                    local l_AbsolutePosition_1 = v32.AbsolutePosition;
                    v29 = math.max(v29, l_AbsolutePosition_1.x - l_AbsolutePosition_0.x + l_AbsoluteSize_0.x);
                    v30 = math.max(v30, l_AbsolutePosition_1.y - l_AbsolutePosition_0.y + l_AbsoluteSize_0.y);
                end;
            end;
            v24:applyFit(v25, v29, v30);
            return;
        end;
    end;
    v7.applyFit = function(v35, v36, v37, v38) --[[ Line: 108 ]] --[[ Name: applyFit ]]
        -- upvalues: v5 (ref)
        local l_current_2 = v35.ref.current;
        if l_current_2 == nil then
            return;
        else
            local l_UIPadding_0 = l_current_2:FindFirstChildOfClass("UIPadding");
            local v41 = v35.props.Size or UDim2.new(0, 0, 0, 0);
            local l_Width_0 = v5.FitAxis.Width;
            local l_Height_0 = v5.FitAxis.Height;
            local function v55(v44, v45, v46, v47, v48, v49) --[[ Line: 119 ]] --[[ Name: calculateAxis ]]
                -- upvalues: v5 (ref), l_UIPadding_0 (copy)
                local v50 = true;
                if v44 ~= v45 then
                    v50 = v44 == v5.FitAxis.Both;
                end;
                local v51 = nil;
                local v52 = nil;
                if v50 then
                    v51 = 0;
                    if l_UIPadding_0 then
                        local v53 = l_UIPadding_0[v48].Scale + l_UIPadding_0[v49].Scale;
                        local v54 = l_UIPadding_0[v48].Offset + l_UIPadding_0[v49].Offset;
                        if v53 == 1 then
                            error("Can not apply FitChildren to a component with 100% padding width");
                            return v51, v52;
                        else
                            return v51, (v46 + v54) / (1 - v53);
                        end;
                    else
                        return v51, v46;
                    end;
                else
                    return v47.Scale, v47.Offset;
                end;
            end;
            for v56, v57 in pairs(v36) do
                local v58, v59 = v55(v57, l_Width_0, v37, v41.X, "PaddingLeft", "PaddingRight");
                local v60, v61 = v55(v57, l_Height_0, v38, v41.Y, "PaddingTop", "PaddingBottom");
                l_current_2[v56] = UDim2.new(v58, v59, v60, v61);
            end;
            return;
        end;
    end;
    v7.init = function(v62) --[[ Line: 150 ]] --[[ Name: init ]]
        -- upvalues: v7 (copy), v2 (ref)
        v62.signals = {};
        local l_forwardRef_0 = v62.props.forwardRef;
        assert(type(l_forwardRef_0) ~= "function", ("%s does not support function ref forwarding"):format((tostring(v7))));
        v62.ref = l_forwardRef_0 or v2.createRef();
    end;
    v7.render = function(v64) --[[ Line: 164 ]] --[[ Name: render ]]
        -- upvalues: l_Immutable_0 (ref), v2 (ref), v6 (copy)
        local v65 = l_Immutable_0.RemoveFromDictionary(v64.props, "fitAxis", "fitFields", "forwardRef");
        v65[v2.Ref] = v64.ref;
        return v2.createElement(v6, v65);
    end;
    v7.didMount = function(v66) --[[ Line: 171 ]] --[[ Name: didMount ]]
        v66:resize();
    end;
    v7.didUpdate = function(v67) --[[ Line: 175 ]] --[[ Name: didUpdate ]]
        v67:resize();
    end;
    v7.willUnmount = function(v68) --[[ Line: 179 ]] --[[ Name: willUnmount ]]
        v68:disconnectSignals();
    end;
    return v2.forwardRef(function(v69, v70) --[[ Line: 183 ]]
        -- upvalues: v2 (ref), v7 (copy), v1 (ref)
        return v2.createElement(v7, v1.Dictionary.join(v69, {
            forwardRef = v70
        }));
    end);
end;
v5.FitFrame = v5.wrap("Frame");
v5.FitScrollingFrame = v5.wrap("ScrollingFrame");
v5.FitTextButton = v5.wrap("TextButton");
return v5;