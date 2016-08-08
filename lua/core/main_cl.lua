local vgui = vgui
local gui = gui

local pScoreboard

// Fuck your shitty addons and shitty gamemode.
local function removeOldHooks()
	for k, _ in pairs(hook.GetTable()['ScoreboardShow'] or {})do
		hook.Remove('ScoreboardShow', k)
	end

	for k, _ in pairs(hook.GetTable()['ScoreboardHide'] or {})do
		hook.Remove('ScoreboardHide', k)
	end
end

local function scoreboardShow()
	gui.EnableScreenClicker(true)

	pScoreboard = vgui.Create('pScoreboard_frame')
	pScoreboard:LayoutPlayers()

	return true
end

local function scoreboardHide()
	gui.EnableScreenClicker(false)
		
	if IsValid(pScoreboard) then	
		pScoreboard:Close()
	end
end

timer.Simple(1, function()
	removeOldHooks()
	
	hook.Add('ScoreboardHide', 'pScoreboard.ScoreboardHide', scoreboardHide)
	hook.Add('ScoreboardShow', 'pScoreboard.ScoreboardShow', scoreboardShow)
end)