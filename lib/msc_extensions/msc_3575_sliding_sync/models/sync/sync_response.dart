{
// Connection and Streaming API
"pos": "5",
"txn_id": "client-chosen-string", // echo of the txn ID

// Sliding Window API
"lists": {
"client_chosen_key": {
"count": 1337,
"ops": [
{
"op": "SYNC",
"range": [0, 99],
"room_ids": [
"!foo:bar", // ... 99 more room IDs
]
}
]
}
},

// Aggregated rooms from lists and room subscriptions
"rooms": {
// Room from room subscription
"!sub1:bar": {
"name": "Alice and Bob",
"avatar": "mxc://...",
"initial": true,
"required_state": [
{"sender":"@alice:example.com","type":"m.room.create", "state_key":"", "content":{"creator":"@alice:example.com"}},
{"sender":"@alice:example.com","type":"m.room.join_rules", "state_key":"", "content":{"join_rule":"invite"}},
{"sender":"@alice:example.com","type":"m.room.history_visibility", "state_key":"", "content":{"history_visibility":"joined"}},
{"sender":"@alice:example.com","type":"m.room.member", "state_key":"@alice:example.com", "content":{"membership":"join"}}
],
"timeline": [
{"sender":"@alice:example.com","type":"m.room.create", "state_key":"", "content":{"creator":"@alice:example.com"}},
{"sender":"@alice:example.com","type":"m.room.join_rules", "state_key":"", "content":{"join_rule":"invite"}},
{"sender":"@alice:example.com","type":"m.room.history_visibility", "state_key":"", "content":{"history_visibility":"joined"}},
{"sender":"@alice:example.com","type":"m.room.member", "state_key":"@alice:example.com", "content":{"membership":"join"}},
{"sender":"@alice:example.com","type":"m.room.message", "content":{"body":"A"}},
{"sender":"@alice:example.com","type":"m.room.message", "content":{"body":"B"}},
],
"prev_batch": "t111_222_333",
"joined_count": 41,
"invited_count": 1,
"notification_count": 1,
"highlight_count": 0
},
// rooms from list
"!foo:bar": {
"name": "The calculated room name",
"avatar": "mxc://...",
"initial": true,
"required_state": [
{"sender":"@alice:example.com","type":"m.room.join_rules", "state_key":"", "content":{"join_rule":"invite"}},
{"sender":"@alice:example.com","type":"m.room.history_visibility", "state_key":"", "content":{"history_visibility":"joined"}},
{"sender":"@alice:example.com","type":"m.space.child", "state_key":"!foo:example.com", "content":{"via":["example.com"]}},
{"sender":"@alice:example.com","type":"m.space.child", "state_key":"!bar:example.com", "content":{"via":["example.com"]}},
{"sender":"@alice:example.com","type":"m.space.child", "state_key":"!baz:example.com", "content":{"via":["example.com"]}}
],
"timeline": [
{"sender":"@alice:example.com","type":"m.room.join_rules", "state_key":"", "content":{"join_rule":"invite"}},
{"sender":"@alice:example.com","type":"m.room.message", "content":{"body":"A"}},
{"sender":"@alice:example.com","type":"m.room.message", "content":{"body":"B"}},
{"sender":"@alice:example.com","type":"m.room.message", "content":{"body":"C"}},
{"sender":"@alice:example.com","type":"m.room.message", "content":{"body":"D"}},
],
"prev_batch": "t111_222_333",
"joined_count": 4,
"invited_count": 0,
"notification_count": 54,
"highlight_count": 3
},
// ... 99 more items
},

// Extensions API
"extensions": {},

// Bandwidth optimisations, see "Bandwidth optimisations for persistent clients"
"delta_token": "server-generated-string" // the delta token to use
}