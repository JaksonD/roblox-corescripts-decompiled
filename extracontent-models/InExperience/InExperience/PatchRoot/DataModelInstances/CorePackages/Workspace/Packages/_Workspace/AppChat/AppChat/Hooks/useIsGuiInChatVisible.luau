local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(script.Parent.useChatIsVisible);
local l_setTimeout_0 = require(l_Parent_0.LuauPolyfill).setTimeout;
local v6 = game:DefineFastInt("AppChat.GuiVisibleBatchUpdateIntervalMs", 1000);
local function v12(v7, v8, v9) --[[ Line: 24 ]] --[[ Name: getGuiObjectIsObscuredAtPosition ]]
    -- upvalues: l_CoreGui_0 (copy)
    for _, v11 in (l_CoreGui_0:GetGuiObjectsAtPosition(v8, v9)) do
        if v11:IsA("GuiObject") then
            if v11 == v7 then
                return false;
            elseif v11.Visible ~= false and v11.BackgroundTransparency <= 0.95 and not v11:IsDescendantOf(v7) then
                return true;
            end;
        end;
    end;
    return false;
end;
local function v28(v13) --[[ Line: 42 ]] --[[ Name: getGuiObjectIsObscured ]]
    -- upvalues: v12 (copy)
    local l_AbsolutePosition_0 = v13.AbsolutePosition;
    local l_AbsoluteSize_0 = v13.AbsoluteSize;
    local v16 = l_AbsolutePosition_0 + l_AbsoluteSize_0 * 0.5;
    local v17 = l_AbsolutePosition_0 + l_AbsoluteSize_0;
    local v18 = l_AbsolutePosition_0 + Vector2.new(l_AbsoluteSize_0.X, 0);
    local v19 = l_AbsolutePosition_0 + Vector2.new(0, l_AbsoluteSize_0.Y);
    local v20 = 1;
    local l_UICorner_0 = v13:FindFirstChildOfClass("UICorner");
    if l_UICorner_0 and l_UICorner_0:IsA("UICorner") then
        local l_Offset_0 = l_UICorner_0.CornerRadius.Offset;
        if l_Offset_0 > 0 then
            v20 = math.ceil(l_Offset_0 * 0.3) + 1;
        end;
    end;
    local v23 = v12(v13, v16.X, v16.Y);
    local v24 = v12(v13, l_AbsolutePosition_0.X + v20, l_AbsolutePosition_0.Y + v20);
    local v25 = v12(v13, v19.X + v20, v19.Y - v20);
    local v26 = v12(v13, v18.X - v20, v18.Y + v20);
    local v27 = v12(v13, v17.X - v20, v17.Y - v20);
    return v23 or v24 or v25 or v26 or v27;
end;
return function(v29, v30) --[[ Line: 82 ]] --[[ Name: useIsGuiInChatVisible ]]
    -- upvalues: v4 (copy), v3 (copy), v28 (copy), l_setTimeout_0 (copy), v6 (copy), v2 (copy)
    local v31 = v4();
    local v32, v33 = v3.useState(false);
    local v34 = v3.useRef(nil);
    v3.useEffect(function() --[[ Line: 92 ]]
        -- upvalues: v29 (copy), v28 (ref), v33 (copy), v34 (copy), l_setTimeout_0 (ref), v6 (ref), v31 (copy)
        local function _() --[[ Line: 93 ]] --[[ Name: updateIsGuiVisible ]]
            -- upvalues: v29 (ref), v28 (ref), v33 (ref)
            if v29.current and v29.current:IsA("GuiObject") then
                local l_IsNotOccluded_0 = v29.current.IsNotOccluded;
                local v36 = v28(v29.current);
                local v37 = l_IsNotOccluded_0 and not v36;
                v33(v37);
                return;
            else
                v33(false);
                return;
            end;
        end;
        local function v42() --[[ Line: 103 ]] --[[ Name: queueUpdateIsGuiVisible ]]
            -- upvalues: v34 (ref), l_setTimeout_0 (ref), v29 (ref), v28 (ref), v33 (ref), v6 (ref)
            if v34.current then
                return;
            else
                v34.current = l_setTimeout_0(function() --[[ Line: 107 ]]
                    -- upvalues: v34 (ref), v29 (ref), v28 (ref), v33 (ref)
                    v34.current = nil;
                    if v29.current and v29.current:IsA("GuiObject") then
                        local l_IsNotOccluded_1 = v29.current.IsNotOccluded;
                        local v40 = v28(v29.current);
                        local v41 = l_IsNotOccluded_1 and not v40;
                        v33(v41);
                        return;
                    else
                        v33(false);
                        return;
                    end;
                end, v6);
                return;
            end;
        end;
        local function v47(v43) --[[ Line: 112 ]] --[[ Name: onDescendantEvent ]]
            -- upvalues: v34 (ref), l_setTimeout_0 (ref), v29 (ref), v28 (ref), v33 (ref), v6 (ref)
            if not v43:IsA("GuiObject") then
                return;
            elseif v34.current then
                return;
            else
                v34.current = l_setTimeout_0(function() --[[ Line: 107 ]]
                    -- upvalues: v34 (ref), v29 (ref), v28 (ref), v33 (ref)
                    v34.current = nil;
                    if v29.current and v29.current:IsA("GuiObject") then
                        local l_IsNotOccluded_2 = v29.current.IsNotOccluded;
                        local v45 = v28(v29.current);
                        local v46 = l_IsNotOccluded_2 and not v45;
                        v33(v46);
                        return;
                    else
                        v33(false);
                        return;
                    end;
                end, v6);
                return;
            end;
        end;
        if not v34.current then
            v34.current = l_setTimeout_0(function() --[[ Line: 107 ]]
                -- upvalues: v34 (ref), v29 (ref), v28 (ref), v33 (ref)
                v34.current = nil;
                if v29.current and v29.current:IsA("GuiObject") then
                    local l_IsNotOccluded_3 = v29.current.IsNotOccluded;
                    local v49 = v28(v29.current);
                    local v50 = l_IsNotOccluded_3 and not v49;
                    v33(v50);
                    return;
                else
                    v33(false);
                    return;
                end;
            end, v6);
        end;
        local v51 = {};
        if v29.current and v29.current:IsA("GuiObject") and v31 then
            table.insert(v51, v29.current:GetPropertyChangedSignal("IsNotOccluded"):Connect(v42));
            local l_FirstAncestorWhichIsA_0 = v29.current:FindFirstAncestorWhichIsA("LayerCollector");
            if l_FirstAncestorWhichIsA_0 then
                table.insert(v51, l_FirstAncestorWhichIsA_0.DescendantAdded:Connect(v47));
                table.insert(v51, l_FirstAncestorWhichIsA_0.DescendantRemoving:Connect(v47));
            end;
        end;
        return function() --[[ Line: 133 ]]
            -- upvalues: v51 (copy)
            for _, v54 in v51 do
                v54:Disconnect();
            end;
        end;
    end, v2.List.join(v30, {
        v31
    }));
    return v31 and v32;
end;