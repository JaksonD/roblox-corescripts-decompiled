local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_script_FirstAncestor_0.Enums.PromptState);
local _ = require(l_script_FirstAncestor_0.types);
local _ = require(l_script_FirstAncestor_0.Enums.TransferDirection);
local _ = require(l_script_FirstAncestor_0.Enums.TransferOrigination);
local _ = require(l_script_FirstAncestor_0.Models.ErrorTransferModel);
local _ = require(l_script_FirstAncestor_0.Enums.TransferRetryOrigin);
return function() --[[ Line: 65 ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v9, v10 = v2.createSignal(v3.Unspecified);
    local v11, v12 = v2.createSignal(nil);
    local v13, v14 = v2.createSignal(0);
    local v15, v16 = v2.createSignal(0);
    local v17, v18 = v2.createSignal(false);
    local v19, v20 = v2.createSignal(nil);
    local v21, v22 = v2.createSignal(nil);
    local v23, v24 = v2.createSignal(nil);
    local v25, v26 = v2.createSignal(nil);
    local v27, v28 = v2.createSignal(nil);
    local v29, v30 = v2.createSignal(nil);
    local v31, v32 = v2.createSignal(nil);
    local v33, v34 = v2.createSignal(false);
    local v35, v36 = v2.createSignal(nil);
    local v37, v38 = v2.createSignal(nil);
    local v39, v40 = v2.createSignal(nil);
    local v41, v42 = v2.createSignal(nil);
    local v43, v44 = v2.createSignal(nil);
    local v45, v46 = v2.createSignal("");
    local v47 = nil;
    local function v49(v48) --[[ Line: 89 ]] --[[ Name: setOnClose ]]
        -- upvalues: v47 (ref)
        v47 = v48;
    end;
    local function v50() --[[ Line: 93 ]] --[[ Name: triggerOnClose ]]
        -- upvalues: v47 (ref)
        if v47 then
            v47();
        end;
    end;
    return {
        getPromptState = v9, 
        setPromptState = v10, 
        getTransferRequestId = v11, 
        setTransferRequestId = v12, 
        getRecipientUserId = v13, 
        setRecipientUserId = v14, 
        getRobuxBalanceAmount = v15, 
        setRobuxBalanceAmount = v16, 
        getBalanceReceivedFromApi = v17, 
        setBalanceReceivedFromApi = v18, 
        getSelectedAmount = v19, 
        setSelectedAmount = v20, 
        getUserRelationshipDetail = v21, 
        setUserRelationshipDetail = v22, 
        getRecipient = v23, 
        setRecipient = v24, 
        getSender = v25, 
        setSender = v26, 
        getDirection = v27, 
        setDirection = v28, 
        getTransferOrigination = v29, 
        setTransferOrigination = v30, 
        getRobuxTransfer = v31, 
        setRobuxTransfer = v32, 
        getIsAlreadyAccepted = v33, 
        setIsAlreadyAccepted = v34, 
        getErrorTransferModel = v35, 
        setErrorTransferModel = v36, 
        getAmpRecourseActions = v37, 
        setAmpRecourseActions = v38, 
        getAmpFeatureCheck = v39, 
        setAmpFeatureCheck = v40, 
        getPreviousPromptState = v41, 
        setPreviousPromptState = v42, 
        getTransferRetryOrigin = v43, 
        setTransferRetryOrigin = v44, 
        getTransferClientSessionId = v45, 
        setTransferClientSessionId = v46, 
        setOnClose = v49, 
        triggerOnClose = v50
    };
end;