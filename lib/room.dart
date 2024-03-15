class RoomObject {
  RoomLabel _roomLabel;
  bool _isDirty;

  RoomObject(this._roomLabel, this._isDirty);

  bool get isDirty => _isDirty;

  set isDirty(bool value) {
    _isDirty = value;
  }

  RoomLabel get roomLabel => _roomLabel;

  set roomLabel(RoomLabel value) {
    _roomLabel = value;
  }
}

enum RoomLabel { A, B }
