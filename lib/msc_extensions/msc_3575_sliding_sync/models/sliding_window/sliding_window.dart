import 'package:matrix/msc_extensions/msc_3575_sliding_sync/msc_3575_sliding_sync.dart';
class SlidingWindow {
  const SlidingWindow({
    required this.ranges,
    required this.sort,
    required this.required_state,
    required this.timeline_limit,
    required this.include_old_rooms,
    required this.include_heroes,
    required this.filters,
    required this.bump_event_types,
  });

  /// Sliding window ranges, see the Sliding Window API for more information.
  /// If this field is missing, no sliding window is used and all rooms are returned in this list.
  final List<List<int>> ranges;

  /// Sticky. List sort order. See Sliding Window API for more information.
  /// These fields may be expanded through use of extensions.

  //: [ "by_notification_level", "by_recency" ],
  final List<String> sort;

// Sticky. Required state for each room returned. An array of event type and state key tuples.
// Note that elements of this array are NOT sticky so they must be specified in full when they
// are changed. Elements in this array are ORd together to produce the final set of state events
// to return. One unique exception is when you request all state events via ["*", "*"]. When used,
// all state events are returned by default, and additional entries FILTER OUT the returned set
// of state events. These additional entries cannot use '*' themselves.
// For example, ["*", "*"], ["m.room.member", "@alice:example.com"] will _exclude_ every m.room.member
// event _except_ for @alice:example.com, and include every other state event.
// In addition, ["*", "*"], ["m.space.child", "*"] is an error, the m.space.child filter is not
// required as it would have been returned anyway.
  final List<List<String>> required_state;

//[
// Request the join rules event. Note that the empty string is required here to match
// the event's blank state_key.
//["m.room.join_rules", ""],
//["m.room.history_visibility", ""],
// Request all `m.space.child` state events.
// The * is a special sentinel value meaning 'all keys'.
// Note that `*` is NOT a generic glob function. You cannot specify `foo*` to pull in keys
// like `food` and `foobar`. In this case, the * is treated as a literal *.
//["m.space.child", "*"],
// Request only the m.room.member events required to render events in the timeline.
// The "$LAZY" value is a special sentinel value meaning "lazy loading" and is only valid for
// the "m.room.member" event type. For more information on the semantics, see "Lazy-Loading Room Members".
//["m.room.member", "$LAZY"],
// Request your own m.room.member event.
// The "$ME" value is a special sentinel value meaning "my user id". It is valid for use on
// any state event, but is typically most useful on the m.room.member event.
//["m.room.member", "$ME"],
// Request all state events.
//["*", "*"]
//],
  /// Sticky. The maximum number of timeline events to return per response.
  final int timeline_limit;

// See the "Tombstones" section for more information.
  final SlidingWindow? include_old_rooms;

  /// Sticky. Return a stripped variant of membership events (containing `user_id` and optionally `avatar_url` and `displayname`)
  /// for the users used to calculate the room name.
  final bool? include_heroes;

// Sticky. Filters to apply to the list before sorting.
  final SlidingWindowFilter filters;

  /// Sticky. Allowlist of event types which should be considered recent activity
  /// when sorting `by_recency`. By omitting event types from this field, clients
  /// can ensure that uninteresting events (e.g. a profile rename) do not cause a
  /// room to jump to the top of its list(s). Empty or omitted `bump_event_types`
  /// have no effect—all events in a room will be considered recent activity.
  ///
  /// NB. Changes to bump_event_types will NOT cause the room list to be reordered;
  /// it will only affect the ordering of rooms due to future updates.
  final List<String>? bump_event_types;
}
