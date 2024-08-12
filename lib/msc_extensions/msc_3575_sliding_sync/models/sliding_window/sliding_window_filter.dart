/// All fields below are Sticky.
/// All fields are applied with AND operators, hence if is_dm:true and is_encrypted:true
/// then only Encrypted DM rooms will be returned. The absence of fields implies no filter
/// on that criteria: it does NOT imply 'false'.
/// These fields may be expanded through use of extensions.
class SlidingWindowFilter {
  const SlidingWindowFilter({
    required this.is_dm,
    required this.spaces,
    required this.is_encrypted,
    required this.is_invite,
    required this.room_types,
    required this.not_room_types,
    required this.room_name_like,
    required this.tags,
    required this.not_tags,
  });

  /// Flag which only returns rooms present (or not) in the DM section of account data.
  /// If unset, both DM rooms and non-DM rooms are returned. If false, only non-DM rooms
  /// are returned. If true, only DM rooms are returned.
  final bool? is_dm;

  /// A list of spaces which target rooms must be a part of, as m.space.child state events.
  /// The server will inspect the m.space.child state events for the JOINED space room IDs given,
  /// and filter the room list based on the INVITED/JOINED children room IDs.
  /// If the child room has a m.room.tombstone event, then the search should recursively navigate
  /// the room ID in that event to find the latest room and use that room ID instead of the initial
  /// room ID in the m.space.child event.
  /// If unset, all rooms are included. Servers MUST NOT navigate subspaces. It is up to the client to
  /// give a complete list of spaces to navigate. Only rooms directly mentioned as m.space.child
  /// events in these spaces will be returned. Unknown spaces or spaces the user is not joined to
  /// will be ignored.
  final List<String>? spaces;

  /// Flag which only returns rooms which have an `m.room.encryption` state event. If unset,
  /// both encrypted and unencrypted rooms are returned. If false, only unencrypted rooms
  /// are returned. If true, only encrypted rooms are returned.
  final bool? is_encrypted;

  /// Flag which only returns rooms the user is currently invited to. If unset, both invited
  /// and joined rooms are returned. If false, no invited rooms are returned. If true, only
  /// invited rooms are returned.
  final bool? is_invite;

  /// If specified, only rooms where the `m.room.create` event has a `type` matching one
  /// of the strings in this array will be returned. If this field is unset, all rooms are
  /// returned regardless of type. This can be used to get the initial set of spaces for an account.
  /// For rooms which do not have a room type, use 'null' to include them.
  final List<String?>? room_types;

  /// Same as "room_types" but inverted. This can be used to filter out spaces from the room list.
  /// If a type is in both room_types and not_room_types, then not_room_types wins and they are
  /// not included in the result.
  final List<String?>? not_room_types;

  /// Filter the room name. Case-insensitive partial matching e.g 'foo' matches 'abFooab'.
  /// The term 'like' is inspired by SQL 'LIKE', and the text here is similar to '%foo%'.
  final String? room_name_like;

  /// Filter the room based on its room tags. If multiple tags are present, a room can have
  /// any one of the listed tags (OR'd).
  final List<String>? tags;

  /// Filter the room based on its room tags. Takes priority over `tags`. For example, a room
  /// with tags A and B with filters tags:[A] not_tags:[B] would NOT be included because not_tags
  /// takes priority over `tags`. This filter is useful if your Rooms list does NOT include the
  /// list of favourite rooms again.
  final List<String>? not_tags;
}
