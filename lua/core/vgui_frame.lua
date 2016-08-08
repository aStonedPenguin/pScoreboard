local ScrW = ScrW
local ScrH = ScrH
local draw = draw 
local vgui = vgui
local timer = timer

local PANEL = {}
 
function PANEL:Init()

	self.layedout = false

	self.w, self.h = ScrW()*.5, ScrH()*.8

	self:SetSize(self.w, self.h)
	self:SetPos(0 - self.w, ScrH()/2 - self.h/2)
	self:MoveTo(ScrW()/2 - self.w/2, ScrH()/2 - self.h/2, 0.10, 0, 1)
	self:MakePopup()

	self.hostname = vgui.Create('DLabel', self)
	self.hostname:SetText(pScoreboard.hostname)

	self.players = vgui.Create('DLabel', self)
	self.players:SetText('Players: ' .. #player.GetAll() .. ' / ' .. GetConVarString('maxplayers'))

	self.header = vgui.Create('DLabel', self)
	self.header:SetText(pScoreboard.subtitle)
	
	self.name = vgui.Create('DLabel', self)
	self.name:SetText('Name')

	self.team = vgui.Create('DLabel', self)
	self.team:SetText('Team')

	self.ping = vgui.Create('DLabel', self)
	self.ping:SetText('Ping')

	self.playerlist = vgui.Create('DPanelList', self)
	self.playerlist:SetSpacing(1)
	self.playerlist:EnableVerticalScrollbar(true)
	self.playerlist.VBar:SetVisible(false)

end


function PANEL:Think()

	if self.layedout and #self.SortedPlayers != #player.GetAll() then
		self:InvalidateLayout()
	end

end


function PANEL:PerformLayout()

	self.layedout = true

	self.hostname:SizeToContents()
	self.hostname:SetPos(5, 1)

	self.players:SizeToContents()
	self.players:SetPos(self.w - self.players:GetWide() - 5, 1)

	self.header:SizeToContents()
	self.header:SetPos(self.w/2 - self.header:GetWide()/2, 40)
	
	self.name:SizeToContents()
	self.name:SetPos(46, 75)

	self.team:SizeToContents()
	self.team:SetPos(self:GetWide()/2 - self.team:GetWide()/2, 75)

	self.ping:SizeToContents()
	self.ping:SetPos(self.w - self.ping:GetWide() - 5, 75)

	self.playerlist:SetSize(self.w - 2, self.h - 90)
	self.playerlist:SetPos(1, 90)

end


function PANEL:ApplySchemeSettings()

	self.hostname:SetFont('pScoreboard.Hostname')

	self.players:SetFont('pScoreboard.Subtitle')

	self.header:SetFont('pScoreboard.Subtitle')

end


function PANEL:LayoutPlayers()

	self.SortedPlayers = {}

	for k, v in ipairs(player.GetAll()) do
		self.SortedPlayers[k] = v
	end

	table.sort(self.SortedPlayers, function(a, b) return a:Team() < b:Team() end)

	for k, v in ipairs(self.SortedPlayers) do
		if IsValid(v) and v:Team() != TEAM_CONNECTING then
			local row = vgui.Create('pScoreboard_playerrow')
			row:SetSize(self.playerlist:GetWide(), 25)
			row:SetPos(0, 0)
			row:SetPlayer(v)

			self.playerlist:AddItem(row)
		end
	end

end


function PANEL:Close()

	self:MoveTo(ScrW() - self.w, ScrH()/2 - self.h/2, 0.10, 0, 1)

	timer.Create('RemoveWindow', .10, 1, function()
		self:Remove()
	end)

end


function PANEL:Paint(w, h)

	draw.OutlinedBox(0, 0, w, h, pScoreboard.color_bg, pScoreboard.color_outline)

	draw.Box(1, 40, w - 2, 25, pScoreboard.color_header)

end

vgui.Register('pScoreboard_frame', PANEL, 'EditablePanel')