local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local v2 = require(l_Parent_0.AvatarExperienceCommon);
local v3 = require(l_Parent_0.AvatarExperienceFlags);
local l_SafeAppStorageService_0 = v2.Lib.SafeAppStorageService;
local l_FFlagAXMakeupReleaseFTUX_0 = v3.FFlagAXMakeupReleaseFTUX;
local l_FFlagAXMISEnableMultiShopping_0 = v3.FFlagAXMISEnableMultiShopping;
local v7 = game:DefineFastFlag("AXCatalogMakeupFtuxUseMemStorage", false);
local l_FFlagAXMakeupLayeringTooltipFTUX_0 = v3.FFlagAXMakeupLayeringTooltipFTUX;
local v9 = game:DefineFastInt("AXMakeupLayeringTooltipMaxSeenCount", 2);
local v10 = game:DefineFastInt("AXMakeupMax6LayersPromptMaxSeenCount", 3);
local v11 = not l_FFlagAXMakeupLayeringTooltipFTUX_0 and nil;
local function v14() --[[ Line: 29 ]] --[[ Name: getStorage ]]
    -- upvalues: l_SafeAppStorageService_0 (copy), v7 (copy), l_HttpService_0 (copy)
    local v12 = l_SafeAppStorageService_0.getItem("AXCatalogMakeupFTUX", v7);
    if not v12 or v12 == "" then
        v12 = "{}";
    end;
    local v13 = {};
    pcall(function() --[[ Line: 36 ]]
        -- upvalues: v13 (ref), l_HttpService_0 (ref), v12 (ref)
        v13 = l_HttpService_0:JSONDecode(v12);
    end);
    return v13;
end;
local function _(v15) --[[ Line: 44 ]] --[[ Name: setStorage ]]
    -- upvalues: l_HttpService_0 (copy), l_SafeAppStorageService_0 (copy), v7 (copy)
    pcall(function() --[[ Line: 45 ]]
        -- upvalues: l_HttpService_0 (ref), v15 (copy), l_SafeAppStorageService_0 (ref), v7 (ref)
        local v16 = l_HttpService_0:JSONEncode(v15);
        l_SafeAppStorageService_0.setItem("AXCatalogMakeupFTUX", v16, v7);
        l_SafeAppStorageService_0.flush();
    end);
end;
return function() --[[ Line: 52 ]] --[[ Name: useMakeupFtux ]]
    -- upvalues: l_FFlagAXMISEnableMultiShopping_0 (copy), v14 (copy), l_HttpService_0 (copy), l_SafeAppStorageService_0 (copy), v7 (copy), v10 (copy), l_FFlagAXMakeupLayeringTooltipFTUX_0 (copy), v11 (ref), v9 (copy), l_FFlagAXMakeupReleaseFTUX_0 (copy)
    local function v20() --[[ Line: 53 ]]
        -- upvalues: l_FFlagAXMISEnableMultiShopping_0 (ref), v14 (ref), l_HttpService_0 (ref), l_SafeAppStorageService_0 (ref), v7 (ref)
        if not l_FFlagAXMISEnableMultiShopping_0 then
            return;
        else
            local v18 = v14();
            v18.seenMakeupMax6LayersCount = v18.seenMakeupMax6LayersCount == nil and 1 or v18.seenMakeupMax6LayersCount + 1;
            pcall(function() --[[ Line: 45 ]]
                -- upvalues: l_HttpService_0 (ref), v18 (copy), l_SafeAppStorageService_0 (ref), v7 (ref)
                local v19 = l_HttpService_0:JSONEncode(v18);
                l_SafeAppStorageService_0.setItem("AXCatalogMakeupFTUX", v19, v7);
                l_SafeAppStorageService_0.flush();
            end);
            return;
        end;
    end;
    local function v22() --[[ Line: 65 ]]
        -- upvalues: v14 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v10 (ref)
        local v21 = v14();
        return not v21.hideMakeupMax6LayersPrompt and (not l_FFlagAXMISEnableMultiShopping_0 or v21.seenMakeupMax6LayersCount == nil or v21.seenMakeupMax6LayersCount < v10);
    end;
    local function v25() --[[ Line: 78 ]]
        -- upvalues: v14 (ref), l_HttpService_0 (ref), l_SafeAppStorageService_0 (ref), v7 (ref)
        local v23 = v14();
        v23.hideMakeupMax6LayersPrompt = true;
        pcall(function() --[[ Line: 45 ]]
            -- upvalues: l_HttpService_0 (ref), v23 (copy), l_SafeAppStorageService_0 (ref), v7 (ref)
            local v24 = l_HttpService_0:JSONEncode(v23);
            l_SafeAppStorageService_0.setItem("AXCatalogMakeupFTUX", v24, v7);
            l_SafeAppStorageService_0.flush();
        end);
    end;
    local v26 = l_FFlagAXMakeupLayeringTooltipFTUX_0 and function() --[[ Line: 86 ]]
        -- upvalues: v11 (ref), v14 (ref), v9 (ref)
        if v11 then
            return false;
        else
            return (v14().makeupLayeringTooltipSeenCount or 0) < v9;
        end;
    end or nil;
    local v29 = l_FFlagAXMakeupLayeringTooltipFTUX_0 and function() --[[ Line: 99 ]]
        -- upvalues: v11 (ref), v14 (ref), l_HttpService_0 (ref), l_SafeAppStorageService_0 (ref), v7 (ref)
        v11 = true;
        local v27 = v14();
        v27.makeupLayeringTooltipSeenCount = (v27.makeupLayeringTooltipSeenCount or 0) + 1;
        pcall(function() --[[ Line: 45 ]]
            -- upvalues: l_HttpService_0 (ref), v27 (copy), l_SafeAppStorageService_0 (ref), v7 (ref)
            local v28 = l_HttpService_0:JSONEncode(v27);
            l_SafeAppStorageService_0.setItem("AXCatalogMakeupFTUX", v28, v7);
            l_SafeAppStorageService_0.flush();
        end);
    end or nil;
    local v30 = l_FFlagAXMakeupReleaseFTUX_0 and function() --[[ Line: 110 ]]
        -- upvalues: v14 (ref)
        return not v14().shownMakeupReleasePrompt;
    end or nil;
    local v33 = l_FFlagAXMakeupReleaseFTUX_0 and function() --[[ Line: 118 ]]
        -- upvalues: v14 (ref), l_HttpService_0 (ref), l_SafeAppStorageService_0 (ref), v7 (ref)
        local v31 = v14();
        v31.shownMakeupReleasePrompt = true;
        pcall(function() --[[ Line: 45 ]]
            -- upvalues: l_HttpService_0 (ref), v31 (copy), l_SafeAppStorageService_0 (ref), v7 (ref)
            local v32 = l_HttpService_0:JSONEncode(v31);
            l_SafeAppStorageService_0.setItem("AXCatalogMakeupFTUX", v32, v7);
            l_SafeAppStorageService_0.flush();
        end);
    end or nil;
    return {
        shouldShowMakeupMax6LayersPrompt = v22, 
        hideMakeupMax6LayersPrompt = v25, 
        shouldShowMakeupLayeringTooltip = v26, 
        markMakeupLayeringTooltipSeen = v29, 
        shouldShowMakeupReleasePrompt = v30, 
        setShownMakeupReleasePrompt = v33, 
        incrementSeenMakeupMax6LayersPrompt = v20
    };
end;