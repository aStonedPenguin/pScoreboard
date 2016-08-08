local Color = Color
local draw = draw 
local vgui = vgui

local color_white = Color(220,220,220)

local PANEL = {}
 
function PANEL:Init()

	self:SetText('')

	self.avatar = vgui.Create('AvatarImage', self)

	self.avatarbutton = vgui.Create('DButton', self)
	self.avatarbutton:SetText('')
	self.avatarbutton.Paint = function() end

	self.rank = vgui.Create("DImage", self)
	
	self.name = vgui.Create('DLabel', self)

	self.team = vgui.Create('DLabel', self)

	self.ping = vgui.Create('DLabel', self)

end


function PANEL:SetPlayer(pl)

	self.avatar:SetPlayer(pl, 32)
	self.avatarbutton.DoClick = function()
		pl:ShowProfile()
	end

	self.rank:SetImage((pScoreboard.Ranks[pl:GetUserGroup()] or 'icon16/user.png'))

	self.name:SetText(pl:Name())

	self.team:SetText(team.GetName(pl:Team()))

	self.ping:SetText(pl:Ping())

	self.bg = team.GetColor(pl:Team())

end


function PANEL:PerformLayout()

	self.avatar:SetSize(23, 23)
	self.avatar:SetPos(1, 1)

	self.avatarbutton:SetSize(23, 23)
	self.avatarbutton:SetPos(1, 1)

	self.rank:SetSize(16, 16)
	self.rank:SetPos(25, 4.5)

	self.name:SizeToContents()
	self.name:SetPos(46, 0)

	self.team:SizeToContents()
	self.team:SetPos(self:GetWide()/2 - self.team:GetWide()/2, 0)

	self.ping:SizeToContents()
	self.ping:SetPos(self:GetWide() - self.ping:GetWide() - 5, 0)

end


function PANEL:ApplySchemeSettings()

	self.name:SetTextColor(color_white)
	self.name:SetFont('pScoreboard.PlayerRow')

	self.team:SetTextColor(color_white)
	self.team:SetFont('pScoreboard.PlayerRow')

	self.ping:SetTextColor(color_white)
	self.ping:SetFont('pScoreboard.PlayerRow')

end


function PANEL:Paint(w, h)

	draw.Box(0, 0, w, h, self.bg)

end

vgui.Register('pScoreboard_playerrow', PANEL, 'Button')
