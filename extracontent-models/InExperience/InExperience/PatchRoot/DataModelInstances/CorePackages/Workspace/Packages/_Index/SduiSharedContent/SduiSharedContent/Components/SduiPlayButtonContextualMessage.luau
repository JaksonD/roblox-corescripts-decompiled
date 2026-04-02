local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.GamePlayButton);
local v4 = require(l_Parent_0.RoactServiceTags);
local l_useTokens_0 = v2.Hooks.useTokens;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_usePlayButtonContextualMessage_0 = v3.usePlayButtonContextualMessage;
local l_usePlayButtonState_0 = v3.usePlayButtonState;
local _ = require(l_Parent_0.SduiCoreSystem);
local l_Text_0 = v2.Text;
return v1.memo(function(v11) --[[ Line: 28 ]] --[[ Name: SduiPlayButtonContextualMessage ]]
    -- upvalues: l_useRoactService_0 (copy), v4 (copy), l_useTokens_0 (copy), l_usePlayButtonState_0 (copy), l_usePlayButtonContextualMessage_0 (copy), v1 (copy), l_Text_0 (copy)
    local v12 = l_useRoactService_0(v4.RoactNetworking);
    local v13 = l_useTokens_0();
    local v14 = l_usePlayButtonState_0(v12, v11.universeId, v11.fetchDelayInSeconds);
    local v15 = l_usePlayButtonContextualMessage_0(v11.universeId, v14.playButtonState, v14.playabilityStatus);
    if v15 == nil or v15 == "" then
        return nil;
    else
        return v1.createElement(l_Text_0, {
            tag = "auto-xy text-caption-medium text-wrap text-align-x-left", 
            textStyle = v13.Color.Content.Emphasis, 
            Text = v15, 
            LayoutOrder = v11.layoutOrder
        });
    end;
end);