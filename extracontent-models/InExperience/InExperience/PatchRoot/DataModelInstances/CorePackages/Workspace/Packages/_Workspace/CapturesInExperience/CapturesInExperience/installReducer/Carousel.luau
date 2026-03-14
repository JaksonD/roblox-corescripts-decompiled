local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Cryo);
local v3 = require(l_Parent_1.Rodux);
local v4 = require(l_Parent_0.Actions.CapturesRetrieved);
local v5 = require(l_Parent_0.Enums.CaptureType);
local v6 = require(l_Parent_0.Actions.CarouselClosed);
local v7 = require(l_Parent_0.Actions.CarouselIndexSelected);
local v8 = require(l_Parent_0.Actions.CarouselOpened);
local v9 = require(l_Parent_0.Actions.DeleteWarningModalClosed);
local v10 = require(l_Parent_0.Actions.DeleteWarningModalOpened);
local _ = require(l_Parent_0.Types);
local v12 = require(l_Parent_0.Flags.FFlagUseRbxstorageInGallery);
local v13 = require(l_Parent_0.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript);
local v14 = {
    IsOpen = false, 
    IsDeleteWarningModalOpen = false, 
    SelectedCaptureIndex = 0
};
local function v19(v15, v16, v17) --[[ Line: 32 ]] --[[ Name: findNewSelectedCaptureIndex ]]
    -- upvalues: v12 (copy), v13 (copy), v2 (copy), v5 (copy)
    if not v12 and v15[v16] ~= nil and v15[v16].filePath == v17.filePath and not v13 then
        return v16;
    else
        return v2.List.findWhere(v15, function(v18) --[[ Line: 47 ]]
            -- upvalues: v13 (ref), v17 (copy), v12 (ref), v5 (ref)
            if v13 then
                return tostring(v18.CaptureTime.UnixTimestampMillis) == tostring(v17.CaptureTime.UnixTimestampMillis);
            elseif v12 and v18.type == v5.Video and v17.type == v5.Video then
                return v18.thumbnailKey == v17.thumbnailKey;
            elseif v12 and v18.type == v5.Screenshot and v17.type == v5.Screenshot then
                return v18.filePath == v17.filePath;
            elseif not v12 then
                return v18.filePath == v17.filePath;
            else
                return false;
            end;
        end);
    end;
end;
return v3.createReducer(v14, {
    [v4.name] = function(v20, v21) --[[ Line: 72 ]]
        -- upvalues: v2 (copy), v19 (copy)
        if v20.IsOpen == false then
            return v20;
        elseif #v21.captures == 0 then
            return v2.Dictionary.join(v20, {
                IsOpen = false, 
                SelectedCaptureIndex = 0
            });
        elseif v21.selectedCapture == nil then
            local v22 = #v21.captures;
            return v2.Dictionary.join(v20, {
                SelectedCaptureIndex = math.min(v20.SelectedCaptureIndex, v22)
            });
        else
            assert(v21.selectedCapture ~= nil, "CapturesRetrieved selectedCapture should not be nil");
            local l_selectedCapture_0 = v21.selectedCapture;
            local v24 = v19(v21.captures, v20.SelectedCaptureIndex, l_selectedCapture_0);
            if v24 == v20.SelectedCaptureIndex then
                return v20;
            elseif v24 ~= nil then
                return v2.Dictionary.join(v20, {
                    SelectedCaptureIndex = v24
                });
            else
                local v25 = #v21.captures;
                return v2.Dictionary.join(v20, {
                    SelectedCaptureIndex = math.clamp(v20.SelectedCaptureIndex - 1, 1, v25)
                });
            end;
        end;
    end, 
    [v6.name] = function(v26, _) --[[ Line: 117 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v26, {
            IsOpen = false, 
            SelectedCaptureIndex = 0
        });
    end, 
    [v7.name] = function(v28, v29) --[[ Line: 124 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v28, {
            SelectedCaptureIndex = v29.index
        });
    end, 
    [v8.name] = function(v30, v31) --[[ Line: 130 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v30, {
            IsOpen = true, 
            SelectedCaptureIndex = v31.index
        });
    end, 
    [v9.name] = function(v32, _) --[[ Line: 137 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v32, {
            IsDeleteWarningModalOpen = false
        });
    end, 
    [v10.name] = function(v34, _) --[[ Line: 143 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v34, {
            IsDeleteWarningModalOpen = true
        });
    end
});