local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useBinding_0 = v3.useBinding;
local l_useContext_0 = v3.useContext;
local l_useEffect_0 = v3.useEffect;
local l_useLayerCollector_0 = require(l_Parent_0.UIBlox).Core.Layout.LayerCollector.useLayerCollector;
local v8 = require(l_Parent_0.Responsive);
local l_useOrientation_0 = v8.useOrientation;
local v10 = require(l_script_FirstAncestor_0.Contexts.ParentContainer.ParentContainerContext);
local v11 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatInExperienceTabBarAdjustment);
return function() --[[ Line: 22 ]] --[[ Name: useParentContainerExtents ]]
    -- upvalues: l_useContext_0 (copy), v10 (copy), l_useLayerCollector_0 (copy), v11 (copy), l_useOrientation_0 (copy), l_useBinding_0 (copy), v8 (copy), l_useEffect_0 (copy), l_GuiService_0 (copy)
    local v12 = l_useContext_0(v10).getParentContainer();
    local v13 = l_useLayerCollector_0();
    local v14 = if not v11() then l_useOrientation_0() else nil;
    local v15, v16 = l_useBinding_0(if v12 then v12.AbsoluteSize else Vector2.zero);
    local v17, v18 = l_useBinding_0(if v12 then v12.AbsolutePosition else Vector2.zero);
    local v19 = if not v11() then v14 == v8.Keys.Landscape else nil;
    l_useEffect_0(function() --[[ Line: 37 ]]
        -- upvalues: v12 (copy), v13 (copy), v11 (ref), v19 (copy), l_GuiService_0 (ref), v16 (copy), v18 (copy)
        if v12 then
            local v20 = nil;
            local v21 = nil;
            local v22 = nil;
            local function _(v23, v24, v25) --[[ Line: 41 ]]
                return Vector2.new(math.clamp(v23.X, v24.X, v25.X), (math.clamp(v23.Y, v24.Y, v25.Y)));
            end;
            local function v34() --[[ Line: 45 ]]
                -- upvalues: v12 (ref), v13 (ref), v11 (ref), v19 (ref), l_GuiService_0 (ref), v16 (ref), v18 (ref)
                local l_AbsoluteSize_0 = v12.AbsoluteSize;
                local l_AbsolutePosition_0 = v12.AbsolutePosition;
                local l_absoluteSize_0 = v13.absoluteSize;
                local l_zero_0 = Vector2.zero;
                if not v11() and v19 then
                    l_zero_0 = Vector2.new(0, l_GuiService_0:GetSafeZoneOffsets().bottom);
                end;
                l_absoluteSize_0 = l_absoluteSize_0 - l_zero_0;
                local l_l_AbsolutePosition_0_0 = l_AbsolutePosition_0;
                local l_zero_1 = Vector2.zero;
                local l_l_absoluteSize_0_0 = l_absoluteSize_0;
                l_AbsolutePosition_0 = Vector2.new(math.clamp(l_l_AbsolutePosition_0_0.X, l_zero_1.X, l_l_absoluteSize_0_0.X), (math.clamp(l_l_AbsolutePosition_0_0.Y, l_zero_1.Y, l_l_absoluteSize_0_0.Y)));
                l_l_AbsolutePosition_0_0 = l_AbsoluteSize_0;
                l_zero_1 = Vector2.zero;
                l_l_absoluteSize_0_0 = l_absoluteSize_0 - l_AbsolutePosition_0;
                l_AbsoluteSize_0 = Vector2.new(math.clamp(l_l_AbsolutePosition_0_0.X, l_zero_1.X, l_l_absoluteSize_0_0.X), (math.clamp(l_l_AbsolutePosition_0_0.Y, l_zero_1.Y, l_l_absoluteSize_0_0.Y)));
                v16(l_AbsoluteSize_0);
                v18(l_AbsolutePosition_0);
            end;
            v20 = v12:GetPropertyChangedSignal("AbsoluteSize"):Connect(v34);
            v21 = v12:GetPropertyChangedSignal("AbsolutePosition"):Connect(v34);
            if not v11() then
                v22 = l_GuiService_0.SafeZoneOffsetsChanged:Connect(v34);
            end;
            v34();
            return function() --[[ Line: 85 ]]
                -- upvalues: v20 (ref), v21 (ref), v11 (ref), v22 (ref)
                if v20 and v20.Connected then
                    v20:Disconnect();
                end;
                if v21 and v21.Connected then
                    v21:Disconnect();
                end;
                if not v11() and v22 and v22.Connected then
                    v22:Disconnect();
                end;
            end;
        else
            return function() --[[ Line: 100 ]]

            end;
        end;
    end, {
        v12, 
        v16, 
        v18, 
        v13.absoluteSize, 
        v19
    });
    return v15, v17;
end;