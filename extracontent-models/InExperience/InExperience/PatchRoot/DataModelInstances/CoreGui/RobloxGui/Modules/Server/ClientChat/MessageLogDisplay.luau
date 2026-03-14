local v0 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 7 ]]
    return UserSettings():IsUserFeatureEnabled("UserRemoveMessageOnTextFilterFailures");
end);
v0 = l_status_0 and l_result_0;
l_status_0 = false;
local v3;
l_result_0, v3 = pcall(function() --[[ Line: 15 ]]
    return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2");
end);
l_status_0 = l_result_0 and v3;
l_result_0 = {
    ScrollBarThickness = 4
};
local l_ClientChatModules_0 = game:GetService("Chat"):WaitForChild("ClientChatModules");
local l_Parent_0 = script.Parent;
local l_MessageLabelCreator_0 = require(l_Parent_0:WaitForChild("MessageLabelCreator"));
local l_CurveUtil_0 = require(l_Parent_0:WaitForChild("CurveUtil"));
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local v9 = l_MessageLabelCreator_0.new();
local v10 = {};
v10.__index = v10;
local function v14() --[[ Line: 42 ]] --[[ Name: CreateGuiObjects ]]
    -- upvalues: l_ChatSettings_0 (copy), l_result_0 (copy)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Selectable = false;
    l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_0.BackgroundTransparency = 1;
    local l_ScrollingFrame_0 = Instance.new("ScrollingFrame");
    l_ScrollingFrame_0.Selectable = l_ChatSettings_0.GamepadNavigationEnabled;
    l_ScrollingFrame_0.Name = "Scroller";
    l_ScrollingFrame_0.BackgroundTransparency = 1;
    l_ScrollingFrame_0.BorderSizePixel = 0;
    l_ScrollingFrame_0.Position = UDim2.new(0, 0, 0, 3);
    l_ScrollingFrame_0.Size = UDim2.new(1, -4, 1, -6);
    l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 0, 0);
    l_ScrollingFrame_0.ScrollBarThickness = l_result_0.ScrollBarThickness;
    l_ScrollingFrame_0.Active = true;
    l_ScrollingFrame_0.Parent = l_Frame_0;
    local l_UIListLayout_0 = Instance.new("UIListLayout");
    l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
    l_UIListLayout_0.Parent = l_ScrollingFrame_0;
    return l_Frame_0, l_ScrollingFrame_0, l_UIListLayout_0;
end;
v10.Destroy = function(v15) --[[ Line: 67 ]] --[[ Name: Destroy ]]
    v15.GuiObject:Destroy();
    v15.Destroyed = true;
end;
v10.SetActive = function(v16, v17) --[[ Line: 72 ]] --[[ Name: SetActive ]]
    v16.GuiObject.Visible = v17;
end;
v10.UpdateMessageFiltered = function(v18, v19) --[[ Line: 76 ]] --[[ Name: UpdateMessageFiltered ]]
    -- upvalues: v0 (ref)
    local v20 = nil;
    local v21 = 1;
    local l_MessageObjectLog_0 = v18.MessageObjectLog;
    while v21 <= #l_MessageObjectLog_0 do
        local v23 = l_MessageObjectLog_0[v21];
        if v23.ID == v19.ID then
            v20 = v23;
            break;
        else
            v21 = v21 + 1;
        end;
    end;
    if v20 then
        if v0 then
            if v19.Message == "" then
                v18:RemoveMessageAtIndex(v21);
                return;
            else
                v20.UpdateTextFunction(v19);
                v18:PositionMessageLabelInWindow(v20, v21);
                return;
            end;
        else
            v20.UpdateTextFunction(v19);
            v18:PositionMessageLabelInWindow(v20, v21);
        end;
    end;
end;
v10.RefreshMessagePlacement = function(v24, v25) --[[ Line: 107 ]] --[[ Name: RefreshMessagePlacement ]]
    local v26 = nil;
    local v27 = 1;
    local l_MessageObjectLog_1 = v24.MessageObjectLog;
    while v27 <= #l_MessageObjectLog_1 do
        local v29 = l_MessageObjectLog_1[v27];
        if v29.ID == v25.ID then
            v26 = v29;
            break;
        else
            v27 = v27 + 1;
        end;
    end;
    if v26 then
        v24:PositionMessageLabelInWindow(v26, v27);
    end;
end;
v10.AddMessage = function(v30, v31) --[[ Line: 129 ]] --[[ Name: AddMessage ]]
    -- upvalues: l_status_0 (ref), v9 (copy)
    v30:WaitUntilParentedCorrectly();
    local v32 = nil;
    v32 = if l_status_0 then v9:CreateMessageLabel_Chat(v31, v30.CurrentChannelName, function() --[[ Line: 134 ]]
        -- upvalues: v30 (copy), v31 (copy)
        v30:RefreshMessagePlacement(v31);
    end) else v9:CreateMessageLabel(v31, v30.CurrentChannelName);
    if v32 == nil then
        return;
    else
        table.insert(v30.MessageObjectLog, v32);
        v30:PositionMessageLabelInWindow(v32, #v30.MessageObjectLog);
        return;
    end;
end;
v10.RemoveMessageAtIndex = function(v33, v34) --[[ Line: 151 ]] --[[ Name: RemoveMessageAtIndex ]]
    v33:WaitUntilParentedCorrectly();
    local v35 = v33.MessageObjectLog[v34];
    if v35 then
        v35:Destroy();
        table.remove(v33.MessageObjectLog, v34);
    end;
end;
v10.AddMessageAtIndex = function(v36, v37, v38) --[[ Line: 162 ]] --[[ Name: AddMessageAtIndex ]]
    -- upvalues: l_status_0 (ref), v9 (copy)
    local v39 = nil;
    v39 = if l_status_0 then v9:CreateMessageLabel_Chat(v37, v36.CurrentChannelName, function() --[[ Line: 165 ]]
        -- upvalues: v36 (copy), v37 (copy)
        v36:RefreshMessagePlacement(v37);
    end) else v9:CreateMessageLabel(v37, v36.CurrentChannelName);
    if v39 == nil then
        return;
    else
        table.insert(v36.MessageObjectLog, v38, v39);
        v36:PositionMessageLabelInWindow(v39, v38);
        return;
    end;
end;
v10.RemoveLastMessage = function(v40) --[[ Line: 183 ]] --[[ Name: RemoveLastMessage ]]
    v40:WaitUntilParentedCorrectly();
    v40.MessageObjectLog[1]:Destroy();
    table.remove(v40.MessageObjectLog, 1);
end;
v10.IsScrolledDown = function(v41) --[[ Line: 192 ]] --[[ Name: IsScrolledDown ]]
    local l_Offset_0 = v41.Scroller.CanvasSize.Y.Offset;
    local l_Y_0 = v41.Scroller.AbsoluteWindowSize.Y;
    local l_Y_1 = v41.Scroller.CanvasPosition.Y;
    local v45 = true;
    if l_Offset_0 >= l_Y_0 then
        v45 = l_Offset_0 - l_Y_1 <= l_Y_0 + 5;
    end;
    return v45;
end;
v10.UpdateMessageTextHeight = function(v46, v47) --[[ Line: 201 ]] --[[ Name: UpdateMessageTextHeight ]]
    local l_BaseFrame_0 = v47.BaseFrame;
    for v49 = 1, 10 do
        if not v47.BaseMessage.TextFits then
            local v50 = v46.Scroller.AbsoluteSize.X - v49;
            l_BaseFrame_0.Size = UDim2.new(1, 0, 0, v47.GetHeightFunction(v50));
        else
            break;
        end;
    end;
end;
v10.PositionMessageLabelInWindow = function(v51, v52, v53) --[[ Line: 213 ]] --[[ Name: PositionMessageLabelInWindow ]]
    v51:WaitUntilParentedCorrectly();
    local v54 = v51:IsScrolledDown();
    local l_BaseFrame_1 = v52.BaseFrame;
    local v56 = 1;
    if v51.MessageObjectLog[v53 - 1] then
        v56 = if v53 == #v51.MessageObjectLog then v51.MessageObjectLog[v53 - 1].BaseFrame.LayoutOrder + 1 else v51.MessageObjectLog[v53 - 1].BaseFrame.LayoutOrder;
    end;
    l_BaseFrame_1.LayoutOrder = v56;
    l_BaseFrame_1.Size = UDim2.new(1, 0, 0, v52.GetHeightFunction(v51.Scroller.AbsoluteSize.X));
    l_BaseFrame_1.Parent = v51.Scroller;
    if v52.BaseMessage then
        v51:UpdateMessageTextHeight(v52);
    end;
    if v54 then
        v51.Scroller.CanvasPosition = Vector2.new(0, (math.max(0, v51.Scroller.CanvasSize.Y.Offset - v51.Scroller.AbsoluteSize.Y)));
    end;
end;
v10.ReorderAllMessages = function(v57) --[[ Line: 243 ]] --[[ Name: ReorderAllMessages ]]
    v57:WaitUntilParentedCorrectly();
    if v57.GuiObject.AbsoluteSize.Y < 1 then
        return;
    else
        local l_CanvasPosition_0 = v57.Scroller.CanvasPosition;
        local v59 = v57:IsScrolledDown();
        for _, v61 in pairs(v57.MessageObjectLog) do
            v57:UpdateMessageTextHeight(v61);
        end;
        if not v59 then
            v57.Scroller.CanvasPosition = l_CanvasPosition_0;
            return;
        else
            v57.Scroller.CanvasPosition = Vector2.new(0, (math.max(0, v57.Scroller.CanvasSize.Y.Offset - v57.Scroller.AbsoluteSize.Y)));
            return;
        end;
    end;
end;
v10.Clear = function(v62) --[[ Line: 265 ]] --[[ Name: Clear ]]
    for _, v64 in pairs(v62.MessageObjectLog) do
        v64:Destroy();
    end;
    v62.MessageObjectLog = {};
end;
v10.SetCurrentChannelName = function(v65, v66) --[[ Line: 272 ]] --[[ Name: SetCurrentChannelName ]]
    v65.CurrentChannelName = v66;
end;
v10.FadeOutBackground = function(_, _) --[[ Line: 276 ]] --[[ Name: FadeOutBackground ]]

end;
v10.FadeInBackground = function(_, _) --[[ Line: 280 ]] --[[ Name: FadeInBackground ]]

end;
v10.FadeOutText = function(v71, v72) --[[ Line: 284 ]] --[[ Name: FadeOutText ]]
    -- upvalues: l_CurveUtil_0 (copy)
    for v73 = 1, #v71.MessageObjectLog do
        if v71.MessageObjectLog[v73].FadeOutFunction then
            v71.MessageObjectLog[v73].FadeOutFunction(v72, l_CurveUtil_0);
        end;
    end;
end;
v10.FadeInText = function(v74, v75) --[[ Line: 292 ]] --[[ Name: FadeInText ]]
    -- upvalues: l_CurveUtil_0 (copy)
    for v76 = 1, #v74.MessageObjectLog do
        if v74.MessageObjectLog[v76].FadeInFunction then
            v74.MessageObjectLog[v76].FadeInFunction(v75, l_CurveUtil_0);
        end;
    end;
end;
v10.Update = function(v77, v78) --[[ Line: 300 ]] --[[ Name: Update ]]
    -- upvalues: l_CurveUtil_0 (copy)
    for v79 = 1, #v77.MessageObjectLog do
        if v77.MessageObjectLog[v79].UpdateAnimFunction then
            v77.MessageObjectLog[v79].UpdateAnimFunction(v78, l_CurveUtil_0);
        end;
    end;
end;
v10.WaitUntilParentedCorrectly = function(v80) --[[ Line: 309 ]] --[[ Name: WaitUntilParentedCorrectly ]]
    while not v80.GuiObject:IsDescendantOf(game:GetService("Players").LocalPlayer) do
        v80.GuiObject.AncestryChanged:wait();
    end;
end;
l_result_0.new = function() --[[ Line: 318 ]] --[[ Name: new ]]
    -- upvalues: v10 (copy), v14 (copy)
    local v81 = setmetatable({}, v10);
    v81.Destroyed = false;
    local v82, v83, v84 = v14();
    v81.GuiObject = v82;
    v81.Scroller = v83;
    v81.Layout = v84;
    v81.MessageObjectLog = {};
    v81.Name = "MessageLogDisplay";
    v81.GuiObject.Name = "Frame_" .. v81.Name;
    v81.CurrentChannelName = "";
    v81.GuiObject:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 334 ]]
        -- upvalues: v81 (copy)
        spawn(function() --[[ Line: 335 ]]
            -- upvalues: v81 (ref)
            v81:ReorderAllMessages();
        end);
    end);
    local v85 = true;
    v81.Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Line: 340 ]]
        -- upvalues: v81 (copy), v85 (ref)
        local l_AbsoluteContentSize_0 = v81.Layout.AbsoluteContentSize;
        v81.Scroller.CanvasSize = UDim2.new(0, 0, 0, l_AbsoluteContentSize_0.Y);
        if v85 then
            local l_AbsoluteWindowSize_0 = v81.Scroller.AbsoluteWindowSize;
            v81.Scroller.CanvasPosition = Vector2.new(0, l_AbsoluteContentSize_0.Y - l_AbsoluteWindowSize_0.Y);
        end;
    end);
    v81.Scroller:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 349 ]]
        -- upvalues: v85 (ref), v81 (copy)
        v85 = v81:IsScrolledDown();
    end);
    return v81;
end;
return l_result_0;