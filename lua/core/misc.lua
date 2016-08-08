local surface = surface

function draw.Box(x, y, w, h, col)
	surface.SetDrawColor(col)
	surface.DrawRect(x, y, w, h)
end

function draw.OutlinedBox(x, y, w, h, col, bordercol)
	surface.SetDrawColor(col)
	surface.DrawRect(x + 1, y + 1, w - 2, h - 2)
	
	surface.SetDrawColor(bordercol)
	surface.DrawOutlinedRect(x, y, w, h)
end

surface.CreateFont('pScoreboard.Hostname', {
	font = 'roboto',
	size = 34,
	weight = 500,
})

surface.CreateFont('pScoreboard.Subtitle', {
	font = 'roboto',
	size = 24,
	weight = 350,
})

surface.CreateFont('pScoreboard.PlayerRow', {
	font = 'roboto',
	size = 22,
	weight = 350,
})

surface.CreateFont('pScoreboard.Label', {
	font = 'roboto',
	size = 14,
	weight = 600,
})