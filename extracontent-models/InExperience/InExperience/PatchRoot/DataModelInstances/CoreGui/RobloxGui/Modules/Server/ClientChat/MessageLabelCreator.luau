local v0 = {};
local l_Chat_0 = game:GetService("Chat");
local l_ClientChatModules_0 = l_Chat_0:WaitForChild("ClientChatModules");
local l_MessageCreatorModules_0 = l_ClientChatModules_0:WaitForChild("MessageCreatorModules");
local l_Util_0 = require(l_MessageCreatorModules_0:WaitForChild("Util"));
local l_Parent_0 = script.Parent;
local _ = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local l_ObjectPool_0 = require(l_Parent_0:WaitForChild("ObjectPool"));
local _ = require(l_Parent_0:WaitForChild("MessageSender"));
local v9 = {};
v9.__index = v9;
mergeProps = function(v10, v11) --[[ Line: 26 ]] --[[ Name: mergeProps ]]
    if not v10 then
        return;
    else
        for v12, v13 in pairs(v10) do
            v11[v12] = v13;
        end;
        return;
    end;
end;
ReturnToObjectPoolRecursive = function(v14, v15) --[[ Line: 33 ]] --[[ Name: ReturnToObjectPoolRecursive ]]
    local l_v14_Children_0 = v14:GetChildren();
    for v17 = 1, #l_v14_Children_0 do
        ReturnToObjectPoolRecursive(l_v14_Children_0[v17], v15);
    end;
    v14.Parent = nil;
    v15:ReturnInstance(v14);
end;
GetMessageCreators = function() --[[ Line: 42 ]] --[[ Name: GetMessageCreators ]]
    -- upvalues: l_MessageCreatorModules_0 (copy), l_Util_0 (copy)
    local v18 = {};
    local l_l_MessageCreatorModules_0_Children_0 = l_MessageCreatorModules_0:GetChildren();
    for v20 = 1, #l_l_MessageCreatorModules_0_Children_0 do
        if l_l_MessageCreatorModules_0_Children_0[v20]:IsA("ModuleScript") and l_l_MessageCreatorModules_0_Children_0[v20].Name ~= "Util" then
            local v21 = require(l_l_MessageCreatorModules_0_Children_0[v20]);
            v18[v21[l_Util_0.KEY_MESSAGE_TYPE]] = v21[l_Util_0.KEY_CREATOR_FUNCTION];
        end;
    end;
    return v18;
end;
v9.WrapIntoMessageObject = function(v22, v23, v24) --[[ Line: 56 ]] --[[ Name: WrapIntoMessageObject ]]
    -- upvalues: l_Util_0 (copy)
    local v25 = v24[l_Util_0.KEY_BASE_FRAME];
    local v26 = nil;
    if l_Util_0.KEY_BASE_MESSAGE then
        v26 = v24[l_Util_0.KEY_BASE_MESSAGE];
    end;
    local v27 = v24[l_Util_0.KEY_UPDATE_TEXT_FUNC];
    local v28 = v24[l_Util_0.KEY_GET_HEIGHT];
    local v29 = v24[l_Util_0.KEY_FADE_IN];
    local v30 = v24[l_Util_0.KEY_FADE_OUT];
    local v31 = v24[l_Util_0.KEY_UPDATE_ANIMATION];
    return {
        ID = v23.ID, 
        BaseFrame = v25, 
        BaseMessage = v26, 
        UpdateTextFunction = v27 or function() --[[ Line: 73 ]]
            warn("NO MESSAGE RESIZE FUNCTION");
        end, 
        GetHeightFunction = v28, 
        FadeInFunction = v29, 
        FadeOutFunction = v30, 
        UpdateAnimFunction = v31, 
        ObjectPool = v22.ObjectPool, 
        Destroyed = false, 
        Destroy = function(v32) --[[ Line: 81 ]] --[[ Name: Destroy ]]
            ReturnToObjectPoolRecursive(v32.BaseFrame, v32.ObjectPool);
            v32.Destroyed = true;
        end
    };
end;
v9.CreateMessageLabel_Chat = function(v33, v34, v35, v36) --[[ Line: 89 ]] --[[ Name: CreateMessageLabel_Chat ]]
    -- upvalues: l_Chat_0 (copy)
    v34.Channel = v35;
    local v37 = nil;
    pcall(function() --[[ Line: 92 ]]
        -- upvalues: v37 (ref), l_Chat_0 (ref), v34 (copy)
        v37 = l_Chat_0:InvokeChatCallback(Enum.ChatCallbackType.OnClientFormattingMessage, v34);
    end);
    v34.ExtraData = v34.ExtraData or {};
    mergeProps(v37, v34.ExtraData);
    local l_MessageType_0 = v34.MessageType;
    if v33.MessageCreators[l_MessageType_0] then
        local v39 = v33.MessageCreators[l_MessageType_0](v34, v35, v36);
        if v39 then
            return v33:WrapIntoMessageObject(v34, v39);
        end;
    elseif v33.DefaultCreatorType then
        local v40 = v33.MessageCreators[v33.DefaultCreatorType](v34, v35, v36);
        if v40 then
            return v33:WrapIntoMessageObject(v34, v40);
        end;
    else
        error("No message creator available for message type: " .. l_MessageType_0);
    end;
end;
v9.CreateMessageLabel = function(v41, v42, v43) --[[ Line: 114 ]] --[[ Name: CreateMessageLabel ]]
    -- upvalues: l_Chat_0 (copy)
    v42.Channel = v43;
    local v44 = nil;
    pcall(function() --[[ Line: 118 ]]
        -- upvalues: v44 (ref), l_Chat_0 (ref), v42 (copy)
        v44 = l_Chat_0:InvokeChatCallback(Enum.ChatCallbackType.OnClientFormattingMessage, v42);
    end);
    v42.ExtraData = v42.ExtraData or {};
    mergeProps(v44, v42.ExtraData);
    local l_MessageType_1 = v42.MessageType;
    if v41.MessageCreators[l_MessageType_1] then
        local v46 = v41.MessageCreators[l_MessageType_1](v42, v43);
        if v46 then
            return v41:WrapIntoMessageObject(v42, v46);
        end;
    elseif v41.DefaultCreatorType then
        local v47 = v41.MessageCreators[v41.DefaultCreatorType](v42, v43);
        if v47 then
            return v41:WrapIntoMessageObject(v42, v47);
        end;
    else
        error("No message creator available for message type: " .. l_MessageType_1);
    end;
end;
v0.new = function() --[[ Line: 143 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy), l_ObjectPool_0 (copy), l_Util_0 (copy)
    local v48 = setmetatable({}, v9);
    v48.ObjectPool = l_ObjectPool_0.new(50);
    v48.MessageCreators = GetMessageCreators();
    v48.DefaultCreatorType = l_Util_0.DEFAULT_MESSAGE_CREATOR;
    l_Util_0:RegisterObjectPool(v48.ObjectPool);
    return v48;
end;
v0.GetStringTextBounds = function(_, v50, v51, v52, v53) --[[ Line: 155 ]] --[[ Name: GetStringTextBounds ]]
    -- upvalues: l_Util_0 (copy)
    return l_Util_0:GetStringTextBounds(v50, v51, v52, v53);
end;
return v0;