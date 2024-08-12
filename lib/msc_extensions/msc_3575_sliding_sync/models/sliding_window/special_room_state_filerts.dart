class SpecialRoomStateFilters {
  const SpecialRoomStateFilters._();

  /// Note that the empty string is required here to match
  /// the event's blank state_key.

  static const blank = r'';

  /// The "$ME" value is a special sentinel value meaning "my user id". It is valid for use on
  /// any state event, but is typically most useful on the m.room.member event.
  static const me = r'$ME';

  /// The "$LAZY" value is a special sentinel value meaning "lazy loading" and is only valid for
  /// the "m.room.member" event type. For more information on the semantics, see "Lazy-Loading Room Members".
  static const lazy = r'$LAZY';

  /// The * is a special sentinel value meaning 'all keys'.
  /// Note that `*` is NOT a generic glob function. You cannot specify `foo*` to pull in keys
  /// like `food` and `foobar`. In this case, the * is treated as a literal *.

  static const all = r'*';
}
