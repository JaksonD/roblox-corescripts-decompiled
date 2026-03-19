local l_script_FirstAncestor_0 = script:FindFirstAncestor("SongDetails");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Localization);
local l_useLocalization_0 = v3.Hooks.useLocalization;
local l_useAbbreviatedNumberLocalization_0 = v3.Hooks.useAbbreviatedNumberLocalization;
local _ = require(l_Parent_0.DiscoveryTypes);
local v7 = require(l_script_FirstAncestor_0.Helpers.formatting);
return function(v8) --[[ Line: 18 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useAbbreviatedNumberLocalization_0 (copy), v2 (copy), v7 (copy)
    local v9 = v8 and v8.artistName or "";
    local v10 = l_useLocalization_0({
        dateUploadedLabel = "Feature.SongDetails.Label.DateUploaded", 
        experiencesFeaturingLabel = "Feature.SongDetails.Label.ExperiencesFeaturing", 
        lengthLabel = "Feature.SongDetails.Label.Length", 
        monthlyListenersLabel = "Feature.SongDetails.Label.MonthlyListeners", 
        songsAvailableByArtistLabel = {
            "Feature.SongDetails.Label.SongsAvailableBy"; 
            artistName = v9
        }, 
        thousandPlusLabel = "Feature.SongDetails.Label.ThousandPlus", 
        vendorLabel = "Feature.SongDetails.Label.Vendor", 
        genreLabel = "Feature.SongDetails.Label.Genre"
    });
    local v11 = v8 and v8.songMetrics and v8.songMetrics.monthlyListeners or nil;
    local v12 = l_useAbbreviatedNumberLocalization_0(v11);
    return {
        rows = v2.useMemo(function() --[[ Line: 39 ]]
            -- upvalues: v8 (copy), v10 (copy), v7 (ref), v12 (copy), v9 (copy)
            if not v8 then
                return {};
            else
                local v13 = {};
                if v8.genre and v8.genre ~= "" then
                    table.insert(v13, {
                        infoName = v10.genreLabel, 
                        infoData = v8.genre
                    });
                end;
                if v8.durationSeconds and v8.durationSeconds > 0 then
                    table.insert(v13, {
                        infoName = v10.lengthLabel, 
                        infoData = v7.formatDuration(v8.durationSeconds)
                    });
                end;
                if v8.uploadedTime and v8.uploadedTime ~= "" then
                    table.insert(v13, {
                        infoName = v10.dateUploadedLabel, 
                        infoData = v7.formatDate(v8.uploadedTime)
                    });
                end;
                if v8.songMetrics then
                    if v8.songMetrics.monthlyListeners and v8.songMetrics.monthlyListeners > 0 and v12 then
                        table.insert(v13, {
                            infoName = v10.monthlyListenersLabel, 
                            infoData = v12
                        });
                    end;
                    if v8.songMetrics.experiencesPlayed and v8.songMetrics.experiencesPlayed > 0 then
                        table.insert(v13, {
                            infoName = v10.experiencesFeaturingLabel, 
                            infoData = tostring(v8.songMetrics.experiencesPlayed)
                        });
                    end;
                    if v8.songMetrics.artistSongsCount and v8.songMetrics.artistSongsCount > 0 and v9 and v9 ~= "" then
                        local v14 = if v8.songMetrics.artistSongsCount < 1000 then tostring(v8.songMetrics.artistSongsCount) else v10.thousandPlusLabel;
                        table.insert(v13, {
                            infoName = v10.songsAvailableByArtistLabel, 
                            infoData = v14
                        });
                    end;
                end;
                if v8.creatorName and v8.creatorName ~= "" then
                    table.insert(v13, {
                        infoName = v10.vendorLabel, 
                        infoData = v8.creatorName
                    });
                end;
                return v13;
            end;
        end, {
            v9, 
            v10.dateUploadedLabel, 
            v10.experiencesFeaturingLabel, 
            v10.genreLabel, 
            v10.lengthLabel, 
            v10.monthlyListenersLabel, 
            v10.songsAvailableByArtistLabel, 
            v10.thousandPlusLabel, 
            v10.vendorLabel, 
            v12, 
            v8
        })
    };
end;