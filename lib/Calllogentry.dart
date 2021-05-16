class CallLogEntry {
  String _name;
  String _number;
  int _timeStamp;
  CallLogEntry(String phoneNumber) {
    this.number = phoneNumber;
  }
  CallLogEntry.addItem(int time, String phoneNumber) {
    this.number = phoneNumber;
    this.timeStamp = time;
  }
  String get name {
    return _name;
  }

  set name(String strName) {
    this._name = strName;
  }

  String get number {
    return _number;
  }

  set number(String strNUmber) {
    this._number = strNUmber;
  }

  int get timeStamp {
    return _timeStamp;
  }

  set timeStamp(int strTime) {
    this._timeStamp = strTime;
  }

  CallLogEntry.fromMap(Map map) {
    this.name = map['name'];
    this.number = map['number'];
    this.timeStamp = (map['timeStamp'] != null
        ? map['timeStamp']
        : DateTime.now().millisecondsSinceEpoch);
  }
  Map toMap() {
    return {
      'name': this.name,
      'number': this.number,
      'timeStamp': (this.timeStamp != null
          ? this.timeStamp
          : DateTime.now().millisecondsSinceEpoch)
    };
  }
}
