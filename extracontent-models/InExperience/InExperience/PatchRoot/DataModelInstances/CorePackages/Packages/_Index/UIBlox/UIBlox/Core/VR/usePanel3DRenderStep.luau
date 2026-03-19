local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_0.Constants);
local function v8(v4, v5) --[[ Line: 12 ]] --[[ Name: GetUserCFrameWorldSpace ]]
    local l_v5_UserCFrame_0 = v5:GetUserCFrame(v4);
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if not l_CurrentCamera_0.HeadLocked then
        l_v5_UserCFrame_0 = v5:GetUserCFrame(Enum.UserCFrame.Head):Inverse() * l_v5_UserCFrame_0;
    end;
    return l_CurrentCamera_0.CFrame * (CFrame.new(l_v5_UserCFrame_0.p * l_CurrentCamera_0.HeadScale) * (l_v5_UserCFrame_0 - l_v5_UserCFrame_0.p));
end;
return function(v9, v10) --[[ Line: 24 ]] --[[ Name: usePanel3DRenderStep ]]
    -- upvalues: v3 (copy), v2 (copy), v8 (copy)
    if v9.anchoring == v3.AnchoringTypes.PanelManaged and v9.connectPanelManagerFunction then
        return;
    else
        local v11 = v2.useRef(v9.offset);
        local v12 = v2.useRef(nil);
        local v13 = v2.useRef(false);
        local l_vrService_0 = v9.vrService;
        v2.useEffect(function() --[[ Line: 35 ]]
            -- upvalues: v11 (copy), v9 (copy)
            v11.current = v9.offset;
        end, {});
        local v31 = v2.useCallback(function(v15) --[[ Line: 39 ]]
            -- upvalues: v9 (copy), v3 (ref), l_vrService_0 (copy), v8 (ref), v12 (copy), v13 (copy), v11 (copy), v10 (copy)
            local l_CurrentCamera_1 = workspace.CurrentCamera;
            local v17 = nil;
            local l_CFrame_0 = l_CurrentCamera_1.CFrame;
            local l_HeadScale_0 = l_CurrentCamera_1.HeadScale;
            local v20 = nil;
            if v9.anchoring == v3.AnchoringTypes.Head then
                v20 = l_vrService_0:GetUserCFrame(Enum.UserCFrame.Head);
                local v21 = v8(Enum.UserCFrame.Head, l_vrService_0);
                if v12.current == nil then
                    v12.current = v21;
                end;
                assert(v12.current ~= nil, "lastLookCFrame should not be nil.");
                if v12.current.LookVector:Dot(v21.LookVector) < 0.85 then
                    v13.current = true;
                elseif v12.current.LookVector:Dot(v21.LookVector) > 0.99 then
                    v13.current = false;
                end;
                if v13.current then
                    v12.current = v12.current:Lerp(v21, 7.2 * v15);
                end;
                v17 = v21.Position + v12.current.LookVector * l_HeadScale_0 * 2;
                v17 = Vector3.new(v17.X, v21.Position.Y, v17.Z);
                local l_alignedPanel_0 = v9.alignedPanel;
                if l_alignedPanel_0 then
                    local l_l_alignedPanel_0_Part_0 = l_alignedPanel_0:GetPart();
                    if l_l_alignedPanel_0_Part_0 and l_alignedPanel_0:IsPositionLockedType() and (l_alignedPanel_0:IsVisible() or l_alignedPanel_0.alwaysUpdatePosition) then
                        v17 = Vector3.new(l_l_alignedPanel_0_Part_0.Position.X, v21.Position.Y - 0.4 * l_HeadScale_0, l_l_alignedPanel_0_Part_0.Position.Z);
                    end;
                end;
            elseif v9.anchoring == v3.AnchoringTypes.Wrist then
                if l_vrService_0:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) and l_vrService_0.GuiInputUserCFrame == Enum.UserCFrame.LeftHand then
                    v20 = l_vrService_0:GetUserCFrame(Enum.UserCFrame.RightHand);
                elseif l_vrService_0:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
                    v20 = l_vrService_0:GetUserCFrame(Enum.UserCFrame.LeftHand);
                end;
                if not v20 then
                    v20 = l_vrService_0:GetUserCFrame(Enum.UserCFrame.Head);
                end;
                local v24 = v20.Position * l_HeadScale_0;
                v17 = (l_CFrame_0 * CFrame.new(v24)).Position;
            else
                return;
            end;
            if v9.offsetCallback then
                v17 = v9.offsetCallback({
                    finalPosition = v17, 
                    cameraHeadScale = l_HeadScale_0
                });
            end;
            if v9.lerp and v11.current ~= nil then
                v11.current = v11.current:Lerp(v9.offset, 7.2 * v15);
            else
                v11.current = v9.offset;
            end;
            local v25 = nil;
            if v11.current ~= nil then
                if v9.faceCamera then
                    local v26 = v8(Enum.UserCFrame.Head, l_vrService_0);
                    v25 = CFrame.new(v17 + v11.current.Position * l_HeadScale_0, v26.Position);
                else
                    local v27, v28, v29 = v20:ToOrientation();
                    local v30 = CFrame.new(v11.current.Position * l_HeadScale_0);
                    v25 = CFrame.new(v17) * CFrame.Angles(-v27, v28, -v29) * v30;
                end;
            end;
            if v9.tiltCallback then
                v25 = v9.tiltCallback({
                    panelCFrame = v25, 
                    cameraHeadScale = l_HeadScale_0
                });
            end;
            if v10.current ~= nil then
                v10.current.CFrame = v25;
                v10.current.Size = Vector3.new(v9.partSize.X * l_HeadScale_0, v9.partSize.Y * l_HeadScale_0, 0.05);
            end;
        end, {
            v9.anchoring, 
            v9.faceCamera, 
            v9.lerp, 
            v9.offset, 
            v9.partSize, 
            v9.alignedPanel, 
            v9.offsetCallback, 
            v9.tiltCallback
        });
        v2.useEffect(function() --[[ Line: 161 ]]
            -- upvalues: v9 (copy), v3 (ref), v31 (copy)
            if v9.anchoring ~= v3.AnchoringTypes.World then
                local v32 = nil;
                local v33 = nil;
                local v34 = nil;
                local function v35() --[[ Line: 166 ]] --[[ Name: onCurrentCameraChanged ]]
                    -- upvalues: v32 (ref), v31 (ref)
                    if v32 then
                        v32:Disconnect();
                    end;
                    if workspace.CurrentCamera then
                        v32 = workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ Line: 173 ]]
                            -- upvalues: v31 (ref)
                            v31(0);
                        end);
                    end;
                end;
                v34 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(v35);
                v35();
                if v9.alignedPanel then
                    local l_Part_0 = v9.alignedPanel:GetPart();
                    if l_Part_0 then
                        v33 = l_Part_0:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ Line: 186 ]]
                            -- upvalues: v31 (ref)
                            v31(0);
                        end);
                    end;
                end;
                local v37 = v9.movementUpdateEvent:Connect(v31);
                return function() --[[ Line: 194 ]]
                    -- upvalues: v37 (copy), v34 (ref), v32 (ref), v33 (ref)
                    v37:Disconnect();
                    v34:Disconnect();
                    if v32 then
                        v32:Disconnect();
                    end;
                    if v33 then
                        v33:Disconnect();
                    end;
                end;
            else
                return function() --[[ Line: 205 ]]

                end;
            end;
        end, {
            v9.anchoring, 
            v31
        });
        return;
    end;
end;