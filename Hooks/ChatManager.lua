NepHook:Post(ChatManager, "init", function(self)
	self._player_steam_id = {}
	self._player_steam_id[1] = "0"
	self._player_steam_id[2] = "0"
	self._player_steam_id[3] = "0"
	self._player_steam_id[4] = "0"
end)

NepHook:Post(ChatManager, "receive_message_by_peer", function(self, channel_id, peer, message)
	if not self._player_steam_id then
		self._player_steam_id = {}
		self._player_steam_id[1] = "0"
		self._player_steam_id[2] = "0"
		self._player_steam_id[3] = "0"
		self._player_steam_id[4] = "0"
	end

	local color_id = peer:id()
	local steam_id = peer:user_id()
	local color = tweak_data.chat_colors[color_id] or tweak_data.chat_colors[#tweak_data.chat_colors]
	self._player_steam_id[color_id] = steam_id
end)