/*
*
* {
  // A map of list key to list information. Max lists: 100.
  "lists": {
    // an arbitrary string which the client is using to refer to this list for this connection. Keep
    // this small as it needs to be sent a lot. Max length: 64 bytes.
    "client_chosen_key": {
  },
}
* */


import 'package:matrix/msc_extensions/msc_3575_sliding_sync/msc_3575_sliding_sync.dart';

class SlidingWindows {
  const SlidingWindows({required this.lists});

  /// A map of list key to list information. Max lists: 100.
  ///
  /// an arbitrary string which the client is using to refer to this list for this connection. Keep
  /// this small as it needs to be sent a lot. Max length: 64 bytes.
  final Map<String, SlidingWindow> lists;
}
