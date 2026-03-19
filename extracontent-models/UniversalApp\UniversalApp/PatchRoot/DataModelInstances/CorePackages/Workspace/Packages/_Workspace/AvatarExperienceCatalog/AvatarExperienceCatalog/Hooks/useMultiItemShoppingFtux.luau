local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local l_SafeAppStorageService_0 = require(l_Parent_0.AvatarExperienceCommon).Lib.SafeAppStorageService;
local v3 = game:DefineFastFlag("AXCatalogMultiItemShoppingFtuxUseMemStorage", false);
local v4 = game:DefineFastInt("AXCatalogMultiItemShoppingFtuxIntroMaxCount", 1);
local v5 = game:DefineFastInt("AXCatalogMultiItemShoppingFtuxOtherPromptMaxCount", 3);
local v6 = false;
local function v9() --[[ Line: 28 ]] --[[ Name: getStorage ]]
    -- upvalues: l_SafeAppStorageService_0 (copy), v3 (copy), l_HttpService_0 (copy)
    local v7 = l_SafeAppStorageService_0.getItem("AXCatalogMultiItemShoppingFTUX", v3);
    if not v7 or v7 == "" then
        v7 = "{}";
    end;
    local v8 = {};
    pcall(function() --[[ Line: 36 ]]
        -- upvalues: v8 (ref), l_HttpService_0 (ref), v7 (ref)
        v8 = l_HttpService_0:JSONDecode(v7);
    end);
    return v8;
end;
local function _(v10) --[[ Line: 44 ]] --[[ Name: setStorage ]]
    -- upvalues: l_HttpService_0 (copy), l_SafeAppStorageService_0 (copy), v3 (copy)
    pcall(function() --[[ Line: 45 ]]
        -- upvalues: l_HttpService_0 (ref), v10 (copy), l_SafeAppStorageService_0 (ref), v3 (ref)
        local v11 = l_HttpService_0:JSONEncode(v10);
        l_SafeAppStorageService_0.setItem("AXCatalogMultiItemShoppingFTUX", v11, v3);
        l_SafeAppStorageService_0.flush();
    end);
end;
return function() --[[ Line: 56 ]] --[[ Name: useMultiItemShoppingFtux ]]
    -- upvalues: v9 (copy), v6 (ref), v4 (copy), v5 (copy), l_HttpService_0 (copy), l_SafeAppStorageService_0 (copy), v3 (copy)
    local function v14() --[[ Line: 57 ]]
        -- upvalues: v9 (ref), v6 (ref), v4 (ref)
        local v13 = v9();
        return not v6 and (v13.showIntroPromptCount == nil or v13.showIntroPromptCount < v4);
    end;
    local function v15() --[[ Line: 64 ]]
        -- upvalues: v9 (ref)
        return not v9().seenTooltipOnCheckoutButton;
    end;
    local function v17() --[[ Line: 70 ]]
        -- upvalues: v9 (ref), v5 (ref)
        local v16 = v9();
        return not v16.hideClearAllItemsPrompt and (v16.clearAllItemsPromptCount == nil or v16.clearAllItemsPromptCount < v5);
    end;
    local function v19() --[[ Line: 80 ]]
        -- upvalues: v9 (ref), v5 (ref)
        local v18 = v9();
        return not v18.hideWearAvatarReplaceAllItemsPrompt and (v18.wearAvatarReplaceAllItemsPromptCount == nil or v18.wearAvatarReplaceAllItemsPromptCount < v5);
    end;
    local function v20() --[[ Line: 90 ]]
        -- upvalues: v9 (ref)
        return not v9().seenItemReplacedOnAvatarPrompt;
    end;
    local function v23() --[[ Line: 96 ]]
        -- upvalues: v6 (ref), v9 (ref), l_HttpService_0 (ref), l_SafeAppStorageService_0 (ref), v3 (ref)
        v6 = true;
        local v21 = v9();
        v21.showIntroPromptCount = v21.showIntroPromptCount == nil and 1 or v21.showIntroPromptCount + 1;
        pcall(function() --[[ Line: 45 ]]
            -- upvalues: l_HttpService_0 (ref), v21 (copy), l_SafeAppStorageService_0 (ref), v3 (ref)
            local v22 = l_HttpService_0:JSONEncode(v21);
            l_SafeAppStorageService_0.setItem("AXCatalogMultiItemShoppingFTUX", v22, v3);
            l_SafeAppStorageService_0.flush();
        end);
    end;
    local function v26() --[[ Line: 105 ]]
        -- upvalues: v9 (ref), l_HttpService_0 (ref), l_SafeAppStorageService_0 (ref), v3 (ref)
        local v24 = v9();
        v24.seenTooltipOnCheckoutButton = true;
        pcall(function() --[[ Line: 45 ]]
            -- upvalues: l_HttpService_0 (ref), v24 (copy), l_SafeAppStorageService_0 (ref), v3 (ref)
            local v25 = l_HttpService_0:JSONEncode(v24);
            l_SafeAppStorageService_0.setItem("AXCatalogMultiItemShoppingFTUX", v25, v3);
            l_SafeAppStorageService_0.flush();
        end);
    end;
    local function v29() --[[ Line: 112 ]]
        -- upvalues: v9 (ref), l_HttpService_0 (ref), l_SafeAppStorageService_0 (ref), v3 (ref)
        local v27 = v9();
        v27.hideClearAllItemsPrompt = true;
        pcall(function() --[[ Line: 45 ]]
            -- upvalues: l_HttpService_0 (ref), v27 (copy), l_SafeAppStorageService_0 (ref), v3 (ref)
            local v28 = l_HttpService_0:JSONEncode(v27);
            l_SafeAppStorageService_0.setItem("AXCatalogMultiItemShoppingFTUX", v28, v3);
            l_SafeAppStorageService_0.flush();
        end);
    end;
    local function v32() --[[ Line: 119 ]]
        -- upvalues: v9 (ref), l_HttpService_0 (ref), l_SafeAppStorageService_0 (ref), v3 (ref)
        local v30 = v9();
        v30.clearAllItemsPromptCount = v30.clearAllItemsPromptCount == nil and 1 or v30.clearAllItemsPromptCount + 1;
        pcall(function() --[[ Line: 45 ]]
            -- upvalues: l_HttpService_0 (ref), v30 (copy), l_SafeAppStorageService_0 (ref), v3 (ref)
            local v31 = l_HttpService_0:JSONEncode(v30);
            l_SafeAppStorageService_0.setItem("AXCatalogMultiItemShoppingFTUX", v31, v3);
            l_SafeAppStorageService_0.flush();
        end);
    end;
    local function v35() --[[ Line: 128 ]]
        -- upvalues: v9 (ref), l_HttpService_0 (ref), l_SafeAppStorageService_0 (ref), v3 (ref)
        local v33 = v9();
        v33.hideWearAvatarReplaceAllItemsPrompt = true;
        pcall(function() --[[ Line: 45 ]]
            -- upvalues: l_HttpService_0 (ref), v33 (copy), l_SafeAppStorageService_0 (ref), v3 (ref)
            local v34 = l_HttpService_0:JSONEncode(v33);
            l_SafeAppStorageService_0.setItem("AXCatalogMultiItemShoppingFTUX", v34, v3);
            l_SafeAppStorageService_0.flush();
        end);
    end;
    local function v38() --[[ Line: 135 ]]
        -- upvalues: v9 (ref), l_HttpService_0 (ref), l_SafeAppStorageService_0 (ref), v3 (ref)
        local v36 = v9();
        v36.wearAvatarReplaceAllItemsPromptCount = v36.wearAvatarReplaceAllItemsPromptCount == nil and 1 or v36.wearAvatarReplaceAllItemsPromptCount + 1;
        pcall(function() --[[ Line: 45 ]]
            -- upvalues: l_HttpService_0 (ref), v36 (copy), l_SafeAppStorageService_0 (ref), v3 (ref)
            local v37 = l_HttpService_0:JSONEncode(v36);
            l_SafeAppStorageService_0.setItem("AXCatalogMultiItemShoppingFTUX", v37, v3);
            l_SafeAppStorageService_0.flush();
        end);
    end;
    local function v41() --[[ Line: 144 ]]
        -- upvalues: v9 (ref), l_HttpService_0 (ref), l_SafeAppStorageService_0 (ref), v3 (ref)
        local v39 = v9();
        v39.seenItemReplacedOnAvatarPrompt = true;
        pcall(function() --[[ Line: 45 ]]
            -- upvalues: l_HttpService_0 (ref), v39 (copy), l_SafeAppStorageService_0 (ref), v3 (ref)
            local v40 = l_HttpService_0:JSONEncode(v39);
            l_SafeAppStorageService_0.setItem("AXCatalogMultiItemShoppingFTUX", v40, v3);
            l_SafeAppStorageService_0.flush();
        end);
    end;
    return {
        shouldShowIntroPrompt = v14, 
        shouldShowTooltipOnCheckoutButton = v15, 
        shouldShowClearAllItemsPrompt = v17, 
        shouldShowWearAvatarReplaceAllItemsPrompt = v19, 
        setShowIntroPromptCount = v23, 
        setSeenTooltipOnCheckoutButton = v26, 
        hideClearAllItemsPrompt = v29, 
        incrementClearAllItemsPromptCount = v32, 
        hideWearAvatarReplaceAllItemsPrompt = v35, 
        incrementWearAvatarReplaceAllItemsPromptCount = v38, 
        shouldShowItemReplacedOnAvatarPrompt = v20, 
        setSeenItemReplaceOnAvatarPrompt = v41
    };
end;