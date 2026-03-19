local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.Common.Immutable);
local v5 = require(l_Modules_0.Common.Symbol);
local v6 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v7 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local v8 = {
    FitAxis = {
        Width = v5.named("Width"), 
        Height = v5.named("Height"), 
        Both = v5.named("Both")
    }
};
v8.wrap = function(v9) --[[ Line: 25 ]] --[[ Name: wrap ]]
    -- upvalues: v3 (copy), v8 (copy), v4 (copy), v2 (copy)
    local v10 = v3.PureComponent:extend(("FitChildren(%s)"):format((tostring(v9))));
    v10.disconnectSignals = function(v11) --[[ Line: 28 ]] --[[ Name: disconnectSignals ]]
        for _, v13 in ipairs(v11.signals) do
            v13:Disconnect();
        end;
    end;
    v10.resize = function(v14) --[[ Line: 34 ]] --[[ Name: resize ]]
        -- upvalues: v8 (ref)
        local v15 = v14.props.fitFields or if v14.props.fitAxis then {
            Size = v14.props.fitAxis
        } else {
            Size = v8.FitAxis.Both
        };
        v14:disconnectSignals();
        v14.signals = {};
        local l_current_0 = v14.ref.current;
        if l_current_0 == nil then
            return;
        else
            local l_UIGridStyleLayout_0 = l_current_0:FindFirstChildWhichIsA("UIGridStyleLayout");
            if l_UIGridStyleLayout_0 then
                local function v19() --[[ Line: 61 ]] --[[ Name: update ]]
                    -- upvalues: l_UIGridStyleLayout_0 (copy), v14 (copy), v15 (ref)
                    local l_AbsoluteContentSize_0 = l_UIGridStyleLayout_0.AbsoluteContentSize;
                    v14:applyFit(v15, l_AbsoluteContentSize_0.x, l_AbsoluteContentSize_0.y);
                end;
                local v20 = l_UIGridStyleLayout_0:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(v19);
                table.insert(v14.signals, v20);
                local l_AbsoluteContentSize_1 = l_UIGridStyleLayout_0.AbsoluteContentSize;
                v14:applyFit(v15, l_AbsoluteContentSize_1.x, l_AbsoluteContentSize_1.y);
            else
                v14:resizeFromChildren(v15);
                local l_l_current_0_Children_0 = l_current_0:GetChildren();
                for _, v24 in ipairs(l_l_current_0_Children_0) do
                    if v24:IsA("GuiBase2d") then
                        local v25 = v24:GetPropertyChangedSignal("Size"):Connect(function() --[[ Line: 75 ]]
                            -- upvalues: v14 (copy), v15 (ref)
                            v14:resizeFromChildren(v15);
                        end);
                        table.insert(v14.signals, v25);
                        local v26 = v24:GetPropertyChangedSignal("Position"):Connect(function() --[[ Line: 79 ]]
                            -- upvalues: v14 (copy), v15 (ref)
                            v14:resizeFromChildren(v15);
                        end);
                        table.insert(v14.signals, v26);
                    end;
                end;
            end;
            return;
        end;
    end;
    v10.resizeFromChildren = function(v27, v28) --[[ Line: 88 ]] --[[ Name: resizeFromChildren ]]
        local l_current_1 = v27.ref.current;
        if l_current_1 == nil then
            return;
        else
            local l_AbsolutePosition_0 = l_current_1.AbsolutePosition;
            local l_l_current_1_Children_0 = l_current_1:GetChildren();
            local v32 = 0;
            local v33 = 0;
            for _, v35 in ipairs(l_l_current_1_Children_0) do
                if v35:IsA("GuiBase2d") then
                    local l_AbsoluteSize_0 = v35.AbsoluteSize;
                    local l_AbsolutePosition_1 = v35.AbsolutePosition;
                    v32 = math.max(v32, l_AbsolutePosition_1.x - l_AbsolutePosition_0.x + l_AbsoluteSize_0.x);
                    v33 = math.max(v33, l_AbsolutePosition_1.y - l_AbsolutePosition_0.y + l_AbsoluteSize_0.y);
                end;
            end;
            v27:applyFit(v28, v32, v33);
            return;
        end;
    end;
    v10.applyFit = function(v38, v39, v40, v41) --[[ Line: 110 ]] --[[ Name: applyFit ]]
        -- upvalues: v8 (ref)
        local l_current_2 = v38.ref.current;
        if l_current_2 == nil then
            return;
        else
            local l_UIPadding_0 = l_current_2:FindFirstChildOfClass("UIPadding");
            local v44 = v38.props.Size or UDim2.new(0, 0, 0, 0);
            local l_Width_0 = v8.FitAxis.Width;
            local l_Height_0 = v8.FitAxis.Height;
            local function v58(v47, v48, v49, v50, v51, v52) --[[ Line: 121 ]] --[[ Name: calculateAxis ]]
                -- upvalues: v8 (ref), l_UIPadding_0 (copy)
                local v53 = true;
                if v47 ~= v48 then
                    v53 = v47 == v8.FitAxis.Both;
                end;
                local v54 = nil;
                local v55 = nil;
                if v53 then
                    v54 = 0;
                    if l_UIPadding_0 then
                        local v56 = l_UIPadding_0[v51].Scale + l_UIPadding_0[v52].Scale;
                        local v57 = l_UIPadding_0[v51].Offset + l_UIPadding_0[v52].Offset;
                        if v56 == 1 then
                            error("Can not apply FitChildren to a component with 100% padding width");
                            return v54, v55;
                        else
                            return v54, (v49 + v57) / (1 - v56);
                        end;
                    else
                        return v54, v49;
                    end;
                else
                    return v50.Scale, v50.Offset;
                end;
            end;
            for v59, v60 in pairs(v39) do
                local v61, v62 = v58(v60, l_Width_0, v40, v44.X, "PaddingLeft", "PaddingRight");
                local v63, v64 = v58(v60, l_Height_0, v41, v44.Y, "PaddingTop", "PaddingBottom");
                l_current_2[v59] = UDim2.new(v61, v62, v63, v64);
            end;
            return;
        end;
    end;
    v10.init = function(v65) --[[ Line: 152 ]] --[[ Name: init ]]
        -- upvalues: v3 (ref)
        v65.signals = {};
        local l_forwardRef_0 = v65.props.forwardRef;
        if type(l_forwardRef_0) == "table" then
            v65.ref = l_forwardRef_0;
        else
            v65.ref = v3.createRef();
        end;
        v65.setRef = function(v67) --[[ Line: 164 ]]
            -- upvalues: v65 (copy), l_forwardRef_0 (copy)
            v65.ref.current = v67;
            if l_forwardRef_0 and type(l_forwardRef_0) == "function" then
                l_forwardRef_0(v67);
            end;
        end;
    end;
    v10.render = function(v68) --[[ Line: 172 ]] --[[ Name: render ]]
        -- upvalues: v4 (ref), v3 (ref), v9 (copy)
        local v69 = v4.RemoveFromDictionary(v68.props, "fitAxis", "fitFields", "forwardRef");
        v69[v3.Ref] = v68.setRef;
        return v3.createElement(v9, v69);
    end;
    v10.didMount = function(v70) --[[ Line: 179 ]] --[[ Name: didMount ]]
        v70:resize();
    end;
    v10.didUpdate = function(v71) --[[ Line: 183 ]] --[[ Name: didUpdate ]]
        v71:resize();
    end;
    v10.willUnmount = function(v72) --[[ Line: 187 ]] --[[ Name: willUnmount ]]
        v72:disconnectSignals();
    end;
    return v3.forwardRef(function(v73, v74) --[[ Line: 191 ]]
        -- upvalues: v3 (ref), v10 (copy), v2 (ref)
        return v3.createElement(v10, v2.Dictionary.join(v73, {
            forwardRef = v74
        }));
    end);
end;
v8.FitFrame = v8.wrap("Frame");
v8.FitScrollingFrame = v8.wrap("ScrollingFrame");
v8.FitTextButton = v8.wrap("TextButton");
v8.FitImageLabel = v8.wrap(v6);
v8.FitImageButton = v8.wrap(v7);
return v8;