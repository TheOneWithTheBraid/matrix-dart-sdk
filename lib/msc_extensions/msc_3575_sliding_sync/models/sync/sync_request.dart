import 'package:matrix/msc_extensions/msc_3575_sliding_sync/msc_3575_sliding_sync.dart';
class SyncRequest {
/// Optional: allows clients to know what request params reached the server,
/// functionally similar to txn IDs on /send for events.
final String? txn_id;

/// Optional: a delta token to remember information between connections.
/// See "Bandwidth optimisations for persistent clients" for more information.
final String? delta_token;

/// Optional: a unique string to identify this connection to the server. If this
/// is missing, only 1 sliding sync connection can be made to the server at any one time.
/// Clients need to set this to allow >1 connection concurrently, so the server can distinguish
/// between connections. This is NOT STICKY and must be provided with every request, if your client
/// needs >1 concurrent connection. Max: 16 chars, due to it being required with every request.
final String? conn_id;

// Sliding Window API
final List<SlidingWindow> lists;

// Room Subscriptions API
"room_subscriptions": {
"!sub1:bar": {
"required_state": [ ["*","*"] ],
"timeline_limit": 50,
"include_old_rooms": {
"timeline_limit": 1,
"required_state": [ ["m.room.tombstone", ""], ["m.room.create", ""] ],
}
}
},
"unsubscribe_rooms": [ "!sub3:bar" ],

// Extensions API
"extensions": {}
}