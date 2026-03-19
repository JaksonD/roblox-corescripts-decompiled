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
return function(v10) --[[ Line: 37 ]] --[[ Name: ShareLinkContainer ]]
    -- upvalues: v9 (copy), l_useSignalState_0 (copy), l_useDispatch_0 (copy), l_useEffect_0 (copy), v6 (copy), v2 (copy), v5 (copy)
    local l_linkId_0 = v10.shareLink.linkId;
    local l_linkType_0 = v10.shareLink.linkType;
    local v13 = v9(false);
    local v14 = l_useSignalState_0(v13.getShareLinkMetadataComputed(l_linkId_0));
    local v15 = l_useDispatch_0();
    l_useEffect_0(function() --[[ Line: 44 ]]
        -- upvalues: v14 (copy), v13 (copy), v15 (copy), l_linkId_0 (copy), l_linkType_0 (copy), v6 (ref)
        if not v14 then
            v13.fetchShareLinkMetadata(v15, l_linkId_0, l_linkType_0);
            return;
        else
            v6:warning("ShareLinkContainer: Missing linkId or linkType in props.");
            return;
        end;
    end, {
        l_linkId_0, 
        l_linkType_0, 
        v14
    });
    return v2.createElement(v5, {
        universeId = if v14 then v14.universeId else nil, 
        placeId = if v14 then v14.placeId else nil, 
        conversationId = v10.conversationId, 
        senderUserId = v10.senderUserId, 
        onDetailsOpened = v10.onDetailsOpened, 
        openGameDetailsPage = v10.openGameDetailsPage, 
        networkImpl = v10.networkImpl, 
        eventStream = v10.eventStream, 
        eventIngest = v10.eventIngest, 
        luaChatPlayTogetherEnabled = v10.luaChatPlayTogetherEnabled, 
        isStartOfGroup = v10.isStartOfGroup, 
        isIncoming = v10.isIncoming, 
        isUnfiltered = v10.isUnfiltered, 
        isPending = v10.isPending, 
        isRepliedTo = v10.isRepliedTo
    });
end;