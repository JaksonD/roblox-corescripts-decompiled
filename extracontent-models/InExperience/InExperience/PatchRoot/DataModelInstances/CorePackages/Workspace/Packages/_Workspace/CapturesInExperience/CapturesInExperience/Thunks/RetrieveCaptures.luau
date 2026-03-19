local l_Parent_0 = script.Parent.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local v2 = require(l_Parent_0.Actions.CapturesRetrieved);
local v3 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.Types);
local v5 = require(l_Parent_0.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript);
local v6 = require(l_Parent_0.Flags.FFlagCaptureServiceRetrieveCapturesSafeguard);
local function _(v7) --[[ Line: 14 ]] --[[ Name: getSelectedCapture ]]
    -- upvalues: v3 (copy)
    local l_SelectedCaptureIndex_0 = v7[v3.RoduxKey].Carousel.SelectedCaptureIndex;
    if l_SelectedCaptureIndex_0 ~= nil then
        return v7[v3.RoduxKey].Captures[l_SelectedCaptureIndex_0];
    else
        return nil;
    end;
end;
return function() --[[ Line: 23 ]]
    -- upvalues: v3 (copy), v5 (copy), l_CaptureService_0 (copy), v2 (copy), v6 (copy)
    return function(v10) --[[ Line: 24 ]]
        -- upvalues: v3 (ref), v5 (ref), l_CaptureService_0 (ref), v2 (ref), v6 (ref)
        local v11 = v10:getState();
        local l_SelectedCaptureIndex_1 = v11[v3.RoduxKey].Carousel.SelectedCaptureIndex;
        local v13 = if l_SelectedCaptureIndex_1 ~= nil then v11[v3.RoduxKey].Captures[l_SelectedCaptureIndex_1] else nil;
        if v5 then
            v11, l_SelectedCaptureIndex_1 = pcall(function() --[[ Line: 27 ]]
                -- upvalues: l_CaptureService_0 (ref)
                local v14, v15 = l_CaptureService_0:ReadCapturesFromGalleryAsync();
                if v14 == Enum.ReadCapturesFromGalleryResult.Success then
                    return v15;
                else
                    return nil;
                end;
            end);
            local v16 = {};
            if v11 then
                local l_l_SelectedCaptureIndex_1_CurrentPage_0 = l_SelectedCaptureIndex_1:GetCurrentPage();
                for _, v19 in ipairs(l_l_SelectedCaptureIndex_1_CurrentPage_0) do
                    table.insert(v16, v19);
                end;
                v10:dispatch(v2(v16, v13));
                return;
            else
                warn("Failed to retrieve captures from gallery");
                return;
            end;
        elseif v6 then
            v11, l_SelectedCaptureIndex_1 = pcall(function() --[[ Line: 47 ]]
                -- upvalues: l_CaptureService_0 (ref)
                return l_CaptureService_0:RetrieveCaptures();
            end);
            if v11 then
                v10:dispatch(v2(l_SelectedCaptureIndex_1, v13));
                return;
            else
                warn("Failed to retrieve captures from gallery");
                return;
            end;
        else
            v11 = l_CaptureService_0:RetrieveCaptures();
            v10:dispatch(v2(v11, v13));
            return;
        end;
    end;
end;