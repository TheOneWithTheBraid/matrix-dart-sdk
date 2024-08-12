{
"rooms": {
// the room ID
"!foo:bar": {
"name": "The calculated room name",
// Optional, nullable string: the MXC URL of the room's avatar. If omitted,
// there is no change to the avatar. If null, the room now has no avatar.
"avatar": "mxc://...",
// Optional. If omitted there is no change to the heroes or the `name` was not
// calculated using room heroes. `avatar_url` and `displayname` are optional.
"heroes": [
{"user_id":"@alice:example.com","displayname":"Alice","avatar_url":"mxc://..."},
],
// Flag which is set when this is the first time the server is sending this data on this connection.
// Clients can use this flag to replace or update their local state. When there is an update, servers
// MUST omit this flag entirely and NOT send "initial":false as this is wasteful on bandwidth. The
// absence of this flag means 'false'.
"initial": true,
// this is the CURRENT STATE, unlike sync v2
"required_state": [
{"sender":"@alice:example.com","type":"m.room.join_rules", "state_key":"", "content":{"join_rule":"invite"}},
{"sender":"@alice:example.com","type":"m.room.history_visibility", "state_key":"", "content":{"history_visibility":"joined"}},
{"sender":"@alice:example.com","type":"m.space.child", "state_key":"!foo:example.com", "content":{"via":["example.com"]}},
{"sender":"@alice:example.com","type":"m.space.child", "state_key":"!bar:example.com", "content":{"via":["example.com"]}},
{"sender":"@alice:example.com","type":"m.space.child", "state_key":"!baz:example.com", "content":{"via":["example.com"]}}
],
// Last event is most recent. Max timeline_limit events.
"timeline": [
{"sender":"@alice:example.com","type":"m.room.join_rules", "state_key":"", "content":{"join_rule":"invite"}},
{"sender":"@alice:example.com","type":"m.room.message", "content":{"body":"A"}},
{"sender":"@alice:example.com","type":"m.room.message", "content":{"body":"B"}},
{"sender":"@alice:example.com","type":"m.room.message", "content":{"body":"C"}},
{"sender":"@alice:example.com","type":"m.room.message", "content":{"body":"D"}},
],
"is_dm": true, // field is absent on non-DM rooms
"invite_state": [ { type: "m.room.member" } ], // stripped state events, same as rooms.invite.$room_id.invite_state in sync v2, absent on joined/left rooms
"prev_batch": "t111_222_333", // same as sync v2
"limited": true,              // same as sync v2
"joined_count": 41,           // same as sync v2 m.joined_member_count
"invited_count": 1,           // same as sync v2 m.invited_member_count
"notification_count": 54,     // same as sync v2
"highlight_count": 3,          // same as sync v2
// The number of timeline events which have just occurred and are not historical.
// The last N events are 'live' and should be treated as such.
// This is mostly useful to determine whether a given @mention event should make a noise or not.
// Clients cannot rely solely on the absence of 'initial: true' to determine live events because
// if a room not in the sliding window bumps into the window because of an @mention it will have
// 'initial: true' yet contain a single live event (with potentially other old events in the timeline)
"num_live": 1
}
}
}