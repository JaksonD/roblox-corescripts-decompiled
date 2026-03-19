local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v3.Hooks.useTokens;
local v5 = require(l_script_FirstAncestor_0.Hooks.useIsChatUserMessagesEnabled);
local v6 = require(l_script_FirstAncestor_0.Utils.loadFoundationCloudAsset);
local v7, _ = v6("pictograms/chat");
local v9, _ = v6("pictograms/voice_chat");
local v11 = game:DefineFastFlag("FixEmptyConversationTransparency", false);
return v2.memo(function() --[[ Line: 16 ]] --[[ Name: EmptyConversationPage ]]
    -- upvalues: l_useTokens_0 (copy), v5 (copy), v2 (copy), v3 (copy), v11 (copy), v9 (copy), v7 (copy)
    local v12 = l_useTokens_0();
    local v13 = v5();
    return v2.createElement(v3.View, {
        tag = v11 and "size-full" or "bg-surface-0 size-full"
    }, {
        ChatIcon = v2.createElement(v3.Image, {
            Image = if v13 then v9 else v7, 
            imageStyle = v12.Color.Content.Emphasis, 
            ScaleType = Enum.ScaleType.Fit, 
            Size = UDim2.new(0, 320, 0, 320), 
            tag = "position-center-center anchor-center-center"
        })
    });
end);