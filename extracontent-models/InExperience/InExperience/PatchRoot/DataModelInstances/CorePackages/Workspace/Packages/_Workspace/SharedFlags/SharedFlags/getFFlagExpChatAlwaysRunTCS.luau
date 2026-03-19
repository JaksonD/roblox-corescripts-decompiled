local l_Chat_0 = game:GetService("Chat");
game:DefineFastFlag("DebugExpChatAlwaysRunTCS", false);
local v1 = game:DefineFastFlag("ExpChatMigrationReplicationFix", false);
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_IsAutoMigrated_0 = l_Chat_0.IsAutoMigrated;
if game:GetService("RunService"):IsServer() then
    l_RobloxReplicatedStorage_0:SetAttribute("ChatMigratedToExpChat", l_Chat_0.IsAutoMigrated);
    l_Chat_0:GetPropertyChangedSignal("IsAutoMigrated"):Connect(function() --[[ Line: 17 ]]
        -- upvalues: l_RobloxReplicatedStorage_0 (copy), l_Chat_0 (copy), l_IsAutoMigrated_0 (ref)
        l_RobloxReplicatedStorage_0:SetAttribute("ChatMigratedToExpChat", l_Chat_0.IsAutoMigrated);
        l_IsAutoMigrated_0 = l_Chat_0.IsAutoMigrated;
    end);
else
    l_IsAutoMigrated_0 = l_RobloxReplicatedStorage_0:GetAttribute("ChatMigratedToExpChat") == true;
    l_RobloxReplicatedStorage_0:GetAttributeChangedSignal("ChatMigratedToExpChat"):Connect(function() --[[ Line: 23 ]]
        -- upvalues: l_IsAutoMigrated_0 (ref), l_RobloxReplicatedStorage_0 (copy), l_Chat_0 (copy)
        l_IsAutoMigrated_0 = l_RobloxReplicatedStorage_0:GetAttribute("ChatMigratedToExpChat") == true;
        l_Chat_0.IsAutoMigrated = l_IsAutoMigrated_0;
    end);
end;
local function _() --[[ Line: 29 ]] --[[ Name: IsChatAutoMigrated ]]
    -- upvalues: v1 (copy), l_Chat_0 (copy), l_IsAutoMigrated_0 (ref)
    if game:GetEngineFeature("ChatServiceCompatibilityForAll") then
        return true;
    elseif v1 and game:GetEngineFeature("TCSMigrationReplicationFix") then
        return l_Chat_0.IsAutoMigrated;
    else
        return l_IsAutoMigrated_0;
    end;
end;
return function() --[[ Line: 41 ]]
    -- upvalues: v1 (copy), l_Chat_0 (copy), l_IsAutoMigrated_0 (ref)
    return game:GetEngineFeature("ChatServiceCompatibilityForAll") and true or (if v1 and game:GetEngineFeature("TCSMigrationReplicationFix") then l_Chat_0.IsAutoMigrated else l_IsAutoMigrated_0) or game:GetFastFlag("DebugExpChatAlwaysRunTCS");
end;