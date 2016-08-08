local msg = {
	[[       _____                    ____                      _ ]],
	[[      / ____|                  |  _ \                    | |]],
	[[ _ __| (___   ___ ___  _ __ ___| |_) | ___   __ _ _ __ __| |]],
	[[| '_ \\___ \ / __/ _ \| '__/ _ \  _ < / _ \ / _` | '__/ _` |]],
	[[| |_) |___) | (_| (_) | | |  __/ |_) | (_) | (_| | | | (_| |]],
	[[| .__/_____/ \___\___/|_|  \___|____/ \___/ \__,_|_|  \__,_|]],
	[[| |                                                         ]],
	[[|_|                                  					      ]],
}

local include_cl = (SERVER) and AddCSLuaFile or include

pScoreboard = pScoreboard or {}

include_cl('config.lua')

include_cl('core/main_cl.lua')

include_cl('core/misc.lua')
include_cl('core/vgui_playerrow.lua')
include_cl('core/vgui_frame.lua')

for k, v in ipairs(msg) do
	MsgC(Color(0,255,0), v .. '\n')
end