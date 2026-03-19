local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local v5 = require(script.Parent.GameCardContainer);
local v6 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local l_useEffect_0 = v2.useEffect;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local v9 = require(l_script_FirstAncestor_0.Stores.GetShareLinkStore);
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableNewChatBubbleUI);
return function(v11) --[[ Line: 39 ]] --[[ Name: ShareLinkContainer ]]
    -- upvalues: v9 (copy), l_useSignalState_0 (copy), l_useDispatch_0 (copy), l_useEffect_0 (copy), v6 (copy), v2 (copy), v5 (copy), v10 (copy)
    local l_linkId_0 = v11.shareLink.linkId;
    local l_linkType_0 = v11.shareLink.linkType;
    local v14 = v9(false);
    local v15 = l_useSignalState_0(v14.getShareLinkMetadataComputed(l_linkId_0));
    local v16 = l_useDispatch_0();
    l_useEffect_0(function() --[[ Line: 46 ]]
        -- upvalues: v15 (copy), v14 (copy), v16 (copy), l_linkId_0 (copy), l_linkType_0 (copy), v6 (ref)
        if not v15 then
            v14.fetchShareLinkMetadata(v16, l_linkId_0, l_linkType_0);
            return;
        else
            v6:warning("ShareLinkContainer: Missing linkId or linkType in props.");
            return;
        end;
    end, {
        l_linkId_0, 
        l_linkType_0, 
        v15
    });
    return v2.createElement(v5, {
        universeId = if v15 then v15.universeId else nil, 
        placeId = if v15 then v15.placeId else nil, 
        conversationId = v11.conversationId, 
        senderUserId = v11.senderUserId, 
        onDetailsOpened = v11.onDetailsOpened, 
        openGameDetailsPage = v11.openGameDetailsPage, 
        networkImpl = v11.networkImpl, 
        eventStream = v11.eventStream, 
        eventIngest = v11.eventIngest, 
        luaChatPlayTogetherEnabled = v11.luaChatPlayTogetherEnabled, 
        isStartOfGroup = if v10 then v11.isStartOfGroup else nil, 
        isIncoming = if v10 then v11.isIncoming else nil, 
        isUnfiltered = if v10 then v11.isUnfiltered else nil, 
        isPending = if v10 then v11.isPending else nil, 
        isRepliedTo = if v10 then v11.isRepliedTo else nil
    });
end;