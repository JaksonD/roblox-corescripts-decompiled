local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_script_FirstAncestor_0.Enums.PromptState);
local _ = require(l_script_FirstAncestor_0.types);
local _ = require(l_script_FirstAncestor_0.Enums.TransferDirection);
local _ = require(l_script_FirstAncestor_0.Enums.TransferOrigination);
local _ = require(l_script_FirstAncestor_0.Models.ErrorTransferModel);
local _ = require(l_script_FirstAncestor_0.Enums.TransferRetryOrigin);
return function() --[[ Line: 61 ]]
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
    local v33, v34 = v2.createSignal(nil);
    local v35, v36 = v2.createSignal(nil);
    local v37, v38 = v2.createSignal(nil);
    local v39, v40 = v2.createSignal(nil);
    local v41, v42 = v2.createSignal(nil);
    local v43 = nil;
    local function v45(v44) --[[ Line: 83 ]] --[[ Name: setOnClose ]]
        -- upvalues: v43 (ref)
        v43 = v44;
    end;
    local function v46() --[[ Line: 87 ]] --[[ Name: triggerOnClose ]]
        -- upvalues: v43 (ref)
        if v43 then
            v43();
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
        getErrorTransferModel = v33, 
        setErrorTransferModel = v34, 
        getAmpRecourseActions = v35, 
        setAmpRecourseActions = v36, 
        getAmpFeatureCheck = v37, 
        setAmpFeatureCheck = v38, 
        getPreviousPromptState = v39, 
        setPreviousPromptState = v40, 
        getTransferRetryOrigin = v41, 
        setTransferRetryOrigin = v42, 
        setOnClose = v45, 
        triggerOnClose = v46
    };
end;