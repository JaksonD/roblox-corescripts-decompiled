local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local v2 = require(l_Parent_0.AvatarExperienceCommon);
local v3 = require(l_Parent_0.AvatarExperienceFlags);
local l_SafeAppStorageService_0 = v2.Lib.SafeAppStorageService;
local l_FFlagAXMakeupReleaseFTUX_0 = v3.FFlagAXMakeupReleaseFTUX;
local v6 = game:DefineFastFlag("AXCatalogMakeupFtuxUseMemStorage", false);
local l_FFlagAXMakeupLayeringTooltipFTUX_0 = v3.FFlagAXMakeupLayeringTooltipFTUX;
local v8 = game:DefineFastInt("AXMakeupLayeringTooltipMaxSeenCount", 2);
local v9 = not l_FFlagAXMakeupLayeringTooltipFTUX_0 and nil;
local function v12() --[[ Line: 26 ]] --[[ Name: getStorage ]]
    -- upvalues: l_SafeAppStorageService_0 (copy), v6 (copy), l_HttpService_0 (copy)
    local v10 = l_SafeAppStorageService_0.getItem("AXCatalogMakeupFTUX", v6);
    if not v10 or v10 == "" then
        v10 = "{}";
    end;
    local v11 = {};
    pcall(function() --[[ Line: 33 ]]
        -- upvalues: v11 (ref), l_HttpService_0 (ref), v10 (ref)
        v11 = l_HttpService_0:JSONDecode(v10);
    end);
    return v11;
end;
local function _(v13) --[[ Line: 41 ]] --[[ Name: setStorage ]]
    -- upvalues: l_HttpService_0 (copy), l_SafeAppStorageService_0 (copy), v6 (copy)
    pcall(function() --[[ Line: 42 ]]
        -- upvalues: l_HttpService_0 (ref), v13 (copy), l_SafeAppStorageService_0 (ref), v6 (ref)
        local v14 = l_HttpService_0:JSONEncode(v13);
        l_SafeAppStorageService_0.setItem("AXCatalogMakeupFTUX", v14, v6);
        l_SafeAppStorageService_0.flush();
    end);
end;
return function() --[[ Line: 49 ]] --[[ Name: useMakeupFtux ]]
    -- upvalues: v12 (copy), l_HttpService_0 (copy), l_SafeAppStorageService_0 (copy), v6 (copy), l_FFlagAXMakeupLayeringTooltipFTUX_0 (copy), v9 (ref), v8 (copy), l_FFlagAXMakeupReleaseFTUX_0 (copy)
    local function v16() --[[ Line: 50 ]]
        -- upvalues: v12 (ref)
        return not v12().hideMakeupMax6LayersPrompt;
    end;
    local function v19() --[[ Line: 56 ]]
        -- upvalues: v12 (ref), l_HttpService_0 (ref), l_SafeAppStorageService_0 (ref), v6 (ref)
        local v17 = v12();
        v17.hideMakeupMax6LayersPrompt = true;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_HttpService_0 (ref), v17 (copy), l_SafeAppStorageService_0 (ref), v6 (ref)
            local v18 = l_HttpService_0:JSONEncode(v17);
            l_SafeAppStorageService_0.setItem("AXCatalogMakeupFTUX", v18, v6);
            l_SafeAppStorageService_0.flush();
        end);
    end;
    local v20 = l_FFlagAXMakeupLayeringTooltipFTUX_0 and function() --[[ Line: 64 ]]
        -- upvalues: v9 (ref), v12 (ref), v8 (ref)
        if v9 then
            return false;
        else
            return (v12().makeupLayeringTooltipSeenCount or 0) < v8;
        end;
    end or nil;
    local v23 = l_FFlagAXMakeupLayeringTooltipFTUX_0 and function() --[[ Line: 77 ]]
        -- upvalues: v9 (ref), v12 (ref), l_HttpService_0 (ref), l_SafeAppStorageService_0 (ref), v6 (ref)
        v9 = true;
        local v21 = v12();
        v21.makeupLayeringTooltipSeenCount = (v21.makeupLayeringTooltipSeenCount or 0) + 1;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_HttpService_0 (ref), v21 (copy), l_SafeAppStorageService_0 (ref), v6 (ref)
            local v22 = l_HttpService_0:JSONEncode(v21);
            l_SafeAppStorageService_0.setItem("AXCatalogMakeupFTUX", v22, v6);
            l_SafeAppStorageService_0.flush();
        end);
    end or nil;
    local v24 = l_FFlagAXMakeupReleaseFTUX_0 and function() --[[ Line: 88 ]]
        -- upvalues: v12 (ref)
        return not v12().shownMakeupReleasePrompt;
    end or nil;
    local v27 = l_FFlagAXMakeupReleaseFTUX_0 and function() --[[ Line: 96 ]]
        -- upvalues: v12 (ref), l_HttpService_0 (ref), l_SafeAppStorageService_0 (ref), v6 (ref)
        local v25 = v12();
        v25.shownMakeupReleasePrompt = true;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_HttpService_0 (ref), v25 (copy), l_SafeAppStorageService_0 (ref), v6 (ref)
            local v26 = l_HttpService_0:JSONEncode(v25);
            l_SafeAppStorageService_0.setItem("AXCatalogMakeupFTUX", v26, v6);
            l_SafeAppStorageService_0.flush();
        end);
    end or nil;
    return {
        shouldShowMakeupMax6LayersPrompt = v16, 
        hideMakeupMax6LayersPrompt = v19, 
        shouldShowMakeupLayeringTooltip = v20, 
        markMakeupLayeringTooltipSeen = v23, 
        shouldShowMakeupReleasePrompt = v24, 
        setShownMakeupReleasePrompt = v27
    };
end;